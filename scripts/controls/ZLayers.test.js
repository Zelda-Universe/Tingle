const fs = require('fs');
const vm = require('vm');

function drawerMethods(globals = {}) {
  const context = { ...globals, ZConfig: { getConfig: () => null }, $: { extend: (_, ...values) => Object.assign({}, ...values) }, L: { Control: { Layers: { prototype: { options: {} }, extend(methods) {
    function Control() {}
    Control.prototype = methods;
    Control.addInitHook = () => {};
    return Control;
  } } }, control: {} } };
  vm.runInNewContext(fs.readFileSync(__dirname + '/ZLayers.js', 'utf8'), context);
  // (Leaflet's helpers a test brings, beside the control.)
  if(globals.L) Object.assign(context.L, globals.L);
  return context.L.Control.ZLayers.prototype;
}

describe('profile header scroll compositing',()=>{
  test('scroll updates do not resize the sticky header or its layout margin',()=>{
    const methods=drawerMethods();
    const profile={style:{setProperty:jest.fn()}};
    const bar={isConnected:true,firstChild:{textContent:'Link'},classList:{contains:()=>true,toggle:jest.fn()},style:{setProperty:jest.fn()}};
    const drawer={_compactTitleBar:bar,_compactTitleSource:{textContent:'Link',closest:()=>profile},_contents:{scrollTop:80}};
    methods._updateCompactTitle.call(drawer);
    expect(bar.style.setProperty).toHaveBeenCalledWith('--profile-progress',.5);
    expect(bar.style.setProperty).toHaveBeenCalledWith('--profile-scroll','80px');
    expect(bar.style.height).toBeUndefined();
    expect(bar.style.marginBottom).toBeUndefined();
    expect(profile.style.setProperty).toHaveBeenCalledWith('--profile-scroll','80px');
    drawer._contents.scrollTop=200;
    methods._updateCompactTitle.call(drawer);
    expect(bar.style.setProperty).toHaveBeenCalledWith('--profile-progress',1);
    expect(bar.style.setProperty).toHaveBeenCalledWith('--profile-scroll','160px');
    const writes=bar.style.setProperty.mock.calls.length;
    drawer._contents.scrollTop=250;
    methods._updateCompactTitle.call(drawer);
    expect(bar.style.setProperty).toHaveBeenCalledTimes(writes);
    drawer._contents.scrollTop=-15;
    methods._updateCompactTitle.call(drawer);
    expect(bar.style.setProperty).toHaveBeenCalledWith('--profile-progress',0);
  });

  test('multiple scroll events are coalesced into one animation frame',()=>{
    const frame=jest.fn(()=>1);
    const methods=drawerMethods({window:{requestAnimationFrame:frame}});
    const drawer={_updateCompactTitle:jest.fn()};
    methods._scheduleCompactTitle.call(drawer);
    methods._scheduleCompactTitle.call(drawer);
    expect(frame).toHaveBeenCalledTimes(1);
    frame.mock.calls[0][0]();
    expect(drawer._updateCompactTitle).toHaveBeenCalledTimes(1);
    expect(drawer._compactTitleFrame).toBeNull();
  });

  test('the edit button stays pinned and interactive beyond the avatar collapse',()=>{
    const methods=drawerMethods(),edit={disabled:false};
    const profile={style:{setProperty:jest.fn()},querySelector:()=>edit};
    const bar={isConnected:true,firstChild:{textContent:'Link'},classList:{contains:()=>true,toggle:jest.fn()},style:{setProperty:jest.fn()}};
    const drawer={_compactTitleBar:bar,_compactTitleSource:{textContent:'Link',closest:()=>profile},_contents:{scrollTop:120}};
    methods._updateCompactTitle.call(drawer);
    expect(edit.disabled).toBe(false);
    drawer._contents.scrollTop=400;methods._updateCompactTitle.call(drawer);
    expect(profile.style.setProperty.mock.calls.some(call=>call[0]==='--profile-edit-scroll')).toBe(false);
    drawer._contents.scrollTop=20;methods._updateCompactTitle.call(drawer);
    expect(edit.disabled).toBe(false);
    const css=fs.readFileSync(require('path').join(__dirname,'../../styles/zmain.css'),'utf8');
    const rule=css.slice(css.indexOf('.main-content > .profile-banner-edit {'),css.indexOf('}',css.indexOf('.main-content > .profile-banner-edit {')));
    expect(rule).toContain('position:sticky');
    expect(rule).toContain('top:12px');
    expect(rule).not.toContain('transform:');
    expect(rule).not.toContain('opacity:');
  });

  test('dynamic banner blur is isolated from sticky geometry and avatar movement uses transforms',()=>{
    const css=fs.readFileSync(require('path').join(__dirname,'../../styles/zmain.css'),'utf8');
    const profile=css.slice(css.indexOf('.main-content > .compact-title-bar-profile'),css.indexOf('.profile-avatar {',css.indexOf('.profile-compact-avatar {')+1));
    expect(profile).toContain('.profile-compact-banner::before { filter:blur(calc(var(--profile-progress,0) * 10px))');
    expect(profile).toContain('will-change:transform,filter');
    expect(profile).toContain('height:120px; margin-bottom:-120px');
    expect(profile).toContain('top:84px');
    expect(profile).not.toContain('top:calc(');
    expect(profile).not.toContain('z-index:-1');
  });
});

