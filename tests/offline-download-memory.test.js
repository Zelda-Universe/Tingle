const fs = require('fs');
const path = require('path');
const read = file => fs.readFileSync(path.join(__dirname, '..', file), 'utf8');

// Downloading TotK closed the tab on iPhones. Measured in the iOS simulator:
// saving a copy of each response grew the page's memory by about 150 MB
// over 56,000 files, and listing a pack of 56,000 files (cache.keys()) took
// 1.27 GB in Safari's storage process. TotK has several times that.
//
// And updates: saved apart from the map until they're all there, so a
// cancelled or failed update leaves the map as it was.

const BASE = document.baseURI; // (Where the download resolves tile addresses.)

function response(body, json) {
  return {
    ok: true, status: 200, type: 'basic', body,
    clone: jest.fn(() => response(body, json)),
    json: async () => json
  };
}

function makeCache(name, opened) {
  const saved = new Map();
  return {
    name, saved,
    put: jest.fn(async (url, value) => { saved.set(new URL(url, BASE).href, value); }),
    match: jest.fn(async url => saved.get(new URL(url, BASE).href)),
    delete: jest.fn(async url => saved.delete(new URL(url, BASE).href)),
    keys: jest.fn(async () => { throw new Error('a whole pack was listed'); })
  };
}

// The real ZMapOfflinePacks helpers, from zmap.js.
function packsHelpers(records) {
  const zmap = read('scripts/zmap.js');
  const start = zmap.indexOf('var ZMapOfflinePacks = {');
  const end = zmap.indexOf('\n};\n', start) + 3;
  const packs = new Function('isOcarina', zmap.slice(start, end) + '\nreturn ZMapOfflinePacks;')(() => false);
  packs.read = id => records[id] ? JSON.parse(JSON.stringify(records[id])) : null;
  packs.write = (id, record) => { records[id] = JSON.parse(JSON.stringify(record)); };
  packs.remove = id => { delete records[id]; };
  return packs;
}

function setup({ tiles, record, mapFiles = {}, oldIndex }) {
  const records = record ? { TotK: record } : {};
  const caches = {};
  const open = name => (caches[name] = caches[name] || makeCache(name));
  const main = open('zeldamaps-offline-TotK');
  Object.entries(mapFiles).forEach(([url, body]) => main.saved.set(url, response(body)));
  if (oldIndex) main.saved.set(new URL('offline-pack-index.json', BASE).href, response('', { tiles: oldIndex }));
  const fetch = jest.fn(async url => {
    url = String(url);
    if (url.includes('get_offline_maps')) return response('', { success: true, total: tiles.length, totalBytes: 2000, version: 'new', tiles });
    if (url.includes('get_container')) return response('', [{ id: 21 }]);
    if (url.includes('get_markers') || url.includes('get_map') || url.includes('get_categories')) return response('', {});
    return response('new ' + url);
  });
  const ZMap = function() {};
  global.ZMapOfflinePacks = packsHelpers(records);
  global.fetch = fetch;
  global.caches = {
    open: async name => open(name),
    delete: jest.fn(async name => { const had = !!caches[name]; delete caches[name]; return had; })
  };
  global.Response = function(body) { this.body = body; };
  Object.defineProperty(global.navigator, 'storage', { configurable: true, value: undefined });
  new Function('ZMap', read('scripts/services/OfflineDownloads.js'))(ZMap);
  const zmap = new ZMap();
  zmap._offlineDownloadChanged = () => {};
  zmap._reportOfflineEvent = jest.fn();
  zmap.getUser = () => null;
  const job = { game: { id: 'TotK', name: 'Tears of the Kingdom' }, completedFiles: 0, completedBytes: 0, totalFiles: 0, totalBytes: 2000, cellular: true };
  return { zmap, job, caches, main, records, fetch };
}

afterEach(() => {
  delete global.ZMapOfflinePacks; delete global.fetch; delete global.caches; delete global.Response;
  Object.defineProperty(global.navigator, 'connection', { configurable: true, value: undefined });
});

const tiles = [
  { url: '/tiles/totk/a/0_0_0.png', size: 1, m: 1 },
  { url: '/tiles/totk/a/1_0_0.png', size: 1, m: 1 },
  { url: '/tiles/totk/a/1_1_0.png', size: 1, m: 1, same: '/tiles/totk/a/1_0_0.png' }
];
const url = tile => BASE + tile.slice(1);
const saved = { status: 'downloaded', version: 'old', size: 1000, assetsVersion: 1, downloadedAt: 1 };

test('a tile is saved as it came, not as a copy', async () => {
  const { zmap, job, main } = setup({ tiles });
  await zmap._runOfflineDownload(job);
  const tilePuts = main.put.mock.calls.filter(([u]) => String(u).includes('/tiles/'));
  expect(tilePuts).toHaveLength(2);
  tilePuts.forEach(([, value]) => expect(value.clone).not.toHaveBeenCalled());
});

