const CACHE_VERSION = '20261102-6';
const APP_CACHE = `zeldamaps-app-${CACHE_VERSION}`;
const DATA_CACHE = `zeldamaps-data-${CACHE_VERSION}`;
const TILE_CACHE = `zeldamaps-tiles-${CACHE_VERSION}`;
const MAX_TILE_ENTRIES = 500;

const CORE_ASSETS = [
  './?game=TotK',
  './manifest.webmanifest',
  './res.php?type=javascript&v=20261102-offline-fetch-fix',
  './res.php?type=css&v=20261102-offline-fetch-fix',
  './images/favicon.ico',
  './images/apple-touch-icon-precomposed.png',
  './images/zmaps_white.png',
  './images/zmaps_white_small.png',
  './images/default-avatar.svg'
];

const OPTIONAL_ASSETS = [
  'https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js',
  'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css',
  'https://use.fontawesome.com/releases/v5.0.13/js/all.js',
  'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css',
  'https://cdnjs.cloudflare.com/ajax/libs/fuse.js/3.0.4/fuse.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.16/tinymce.min.js',
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
      })
      .then(() => self.skipWaiting())
  );
});

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

async function staleWhileRevalidate(request, cacheName) {
  const cachedResponse = await caches.match(request);
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

async function cacheFirstTile(request) {
  const cachedResponse = await caches.match(request);
  if (cachedResponse) return cachedResponse;

  const response = await fetch(request);
  if (canCache(response)) {
    await putSafely(TILE_CACHE, request, response);
    await trimTileCache();
  }
  return response;
}

function isPublicDataRequest(url) {
  if (url.origin !== self.location.origin || !url.pathname.endsWith('/ajax.php')) return false;
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

self.addEventListener('fetch', event => {
  const request = event.request;
  if (request.method !== 'GET') return;

  const url = new URL(request.url);

  if (request.mode === 'navigate') {
    event.respondWith(networkFirst(request, APP_CACHE, './?game=TotK'));
    return;
  }

  if (isPublicDataRequest(url)) {
    event.respondWith(networkFirst(request, DATA_CACHE));
    return;
  }

  if (isTileRequest(url, request)) {
    if (request.destination === '') {
      event.respondWith(fetch(request));
      return;
    }
    event.respondWith(cacheFirstTile(request));
    return;
  }

  if (isStaticAssetRequest(url, request)) {
    event.respondWith(staleWhileRevalidate(request, APP_CACHE));
  }
});
