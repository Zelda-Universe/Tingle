const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// The game's data asked for as the page starts (index.php), and start-up
// (zmain.lib.js startupJSON) taking those answers instead of asking again.
const startupJSON=($)=>{
  const src=read('scripts/zmain.lib.js');
  return new Function('$','window',src.slice(src.indexOf('function startupJSON('),src.indexOf('function getMapCategories('))+'return startupJSON;')($,global.window);
};
// A small stand-in for jQuery's Deferred.
const deferred=()=>{const done=[],fail=[];let state=null,args;const d={
  resolve(...a){if(state)return d;state='ok';args=a;done.forEach(f=>f(...a));return d;},
  reject(...a){if(state)return d;state='no';args=a;fail.forEach(f=>f(...a));return d;},
  done(f){if(state==='ok')f(...args);else if(!state)done.push(f);return d;},
  fail(f){if(state==='no')f(...args);else if(!state)fail.push(f);return d;}};return d;};

afterEach(()=>{delete window.zmEarlyData;window.zmGameSwitchData=null;});

test('an answer asked for early is used, once, without asking again',async()=>{
  const asked=[];
  const $={Deferred:deferred,getJSON:url=>{asked.push(url);return deferred();}};
  const ready=[];
  Object.defineProperty(document,'readyState',{configurable:true,get:()=>'loading'});
  const add=document.addEventListener;
  document.addEventListener=(type,fn,opts)=>{ if(type==='DOMContentLoaded') ready.push(fn); else add.call(document,type,fn,opts); };
  window.zmEarlyData={'ajax.php?command=get_map&game=21':Promise.resolve([{id:2101}])};
  const got=[];
  startupJSON($)('ajax.php?command=get_map&game=21',data=>got.push(data));
  await new Promise(r=>setTimeout(r,0));
  // Not until the page is ready (the map's element there).
  expect(got).toEqual([]);
  ready.forEach(fn=>fn());
  expect(got).toEqual([[{id:2101}]]);
  delete document.readyState;
  document.addEventListener=add;
  expect(asked).toEqual([]);
  expect(window.zmEarlyData).toEqual({});
});

test('an early request that failed is asked again as always, and its failure handled as ever',async()=>{
  const retry=deferred();
  const $={Deferred:deferred,getJSON:url=>retry};
  window.zmEarlyData={'ajax.php?command=get_markers&game=21':Promise.reject(new Error('offline'))};
  const failed=jest.fn();
  startupJSON($)('ajax.php?command=get_markers&game=21',()=>{}).fail(failed);
  await new Promise(r=>setTimeout(r,0));
  const xhr={status:0};
  retry.reject(xhr,'error');
  expect(failed).toHaveBeenCalledWith(xhr,'error');
});

test('nothing asked early: asked for as always',()=>{
  const asked=[];
  const $={getJSON:(url,fn)=>{asked.push(url);return deferred();}};
  startupJSON($)('ajax.php?command=get_categories&game=21',()=>{});
  expect(asked).toEqual(['ajax.php?command=get_categories&game=21']);
});

test('the page asks for the same things start-up would, settings first, at the top of the page',()=>{
  const page=read('index.php');
  const head=page.indexOf('<head>');
  const early=page.indexOf('window.zmEarlyData = {}');
  expect(early).toBeGreaterThan(head);
  expect(early).toBeLessThan(page.indexOf('jquery.min.js'));
  expect(page).toContain("ask('ajax.php?command=get_container&game=' + game)");
  expect(page).toContain("['get_categories', 'get_map', 'get_markers'].forEach");
  // As zmain.js names the game.
  expect(page).toContain("if (/^ootr?$/i.test(game)) game = 'OoT';");
  for(const command of ['get_categories','get_map','get_markers'])
    expect(read('scripts/zmain.lib.js')).toContain('"ajax.php?command='+command+'&game=" + gameId');
  expect(read('scripts/zmain.js')).toContain('startupJSON(\n  "ajax.php?command=get_container&game=" + gameId');
});

test('a page from before an update reloads; one already up to date doesn\'t; never mid-edit',()=>{
  const page=read('index.php');
  expect(page).toContain("worker.postMessage({ type: 'zeldamaps-worker-version?' });");
  expect(page).toContain("data.version === pageAssetVersion");
  expect(page).toContain('zMap._editingSomething()');
  expect(page).not.toMatch(/controllerchange', function\(\) \{[^}]*\}\s*if\(reloadingForWorker\) return;\s*reloadingForWorker = true;\s*window\.location\.reload\(\);/);
  expect(read('service-worker.js')).toContain("event.source.postMessage({ type: 'zeldamaps-worker-version', version: ASSET_VERSION });");
});

test('analytics loads at once, as always; admins can try it after the map, in this browser',()=>{
  const page=read('index.php');
  const tag=page.slice(page.indexOf('<?php /* Google tag'),page.indexOf('<?php /* comScore'));
  expect(tag).toContain("afterMap = localStorage.getItem('zeldamapsAnalyticsAfterMap') === 'on';");
  expect(tag).toContain('if (!afterMap || window.zmMapReady) loadGtag();');
  expect(tag).toContain("document.addEventListener('zeldamaps:ready', loadGtag);");
  expect(tag).toContain('setTimeout(loadGtag, 15000);');
  expect(tag).toContain("gtag('config', 'G-YGLG406J6N');");
  expect(read('scripts/zmain.lib.js')).toContain("document.dispatchEvent(new Event('zeldamaps:ready'));");
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain("ZMap.prototype.ANALYTICS_AFTER_MAP_KEY = 'zeldamapsAnalyticsAfterMap';");
  expect(zmap).toContain("Number(user.level) < 15) return;");
  expect(zmap).toContain('this._addAnalyticsTimingSetting();');
});