test('a new download finishes without listing the pack', async () => {
  const { zmap, job, main, records } = setup({ tiles });
  await zmap._runOfflineDownload(job);
  expect(main.keys).not.toHaveBeenCalled();
  expect(records.TotK.status).toBe('downloaded');
});

test('an update is saved apart, then replaces the map: what changed, what\'s new, and what\'s gone', async () => {
  const gone = url('/tiles/totk/a/2_0_0.png');
  const nowSame = url('/tiles/totk/a/1_1_0.png');
  const kept = url('/tiles/totk/a/0_0_0.png');
  const changed = url('/tiles/totk/a/1_0_0.png');
  const { zmap, job, caches, main, records, fetch } = setup({
    tiles, record: saved,
    mapFiles: { [gone]: 'old', [nowSame]: 'old', [kept]: 'old', [changed]: 'old' },
    oldIndex: { [gone]: '1:1', [nowSame]: '1:1', [kept]: '1:1', [changed]: '1:0' }
  });
  job.isUpdate = true;
  await zmap._runOfflineDownload(job);
  expect(main.keys).not.toHaveBeenCalled();
  // Only the changed tile was downloaded, into the update first.
  expect(fetch.mock.calls.filter(([u]) => String(u).includes('/tiles/')).map(([u]) => String(u))).toEqual([changed]);
  expect(main.saved.get(changed).body).toBe('new ' + changed);
  expect(main.saved.get(kept).body).toBe('old');
  expect(main.saved.has(gone)).toBe(false);
  expect(main.saved.has(nowSame)).toBe(false);
  // The update's cache is gone, and the map is downloaded, at its new version.
  expect(caches['zeldamaps-offline-TotK-update']).toBeUndefined();
  expect(records.TotK).toMatchObject({ status: 'downloaded', version: 'new' });
  expect(records.TotK.pendingUpdate).toBeUndefined();
});

test('a failed update leaves the map as it was, still downloaded', async () => {
  const changed = url('/tiles/totk/a/1_0_0.png');
  const { zmap, job, main, records, fetch } = setup({
    tiles, record: saved,
    mapFiles: { [changed]: 'old', [url('/tiles/totk/a/0_0_0.png')]: 'old' },
    oldIndex: { [changed]: '1:0', [url('/tiles/totk/a/0_0_0.png')]: '1:1' }
  });
  fetch.mockImplementation(async u => {
    u = String(u);
    if (u.includes('get_offline_maps')) return response('', { success: true, total: tiles.length, totalBytes: 2000, version: 'new', tiles });
    if (u.includes('get_container')) return response('', [{ id: 21 }]);
    if (u.includes('/tiles/')) return { ok: false, status: 404, type: 'basic' };
    return response('', {});
  });
  job.isUpdate = true;
  await expect(zmap._runOfflineDownload(job)).rejects.toThrow();
  expect(main.saved.get(changed).body).toBe('old');
  expect(ZMapOfflinePacks.isComplete(records.TotK)).toBe(true);
  expect(records.TotK).toMatchObject({ version: 'old', pendingUpdate: true });
  expect(zmap._reportOfflineEvent).toHaveBeenCalledWith(job.game, 'failed', expect.anything());
});

test('cancelling an update keeps the map as it was and offers the update again', async () => {
  const { zmap, caches, records } = setup({ tiles, record: Object.assign({}, saved, { pendingUpdate: true }) });
  caches['zeldamaps-offline-TotK-update'] = makeCache('zeldamaps-offline-TotK-update');
  expect(await zmap.cancelOfflineDownload('TotK')).toBe('kept');
  expect(caches['zeldamaps-offline-TotK-update']).toBeUndefined();
  expect(caches['zeldamaps-offline-TotK']).toBeDefined();
  expect(records.TotK).toMatchObject({ status: 'downloaded', version: 'old' });
  expect(records.TotK.pendingUpdate).toBeUndefined();
  // (Not declined: the update's offered again.)
  expect(records.TotK.dismissedUpdate).toBeUndefined();
});

test('cancelling a first download removes it, all of it, once it has stopped', async () => {
  const { zmap, job, caches, records } = setup({ tiles, record: { status: 'partial', size: 2000 } });
  let stop;
  job.finished = new Promise(resolve => { stop = resolve; });
  zmap._offlineJob = job;
  const cancelled = zmap.cancelOfflineDownload('TotK');
  expect(job.cancelled).toBe(true);
  await Promise.resolve();
  expect(caches['zeldamaps-offline-TotK']).toBeDefined();
  stop();
  expect(await cancelled).toBe('removed');
  expect(caches['zeldamaps-offline-TotK']).toBeUndefined();
  expect(records.TotK).toBeUndefined();
});

