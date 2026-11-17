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