describe('header pages return to category and area lists', () => {
  test('account and login slide forward from detail lists and backward on return', () => {
    const source = fs.readFileSync(__dirname + '/ZLayers.js', 'utf8');
    const start = source.indexOf('      if(((/^(m');
    const rule = source.slice(start, source.indexOf('// Explicit Back actions', start));
    for(const detail of ['m123', 'category-64003', 'area-hyrule-field']) {
      for(const account of ['accountPage', 'loginForm']) {
        const forward = {previousContentType:detail, vType:account, backward:true};
        vm.runInNewContext(rule, forward);
        expect(forward.backward).toBe(false);
        const back = {previousContentType:account, vType:detail, backward:false};
        vm.runInNewContext(rule, back);
        expect(back.backward).toBe(true);
      }
    }
  });
  for(const mobile of [false, true]) for(const kind of ['category', 'area']) {
    test(`${kind} parent restores on ${mobile ? 'mobile' : 'desktop'}`, () => {
      const methods = drawerMethods();
      const destination = {id: 123, name: 'Previous list'};
      const bounds = [[0,0],[10,10]];
      const drawer = {
        _headerPageParent: {[kind]:destination, bounds, top:400, scrollTop:75},
        viewStyleBottomSlide:mobile, options:{openTo:10}, _contents:{scrollTop:0},
        zMap:{_showCategoryPage:jest.fn(), _showAreaPage:jest.fn()},
        openDrawerManual:jest.fn()
      };
      expect(methods._restoreHeaderListParent.call(drawer)).toBe(true);
      if(kind==='category') expect(drawer.zMap._showCategoryPage).toHaveBeenCalledWith(destination);
      else expect(drawer.zMap._showAreaPage).toHaveBeenCalledWith(destination,bounds);
      expect(drawer._contents.scrollTop).toBe(75);
      if(mobile) expect(drawer.openDrawerManual).toHaveBeenCalledWith(400);
      expect(drawer._headerPageParent).toBeNull();
    });
  }
});

describe('map selection preserves the originating drawer level and category', () => {
  for(const categoryList of [false,true]) for(const level of ['closed','partial','full']) {
    test(`${categoryList ? 'single-category' : 'main category'} list, ${level}`, () => {
      const methods=drawerMethods();
      const category=categoryList ? {id:64003} : null;
      const parent=level==='closed' ? null : {top:level==='full'?10:400,category,scrollTop:80};
      const drawer={viewStyleBottomSlide:true,options:{openTo:10},_contents:{scrollTop:0},
        zMap:{selectedCategory:category,_showCategoryPage:jest.fn(),_unfocusCategories:jest.fn(),_closeCategoryPage:jest.fn()},
        _mapsButton:{clear:jest.fn()},_gamesButton:{clear:jest.fn()},reset:jest.fn(),
        closeDrawer:jest.fn(),openDrawerDefaultPartial:jest.fn(),openDrawerLarge:jest.fn()};
      methods._finishMapMenuSelection.call(drawer,parent);
      const expected=level==='closed'?'closeDrawer':level==='partial'?'openDrawerDefaultPartial':'openDrawerLarge';
      expect(drawer[expected]).toHaveBeenCalledTimes(1);
      if(categoryList) {
        expect(drawer.zMap._showCategoryPage).toHaveBeenCalledWith(category);
        expect(drawer.zMap._unfocusCategories).not.toHaveBeenCalled();
        expect(drawer.reset).not.toHaveBeenCalled();
      } else expect(drawer.reset).toHaveBeenCalledTimes(1);
    });
  }
});

