const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Paths on a downloaded map, offline: kept on the device for the signed-in
// account (ZOfflineSync.savePaths), and used when get_paths can't be reached.

test('paths are kept for the account, and used when the server can\'t be reached',()=>{
  const paths=read('scripts/services/Paths.js');
  expect(paths).toContain('ZOfflineSync.savePaths(user.id, game, paths);');
  expect(paths).toContain('(user ? ZOfflineSync.savedPaths(user.id, game) : Promise.resolve(null))');
  // Else the map's own, saved with its download (signed in or out).
  expect(paths).toContain('return paths || (window.ZMapOfflinePacks ? ZMapOfflinePacks.savedPaths(game) : null);');
  // A page that starts offline asks for them too.
  expect(read('scripts/zmain.lib.js')).toContain('if(offline) { if(zMap.loadPaths) zMap.loadPaths(); return; }');
});

test('downloading a map saves its paths with it, as anyone sees them, and the account\'s apart',()=>{
  const job=read('scripts/services/OfflineDownloads.js');
  // Map data, kept with the map (signing out keeps it): fetched without the account.
  expect(job).toContain("saves.push(fetchWithRetry(pathsURL, { cache: 'no-cache', credentials: 'omit' })");
  expect(job).toContain('dataURLs.push(pathsURL);');
  expect(job).toContain('ZOfflineSync.savePaths(account.id, containers[0].id, paths)');
  // (Found by address: packs are named by their offline id, the page asks by container id.)
  expect(read('scripts/zmap.js')).toContain('return caches.match(url)');
  const sync=read('scripts/util/ZOfflineSync.js');
  expect(sync).toContain("accountCache: 'zeldamaps-offline-account',");
  expect(sync).toContain('caches.delete(this.accountCache)');
});

test('the account\'s cache survives updates and isn\'t searched for map tiles',()=>{
  const sw=read('service-worker.js');
  expect(sw).toContain("const ACCOUNT_CACHE = 'zeldamaps-offline-account';");
  expect(sw).toContain("name !== 'zeldamaps-offline-navigation' && name !== ACCOUNT_CACHE");
  expect(sw).toContain('name !== NAVIGATION_CACHE && name !== ACCOUNT_CACHE');
});

test('every font the stylesheets use is saved for offline',()=>{
  const sw=read('service-worker.js');
  expect(sw).toContain("'./fonts/HyliaSerifBeta-Regular.otf',");
  expect(sw).toContain("'./fonts/icomoon.woff?xz2wpa',");
});
