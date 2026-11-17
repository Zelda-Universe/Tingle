const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Switching games without a reload (scripts/services/GameSwitch.js): staff
// only, off unless turned on, and anything it can't do safely is the page
// loaded as always.

const load=(user, stored)=>{
  const ZMap=function(){};
  global.isOcarina=g=>/^(ootr?|64)$/i.test(String(g||''));
  new Function('ZMap',read('scripts/services/GameSwitch.js'))(ZMap);
  // (zmap.js's, shared with the update reload in index.php.)
  new Function('ZMap',read('scripts/zmap.js').match(/ZMap\.prototype\._editingSomething = function[\s\S]*?\n\};\n/)[0])(ZMap);
  const zmap=new ZMap();
  zmap.getUser=()=>user;
  localStorage.clear();
  if(stored) localStorage.setItem(zmap.GAME_SWITCH_KEY,'on');
  return zmap;
};

test('off unless an admin turned it on, in this browser',()=>{
  expect(load(null,true)._gameSwitchOn()).toBe(false);
  expect(load({level:'10'},true)._gameSwitchOn()).toBe(false);
  expect(load({level:'15'},false)._gameSwitchOn()).toBe(false);
  expect(load({level:'15'},true)._gameSwitchOn()).toBe(true);
  expect(load({level:'20'},true)._gameSwitchOn()).toBe(true);
});

test('when it isn\'t safe to switch in place, the page is loaded as always',()=>{
  const zmap=load({level:'20'},true);
  zmap.isFramed=()=>false;
  expect(zmap._gameSwitchBlocker()).toBe('not loaded');
  zmap.map={}; zmap.mapControl={getContentType:()=>'markerEdit-12'};
  expect(zmap._gameSwitchBlocker()).toBe('editing');
  zmap.mapControl.getContentType=()=>'category';
  zmap._pathEditing={};
  expect(zmap._gameSwitchBlocker()).toBe('editing a path');
  zmap._pathEditing=null; zmap._offlineJob={};
  expect(zmap._gameSwitchBlocker()).toBe('downloading');
  zmap._offlineJob=null;
  expect(zmap._gameSwitchBlocker()).toBe(null);
  zmap.isFramed=()=>true;
  expect(zmap._gameSwitchBlocker()).toBe('embed');
});

test('OoT\'s two names are the same game',()=>{
  const zmap=load(null);
  expect(zmap._sameGame('OoT','OoTR')).toBe(true);
  expect(zmap._sameGame('TotK','totk')).toBe(true);
  expect(zmap._sameGame('TotK','BotW')).toBe(false);
});

