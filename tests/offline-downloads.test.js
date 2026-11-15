const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Offline map downloads (scripts/services/OfflineDownloads.js): smaller (each
// image once), and kept going: apart from the Offline Maps page, a toast
// showing progress, files tried again, picked up again on the next page.

test('a tile that\'s the same image as another is downloaded and saved once',()=>{
  const php=read('ajax/get_offline_maps.php');
  expect(php).toContain("if (isset($first[$entry['hash']])) $entry['same'] = $first[$entry['hash']];");
  // Sizes count each image once.
  expect(php).toContain("'totalBytes' => offlineManifestBytes($tiles),");
  expect(php).toContain("'size' => offlineManifestBytes($manifest['tiles']),");
  // Hashes are kept, so only new or changed files are read again.
  expect(php).toContain("$key = $path . '|' . $size . '|' . $mtime;");
  const job=read('scripts/services/OfflineDownloads.js');
  expect(job).toContain('aliases[absoluteURL] = new URL(tile.same, document.baseURI).href;');
  expect(job).toContain('cache.put(ZMapOfflinePacks.aliasesURL');
  const sw=read('service-worker.js');
  expect(sw).toContain("const same = aliases && aliases.get(tilePath(request.url));");
  expect(sw).toContain("if (same) tile = await matchPackTile(pack, same);");
});

test('images the page never shows are left out (TotK\'s _Detail gallery images)',()=>{
  expect(read('ajax/get_offline_maps.php')).toContain("^data/[^/]+/gallery/[^/]+_Detail\\.png$#i");
  expect(read('scripts/zmap.js')).not.toContain('_Detail.png');
});

test('a download runs apart from the page, with a toast, and is picked up again',()=>{
  const job=read('scripts/services/OfflineDownloads.js');
  // Remembered, so the next page picks it up.
  expect(job).toContain("ZMap.prototype.OFFLINE_QUEUE_KEY = 'zeldamapsOfflineQueue';");
  expect(job).toContain("window.addEventListener('online', function() { zmap.resumeOfflineDownloads(); });");
  expect(read('scripts/zmain.lib.js')).toContain('if(zMap.resumeOfflineDownloads) zMap.resumeOfflineDownloads();');
  // A toast that stays while it runs.
  expect(job).toContain("timeOut: 0, extendedTimeOut: 0, tapToDismiss: false");
  // Files that fail are tried again, then once more at the end.
  expect(job).toContain('if(attempt >= 3 || navigator.onLine === false || job.cancelled) throw error;');
  expect(job).toContain('failed.push(tile);');
  // The Offline Maps page shows it rather than running it.
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain("_this.startOfflineDownload(game, { update: card.data('packState') === 'update' });");
  expect(zmap).not.toContain('function downloadBatch(cache, tiles)');
  expect(read('javascript.txt')).toContain('scripts/services/OfflineDownloads.js');
});

test('sizes read as the Offline Maps page shows them',()=>{
  const ZMap=function(){};
  global.$=s=>({text:()=>({html:()=>String(s)})});
  new Function('ZMap',read('scripts/services/OfflineDownloads.js'))(ZMap);
  const zmap=new ZMap();
  expect(zmap._offlineFormatBytes(80786051)).toBe('77 MB');
  expect(zmap._offlineFormatBytes(0)).toBe('0 MB');
  delete global.$;
});
