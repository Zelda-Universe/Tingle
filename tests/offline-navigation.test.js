const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../service-worker.js', 'utf8');

test('offline game switches boot the current app instead of downloaded HTML with obsolete scripts', async () => {
  const currentShell = { version: 'current' };
  const oldDownloadedHTML = { version: 'old-bundle-no-longer-cached' };
  const match = jest.fn(async () => currentShell);
  const globalMatch = jest.fn(async () => oldDownloadedHTML);
  const scope = { URL, self: { location: { origin: 'https://stage.zeldamaps.com' },
    registration: { scope: 'https://stage.zeldamaps.com/' }, addEventListener() {} },
    caches: { open: async () => ({ match }), match: globalMatch },
    fetch: async () => { throw new Error('Offline'); } };
  vm.runInNewContext(source, scope);
  const request = { url: 'https://stage.zeldamaps.com/?game=EoW' };
  expect(await scope.navigateWithCurrentShell(request)).toBe(currentShell);
  expect(match).toHaveBeenCalledWith('https://stage.zeldamaps.com/?game=OoT');
  expect(globalMatch).not.toHaveBeenCalled();
});

test('installation saves public navigation data for every game, not only the current map', async () => {
  const put = jest.fn();
  const scope = { URL, self: { registration: { scope: 'https://stage.zeldamaps.com/' }, addEventListener() {} },
    caches: { open: async () => ({ put }) },
    fetch: jest.fn(async () => ({ ok: true, clone: () => ({ json: async () => [
      { id: 21, shortName: 'TotK' }, { id: 22, shortName: 'EoW' }
    ] }) })) };
  vm.runInNewContext(source, scope);
  await scope.warmNavigationCache();
  expect(put).toHaveBeenCalledTimes(9);
  for (const command of ['get_map', 'get_categories', 'get_markers']) {
    expect(scope.fetch).toHaveBeenCalledWith('https://stage.zeldamaps.com/ajax.php?command=' + command + '&game=22');
  }
});
