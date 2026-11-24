const fs=require('fs');
const path=require('path');
const vm=require('vm');
const {execFileSync}=require('child_process');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Image credits (scripts/services/ImageCredits.js, lib/common/image_credits.php).
function load() {
  const context={ZMap:function(){},URL};
  vm.runInNewContext(read('scripts/services/ImageCredits.js'),context);
  const zmap=new context.ZMap();
  zmap._wikiEscape=s=>String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/"/g,'&quot;');
  return zmap;
}

test('a credit line names the author, links the source and shows a license that needs saying',()=>{
  const zmap=load();
  expect(zmap._imageCreditHTML({author:'Polygon',source:'https://www.polygon.com/x',license:'permission'}))
    .toBe('<span class="zm-image-credit">Image: <a href="https://www.polygon.com/x" target="_blank" rel="noopener noreferrer nofollow">Polygon</a> · With permission</span>');
  expect(zmap._imageCreditHTML({author:'Jane',source:'',license:'cc-by-sa'})).toBe('<span class="zm-image-credit">Image: Jane · CC BY-SA</span>');
  // No author: the source's site names it.
  expect(zmap._imageCreditHTML({author:'',source:'https://www.example.com/a',license:'other'})).toContain('>example.com</a>');
  // The site's own: nothing.
  expect(zmap._imageCreditHTML(null)).toBe('');
  expect(zmap._imageCreditHTML({author:'',source:'',license:'own'})).toBe('');
  // Escaped.
  expect(zmap._imageCreditHTML({author:'<b>x</b>',source:'',license:'own'})).not.toContain('<b>');
});

test('the server keys an image the same however its address is written',()=>{
  const script='include "lib/common/image_credits.php"; $_SERVER["HTTP_HOST"]="localhost:8080"; echo json_encode(array_map("imageCreditKey", json_decode($argv[1], true)));';
  const srcs=['uploads/marker-images/1.webp','/uploads/marker-images/1.webp','https://zeldamaps.com/uploads/marker-images/1.webp','http://localhost:8080/uploads/marker-images/1.webp',
    'https://example.com/a.png','marker-video.php?f=15-ab12.mp4','http://localhost:8080/marker-video.php?f=15-ab12.mov','marker-video.php?f=../x.mp4','javascript:alert(1)','uploads/../config.php','data:image/png;base64,AA'];
  const keys=JSON.parse(execFileSync('php',['-r',script,JSON.stringify(srcs)],{cwd:path.join(__dirname,'..')}).toString());
  expect(keys).toEqual(['uploads/marker-images/1.webp','uploads/marker-images/1.webp','uploads/marker-images/1.webp','uploads/marker-images/1.webp',
    'https://example.com/a.png','uploads/marker-videos/15-ab12.mp4','uploads/marker-videos/15-ab12.mov',null,null,null,null]);
});

test('only editors set credits, and the editor offers Credit on a selected image',()=>{
  const save=read('ajax/save_image_credit.php');
  expect(save).toContain('$editor = wikiRequireEditor($db, $map_prefix);');
  expect(save).toContain("'HTTP_SEC_FETCH_SITE'");
  const zmap=read('scripts/zmap.js')+read('scripts/features/MarkerEditor.js');
  expect(zmap).toContain("mediaToolbar('imagecredit', 'image', false, 'addcredit | imagesettings');");
  expect(zmap).toContain("mediaToolbar('videocredited', 'video', true, 'changecredit | videosettings');");
  expect(zmap).toContain('this._watchImageCredits(this.mapControl._contents);');
  expect(read('javascript.txt')).toContain('scripts/services/ImageCredits.js');
});

test('a video\'s credit line calls it a video',()=>{
  const zmap=load();
  expect(zmap._imageCreditHTML({author:'Jane',source:'',license:'cc-by'},'Video')).toBe('<span class="zm-image-credit">Video: Jane · CC BY</span>');
});