test.each(['world',undefined,'dungeon'])('map menu preserves category focus except for dungeon destinations (%s)',kind=>{
  const methods=drawerMethods();
  const drawer={currentMapLayer:{mapKind:kind},viewStyleBottomSlide:false,
    zMap:{selectedCategory:null,_unfocusCategories:jest.fn(),_closeCategoryPage:jest.fn()},reset:jest.fn()};
  methods._finishMapMenuSelection.call(drawer,null);
  expect(drawer.zMap._unfocusCategories).toHaveBeenCalledTimes(kind==='dungeon'?1:0);
  expect(drawer.reset).toHaveBeenCalledTimes(1);
});

test('a downward pull at the top hands content scrolling to the drawer', () => {
  const handlers={};
  const methods=drawerMethods({performance:{now:()=>0}});
  const contents={scrollTop:50,addEventListener:(name,fn)=>{handlers[name]=fn;}};
  const control={_contents:contents,viewStyleBottomSlide:true,
    _drawerStart:jest.fn(),_drawerMove:jest.fn(),_drawerEnd:jest.fn()};
  methods._setupContentDrawerDrag.call(control);
  const event=(type,y)=>({type,target:{closest:()=>null},touches:[{clientX:100,clientY:y}],stopPropagation:jest.fn()});
  handlers.touchstart(event('touchstart',100));
  handlers.touchmove(event('touchmove',120));
  expect(control._drawerStart).not.toHaveBeenCalled();
  contents.scrollTop=0;
  handlers.touchmove(event('touchmove',140));
  handlers.touchmove(event('touchmove',160));
  expect(control._drawerStart).toHaveBeenCalledTimes(1);
  expect(control._drawerStart.mock.calls[0][0].touches[0].clientY).toBe(140);
  expect(control._drawerMove).toHaveBeenCalledTimes(1);
  handlers.touchend(event('touchend',160));
  expect(control._drawerEnd).toHaveBeenCalledTimes(1);
});

test('switch controls retain Map then Game visually across repeated rotations', () => {
  const methods = drawerMethods();
  const children = [];
  const parent = { appendChild(node) {
    const index = children.indexOf(node);
    if(index !== -1) children.splice(index, 1);
    children.push(node);
  } };
  const maps = { parentNode: parent, name: 'Map' };
  const games = { parentNode: parent, name: 'Game' };
  const drawer = { _mapsButton: { domNode: [maps] }, _gamesButton: { domNode: [games] } };
  for(const mobile of [true, false, true, false, true]) {
    drawer.viewStyleBottomSlide = mobile;
    methods._syncSwitchButtonOrder.call(drawer);
    const visual = mobile ? children.slice().reverse() : children;
    expect(visual.map(node => node.name)).toEqual(['Map', 'Game']);
  }
});

describe('switch menu partial sizing', () => {
  const methods = drawerMethods();

  test('inherits partial state but recalculates the menu height', () => {
    const drawer = {
      _headerPageParent: { top: 450 }, options: { openTo: 10 },
      openDrawerDefaultPartial: jest.fn(), openDrawerLarge: jest.fn()
    };
    methods._openSwitchMenuAtParentHeight.call(drawer);
    expect(drawer.openDrawerDefaultPartial).toHaveBeenCalledTimes(1);
    expect(drawer.openDrawerLarge).not.toHaveBeenCalled();
  });

  test('inherits fully open state', () => {
    const drawer = {
      _headerPageParent: { top: 10 }, options: { openTo: 10 },
      openDrawerDefaultPartial: jest.fn(), openDrawerLarge: jest.fn()
    };
    methods._openSwitchMenuAtParentHeight.call(drawer);
    expect(drawer.openDrawerLarge).toHaveBeenCalledTimes(1);
  });

  test('clears previous page scroll before measuring the partial stop', () => {
    const drawer = {
      _contents: { scrollTop: 200 }, _partialDrawerAvailable: true,
      options: { softOpenTo: 500 }, openDrawerManual: jest.fn(),
      _refreshMobileDrawerDetents() { expect(this._contents.scrollTop).toBe(0); }
    };
    methods.openDrawerDefaultPartial.call(drawer);
    expect(drawer.openDrawerManual).toHaveBeenCalledWith(500);
  });
});

