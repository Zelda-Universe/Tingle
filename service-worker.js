const CACHE_VERSION = '20261105-59';
const APP_CACHE = `zeldamaps-app-${CACHE_VERSION}`;
const DATA_CACHE = `zeldamaps-data-${CACHE_VERSION}`;
const TILE_CACHE = `zeldamaps-tiles-${CACHE_VERSION}`;
const MAX_TILE_ENTRIES = 500;
const NAVIGATION_CACHE = 'zeldamaps-offline-navigation';

const CORE_ASSETS = [
  './?game=TotK',
  './manifest.webmanifest',
  './res.php?type=javascript&v=20261105-abtest-1',
  './res.php?type=css&v=20261105-abtest-1',
  './images/favicon.ico',
  './images/apple-touch-icon-precomposed.png',
  './images/zmaps_white.png',
  './images/zmaps_white_small.png',
  './images/default-avatar.png',
  './images/zelda-maps-bg-tile.png'
];

const OPTIONAL_ASSETS = [
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
    await cache.put(gamesURL, response);
    const urls = games.flatMap(game => [
      'ajax.php?command=get_container&game=' + encodeURIComponent(game.shortName),
      ...['get_map', 'get_categories', 'get_markers'].map(command =>
        'ajax.php?command=' + command + '&game=' + encodeURIComponent(game.id))
    ]);
    await Promise.allSettled(urls.map(async path => {
      const url = new URL(path, self.registration.scope).href;
      const data = await fetch(url);
      if (data.ok) await cache.put(url, data);
    }));
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
    const shellURL = new URL('./?game=TotK', self.registration.scope).href;
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
  const pathname = new URL(url, self.location.origin).pathname;
  const start = pathname.indexOf('/tiles/');
  return start < 0 ? null : pathname.slice(start);
}

async function reportTileSource(clientId, source, url) {
  if (!clientId) return;
  const client = await self.clients.get(clientId);
  if (client) client.postMessage({ type: 'zeldamaps-tile-source', source, url });
}

async function cacheFirstTile(request, clientId) {
  // Explicit packs take priority over the rolling cache. These are static
  // images; fetch() and <img> may send different Vary request headers.
  const packNames = (await caches.keys()).filter(name =>
    name.startsWith('zeldamaps-offline-') && name !== 'zeldamaps-offline-navigation'
  );
  for (const name of packNames) {
    const pack = await caches.open(name);
    let tile = await pack.match(request.url, { ignoreVary: true });
    // Older manifests used the site's /tiles/ host while the renderer uses
    // the production CDN. Recover those existing downloads by tile path.
    if (!tile && tilePath(request.url)) {
      for (const origin of [self.location.origin, 'https://zeldamaps.com', 'https://www.zeldamaps.com']) {
        tile = await pack.match(new URL(tilePath(request.url), origin).href, { ignoreVary: true });
        if (tile) break;
      }
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
  const names = (await caches.keys()).filter(name => name.startsWith('zeldamaps-offline-') && name !== NAVIGATION_CACHE);
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
