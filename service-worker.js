// service-worker.php injects a version computed from the bundled assets;
// a statically served copy of this file (no PHP) falls back to a fixed one.
const ASSET_VERSION = typeof SERVER_ASSET_VERSION !== 'undefined' ? SERVER_ASSET_VERSION : 'static';
const CACHE_VERSION = ASSET_VERSION;
const APP_CACHE = `zeldamaps-app-${CACHE_VERSION}`;
const DATA_CACHE = `zeldamaps-data-${CACHE_VERSION}`;
const TILE_CACHE = `zeldamaps-tiles-${CACHE_VERSION}`;
const MAX_TILE_ENTRIES = 500;
const NAVIGATION_CACHE = 'zeldamaps-offline-navigation';
// The signed-in account's own data kept for offline (ZOfflineSync.savePaths):
// not a map pack, and kept through updates as packs are.
const ACCOUNT_CACHE = 'zeldamaps-offline-account';

const CORE_ASSETS = [
  './?game=OoT',
  './manifest.webmanifest',
  './res.php?type=javascript&v=' + ASSET_VERSION,
  './res.php?type=css&v=' + ASSET_VERSION,
  './images/favicon.ico',
  './images/apple-touch-icon-precomposed.png',
  './images/zmaps_white.png',
  './images/pin-sword.svg',
  './images/icons/games/ocarina-of-time.svg',
  './images/icons/games/a-link-to-the-past.svg',
  './images/zmaps_white_small.png',
  './images/default-avatar.png',
  './images/zelda-maps-bg-tile.png'
];

const OPTIONAL_ASSETS = [
  './images/icons/oot/Poe.svg',
  './images/icons/oot/Kaepora.svg',
  './images/icons/oot/SilverRupee.svg',
  './images/icons/oot/GossipStone.svg',
  './images/icons/oot/WarpPad.svg',
  './images/icons/oot/Chest.svg',
  './images/icons/HeartPiece.svg',
  './images/icons/oot/FairyThought.svg',
  './images/icons/oot/Weapons.svg',
  './images/icons/oot/Upgrades.svg',
  // Hylia Serif: marker, path and area titles (styles/zmain.css).
  './fonts/HyliaSerifBeta-Regular.otf',
  './fonts/icomoon.ttf?xz2wpa',
  './fonts/icomoon.woff?xz2wpa',
  ...['265406_1_0', '265406_0_0', '264CA8_2_0', '264CA8_1_0', '265406_2_0', '265406_3_0', '264CA8_0_0']
    .map(name => './fonts/brandon/' + name + '.woff'),
  'https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js',
  'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css',
  'https://use.fontawesome.com/releases/v5.0.13/js/all.js',
  'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css',
  'https://cdnjs.cloudflare.com/ajax/libs/fuse.js/3.0.4/fuse.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.10.9/tinymce.min.js',
  'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'
];

const PUBLIC_DATA_COMMANDS = new Set([
  'get_categories',
  'get_container',
  'get_container_name',
  'get_games',
  'get_map',
  'get_markers'
]);

const TRUSTED_ASSET_HOSTS = new Set([
  'ajax.googleapis.com',
  'cdnjs.cloudflare.com',
  'maxcdn.bootstrapcdn.com',
  'use.fontawesome.com',
  'ka-f.fontawesome.com'
]);

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(APP_CACHE)
      .then(async cache => {
        await cache.addAll(CORE_ASSETS);
        await Promise.allSettled(OPTIONAL_ASSETS.map(asset => cache.add(asset)));
        await warmNavigationCache();
      })
      .then(() => self.skipWaiting())
  );
});

async function warmNavigationCache() {
  try {
    const cache = await caches.open(NAVIGATION_CACHE);
    const gamesURL = new URL('ajax.php?command=get_games', self.registration.scope).href;
    const response = await fetch(gamesURL);
    if (!response.ok) return;
    const games = await response.clone().json();
    if (!Array.isArray(games)) return;
    // Only the game list, so the offline notice can name the downloaded
    // games. Each game's data is saved as it's viewed (networkFirst) or
    // downloaded from Offline Maps, not for every game on every update.
    await cache.put(gamesURL, response);
  } catch (error) {
    // Keep the previous navigation data if an update occurs offline.
  }
}

self.addEventListener('activate', event => {
  const activeCaches = new Set([APP_CACHE, DATA_CACHE, TILE_CACHE]);
  event.waitUntil(
    caches.keys()
      .then(cacheNames => Promise.all(
        cacheNames
          .filter(cacheName =>
            cacheName.startsWith('zeldamaps-') &&
            !cacheName.startsWith('zeldamaps-offline-') &&
            !activeCaches.has(cacheName)
          )
          .map(cacheName => caches.delete(cacheName))
      ))
      .then(() => self.clients.claim())
  );
});

function canCache(response) {
  return response && (response.ok || response.type === 'opaque');
}

async function putSafely(cacheName, request, response) {
  if (!canCache(response)) return;
  try {
    const cache = await caches.open(cacheName);
    await cache.put(request, response.clone());
  } catch (error) {
    // Storage can be reclaimed or denied, especially on iOS. A cache failure
    // should never prevent the live response from reaching the page.
  }
}

