const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// A page gone back to is drawn at once, as it was left, rather than as
// "Loading…" and then its content (zwiki.js _wikiGet, ZLayers setContent).
const setup=()=>{
  const src=read('scripts/zwiki.js');
  const start=src.indexOf('ZMap.prototype.WIKI_BACK_CACHE_SIZE');
  const end=src.indexOf('// Anything sent to the server could change what a page shows.');
  const ZMap=function(){};
  const asked=[];
  const $={
    param:o=>Object.keys(o).map(k=>k+'='+o[k]).join('&'),
    Deferred:()=>{let v;const d={resolve(x){v=x;return d;},promise(){return d;},done(f){f(v);return d;}};return d;},
    getJSON:(url,params)=>{asked.push(url+' '+JSON.stringify(params));let cb;const answer={done(f){cb=f;return answer;}};answer.answer=data=>cb(data);asked.last=answer;return answer;}
  };
  new Function('ZMap','$',src.slice(start,end))(ZMap,$);
  const zmap=new ZMap();
  zmap.getUser=()=>({id:15});
  zmap.mapControl={_backRendering:false};
  return {zmap,asked};
};

test('gone back to: answered as it was, without asking the server', () => {
  const {zmap,asked}=setup();
  zmap._wikiGet('recent_changes',{game:'TotK'});
  asked.last.answer({success:true,changes:[1,2,3]});
  zmap.mapControl._backRendering=true;
  let got;
  zmap._wikiGet('recent_changes',{game:'TotK'}).done(d=>{got=d;});
  expect(got).toEqual({success:true,changes:[1,2,3]});
  expect(asked.length).toBe(1);
});

test('opened any other way: always asked afresh', () => {
  const {zmap,asked}=setup();
  zmap._wikiGet('recent_changes',{game:'TotK'});
  asked.last.answer({success:true,changes:[1]});
  zmap._wikiGet('recent_changes',{game:'TotK'});
  expect(asked.length).toBe(2);
});

test('anything sent to the server forgets them, and an answer asked for before is not kept', () => {
  const {zmap,asked}=setup();
  zmap._wikiGet('marker_history',{id:1});
  asked.last.answer({success:true,revisions:[1]});
  zmap._wikiGet('marker_history',{id:1});
  const before=asked.last;
  zmap._forgetWikiAnswers();
  before.answer({success:true,revisions:[1]});
  zmap.mapControl._backRendering=true;
  zmap._wikiGet('marker_history',{id:1});
  expect(asked.length).toBe(3);
});

test('failed answers are never kept', () => {
  const {zmap,asked}=setup();
  zmap._wikiGet('talk',{id:1});
  asked.last.answer({success:false,msg:'nope'});
  zmap.mapControl._backRendering=true;
  zmap._wikiGet('talk',{id:1});
  expect(asked.length).toBe(2);
});

test('pictures load at once on a page gone back to, else as they come into view', () => {
  const {zmap}=setup();
  expect(zmap._lazyImage()).toBe(' loading="lazy"');
  zmap.mapControl._backRendering=true;
  expect(zmap._lazyImage()).toBe('');
});

test('a page counts as gone back to only while it is built', () => {
  const js=read('scripts/controls/ZLayers.js');
  expect(js).toContain('if(this._navigatingBack) {\n      this._backRendering = true;');
  expect(js).toContain("this._backRenderingTimer = window.setTimeout(function() { control._backRendering = false; }, 0);");
  expect(read('scripts/zwiki.js')).toContain("if(options && /^post$/i.test(options.type || '') && window.zMap && zMap._forgetWikiAnswers) zMap._forgetWikiAnswers();");
});

test('a settling page that changes again re-fits from where it is, never ending at the old height and jumping', () => {
  const js = read('scripts/controls/ZLayers.js');
  const fit = js.slice(js.indexOf('var fitSettledHeight = function()'), js.indexOf('this._settleFit = fitSettledHeight;'));
  const cancel = fit.indexOf('if(this._settleFitAnimation) { this._settleFitAnimation.cancel(); this._settleFitAnimation = null; }');
  const measure = fit.indexOf('var targetHeight = this._container.getBoundingClientRect().height;');
  expect(cancel).toBeGreaterThan(-1);
  expect(cancel).toBeLessThan(measure);
});

