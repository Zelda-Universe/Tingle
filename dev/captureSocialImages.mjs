#!/usr/bin/env node

// Captures the link-preview (Open Graph) image for each game: the desktop
// view at 1200x630, rendered at 2x, without ads, saved as
// images/social-<game>.jpg. index.php points og:image at these.
//
// Usage: node dev/captureSocialImages.mjs [base URL]
// Defaults to staging, which has every game's data. Drives Chrome over the
// DevTools protocol so each game's view can be framed before capturing.

import { spawn } from 'node:child_process';
import { mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const base = process.argv[2] || 'https://stage.zeldamaps.com/';
const chromePath = process.env.CHROME ||
  '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const port = 9333;

// Runs in the page once the map has loaded. `fit` fits bounds into the area
// beside the sidebar; `cover` fills that area with them.
const helpers = `
  var map = zMap.map, sidebar = zMap.mapControl._container.getBoundingClientRect().right;
  // A fractional zoom leaves hairline seams between tiles unless each tile
  // spans whole device pixels, so round down to the nearest such zoom.
  function seamless(zoom) {
    var tileZoom = Math.round(zoom);
    var size = Math.floor(256 * Math.pow(2, zoom - tileZoom) * devicePixelRatio) / devicePixelRatio;
    return tileZoom + Math.log2(size / 256);
  }
  function fit(bounds, padding, maxZoom) {
    map.fitBounds(bounds, { paddingTopLeft: [sidebar + padding[0], padding[1]],
      paddingBottomRight: [padding[2], padding[3]], animate: false });
    var zoom = seamless(Math.min(map.getZoom(), maxZoom || Infinity));
    map.setZoomAround(map.getSize().divideBy(2).add([sidebar / 2, 0]), zoom, { animate: false });
  }
  function cover(bounds) {
    bounds = L.latLngBounds(bounds);
    // Rounded up, so the map still covers the area.
    var zoom = map.getBoundsZoom(bounds, true, L.point(sidebar, 0));
    var tileZoom = Math.round(zoom);
    var size = Math.ceil(256 * Math.pow(2, zoom - tileZoom) * devicePixelRatio) / devicePixelRatio;
    map.setView(bounds.getCenter(), tileZoom + Math.log2(size / 256), { animate: false });
    map.panBy([-sidebar / 2, 0], { animate: false });
  }
  function centerBeside(latlng, zoom) {
    map.setView(latlng, zoom, { animate: false });
    map.panBy([-sidebar / 2, 0], { animate: false });
  }
`;

const games = [
  { id: 'LA' },
  {
    // The Great Plateau, framed on the average of its four shrines. Every
    // category stays on so nothing in the list is dimmed, but only Korok
    // Seeds show on the map.
    id: 'BotW',
    setup: `
      var menu = zMap.mapControl._categoryMenu;
      menu.categoryButtons.forEach(function(button) {
        button.category.checked = true;
        if(!button.toggledOn) button._toggle(true);
      });
      zMap.refreshMap();
      if(menu.updateCategoryGroupControls) menu.updateCategoryGroupControls();
      var style = document.createElement('style');
      style.textContent = '.leaflet-marker-pane .leaflet-marker-icon:not(:has(.icon-BotW_Korok-Seeds)),' +
        '.leaflet-overlay-pane path { visibility: hidden !important; }';
      document.head.appendChild(style);
      centerBeside([-158.53, 114.40], 5);
    `
  },
  // Great Sky Island, from the bounds of its markers. At this fractional zoom
  // hairline gaps between tiles show the light background, so it's swapped
  // for the sky tiles' own gray.
  {
    id: 'TotK',
    setup: `
      var style = document.createElement('style');
      style.textContent = '.leaflet-map-grid-background-pane { display: none !important; }' +
        'main.leaflet-container { background: #5d6567 !important; }';
      document.head.appendChild(style);
      fit([[-1787.32, -92.06], [-822.41, 760.46]], [40, 70, 40, 30]);
    `
  },
  // The whole area beside the sidebar covered by the map.
  { id: 'EoW', setup: `cover([[0, -35.25], [482.25, 693.75]]);` },
  // All of Hyrule (Child), fitted beside the sidebar. The "Map Under
  // Construction" notice is hidden so the category list shows instead.
  {
    id: 'OoTR', file: 'oot', settle: 8000,
    setup: `
      var style = document.createElement('style');
      style.textContent = '.oot-preview-notice { display: none !important; }';
      document.head.appendChild(style);
      // Fully zoomed out, which is fractional; round up to a zoom where tiles
      // span whole device pixels, or hairline seams show between them.
      var zoom = map.getMinZoom(), tileZoom = Math.round(zoom);
      var size = Math.ceil(256 * Math.pow(2, zoom - tileZoom) * devicePixelRatio) / devicePixelRatio;
      centerBeside(L.latLngBounds(map.options.maxBounds).getCenter(), tileZoom + Math.log2(size / 256));
    `
  }
];
// node dev/captureSocialImages.mjs [base URL] [game ...] captures only those games.
const only = process.argv.slice(3);

const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));