test('a cancelled download isn\'t counted as failed', async () => {
  const { zmap, job } = setup({ tiles });
  job.cancelled = true;
  await expect(zmap._runOfflineDownload(job)).rejects.toThrow('Cancelled');
  expect(zmap._reportOfflineEvent).not.toHaveBeenCalledWith(job.game, 'failed', expect.anything());
});

test('a failed download decides what to keep without listing the pack', async () => {
  const { zmap, job, main } = setup({ tiles });
  const fail = Object.assign(new Error('Full'), { name: 'QuotaExceededError' });
  let puts = 0;
  const put = main.put.getMockImplementation();
  main.put.mockImplementation(async (u, value) => {
    if (String(u).includes('/tiles/') && ++puts === 2) throw fail;
    return put(u, value);
  });
  await expect(zmap._runOfflineDownload(job)).rejects.toBe(fail);
  expect(main.keys).not.toHaveBeenCalled();
});

describe('the update\'s size', () => {
  const MB = 1024 * 1024;
  function sizeText(savedSize, newSize, short) {
    const { zmap } = setup({ tiles, record: Object.assign({}, saved, { size: savedSize }) });
    return zmap._offlineUpdateSizeText({ id: 'TotK', size: newSize }, short);
  }
  test('larger', () => expect(sizeText(1800 * MB, 1920 * MB)).toBe('1.9 GB, 120 MB larger than the map on this device'));
  test('smaller', () => expect(sizeText(1960 * MB, 1920 * MB)).toBe('1.9 GB, 40 MB smaller than the map on this device'));
  test('the same', () => expect(sizeText(1920 * MB, 1920 * MB + 1000)).toBe('1.9 GB, about the same size as the map on this device'));
  test('short, for a list', () => expect(sizeText(1960 * MB, 1920 * MB, true)).toBe('1.9 GB, 40 MB smaller'));
  test('a saved map of unknown size', () => expect(sizeText(undefined, 1920 * MB)).toBe('1.9 GB'));
});

describe('cellular data (only browsers that say: Chrome on Android)', () => {
  function onCellular(type) {
    Object.defineProperty(global.navigator, 'connection', { configurable: true, value: { type, addEventListener() {} } });
  }

  test('a download started on Wi-Fi pauses on cellular data, to carry on on Wi-Fi', async () => {
    const { zmap, job, records } = setup({ tiles });
    job.cellular = false;
    onCellular('cellular');
    const error = await zmap._runOfflineDownload(job).catch(e => e);
    expect(error.waitingForWifi).toBe(true);
    expect(error.fatal).toBeFalsy();
    expect(records.TotK.status).toBe('partial');
    expect(zmap._reportOfflineEvent).not.toHaveBeenCalledWith(job.game, 'failed', expect.anything());
  });

  test('one started on cellular data carries on there', async () => {
    const { zmap, job, records } = setup({ tiles });
    job.cellular = true;
    onCellular('cellular');
    await zmap._runOfflineDownload(job);
    expect(records.TotK.status).toBe('downloaded');
  });

  test('a download picked up again waits for Wi-Fi, unless started on cellular data', () => {
    const { zmap } = setup({ tiles });
    zmap.getUser = () => ({ id: 1 });
    zmap._onPage = () => {};
    zmap._offlineQueue = () => [{ id: 'TotK', name: 'TotK' }, { id: 'BotW', name: 'BotW', cellular: true }];
    const asked = [];
    global.$ = { getJSON: u => { asked.push(u); return { then() {} }; } };
    onCellular('cellular');
    zmap.resumeOfflineDownloads();
    expect(asked).toEqual(['ajax.php?command=get_offline_maps&game=BotW']);
    onCellular('wifi');
    asked.length = 0;
    zmap.resumeOfflineDownloads();
    expect(asked).toHaveLength(2);
    delete global.$;
  });

  test('iPhones never say, so they\'re never treated as on cellular data', () => {
    const { zmap } = setup({ tiles });
    expect(zmap._onCellular()).toBe(false);
  });
});

test('the Offline Maps page checks a pack by its index, not by listing it', () => {
  const zmap = read('scripts/zmap.js');
  const start = zmap.indexOf("var savedState = caches.has(packCacheName(game.id))");
  const end = zmap.indexOf('var sizeLoaded', start);
  const check = zmap.slice(start, end);
  expect(check).toContain('cache.match(ZMapOfflinePacks.indexURL)');
  expect(check).not.toContain('.keys()');
});

test('the service worker shows a map being updated as it was, apart from what\'s new', () => {
  const sw = read('service-worker.js');
  const savedMapsFirst = new Function(sw.slice(sw.indexOf('function savedMapsFirst'), sw.indexOf('async function cacheFirstTile')) + 'return savedMapsFirst;')();
  expect(savedMapsFirst(['zeldamaps-offline-TotK-update', 'zeldamaps-offline-BotW', 'zeldamaps-offline-TotK']))
    .toEqual(['zeldamaps-offline-BotW', 'zeldamaps-offline-TotK', 'zeldamaps-offline-TotK-update']);
});