async function networkFirst(request, cacheName, fallbackRequest) {
  try {
    const response = await fetch(request);
    await putSafely(cacheName, request, response);
    return response;
  } catch (error) {
    const cachedResponse = await caches.match(request);
    if (cachedResponse) return cachedResponse;
    if (fallbackRequest) {
      const fallbackResponse = await caches.match(fallbackRequest);
      if (fallbackResponse) return fallbackResponse;
    }
    throw error;
  }
}

async function navigateWithCurrentShell(request) {
  try {
    const response = await fetch(request);
    await putSafely(APP_CACHE, request, response);
    return response;
  } catch (error) {
    // Downloaded HTML can name obsolete, versioned JS/CSS removed by an
    // app update. Always boot the current shell; game selection comes from
    // the address bar, not from the shell's original game query string.
    const app = await caches.open(APP_CACHE);
    const shellURL = new URL('./?game=OoT', self.registration.scope).href;
    const shell = await app.match(shellURL);
    if (shell) return shell;
    const cached = await caches.match(request);
    if (cached) return cached;
    throw error;
  }
}

async function staleWhileRevalidate(request, cacheName) {
  // Downloaded maps save marker images with fetch(), whose Vary request
  // headers can differ from an <img>'s.
  const cachedResponse = await caches.match(request, { ignoreVary: true });
  const networkResponse = fetch(request)
    .then(async response => {
      await putSafely(cacheName, request, response);
      return response;
    })
    .catch(() => null);

  if (cachedResponse) return cachedResponse;
  const response = await networkResponse;
  if (response) return response;
  throw new Error('The asset is unavailable offline.');
}

async function trimTileCache() {
  const cache = await caches.open(TILE_CACHE);
  const requests = await cache.keys();
  const excess = requests.length - MAX_TILE_ENTRIES;
  if (excess <= 0) return;
  await Promise.all(requests.slice(0, excess).map(request => cache.delete(request)));
}

function tilePath(url) {
  const parsed = new URL(url, self.location.origin);
  const pathname = parsed.pathname;
  const start = pathname.indexOf('/tiles/');
  // Never let an old unversioned offline tile satisfy new artwork.
  return start < 0 ? null : pathname.slice(start) + parsed.search;
}

async function reportTileSource(clientId, source, url) {
  if (!clientId) return;
  const client = await self.clients.get(clientId);
  if (client) client.postMessage({ type: 'zeldamaps-tile-source', source, url });
}

// A tile in a downloaded pack, by its address or, from older manifests that
// used the site's /tiles/ host while the renderer uses the production CDN,
// by its tile path. These are static images; fetch() and <img> may send
// different Vary request headers.
async function matchPackTile(pack, url) {
  let tile = await pack.match(url, { ignoreVary: true });
  if (!tile && tilePath(url)) {
    for (const origin of [self.location.origin, 'https://zeldamaps.com', 'https://www.zeldamaps.com']) {
      tile = await pack.match(new URL(tilePath(url), origin).href, { ignoreVary: true });
      if (tile) break;
    }
  }
  return tile;
}

// Which of a pack's tiles are saved as another, the same image (a download
// saves each image once: scripts/services/OfflineDownloads.js), by tile
// path. Read once a minute at most, or afresh when the page says a pack
// changed.
const PACK_ALIASES = new Map();
async function packAliases(name, pack) {
  const known = PACK_ALIASES.get(name);
  if (known && Date.now() - known.at < 60000) return known.aliases;
  let aliases = null;
  try {
    const response = await pack.match(new URL('offline-pack-aliases.json', self.registration.scope).href);
    if (response) {
      aliases = new Map();
      for (const [url, same] of Object.entries(await response.json())) {
        const key = tilePath(url);
        if (key) aliases.set(key, same);
      }
    }
  } catch (error) {}
  PACK_ALIASES.set(name, { at: Date.now(), aliases });
  return aliases;
}
self.addEventListener('message', event => {
  if (event.data && event.data.type === 'zeldamaps-offline-pack-updated') PACK_ALIASES.delete(event.data.cache);
  // A page asking which version of the site this worker is for (index.php):
  // a page whose scripts are older reloads; one already up to date doesn't.
  if (event.data && event.data.type === 'zeldamaps-worker-version?' && event.source) {
    event.source.postMessage({ type: 'zeldamaps-worker-version', version: ASSET_VERSION });
  }
});

async function cacheFirstTile(request, clientId) {
  // Explicit packs take priority over the rolling cache.
  const packNames = (await caches.keys()).filter(name =>
    name.startsWith('zeldamaps-offline-') && name !== 'zeldamaps-offline-navigation' && name !== ACCOUNT_CACHE
  );
  for (const name of packNames) {
    const pack = await caches.open(name);
    let tile = await matchPackTile(pack, request.url);
    // A tile that's the same image as another: the one saved.
    if (!tile && tilePath(request.url)) {
      const aliases = await packAliases(name, pack);
      const same = aliases && aliases.get(tilePath(request.url));
      if (same) tile = await matchPackTile(pack, same);
    }
    if (tile) {
      await reportTileSource(clientId, 'download', request.url);
      return tile;
    }
  }
  const cachedResponse = await caches.match(request, { ignoreVary: true });
  if (cachedResponse) return cachedResponse;

  const response = await fetch(request);
  if (canCache(response)) {
    await putSafely(TILE_CACHE, request, response);
    await trimTileCache();
  }
  return response;
}

