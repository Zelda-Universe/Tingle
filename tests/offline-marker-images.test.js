/** @jest-environment jsdom */
const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../scripts/zmap.js', 'utf8');
const scope = { document, URL, Set, localStorage };
vm.runInNewContext(source.slice(source.indexOf('var ZMapOfflinePacks ='), source.indexOf('ZMap.prototype.checkOfflineMapUpdates =')), scope);

test('collects nested marker images, lazy images, responsive variants and inline backgrounds', () => {
  const urls = scope.ZMapOfflinePacks.embeddedImageURLs([
    { description: '<img src="https://zeldauniverse.net/a.jpg?x=1&amp;y=2">',
      tabText: '<picture><source srcset="//cdn.example/a.webp 1x, //cdn.example/b.webp 2x"><img src="data/LA/item.png" data-src="https://zeldauniverse.net/lazy.jpg"></picture>' },
    { tabText: '<div style="background-image:url(\'/images/hint.png\')"></div><img src="data:image/png;base64,AAAA"><a href="https://example.com/guide">Guide</a>' }
  ], 'https://stage.zeldamaps.com/');
  expect(Array.from(urls).sort()).toEqual([
    'https://cdn.example/a.webp', 'https://cdn.example/b.webp',
    'https://stage.zeldamaps.com/data/LA/item.png', 'https://stage.zeldamaps.com/images/hint.png',
    'https://zeldauniverse.net/a.jpg?x=1&y=2', 'https://zeldauniverse.net/lazy.jpg'
  ].sort());
});

test('older packs are offered an update to add previously omitted marker images', () => {
  const game = { available: true, version: 'unchanged-tiles' };
  expect(scope.ZMapOfflinePacks.needsUpdate({version:game.version}, game)).toBe(true);
  expect(scope.ZMapOfflinePacks.needsUpdate({version:game.version,assetsVersion:1}, game)).toBe(false);
});

test('external marker images are returned from downloaded packs without a network request', async () => {
  const image = { cachedImage: true };
  const fetch = jest.fn(async () => { throw new Error('Offline'); });
  const worker = { URL, fetch, self: { addEventListener() {} }, caches: {
    keys: async () => ['zeldamaps-offline-LA'], open: async () => ({ match: async () => image })
  } };
  vm.runInNewContext(fs.readFileSync(__dirname + '/../service-worker.js', 'utf8'), worker);
  expect(await worker.downloadedImageOrNetwork({url:'https://zeldauniverse.net/hint.jpg'})).toBe(image);
  expect(fetch).not.toHaveBeenCalled();
});