describe('shared mobile drawer resize animation', () => {
  function harness(from, partial) {
    let now = 0;
    const callbacks = [];
    const menu = { style: { top: from + 'px', height: '300px', left: '8px', width: '380px', borderRadius: '28px' },
      getBoundingClientRect: jest.fn(() => ({ top: Number.parseFloat(menu.style.top), height: Number.parseFloat(menu.style.height) })) };
    const methods = drawerMethods({
      window: { location: { search: '' }, getComputedStyle: node => ({ ...node.style }),
        matchMedia: () => ({ matches: false }), requestAnimationFrame: cb => callbacks.push(cb),
        clearTimeout: jest.fn() },
      performance: { now: () => now }, URLSearchParams
    });
    const drawer = {
      viewStyleBottomSlide: true, _drawerAnimationId: 1, _partialDrawerMode: partial,
      options: { openTo: 10 }, _contents: { style: {} }, _drawerHeaderSeparator: { style: {} },
      _applyMobileDrawerViewport: jest.fn(top => { menu.style.height = (800 - top) + 'px'; }),
      updateContentsHeight: jest.fn(), _finishDrawerClose: jest.fn()
    };
    return { drawer, menu, methods, advance(time) {
      now = time;
      callbacks.splice(0).forEach(cb => cb(time));
    } };
  }

  test.each([
    ['POI → Switch Game', 450, 400, true, true],
    ['POI → Switch Map', 450, 420, true, true],
    ['partial → Account/Login', 450, 10, true, true],
    ['Account/Login → partial menu', 10, 400, true, true],
    ['Back → partial parent', 10, 450, true, true],
    ['close drawer', 400, 700, false, false]
  ])('%s uses per-frame geometry with layout commits', (_, from, to, partial, open) => {
    const h = harness(from, partial);
    h.methods._animate.call(h.drawer, h.menu, from, to, open, 1);
    h.advance(0);
    h.advance(180);
    const middle = Number.parseFloat(h.menu.style.top);
    expect(middle).toBeGreaterThan(Math.min(from, to));
    expect(middle).toBeLessThan(Math.max(from, to));
    expect(h.menu.getBoundingClientRect).toHaveBeenCalled();
    h.advance(360);
    expect(Number.parseFloat(h.menu.style.top)).toBe(to);
    expect(h.drawer._drawerGeometryAnimation).toBeNull();
    if(!open) expect(h.drawer._finishDrawerClose).toHaveBeenCalledTimes(1);
  });

  test('a superseded resize cannot write stale geometry', () => {
    const h = harness(450, true);
    h.methods._animate.call(h.drawer, h.menu, 450, 400, true, 1);
    h.advance(0);
    h.drawer._drawerAnimationId = 2;
    h.menu.style.top = '250px';
    h.advance(180);
    expect(h.menu.style.top).toBe('250px');
  });
});

describe('Switch Map menu follows programmatic map switches', () => {
  const methods = drawerMethods({ window });

  function harness(submapLayers) {
    const hyrule = { id: 11, originalId: 11, defaultSubMapId: 11, bringToBack: jest.fn() };
    const deku = { id: 12, originalId: 12, defaultSubMapId: 12, bringToBack: jest.fn() };
    const updateSelection = jest.fn();
    const drawer = {
      zMap: { mapOptions: { submapLayers } },
      _maps: [hyrule, deku],
      currentMapLayer: hyrule,
      _map: { removeLayer: jest.fn(), addLayer: jest.fn(), fire: jest.fn(), hasLayer: jest.fn(() => false) },
      ...Object.fromEntries(['_swapMapLayer', '_dropOutgoingMapLayer', '_setMapLayerHidden', '_finishTileFades',
        '_mapLayerDrawn', '_clearMapSwap', '_endMapSwapHold', '_releaseMapContent', '_setMapWaiting', '_mapTransition']
        .map(name => [name, methods[name]])),
      setCurrentMap: jest.fn(),
      _syncMapsMenuSelection: methods._syncMapsMenuSelection,
      _mapButtonIsCurrent: methods._mapButtonIsCurrent,
      _mapsMenu: {
        categoryButtons: [{ category: hyrule }, { category: deku }],
        updateCategorySelectionFn: updateSelection
      }
    };
    return { drawer, deku, updateSelection };
  }

  test('selecting an item on another map marks that map in the menu', () => {
    const h = harness(false);
    methods.changeMapOnly.call(h.drawer, 12, undefined);
    expect(h.drawer._map.addLayer).toHaveBeenCalledWith(h.deku);
    // No floor named: the opened map's own, so its markers show.
    expect(h.drawer.setCurrentMap).toHaveBeenCalledWith(12, h.deku.defaultSubMapId);
    expect(h.updateSelection).toHaveBeenCalledTimes(1);
    expect(h.updateSelection).toHaveBeenCalledWith(h.drawer._mapsMenu.categoryButtons[1]);
  });

  test('a submapped game matches the map\'s single button by map id, not layer id', () => {
    // OoT's Hyrule Child/Adult are two layers of one map: the menu holds the
    // first, a switch can land on the other.
    const child = { id: 11, originalId: 11, defaultSubMapId: 11, bringToBack: jest.fn() };
    const adult = { id: 112, originalId: 11, defaultSubMapId: 112, bringToBack: jest.fn() };
    const deku = { id: 12, originalId: 12, defaultSubMapId: 12, bringToBack: jest.fn() };
    const updateSelection = jest.fn();
    const drawer = {
      zMap: { mapOptions: { submapLayers: true } },
      _maps: [child, adult, deku],
      currentMapLayer: child,
      _map: { removeLayer: jest.fn(), addLayer: jest.fn(), fire: jest.fn(), hasLayer: jest.fn(() => false) },
      ...Object.fromEntries(['_swapMapLayer', '_dropOutgoingMapLayer', '_setMapLayerHidden', '_finishTileFades',
        '_mapLayerDrawn', '_clearMapSwap', '_endMapSwapHold', '_releaseMapContent', '_setMapWaiting', '_mapTransition']
        .map(name => [name, methods[name]])),
      setCurrentMap: jest.fn(),
      _syncMapsMenuSelection: methods._syncMapsMenuSelection,
      _mapButtonIsCurrent: methods._mapButtonIsCurrent,
      _mapsMenu: {
        categoryButtons: [{ category: child }, { category: deku }],
        updateCategorySelectionFn: updateSelection
      }
    };
    methods.changeMapOnly.call(drawer, 11, 112); // Hyrule Child → Adult
    expect(drawer.setCurrentMap).toHaveBeenCalledWith(11, 112);
    expect(updateSelection).toHaveBeenCalledWith({ category: child });
  });

  test('staying on the current map leaves the menu untouched', () => {
    const h = harness(false);
    methods.changeMapOnly.call(h.drawer, 11, undefined);
    expect(h.drawer._map.addLayer).not.toHaveBeenCalled();
    expect(h.updateSelection).not.toHaveBeenCalled();
  });
});