async function connect() {
  for(let attempt = 0; attempt < 50; attempt++) {
    try {
      const version = await (await fetch(`http://127.0.0.1:${port}/json/version`)).json();
      return version.webSocketDebuggerUrl;
    } catch(error) {
      await sleep(200);
    }
  }
  throw new Error('Chrome did not start.');
}

function client(url) {
  const socket = new WebSocket(url);
  let nextId = 0;
  const pending = new Map();
  socket.addEventListener('message', event => {
    const message = JSON.parse(event.data);
    if(!pending.has(message.id)) return;
    const { resolve, reject } = pending.get(message.id);
    pending.delete(message.id);
    if(message.error) reject(new Error(message.error.message));
    else resolve(message.result);
  });
  const ready = new Promise(resolve => socket.addEventListener('open', resolve));
  return {
    ready,
    close: () => socket.close(),
    send(method, params = {}, sessionId) {
      const id = ++nextId;
      socket.send(JSON.stringify({ id, method, params, sessionId }));
      return new Promise((resolve, reject) => pending.set(id, { resolve, reject }));
    }
  };
}

async function evaluate(cdp, sessionId, expression) {
  const result = await cdp.send('Runtime.evaluate',
    { expression, awaitPromise: true, returnByValue: true }, sessionId);
  if(result.exceptionDetails) throw new Error(result.exceptionDetails.exception?.description || 'Page script failed.');
  return result.result.value;
}

async function waitFor(cdp, sessionId, expression, timeout = 60000) {
  const start = Date.now();
  while(Date.now() - start < timeout) {
    if(await evaluate(cdp, sessionId, expression).catch(() => false)) return;
    await sleep(500);
  }
  throw new Error('Timed out waiting for: ' + expression);
}

const profile = mkdtempSync(join(tmpdir(), 'zeldamaps-social-'));
const chrome = spawn(chromePath, [
  '--headless=new', '--disable-gpu', '--hide-scrollbars',
  `--remote-debugging-port=${port}`, `--user-data-dir=${profile}`, 'about:blank'
], { stdio: 'ignore' });

try {
  const cdp = client(await connect());
  await cdp.ready;
  for(const game of games.filter(game => !only.length || only.includes(game.id))) {
    // A fresh context each time: signed out, no saved settings or Minimal UI.
    const { browserContextId } = await cdp.send('Target.createBrowserContext');
    const { targetId } = await cdp.send('Target.createTarget', { url: 'about:blank', browserContextId });
    const { sessionId } = await cdp.send('Target.attachToTarget', { targetId, flatten: true });
    await cdp.send('Emulation.setDeviceMetricsOverride',
      { width: 1200, height: 630, deviceScaleFactor: 2, mobile: false }, sessionId);
    await cdp.send('Page.navigate', { url: `${base}?game=${game.id}&ads=off` }, sessionId);
    await waitFor(cdp, sessionId,
      `typeof zMap !== 'undefined' && zMap.map && typeof markers !== 'undefined' && markers.length > 0`);
    await sleep(3000);
    if(game.setup) await evaluate(cdp, sessionId, `(function() { ${helpers} ${game.setup} })()`);
    await sleep(1000);
    // Tiles beyond a map's edge may never load, so don't wait on them forever.
    await waitFor(cdp, sessionId, `!document.querySelector('.leaflet-tile:not(.leaflet-tile-loaded)')`, 20000)
      .catch(() => {});
    await sleep(game.settle || 1500);
    const { data } = await cdp.send('Page.captureScreenshot', { format: 'jpeg', quality: 85 }, sessionId);
    const file = `images/social-${(game.file || game.id).toLowerCase()}.jpg`;
    writeFileSync(join(root, file), Buffer.from(data, 'base64'));
    console.log(file);
    await cdp.send('Target.disposeBrowserContext', { browserContextId });
  }
  cdp.close();
} finally {
  const exited = new Promise(resolve => chrome.once('exit', resolve));
  chrome.kill();
  await exited;
  rmSync(profile, { recursive: true, force: true, maxRetries: 5, retryDelay: 200 });
}