function isPublicDataRequest(url) {
  if (url.origin !== self.location.origin) return false;
  // Marker names and details, which downloaded maps also save.
  if (/\/data\/[^/]+\/lang\/[^/]+\.json$/.test(url.pathname)) return true;
  if (!url.pathname.endsWith('/ajax.php')) return false;
  return PUBLIC_DATA_COMMANDS.has(url.searchParams.get('command'));
}

function isTileRequest(url, request) {
  return request.destination === 'image' && (
    url.pathname.includes('/tiles/') ||
    /(?:^|\/)\d+[_/]\d+[_/]\d+\.(?:png|jpe?g|webp)$/i.test(url.pathname)
  );
}

function isStaticAssetRequest(url, request) {
  if (url.origin === self.location.origin && url.pathname.includes('/uploads/')) {
    return false;
  }
  if (['script', 'style', 'font', 'image'].includes(request.destination)) {
    return url.origin === self.location.origin || TRUSTED_ASSET_HOSTS.has(url.hostname);
  }
  return false;
}

async function downloadedImageOrNetwork(request) {
  const names = (await caches.keys()).filter(name => name.startsWith('zeldamaps-offline-') && name !== NAVIGATION_CACHE && name !== ACCOUNT_CACHE);
  for (const name of names) {
    const image = await (await caches.open(name)).match(request, { ignoreVary: true });
    if (image) return image;
  }
  return fetch(request);
}

self.addEventListener('fetch', event => {
  const request = event.request;
  if (request.method !== 'GET') return;

  const url = new URL(request.url);

  // An embed (embed.php) straight from the server: never the app's shell.
  if (request.mode === 'navigate' && url.pathname.endsWith('/embed.php')) return;
  if (request.mode === 'navigate') {
    event.respondWith(navigateWithCurrentShell(request));
    return;
  }

  // Profile pictures, so the signed-in account looks the same offline.
  if (url.origin === self.location.origin && url.pathname.includes('/uploads/profile-pictures/')) {
    event.respondWith(networkFirst(request, APP_CACHE));
    return;
  }

  if (isPublicDataRequest(url)) {
    // Public game metadata is needed to navigate even to undownloaded games.
    // Unlike the app bundle cache, it must survive version upgrades.
    event.respondWith(networkFirst(request, NAVIGATION_CACHE));
    return;
  }

  if (isTileRequest(url, request)) {
    if (request.destination === '') {
      event.respondWith(fetch(request));
      return;
    }
    event.respondWith(cacheFirstTile(request, event.clientId));
    return;
  }

  if (isStaticAssetRequest(url, request)) {
    event.respondWith(staleWhileRevalidate(request, APP_CACHE));
    return;
  }
  // Embedded marker images from other hosts are only served when explicitly
  // downloaded, rather than indiscriminately caching external resources.
  if (request.destination === 'image') {
    event.respondWith(downloadedImageOrNetwork(request));
  }
});

// Push notifications (lib/common/push.php). Pushes carry no payload: ask
// the server what's new, as the signed-in account, and show it. Browsers
// require something to be shown for every push.
self.addEventListener('push', event => {
  event.waitUntil((async () => {
    const icon = new URL('images/apple-touch-icon-precomposed.png', self.registration.scope).href;
    let items = [];
    try {
      const response = await fetch(new URL('ajax.php?command=notifications_push_latest', self.registration.scope), {
        credentials: 'include', cache: 'no-store'
      });
      items = (await response.json()).notifications || [];
    } catch (e) {}
    const windows = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });
    windows.forEach(client => client.postMessage({ type: 'zeldamaps-notifications' }));
    if (!items.length) {
      await self.registration.showNotification('Zelda Maps', {
        body: 'You have new notifications.', icon, tag: 'zeldamaps-notifications',
        data: { url: new URL('?page=notifications', self.registration.scope).href }
      });
      return;
    }
    // Tagged by id, so one shown by an earlier push is replaced, not repeated.
    await Promise.all(items.map(item => self.registration.showNotification(item.title, {
      body: item.body || undefined, icon, tag: 'zeldamaps-notification-' + item.id,
      // notification= marks it read when it's opened.
      data: { url: new URL(item.url + '&notification=' + item.id, self.registration.scope).href }
    })));
  })());
});

self.addEventListener('notificationclick', event => {
  event.notification.close();
  const url = (event.notification.data && event.notification.data.url) || self.registration.scope;
  event.waitUntil((async () => {
    const windows = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });
    const open = windows.find(client => new URL(client.url).origin === self.location.origin);
    if (open) {
      // The open page shows it in place.
      await open.focus();
      open.postMessage({ type: 'zeldamaps-open-notification', url });
      return;
    }
    await self.clients.openWindow(url);
  })());
});