describe('swapping maps never shows neither', () => {
  const methods = drawerMethods({ window });
  function layer(id, loading, originalId) {
    const handlers = {};
    const container = document.createElement('div');
    // (Separate maps have bounds of their own: no bounds, the same place.)
    return { id, originalId: originalId === undefined ? 'same' : originalId, options: {}, bringToBack: jest.fn(),
      mapBounds: originalId === undefined ? null : [[0, 0], [1, 1]],
      getContainer: () => container, isLoading: () => loading,
      once: (event, fn) => { handlers[event] = fn; }, handlers };
  }
  function drawer(current, transitions) {
    const onMap = new Set([current]);
    const d = Object.create(methods);
    Object.assign(d, {
      zMap: { MAP_TRANSITIONS: Object.assign({ variant: 'cut', map: 'fade' }, transitions) },
      currentMapLayer: current,
      _map: { addLayer: l => onMap.add(l), removeLayer: l => onMap.delete(l), hasLayer: l => onMap.has(l) },
      onMap
    });
    return d;
  }
  const hidden = l => l.getContainer().style.visibility === 'hidden';
  afterEach(() => jest.useRealTimers());

  test('another map fades: loaded out of sight, then the old one fades away over it, then the markers come in', () => {
    jest.useFakeTimers();
    const surface = layer('surface', false, 1), sky = layer('sky', true, 2);
    const d = drawer(surface);
    d._releaseMapContent = jest.fn();
    d._swapMapLayer(sky);
    expect(d.currentMapLayer).toBe(sky);
    expect([...d.onMap]).toEqual([surface, sky]);
    // Never filling in over the old one.
    expect(sky.bringToBack).toHaveBeenCalled();
    expect(hidden(sky)).toBe(true);
    sky.handlers.load();
    expect(hidden(sky)).toBe(false);
    expect(surface.getContainer().style.opacity).toBe('0');
    expect(d._releaseMapContent).not.toHaveBeenCalled();
    jest.advanceTimersByTime(200);
    expect([...d.onMap]).toEqual([sky]);
    expect(d._releaseMapContent).toHaveBeenCalledWith(d.MAP_MARKERS_IN_MS, true);
    // Back as it was, for when it's shown again.
    expect(surface.getContainer().style.opacity).toBe('');
  });



  test('another version of the same map cuts: shown and the old one gone, together', () => {
    jest.useFakeTimers();
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child);
    d._swapMapLayer(adult);
    expect([...d.onMap]).toEqual([child, adult]);
    expect(hidden(adult)).toBe(true);
    expect(hidden(child)).toBe(false);
    adult.handlers.load();
    expect(hidden(adult)).toBe(false);
    expect([...d.onMap]).toEqual([adult]);
    expect(child.getContainer().style.opacity).toBe('');
  });

  test('the transitions are a setting: each kind can be either', () => {
    jest.useFakeTimers();
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child, { variant: 'fade' });
    d._swapMapLayer(adult);
    adult.handlers.load();
    expect(d.onMap.has(child)).toBe(true);
    expect(child.getContainer().style.opacity).toBe('0');
    const a = layer('a', false, 1), b = layer('b', true, 2);
    const e = drawer(a, { map: 'cut' });
    e._swapMapLayer(b);
    b.handlers.load();
    expect([...e.onMap]).toEqual([b]);
  });



  test('a new map that takes too long is shown anyway', () => {
    jest.useFakeTimers();
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child);
    d._swapMapLayer(adult);
    jest.advanceTimersByTime(d.MAP_SWAP_WAIT_MS);
    expect(hidden(adult)).toBe(false);
    expect([...d.onMap]).toEqual([adult]);
  });

  test('slow to load: the map on screen dims under a spinner till the new one is in', () => {
    jest.useFakeTimers();
    const waiting = jest.fn();
    window.zmMapWaiting = waiting;
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child);
    const element = document.createElement('div');
    d._map.getContainer = () => element;
    d._swapMapLayer(adult);
    jest.advanceTimersByTime(d.MAP_SWAP_SLOW_MS - 1);
    expect(waiting).not.toHaveBeenCalled();
    jest.advanceTimersByTime(1);
    expect(waiting).toHaveBeenLastCalledWith(element, true, undefined);
    adult.handlers.load();
    expect(waiting).toHaveBeenLastCalledWith(element, false, undefined);
    delete window.zmMapWaiting;
  });

  test('quick to load: never dimmed', () => {
    jest.useFakeTimers();
    const waiting = jest.fn();
    window.zmMapWaiting = waiting;
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child);
    d._map.getContainer = () => document.createElement('div');
    d._swapMapLayer(adult);
    adult.handlers.load();
    jest.advanceTimersByTime(5000);
    expect(waiting).not.toHaveBeenCalled();
    delete window.zmMapWaiting;
  });

  test('floors tapped through quickly keep the one on screen till the last is drawn', () => {
    jest.useFakeTimers();
    const one = layer('1F', false), two = layer('2F', true), three = layer('3F', true);
    const d = drawer(one);
    d._swapMapLayer(two);
    d._swapMapLayer(three);
    // 2F, never shown, is gone; 1F still on screen; 3F loading out of sight.
    expect([...d.onMap]).toEqual([one, three]);
    expect(hidden(one)).toBe(false);
    expect(hidden(two)).toBe(false);
    expect(hidden(three)).toBe(true);
    // 2F's tiles finishing late change nothing.
    two.handlers.load();
    expect([...d.onMap]).toEqual([one, three]);
    three.handlers.load();
    expect([...d.onMap]).toEqual([three]);
    expect(hidden(three)).toBe(false);
  });

  test('maps picked quickly keep the one on screen till the last is in, then fade from it', () => {
    jest.useFakeTimers();
    const one = layer('1', false, 1), two = layer('2', true, 2), three = layer('3', true, 3);
    const d = drawer(one);
    d._swapMapLayer(two);
    d._swapMapLayer(three);
    expect([...d.onMap]).toEqual([one, three]);
    expect(hidden(three)).toBe(true);
    three.handlers.load();
    expect(one.getContainer().style.opacity).toBe('0');
    jest.advanceTimersByTime(200);
    expect([...d.onMap]).toEqual([three]);
  });



  test('going back to the map still on screen keeps it, and drops the one loading', () => {
    jest.useFakeTimers();
    const child = layer('child', false), adult = layer('adult', true);
    const d = drawer(child);
    d._swapMapLayer(adult);
    d._swapMapLayer(child);
    expect(d.currentMapLayer).toBe(child);
    expect([...d.onMap]).toEqual([child]);
    expect(hidden(child)).toBe(false);
    adult.handlers.load();
    jest.advanceTimersByTime(10000);
    expect([...d.onMap]).toEqual([child]);
  });

  test('nothing of the old map drawn yet (a page opening on another): straight to the new one', () => {
    const first = layer('first', true), wanted = layer('wanted', true);
    first._tiles = {};
    const d = drawer(first);
    d._swapMapLayer(wanted);
    expect([...d.onMap]).toEqual([wanted]);
    expect(hidden(wanted)).toBe(false);
    expect(d._mapSwap).toBeFalsy();
  });
});

