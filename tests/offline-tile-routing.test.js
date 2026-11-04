const fs = require('fs');
const vm = require('vm');

function worker(savedURL) {
  const tile = { downloaded: true };
  const pack = { match: jest.fn(async url => String(url) === savedURL ? tile : undefined) };
  const postMessage = jest.fn();
  const fetch = jest.fn(async () => { throw new Error('Offline'); });
  const scope = {
    URL, fetch,
    self: { location: { origin: 'https://stage.zeldamaps.com' },
      addEventListener() {}, clients: { get: async () => ({ postMessage }) } },
    caches: { keys: async () => ['zeldamaps-offline-EoW'], open: async () => pack, match: async () => undefined }
  };
  vm.runInNewContext(fs.readFileSync(__dirname + '/../service-worker.js', 'utf8'), scope);
  return { scope, tile, fetch, postMessage };
}

describe('downloaded tiles across staging and CDN hosts', () => {
  const path = '/tiles/eow/hyrule_overworld/5_10_12.png';
  test.each(['https://stage.zeldamaps.com', 'https://zeldamaps.com'])(
    'loads the downloaded EoW tile saved under %s without network', async origin => {
      const { scope, tile, fetch, postMessage } = worker(origin + path);
      expect(await scope.cacheFirstTile({ url: 'https://zeldamaps.com' + path }, 'phone')).toBe(tile);
      expect(fetch).not.toHaveBeenCalled();
      expect(postMessage).toHaveBeenCalledWith({ type: 'zeldamaps-tile-source', source: 'download', url: 'https://zeldamaps.com' + path });
    });
  test('does not substitute another tile or announce a cache miss as downloaded', async () => {
    const { scope, postMessage } = worker('https://stage.zeldamaps.com' + path);
    await expect(scope.cacheFirstTile({ url: 'https://zeldamaps.com/tiles/totk/8_1_1.png' }, 'phone')).rejects.toThrow('Offline');
    expect(postMessage).not.toHaveBeenCalled();
  });
});
