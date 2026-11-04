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
