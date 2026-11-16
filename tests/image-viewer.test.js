const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Clicking an image shows it larger with its credit (scripts/services/ImageViewer.js).

const load=()=>{
  const ZMap=function(){};
  new Function('ZMap',read('scripts/services/ImageViewer.js'))(ZMap);
  return new ZMap();
};
const img=(src,href)=>{
  const el={nodeName:'IMG',getAttribute:k=>k==='src'?src:null,closest:()=>null,complete:true,naturalWidth:0,clientWidth:0};
  el.parentNode=href===undefined?{nodeName:'P'}:{nodeName:'A',getAttribute:()=>href};
  return el;
};

test('the larger version: a linked image, a TotK compendium screenshot, or the image itself',()=>{
  const zmap=load();
  expect(zmap._imageLargeSource(img('uploads/a.webp','uploads/a-big.jpg'))).toBe('uploads/a-big.jpg');
  expect(zmap._imageLargeSource(img('data/TotK/gallery/Animal_Bear_A_Icon.png'))).toBe('data/TotK/gallery/Animal_Bear_A_Detail.png');
  expect(zmap._imageLargeSource(img('uploads/a.webp','https://example.com/page'))).toBe('uploads/a.webp');
  expect(zmap._imageLargeSource(img('uploads/a.webp'))).toBe('uploads/a.webp');
});

test('only images with more to see open',()=>{
  const zmap=load();
  const shrunk=Object.assign(img('uploads/a.webp'),{naturalWidth:1600,clientWidth:290});
  const actual=Object.assign(img('uploads/b.webp'),{naturalWidth:300,clientWidth:290});
  expect(zmap._imageZoomable(shrunk)).toBe(true);
  expect(zmap._imageZoomable(actual)).toBe(false);
  expect(zmap._imageZoomable(img('data/TotK/gallery/X_Icon.png'))).toBe(true);
  expect(zmap._imageZoomable(img('data:image/png;base64,xx'))).toBe(false);
});

test('wherever images get credits, with the credit in the overlay',()=>{
  expect(read('scripts/services/ImageCredits.js')).toContain('if(this._wireImageViewer) this._wireImageViewer(root);');
  const viewer=read('scripts/services/ImageViewer.js');
  expect(viewer).toContain("zmap._imageCreditHTML((zmap._imageCreditCache || {})[source.getAttribute('src')] || null)");
  expect(read('javascript.txt')).toContain('scripts/services/ImageViewer.js');
  expect(read('styles/zmain.css')).toContain('.zm-zoomable { cursor: zoom-in; }');
});