test('swiping back keeps the page as it was on screen till the rebuilt one is drawn, then swaps them in one frame', () => {
  const js = read('scripts/controls/ZLayers.js');
  const finish = js.slice(js.indexOf('var finish = function(commit) {'), js.indexOf("contents.addEventListener('pointerdown'"));
  // Rebuilt out of sight, the preview on top, styled as it was: its ids
  // (pages are styled by them) kept, as it's after the real page in the
  // document, so never found first.
  expect(finish).toContain("contents.style.visibility = 'hidden';");
  expect(finish).toContain("preview.style.zIndex = '2';");
  expect(finish).not.toContain("removeAttribute('id')");
  expect(js).toMatch(/contents\.parentNode\.appendChild\(page\);\s*page\.scrollTop = entry\.scrollTop;/);
  expect(finish.indexOf("contents.style.visibility = 'hidden';")).toBeLessThan(finish.indexOf('goBack(button);\n        var frames = 0;'));
  // Swapped once its icons and the pictures in view are in, or after a few frames.
  expect(finish).toContain("contents.querySelector('i.fas, i.far, i.fab')");
  expect(finish).toContain('if(pending && ++frames < 8) return window.requestAnimationFrame(reveal);');
  expect(finish).toMatch(/contents\.style\.visibility = '';\s*preview\.remove\(\);/);
});

describe('going back returns to where the page was scrolled', () => {
  const vm = require('vm');
  const methods = (() => {
    const context = { $: { extend: (_, ...v) => Object.assign({}, ...v) }, ZConfig: { getConfig: () => null }, L: { Control: { Layers: { prototype: { options: {} }, extend(m) { function C() {} C.prototype = m; C.addInitHook = () => {}; return C; } } }, control: {} } };
    vm.runInNewContext(read('scripts/controls/ZLayers.js'), context);
    return context.L.Control.ZLayers.prototype;
  })();
  const control = (scrollHeight) => Object.assign(Object.create(methods), {
    _contentType: 'recentChanges-TotK',
    _contents: { scrollTop: 0, scrollHeight, clientHeight: 500 },
    _pendingScroll: { type: 'recentChanges-TotK', top: 900 }
  });

  test('scrolled to where it was, once it is long enough', () => {
    const c = control(2000);
    c._applyPendingScroll();
    expect(c._contents.scrollTop).toBe(900);
    expect(c._pendingScroll).toBeNull();
  });

  test('not long enough yet (its content still coming): as far as it goes, and again when it settles', () => {
    const c = control(800);
    c._applyPendingScroll();
    expect(c._contents.scrollTop).toBe(300);
    expect(c._pendingScroll).not.toBeNull();
    c._contents.scrollHeight = 2000;
    c._applyPendingScroll(true);
    expect(c._contents.scrollTop).toBe(900);
    expect(c._pendingScroll).toBeNull();
  });

  test('another page open by then: left alone', () => {
    const c = control(2000);
    c._contentType = 'pathRevision-5';
    c._applyPendingScroll();
    expect(c._contents.scrollTop).toBe(0);
  });

  test('both the back button and a swipe use the place kept with the page', () => {
    const js = read('scripts/controls/ZLayers.js');
    expect(js).toContain('if(this._navigatingBack || this._skipNextSlide) {');
    expect(js).toContain('if(kept && kept.type === vType && kept.scrollTop > 0) returnScroll = kept.scrollTop;');
    expect(js).toContain('Promise.resolve().then(function() { scrollingControl._applyPendingScroll(); });');
    expect(read('scripts/zwiki.js')).toContain('if(control._applyPendingScroll) control._applyPendingScroll(true);');
  });
});
