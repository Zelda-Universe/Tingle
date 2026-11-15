const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Image carousels (scripts/services/ImageCarousel.js): images in a row in a
// marker's contents show one at a time.
function load() {
  const ZMap=function(){};
  new Function('ZMap',read('scripts/services/ImageCarousel.js'))(ZMap);
  return new ZMap();
}
function contents(html) {
  document.body.innerHTML='<div class="popupContent">'+html+'</div>';
  return document.querySelector('.popupContent');
}

test('two or more images in a row become one carousel, with a dot each',()=>{
  const zmap=load();
  const root=contents('<img src="a.webp">\n<img src="b.webp">\n<p>Speak to the Cucco Lady.</p>');
  zmap._buildImageCarousels(document.body);
  const carousel=root.querySelector('.zm-carousel');
  expect(carousel).not.toBeNull();
  expect(Array.from(carousel.querySelectorAll('.zm-carousel-slide img')).map(i=>i.getAttribute('src'))).toEqual(['a.webp','b.webp']);
  expect(carousel.querySelectorAll('.zm-carousel-dot').length).toBe(2);
  // First image showing: no Back arrow, a Next one, the first dot lit.
  expect(carousel.querySelector('.zm-carousel-prev').hidden).toBe(true);
  expect(carousel.querySelector('.zm-carousel-next').hidden).toBe(false);
  expect(carousel.querySelector('.zm-carousel-dot').classList.contains('active')).toBe(true);
  // The text after it stays where it was.
  expect(root.lastElementChild.textContent).toBe('Speak to the Cucco Lady.');
  // Built once: looking again changes nothing.
  zmap._buildImageCarousels(document.body);
  expect(root.querySelectorAll('.zm-carousel').length).toBe(1);
});

test('images in paragraphs, links and the same paragraph count; text between them ends a row',()=>{
  const zmap=load();
  const root=contents('<p style="text-align:center"><img src="a"></p><p><a href="x"><img src="b"></a><img src="c"></p>'+
    '<p>Between</p><img src="d">');
  zmap._buildImageCarousels(document.body);
  expect(root.querySelectorAll('.zm-carousel').length).toBe(1);
  expect(root.querySelectorAll('.zm-carousel-slide').length).toBe(3);
  // (The link around an image goes with it.)
  expect(root.querySelector('.zm-carousel-slide a img').getAttribute('src')).toBe('b');
  // One image on its own stays as it is.
  expect(root.lastElementChild.nodeName).toBe('IMG');
});

test('an image alone, or with words beside it, is no carousel',()=>{
  const zmap=load();
  const root=contents('<img src="a"><p>Look: <img src="b"></p>');
  zmap._buildImageCarousels(document.body);
  expect(root.querySelector('.zm-carousel')).toBeNull();
});

test('the credit of the image showing goes under the carousel',()=>{
  const zmap=load();
  const root=contents('<img src="a"><img src="b">');
  zmap._buildImageCarousels(document.body);
  const slide=root.querySelector('.zm-carousel-slide');
  slide.insertAdjacentHTML('beforeend','<span class="zm-image-credit">Image: Polygon</span>');
  zmap._showCarouselCredit(root.querySelector('.zm-carousel'));
  const box=root.querySelector('.zm-carousel + .zm-carousel-credit');
  expect(box.hidden).toBe(false);
  expect(box.textContent).toBe('Image: Polygon');
});

test('it never moves on by itself',()=>{
  const source=read('scripts/services/ImageCarousel.js');
  expect(source).not.toMatch(/setInterval|setTimeout/);
  // Swiped on a phone: the track scrolls sideways, a slide at a time.
  const css=read('styles/zmain.css');
  expect(css).toContain('scroll-snap-type: x mandatory');
  expect(read('javascript.txt')).toContain('scripts/services/ImageCarousel.js\nscripts/services/ImageCredits.js');
});

// A path's steps (PathEditor.js): a paragraph every step has word for word
// is left out of each.
function shared() {
  const source=read('scripts/services/PathEditor.js');
  const start=source.indexOf('ZMap.prototype._withoutSharedBlocks');
  const ZMap=function(){};
  new Function('ZMap',source.slice(start,source.indexOf("// Where a step's marker",start)))(ZMap);
  return new ZMap();
}

test('text on every step of a path is hidden; text on only some stays',()=>{
  const zmap=shared();
  const out=zmap._withoutSharedBlocks([
    '<img src="a"><p>Speak to the Cucco Lady.</p>\n<p><em>Adult Link</em></p>',
    '<p>Return the Pocket Cucco.</p><p><em>Adult  Link</em></p><p>Young Link</p>',
    '',
    '<p>Give Cojiro to the man.</p><p><em>Adult Link</em></p><p>Young Link</p>'
  ]);
  expect(out[0]).toBe('<img src="a"><p>Speak to the Cucco Lady.</p>');
  expect(out[1]).toBe('<p>Return the Pocket Cucco.</p><p>Young Link</p>');
  expect(out[2]).toBe('');
  expect(out[3]).toBe('<p>Give Cojiro to the man.</p><p>Young Link</p>');
});

test('with one step, or nothing in common, steps keep all their text',()=>{
  const zmap=shared();
  expect(zmap._withoutSharedBlocks(['<p>Adult Link</p>',''])).toEqual(['<p>Adult Link</p>','']);
  const two=['<p>A</p><p>Adult Link</p>','<p>B</p><p>Young Link</p>'];
  expect(zmap._withoutSharedBlocks(two)).toEqual(two);
});