describe('another map: at once, markers after its tiles', () => {
  const methods = drawerMethods({ window });
  test('the old map goes at once, the new one fills in, and its markers come in once it has', () => {
    jest.useFakeTimers();
    const handlers = {};
    const surface = { id: 'a', originalId: 1, mapBounds: [[0, 0], [1, 1]], options: {} };
    const dungeon = { id: 'b', originalId: 2, mapBounds: [[0, 0], [1, 1]], options: {}, isLoading: () => true,
      once: (e, fn) => { handlers[e] = fn; } };
    const onMap = new Set([surface]);
    const d = Object.create(methods);
    Object.assign(d, {
      zMap: { MAP_TRANSITIONS: { variant: 'cut', map: 'instant' }, _watchMapLoading: jest.fn() },
      currentMapLayer: surface,
      _map: { addLayer: l => onMap.add(l), removeLayer: l => onMap.delete(l), hasLayer: l => onMap.has(l) },
      _freezeMapContent: jest.fn(), _releaseMapContent: jest.fn()
    });
    d._swapMapLayer(dungeon);
    expect([...onMap]).toEqual([dungeon]);
    expect(d.currentMapLayer).toBe(dungeon);
    expect(d.zMap._watchMapLoading).toHaveBeenCalled();
    expect(d._freezeMapContent).toHaveBeenCalledWith({ copies: false });
    d._releaseMapContent.mockClear();
    handlers.load();
    expect(d._releaseMapContent).toHaveBeenCalledWith(d.MAP_MARKERS_IN_MS, true);
    jest.useRealTimers();
  });

  test('which kind: the same map, or two maps that are each the whole game (TotK), are versions of one place', () => {
    const d = Object.create(methods);
    d.zMap = { mapOptions: {} };
    expect(d._mapSwapKind({ originalId: 1 }, { originalId: 1 })).toBe('variant');
    expect(d._mapSwapKind({ originalId: 2101 }, { originalId: 2102 })).toBe('variant');
    expect(d._mapSwapKind({ originalId: 20, mapBounds: [] }, { originalId: 21, mapBounds: [] })).toBe('map');
    d.zMap.mapOptions.submapLayers = true;
    expect(d._mapSwapKind({ originalId: 1 }, { originalId: 2 })).toBe('map');
  });
});

