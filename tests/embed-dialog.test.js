const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Embed Code (scripts/services/EmbedDialog.js): a dialog with the embed shown
// live beside its code, Landscape or Portrait.

const load=()=>{
  const ZMap=function(){};
  new Function('ZMap',read('scripts/services/EmbedDialog.js'))(ZMap);
  return new ZMap();
};

test('the code is a sized frame of embed.php that shrinks to fit, keeping its shape',()=>{
  const zmap=load();
  const src='https://zeldamaps.com/embed.php?game=OoTR&marker=1&zoom=3';
  const landscape=zmap._embedCode(src,'landscape','Piece of Heart');
  expect(landscape).toBe('<iframe src="https://zeldamaps.com/embed.php?game=OoTR&amp;marker=1&amp;zoom=3" width="800" height="500" style="border:0;width:100%;height:auto;aspect-ratio:800/500" title="Piece of Heart - Zelda Maps" frameborder="0" loading="lazy" allowfullscreen></iframe>');
  const portrait=zmap._embedCode(src,'portrait','Say "hi" <now>');
  expect(portrait).toContain('width="400" height="640"');
  expect(portrait).toContain('max-width:400px;height:auto;aspect-ratio:400/640');
  expect(portrait).toContain('title="Say &quot;hi&quot; &lt;now> - Zelda Maps"');
  // Portrait is narrow enough for the phone layout, Landscape wide enough for the drawer beside the map.
  expect(zmap.EMBED_SHAPES.portrait.width).toBeLessThanOrEqual(600);
  expect(zmap.EMBED_SHAPES.landscape.width).toBeGreaterThan(600);
});

test('every Embed Code opens the dialog, and copying is what\'s counted',()=>{
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain("target: 'marker',");
  expect(zmap).toContain("zmap.openEmbedDialog({ src: embedLink, target: 'pin', title: 'Dropped Pin' });");
  expect(read('scripts/services/PathEditor.js')).toContain("zmap.openEmbedDialog({ src: src, target: 'path', title: path.name });");
  const dialog=read('scripts/services/EmbedDialog.js');
  expect(dialog).toContain('zmap.trackEmbedCopy(opts.target);');
  expect(zmap).not.toContain("trackEmbedCopy('"); // not on opening the dialog
  expect(read('javascript.txt')).toContain('scripts/services/EmbedDialog.js');
});

test('an embed keeps its marker open when the map moves (a phone-shaped frame settling)',()=>{
  expect(read('scripts/zmap.js')).toMatch(/_shouldShowMarker\(markers\[newMarker\.markerPos\], true\)\n(\s*\/\/.*\n)*\s*&& !_this\.isFramed\(\)/);
});

test('no ads in an embed, nor the room kept for one',()=>{
  const lib=read('scripts/zmain.lib.js');
  expect(lib).toContain("var embedded = !!window.zmapEmbed || (zMap.isFramed && zMap.isFramed());");
  expect(lib).toContain("var size = authenticated || embedded || mode == 'off' ? null : getAdSize(mobile);");
});
