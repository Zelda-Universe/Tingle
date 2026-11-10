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
  return context.L.Control.ZLayers.prototype;
}

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
  const methods = drawerMethods();

  function harness(submapLayers) {
    const hyrule = { id: 11, originalId: 11, defaultSubMapId: 11, bringToBack: jest.fn() };
    const deku = { id: 12, originalId: 12, defaultSubMapId: 12, bringToBack: jest.fn() };
    const updateSelection = jest.fn();
    const drawer = {
      zMap: { mapOptions: { submapLayers } },
      _maps: [hyrule, deku],
      currentMapLayer: hyrule,
      _map: { removeLayer: jest.fn(), addLayer: jest.fn(), fire: jest.fn() },
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
    expect(h.drawer.setCurrentMap).toHaveBeenCalledWith(12, undefined);
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
      _map: { removeLayer: jest.fn(), addLayer: jest.fn(), fire: jest.fn() },
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
