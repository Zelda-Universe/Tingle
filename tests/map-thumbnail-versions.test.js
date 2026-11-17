const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Switch Map thumbnails carry their file's version in their address, so new
// art at the same file is never hidden by a cached copy (a month, in
// browsers and Cloudflare).
const iconURL=()=>{
  const ZMap=function(){};
  const src=read('scripts/zmap.js');
  const start=src.indexOf('ZMap.prototype._mapIconURL = function');
  new Function('ZMap',src.slice(start,src.indexOf('\n};\n',start)+4))(ZMap);
  const zmap=new ZMap(); zmap.defaultIconURL='images/icons/';
  return (submap,suffix)=>zmap._mapIconURL(submap,suffix);
};

test('a thumbnail\'s address names its version',()=>{
  const url=iconURL();
  expect(url({tileURL:'la_rmk/1_tail_cave/',tileExt:'png',iconVersion:'566151a355'})).toBe('images/icons/la_rmk/1_tail_cave/icon.png?v=566151a355');
  // No version of its own: the artwork's, if it has one; else as it was.
  expect(url({tileURL:'oot/x/',tileExt:'webp'},'?v=abc')).toBe('images/icons/oot/x/icon.webp?v=abc');
  expect(url({tileURL:'eow/hyrule/',tileExt:'png'})).toBe('images/icons/eow/hyrule/icon.png');
});

test('the server gives each its version, from the file itself',()=>{
  const php=read('ajax/get_map.php');
  expect(php).toContain("$iconFile = dirname(__DIR__) . '/images/icons/' . $row2['tileURL'] . 'icon.' . $row2['tileExt'];");
  expect(php).toContain("$row2['iconVersion'] = substr(md5(filemtime($iconFile) . ':' . filesize($iconFile)), 0, 10);");
  // Every place a map's thumbnail address is made uses it.
  const js=read('scripts/zmap.js');
  // (Only the helper itself puts one together.)
  expect(js.match(/defaultIconURL \+ [^;\n]*tileURL \+ 'icon\.'/g).length).toBe(1);
  expect(js.match(/this\._mapIconURL\(/g).length).toBe(5);
});