test('every way to another game goes through openGameURL',()=>{
  expect(read('scripts/controls/ZLayers.js')).toContain('if(window.zMap && zMap.openGameURL && zMap._gameSwitchOn && zMap._gameSwitchOn()) {');
  expect(read('scripts/controls/ZLayers.js')).toContain('zMap.openGameURL(url);');
  expect(read('scripts/zwiki.js').match(/openGameURL\(/g).length).toBe(2);
  expect(read('scripts/znotifications.js').match(/openGameURL\(/g).length).toBe(2);
  // (A path's revision opens where it's clicked, in any game: no longer one.)
  expect(read('scripts/services/PathEditor.js').match(/openGameURL\(/g).length).toBe(1);
  expect(read('scripts/zmap.js')).toContain('_this.openGameURL(url.href);');
  expect(read('scripts/zmapsettings.js')).toContain('this.openGameURL(url.href)');
  // (None left loading another game's address directly.)
  expect(read('scripts/zwiki.js')).not.toMatch(/window\.location\.href = (this|_this)\._markerURLWithReturn/);
});

test('a map\'s page-wide listeners are recorded, to be taken away on a switch',()=>{
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain("this._onPage(window, 'resize', invalidateMapSize);");
  expect(zmap).toContain("this._onCleanup(function() { message.remove(); });");
  expect(read('scripts/controls/OotFloors.js')).toContain('zmap._onCleanup(function() { panel.remove(); });');
  expect(read('scripts/znotifications.js')).toContain('this._onCleanup(function() { window.clearInterval(poll); });');
  const game=read('scripts/services/GameSwitch.js');
  expect(game).toContain("(this._pageCleanups || []).splice(0).forEach(function(cleanup) {");
  expect(game).toContain('try { this.map.off(); this.map.remove(); }');
});

// The start-up chain (zmain.lib.js): what a switch already asked for, used
// at once; a page load asks for itself, as always.
const startupJSONSource=()=>{
  const src=read('scripts/zmain.lib.js');
  return src.slice(src.indexOf('function startupJSON('),src.indexOf('function getMapCategories('));
};

test('a switch\'s answers are used at once; a page load asks, as always',()=>{
  const asked=[];
  const $={getJSON:(url,fn)=>{asked.push(url);return {fail(){}};}};
  const startupJSON=new Function('$','window',startupJSONSource()+'return startupJSON;')($,global.window);
  window.zmGameSwitchData=null;
  startupJSON('ajax.php?command=get_map&game=19',()=>{});
  expect(asked).toEqual(['ajax.php?command=get_map&game=19']);
  // In: done straight away, and used once.
  const got=[];
  const answered={done(fn){fn([{id:1}]);return this;},fail(){return this;}};
  window.zmGameSwitchData={'ajax.php?command=get_map&game=19':answered};
  startupJSON('ajax.php?command=get_map&game=19',data=>got.push(data));
  expect(got).toEqual([[{id:1}]]);
  expect(window.zmGameSwitchData).toEqual({});
  expect(asked.length).toBe(1);
  window.zmGameSwitchData=null;
});

test('switching builds the map and sidebar before the markers; a page load with them',()=>{
  const src=read('scripts/zmain.lib.js');
  expect(src).toContain('if(window.zmGameSwitchBuildEarly) {\n      zMap.buildMap(gameId);');
  expect(src).toContain('if(!zMap._builtBeforeMarkers) zMap.buildMap(gameId);');
  // (A sidebar built before the games were in gets them.)
  expect(src).toContain('if(zMap.mapControl && zMap.mapControl.refreshGameMenu) zMap.mapControl.refreshGameMenu();');
  const sw=read('scripts/services/GameSwitch.js');
  // The flags never outlive the build.
  expect(sw).toContain('finally { window.zmGameSwitchBuildEarly = false; window.zmGameSwitchData = null; }');
});

test('from Switch Game, the new sidebar starts there and goes Back to its categories',()=>{
  const zmap=load({level:'20'},true);
  const calls=[];
  zmap.mapControl={setContent:(page,type)=>calls.push(['set',type,page.inert,page.getAttribute('aria-hidden')]),resetContent(){calls.push(['back',this._navigatingBack]);}};
  zmap._withoutPageSlide=fn=>{calls.push('no slide');return fn();};
  zmap._slideBackFromGameMenu(document.createElement('div'));
  expect(calls).toEqual(['no slide',['set','gameSwitchFrom',true,'true'],['back',true]]);
});

test('the background pulses while a map\'s first images load',()=>{
  const css=read('styles/zmain.css');
  expect(css).toContain('main.leaflet-container.zm-map-loading::before');
  expect(css).toContain('@keyframes zm-map-loading-pulse');
  const zmap=load(null);
  const handlers={};
  const container=document.createElement('main');
  global.L={GridLayer:function(){}};
  const layer=Object.assign(new L.GridLayer(),{isLoading:()=>true,on:(e,fn)=>{handlers.load=fn;},off:()=>{}});
  zmap.map={getContainer:()=>container,eachLayer:fn=>fn(layer),on:()=>{},off:()=>{}};
  zmap._watchMapLoading();
  expect(container.classList.contains('zm-map-loading')).toBe(true);
  handlers.load();
  expect(container.classList.contains('zm-map-loading')).toBe(false);
});

describe('the old game stays on screen till the new one is drawn',()=>{
  const setup=()=>{
    const zmap=load(null);
    zmap.MAP_TRANSITIONS={game:'fade'};
    const container=document.createElement('main');
    const mapPane=document.createElement('div');
    mapPane.innerHTML='<img class="tile"><img class="marker" id="m9">';
    container.appendChild(mapPane);
    zmap.map={getContainer:()=>container,_mapPane:mapPane,eachLayer:()=>{}};
    zmap.mapControl={_stillCopy:el=>{const c=el.cloneNode(true);c.querySelectorAll('[id]').forEach(p=>p.removeAttribute('id'));return c;}};
    return {zmap,container};
  };
  afterEach(()=>{jest.useRealTimers();delete window.zmMapWaiting;});

  test('a copy of the map, over the map\'s element; one already there is kept',()=>{
    const {zmap,container}=setup();
    const cover=zmap._coverMap();
    expect(cover.className).toBe('zm-map-cover');
    expect(cover.parentNode).toBe(container);
    expect(cover.querySelector('.marker')).not.toBeNull();
    expect(cover.querySelector('#m9')).toBeNull();
    expect(zmap._coverMap()).toBe(cover);
    expect(read('styles/zmain.css')).toMatch(/\.zm-map-cover \{[^}]*z-index: 450/);
  });

  test('taken away once the tiles are drawn and the markers are in, faded, the dimming with it',()=>{
    jest.useFakeTimers();
    let loading=true, markersDone;
    global.L={GridLayer:function(){}};
    const layer=Object.assign(new L.GridLayer(),{isLoading:()=>loading});
    const frames=[];
    window.requestAnimationFrame=fn=>frames.push(fn);
    const waiting=jest.fn();
    window.zmMapWaiting=waiting;
    const {zmap,container}=setup();
    const cover=zmap._coverMap();
    zmap.map.eachLayer=fn=>fn(layer);
    const markers={always:fn=>{markersDone=fn;}};
    zmap._uncoverWhenDrawn(cover,markers,null);
    const step=()=>{const fn=frames.shift(); if(fn) fn();};
    loading=false; step();
    // Tiles in, markers not yet: still there.
    expect(cover.parentNode).toBe(container);
    markersDone(); step();
    expect(cover.style.opacity).toBe('0');
    expect(waiting).toHaveBeenCalledWith(container,false);
    jest.advanceTimersByTime(200);
    expect(cover.parentNode).toBeNull();
  });

  test('a cut takes it away at once',()=>{
    const {zmap}=setup();
    zmap.MAP_TRANSITIONS={game:'cut'};
    global.L={GridLayer:function(){}};
    window.zmMapWaiting=jest.fn();
    const cover=zmap._coverMap();
    zmap._uncoverWhenDrawn(cover,null,null);
    expect(cover.parentNode).toBeNull();
  });
});

test('the dimming: over the map, under the sidebar, and its spinner beside a sidebar',()=>{
  const ZMap=function(){};
  window.zmMapWaiting=undefined;
  new Function('ZMap',read('scripts/zmap.js').match(/function zmMapWaiting[\s\S]*?\n\}\n/)[0]+'\nwindow.zmMapWaiting=zmMapWaiting;')(ZMap);
  const container=document.createElement('main');
  const sidebar=document.createElement('div');
  container.getBoundingClientRect=()=>({top:0,left:0,right:1200,bottom:800,width:1200,height:800});
  sidebar.getBoundingClientRect=()=>({top:0,left:0,right:400,bottom:800,width:400,height:800});
  window.zmMapWaiting(container,true,sidebar);
  const veil=container.querySelector('.zm-map-waiting');
  expect(veil.classList.contains('is-on')).toBe(true);
  expect(veil.getAttribute('role')).toBe('status');
  expect(veil.style.getPropertyValue('--zm-waiting-left')).toBe('400px');
  window.zmMapWaiting(container,true,sidebar);
  expect(container.querySelectorAll('.zm-map-waiting').length).toBe(1);
  window.zmMapWaiting(container,false);
  expect(veil.classList.contains('is-on')).toBe(false);
  const css=read('styles/zmain.css');
  expect(css).toMatch(/\.zm-map-waiting \{[^}]*z-index: 500/);
  delete window.zmMapWaiting;
});

test('a game switched in place is counted as the page load it stands for',()=>{
  const zmap=load(null);
  const sent=[];
  window.gtag=(...args)=>sent.push(['gtag',...args]);
  window.COMSCORE={beacon:o=>sent.push(['comscore',o])};
  document.title='Breath of the Wild Interactive Map - Zelda Maps';
  zmap._countGameSwitchVisit();
  const view=sent.find(s=>s[0]==='gtag');
  expect(view.slice(1,3)).toEqual(['event','page_view']);
  expect(view[3].page_title).toBe('Breath of the Wild Interactive Map - Zelda Maps');
  expect(view[3].page_location).toBe(window.location.href);
  expect(sent.find(s=>s[0]==='comscore')[1]).toEqual({c1:'2',c2:'6035118'});
  delete window.gtag; delete window.COMSCORE;
});