describe('the other floors and ages, loaded ahead', () => {
  const made = [];
  const FakeImage = function() { made.push(this); };
  const methods = drawerMethods({ window, navigator: { onLine: true }, Image: FakeImage,
    L: { Util: { template: (url, data) => url.replace(/\{(\w+)\}/g, (m, k) => data[k]) }, extend: Object.assign, Browser: {} } });
  test('their tiles for what\'s in view, once each', () => {
    made.length = 0;
    const tile = (x, y, current) => ({ coords: { x, y, z: 3 }, current });
    const layer = (url, originalId) => ({ _url: url, originalId, options: { maxNativeZoom: 5, tileSize: 256 } });
    const child = Object.assign(layer('child/{z}_{x}_{y}.png', 1), { _tiles: { a: tile(1, 2, true), b: tile(9, 9, false) } });
    const adult = layer('adult/{z}_{x}_{y}.png', 1), dungeon = Object.assign(layer('deku/{z}_{x}_{y}.png', 2), { mapBounds: [] });
    const d = Object.create(methods);
    Object.assign(d, { zMap: { mapOptions: { submapLayers: true } }, _map: {}, currentMapLayer: child, _maps: [child, adult, dungeon], _preloadedTiles: {}, _preloadedImages: [] });
    d._preloadVariants();
    expect(made.map(i => i.src)).toEqual(['adult/3_1_2.png']);
    d._preloadVariants();
    expect(made.length).toBe(1);
    expect(d._preloadedImages).toEqual(made);
  });

  test('not while the map on screen, or a swap, is still loading: again later', () => {
    const d = Object.create(methods);
    Object.assign(d, { _map: {}, currentMapLayer: { _tiles: {}, isLoading: () => true }, _maps: [] });
    expect(d._preloadVariants()).toBe('busy');
    d.currentMapLayer.isLoading = () => false;
    d._mapSwap = {};
    expect(d._preloadVariants()).toBe('busy');
  });
});

describe('markers change with the map, not before it', () => {
  const methods = drawerMethods({ window, L: undefined });
  function setup() {
    const mapPane = document.createElement('div');
    const panes = {};
    ['tilePane', 'markerPane', 'tooltipPane', 'popupPane', 'ootConnections'].forEach(name => {
      const pane = document.createElement('div');
      pane.className = 'leaflet-pane leaflet-' + name;
      mapPane.appendChild(pane);
      panes[name] = pane;
    });
    panes.markerPane.innerHTML = '<img class="old-marker" id="m1">';
    panes.tooltipPane.innerHTML = '<div class="old-label">Kokiri Forest</div>';
    panes.tilePane.innerHTML = '<img class="tile">';
    const listeners = {};
    const map = {
      _panes: Object.assign({ mapPane }, panes), _mapPane: mapPane,
      getCenter: () => ({}), getZoom: () => 3, latLngToLayerPoint: () => ({ subtract: () => ({}) }),
      on: (e, fn) => { listeners[e] = fn; }, off: e => { delete listeners[e]; }
    };
    const d = Object.create(methods);
    d._map = map;
    return { d, map, panes, mapPane, listeners };
  }

  test('a still copy of the markers stays while the real ones change out of sight', () => {
    const { d, panes, mapPane } = setup();
    d._freezeMapContent();
    const copies = mapPane.querySelectorAll('.zm-held-pane');
    // Markers, labels and OoT's connections; not the tiles or popups.
    expect([...copies].map(c => c.className)).toEqual([
      'leaflet-pane leaflet-markerPane zm-held-pane',
      'leaflet-pane leaflet-tooltipPane zm-held-pane',
      'leaflet-pane leaflet-ootConnections zm-held-pane']);
    expect(panes.markerPane.style.visibility).toBe('hidden');
    expect(panes.markerPane.style.opacity).toBe('0');
    expect(panes.tilePane.style.visibility).toBe('');
    expect(panes.popupPane.style.visibility).toBe('');
    // Just to look at: no ids to be found instead of the real ones.
    expect(copies[0].querySelector('#m1')).toBeNull();
    expect(copies[0].querySelector('.old-marker')).not.toBeNull();
    expect(copies[0].getAttribute('aria-hidden')).toBe('true');
    // The real ones change...
    panes.markerPane.innerHTML = '<img class="new-marker">';
    expect(copies[0].querySelector('.new-marker')).toBeNull();
    // ...and show when the map does.
    d._releaseMapContent();
    expect(mapPane.querySelectorAll('.zm-held-pane').length).toBe(0);
    expect(panes.markerPane.style.visibility).toBe('');
    expect(panes.markerPane.style.opacity).toBe('');
  });

  test('a zoom while held lets the real ones show', () => {
    const { d, mapPane, listeners } = setup();
    d._freezeMapContent();
    listeners.zoomstart();
    expect(mapPane.querySelectorAll('.zm-held-pane').length).toBe(0);
    expect(d._frozenContent).toBeNull();
  });

  test('held once only, however many maps are picked while waiting', () => {
    const { d, mapPane } = setup();
    d._freezeMapContent();
    d._freezeMapContent();
    expect(mapPane.querySelectorAll('.zm-held-pane').length).toBe(3);
  });
  test('fade: the old markers fade away at once; the new ones fade in once the map is in', () => {
    jest.useFakeTimers();
    const { d, panes, mapPane } = setup();
    d._freezeMapContent();
    d._fadeHeldContent(150);
    const copy = mapPane.querySelector('.zm-held-pane');
    expect(copy.style.opacity).toBe('0');
    expect(copy.style.transition).toBe('opacity 150ms ease-out');
    // No markers at all meanwhile.
    expect(panes.markerPane.style.opacity).toBe('0');
    d._releaseMapContent(200, true);
    expect(mapPane.querySelectorAll('.zm-held-pane').length).toBe(0);
    expect(panes.markerPane.style.opacity).toBe('');
    expect(panes.markerPane.style.visibility).toBe('');
    expect(panes.markerPane.style.transition).toBe('opacity 200ms ease-out');
    jest.advanceTimersByTime(250);
    expect(panes.markerPane.style.transition).toBe('');
    jest.useRealTimers();
  });

  test('a map just built: its markers hidden (no copies), through zooms, till let in', () => {
    const { d, panes, mapPane, listeners } = setup();
    d._freezeMapContent({ copies: false });
    expect(mapPane.querySelectorAll('.zm-held-pane').length).toBe(0);
    expect(panes.markerPane.style.opacity).toBe('0');
    expect(listeners.zoomstart).toBeUndefined();
    d._releaseMapContent();
    expect(panes.markerPane.style.opacity).toBe('');
  });

});
