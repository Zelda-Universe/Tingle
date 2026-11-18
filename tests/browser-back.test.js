const fs = require('fs');
const path = require('path');
const read = file => fs.readFileSync(path.join(__dirname, '..', file), 'utf8');

// The browser's Back for the sidebar's pages (scripts/services/BrowserBack.js):
// it does what the page's own Back button does.

function setup({ startState = null, below = undefined, everyone = true, slowBack = 0 } = {}) {
  // A browser's history: entries, the one showing, and popstate on Back.
  const listeners = [];
  const location = { href: 'https://zeldamaps.com/?game=OoTR' };
  // (below: an entry under the one the page loads on.)
  const entries = [{ state: startState, url: location.href }];
  if(below !== undefined) entries.unshift({ state: below, url: location.href });
  let at = entries.length - 1;
  const history = {
    get state() { return entries[at].state; },
    get length() { return entries.length; },
    pushState(state, title, url) {
      entries.splice(at + 1);
      entries.push({ state: JSON.parse(JSON.stringify(state)), url });
      at++;
      location.href = url;
    },
    replaceState(state, title, url) {
      entries[at] = { state: state && JSON.parse(JSON.stringify(state)), url: url || entries[at].url };
      location.href = entries[at].url;
    },
    back() {
      if(at === 0) return;
      setTimeout(() => {
        at--;
        location.href = entries[at].url;
        listeners.forEach(fn => fn({ state: entries[at].state }));
      }, slowBack);
    }
  };
  const window = {
    history, location,
    addEventListener: (type, fn) => { if(type === 'popstate') listeners.push(fn); },
    setTimeout, clearTimeout,
    // On for everyone (the admin panel's Settings), unless a test says not.
    zmapSiteSettings: { browserBack: everyone }
  };
  // (An open <dialog>, if any: document.dialog.)
  const document = { title: 'Ocarina of Time Remake Interactive Map - Zelda Maps', dialog: null,
    querySelector: selector => selector === 'dialog[open]' ? document.dialog : null };

  // The sidebar: the page showing, and its Back button, if it has one.
  // (A page with only a close button: page.close.)
  // (An editor's fields: contents.fields.)
  const contents = { button: null, close: false, fields: [], querySelectorAll: () => contents.fields,
    querySelector: selector => (selector.includes(':not(.close-button)') ? !contents.close : contents.close) ? contents.button : null };
  const map = { mapControl: { _contents: contents }, isFramed: () => false };
  // Markers and areas, opened again by Back (BrowserBack.js reopen).
  map.goTo = jest.fn(goTo => show({ name: 'm' + goTo.marker, close: true }));
  function ZMap() {}
  new Function('ZMap', 'window', 'history', 'document', 'zMap', read('scripts/services/BrowserBack.js'))(ZMap, window, history, document, map);
  Object.setPrototypeOf(map, ZMap.prototype);

  // A page with a Back button going back to `previous` (null: one without).
  function show(page) {
    contents.button = page ? { click: jest.fn(() => show(page.back)) } : null;
    contents.close = !!(page && page.close);
    map.mapControl._contentType = page ? page.name : 'category';
    location.href = 'https://zeldamaps.com/?game=OoTR' + (page ? '&page=' + page.name : '');
    history.replaceState(history.state, '', location.href);
    if(page) document.title = page.name;
    map._syncBrowserBack();
    return contents.button;
  }
  const settle = () => new Promise(resolve => setTimeout(resolve, 120));
  const browserBack = async () => { history.back(); await settle(); };
  return { map, window, document, history, entries: () => entries, at: () => at, show, settle, browserBack, contents, location };
}

const list = null;
const category = { name: 'category', back: list };
const marker = { name: 'marker', back: category };

test('a page with a Back button adds one history entry; Back presses its button', async () => {
  const t = setup();
  t.show(category);
  await t.settle();
  expect(t.history.length).toBe(2);
  expect(t.history.state.zmSidebarBack).toBe(true);
  const button = t.contents.button;
  await t.browserBack();
  expect(button.click).toHaveBeenCalledTimes(1);
  // At the list, which has none: no entry for it.
  expect(t.at()).toBe(0);
  expect(t.history.state && t.history.state.zmSidebarBack).toBeFalsy();
});

test('Back through a chain: each Back is one page back, and only one entry is kept', async () => {
  const t = setup();
  t.show(category);
  await t.settle();
  const markerButton = t.show(marker);
  await t.settle();
  expect(t.history.length).toBe(2);
  await t.browserBack();
  expect(markerButton.click).toHaveBeenCalled();
  // At the category page: its entry's back.
  await t.settle();
  expect(t.at()).toBe(1);
  expect(t.history.state.zmSidebarBack).toBe(true);
  expect(t.history.length).toBe(2);
  await t.browserBack();
  expect(t.at()).toBe(0);
});

test('the page\'s own Back button keeps history in step, with the address and title it leaves', async () => {
  const t = setup();
  t.show(category);
  await t.settle();
  t.contents.button.click();
  await t.settle();
  await t.settle();
  expect(t.at()).toBe(0);
  expect(t.location.href).toBe('https://zeldamaps.com/?game=OoTR');
  expect(t.entries()[0].url).toBe('https://zeldamaps.com/?game=OoTR');
});

test('leaving for another game steps off the entry first, so game history is as it was', async () => {
  const t = setup();
  t.show(category);
  await t.settle();
  const leave = jest.fn();
  t.map._leavingSidebarHistory(leave);
  expect(leave).not.toHaveBeenCalled();
  await t.settle();
  expect(leave).toHaveBeenCalledTimes(1);
  expect(t.at()).toBe(0);
});

test('without an entry, leaving goes at once', () => {
  const t = setup();
  const leave = jest.fn();
  t.map._leavingSidebarHistory(leave);
  expect(leave).toHaveBeenCalledTimes(1);
});

test('a close button that leaves its page showing (a phone\'s login) isn\'t put back, so Back can leave the site', async () => {
  const t = setup();
  t.show({ name: 'loginForm', back: null });
  await t.settle();
  // Its close button only closes the drawer.
  t.contents.button.click = jest.fn();
  await t.browserBack();
  await t.settle();
  expect(t.contents.button.click).toHaveBeenCalledTimes(1);
  expect(t.at()).toBe(0);
  expect(t.history.length).toBe(2);
  expect(t.history.state && t.history.state.zmSidebarBack).toBeFalsy();
  // Another page with one: back again.
  t.show(category);
  await t.settle();
  expect(t.history.state.zmSidebarBack).toBe(true);
});

test('markers opened from the map one over another: Back reopens each before it, then closes the first', async () => {
  const t = setup();
  const pages = ['m1', 'm2', 'm3'].map(name => ({ name, close: true, back: null }));
  for(const page of pages) { t.show(page); await t.settle(); }
  expect(t.history.length).toBe(2);
  await t.browserBack();
  expect(t.map.goTo).toHaveBeenLastCalledWith(expect.objectContaining({ marker: '2', animate: 'move' }));
  expect(t.map.mapControl._contentType).toBe('m2');
  await t.settle();
  expect(t.history.state.zmSidebarBack).toBe(true);
  await t.browserBack();
  expect(t.map.mapControl._contentType).toBe('m1');
  await t.settle();
  // The first: closed, as its close button does.
  const close = t.contents.button;
  await t.browserBack();
  expect(close.click).toHaveBeenCalled();
  expect(t.map.mapControl._contentType).toBe('category');
  expect(t.map.goTo).toHaveBeenCalledTimes(2);
});

test('back at the category list, the markers before are forgotten', async () => {
  const t = setup();
  t.show({ name: 'm1', close: true, back: null });
  t.show({ name: 'm2', close: true, back: null });
  t.show(null);
  t.show({ name: 'm3', close: true, back: null });
  await t.settle();
  const close = t.contents.button;
  await t.browserBack();
  expect(t.map.goTo).not.toHaveBeenCalled();
  expect(close.click).toHaveBeenCalled();
});

test('a marker opened from a list (with its Back button) isn\'t one to reopen', async () => {
  const t = setup();
  t.show({ name: 'm1', close: true, back: null });
  t.show(category);
  t.show({ name: 'm2', back: category });
  await t.settle();
  const back = t.contents.button;
  await t.browserBack();
  expect(back.click).toHaveBeenCalled();
  expect(t.map.goTo).not.toHaveBeenCalled();
});

test('reloaded on a page\'s entry: it\'s kept for the page that opens, not added again', async () => {
  const t = setup({ startState: { zmSidebarBack: true, zmGame: 'OoTR' }, below: { zmGame: 'OoTR' } });
  t.show(category);
  await t.settle();
  expect(t.history.length).toBe(2);
  expect(t.history.state).toEqual({ zmSidebarBack: true, zmGame: 'OoTR' });
  const button = t.contents.button;
  await t.browserBack();
  expect(button.click).toHaveBeenCalled();
});

test('reloaded on an entry, and no page with a Back button opens: no step left over', async () => {
  const t = setup({ startState: { zmSidebarBack: true }, below: null });
  t.show(null);
  await t.settle();
  await t.settle();
  await t.settle();
  expect(t.history.state && t.history.state.zmSidebarBack).toBeFalsy();
});

test('not in an embed', async () => {
  const t = setup();
  t.map.isFramed = () => true;
  t.show(category);
  await t.settle();
  expect(t.history.length).toBe(1);
});

test('Back prefers a page\'s Back button, then its close button; the game menu and links go through it', () => {
  const source = read('scripts/services/BrowserBack.js');
  expect(source).toContain(":scope > a.back-button:not(.close-button)') ||");
  expect(source).toContain(":scope > a.back-button.close-button')");
  expect(read('scripts/services/GameSwitch.js')).toContain('this._leavingSidebarHistory(function() { map._openGameURL(url); });');
  expect(read('scripts/controls/ZLayers.js')).toContain('zMap._leavingSidebarHistory(function() { window.location.replace(url); });');
  expect(read('scripts/controls/ZLayers.js')).toContain('if(this.zMap && this.zMap._syncBrowserBack) this.zMap._syncBrowserBack();');
  expect(read('javascript.txt')).toContain('scripts/services/BrowserBack.js');
});

describe('the switches: for everyone, or staff in their own browser', () => {
  global.toastr = { info: jest.fn() };
  afterEach(() => localStorage.clear());
  const staff = t => { t.map.getUser = () => ({ level: '15' }); };

  test('off for everyone: Back is left alone, as before', async () => {
    const t = setup({ everyone: false });
    t.show(category);
    await t.settle();
    expect(t.history.length).toBe(1);
    t.map.getUser = () => ({ level: '20' });
    t.show(marker);
    await t.settle();
    expect(t.history.length).toBe(1);
  });

  test('staff who turn it on in their own browser get it; others don\'t, even with it stored', async () => {
    const t = setup({ everyone: false });
    localStorage.setItem(t.map.BROWSER_BACK_KEY, 'on');
    t.map.getUser = () => ({ level: '10' });
    expect(t.map._browserBackOn()).toBe(false);
    staff(t);
    expect(t.map._browserBackOn()).toBe(true);
    t.show(category);
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
  });

  test('the staff checkbox: only when off for everyone; turning it on or off takes the entry with it', async () => {
    const t = setup({ everyone: false });
    staff(t);
    let changed;
    t.map.settingsControl = { addCheckbox: jest.fn((label, on, fn) => { changed = fn; return {}; }) };
    t.show(category);
    await t.settle();
    t.map._addBrowserBackSetting();
    expect(t.map.settingsControl.addCheckbox).toHaveBeenCalledWith('Experimental back button support (staff test)', false, expect.any(Function));
    changed(true);
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
    changed(false);
    await t.settle();
    expect(t.at()).toBe(0);
    expect(t.history.state && t.history.state.zmSidebarBack).toBeFalsy();

    const everyone = setup();
    staff(everyone);
    everyone.map.settingsControl = { addCheckbox: jest.fn() };
    everyone.map._addBrowserBackSetting();
    expect(everyone.map.settingsControl.addCheckbox).not.toHaveBeenCalled();
  });

  test('a site setting, off until an admin turns it on, and a staff checkbox once signed in', () => {
    expect(read('lib/common/site_settings.php')).toContain("'browserBack' => array('type' => 'bool', 'default' => false)");
    expect(read('scripts/zmap.js')).toContain("{ name: 'browserBack', label: 'Experimental back button support',");
    expect(read('scripts/zmap.js')).toContain('if(this._addBrowserBackSetting) this._addBrowserBackSetting();');
  });
});

describe('before the page', () => {
  test('an open dialog is closed first, and the page keeps its entry', async () => {
    const t = setup();
    t.show(category);
    await t.settle();
    const dialog = t.document.dialog = { dispatchEvent: jest.fn(() => true), close: jest.fn(() => { t.document.dialog = null; t.map._syncBrowserBack(); }) };
    const button = t.contents.button;
    await t.browserBack();
    expect(dialog.close).toHaveBeenCalled();
    expect(button.click).not.toHaveBeenCalled();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
  });

  test('a dialog over the category list gets an entry too, so Back closes it rather than leaving', async () => {
    const t = setup();
    t.document.dialog = { dispatchEvent: () => true, close: jest.fn(() => { t.document.dialog = null; t.map._syncBrowserBack(); }) };
    t.map._syncBrowserBack();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
    await t.browserBack();
    expect(t.document.dialog).toBe(null);
    await t.settle();
    expect(t.at()).toBe(0);
  });

  test('a dialog that refuses its cancel stays open, with its entry', async () => {
    const t = setup();
    t.document.dialog = { dispatchEvent: () => false, close: jest.fn() };
    t.map._syncBrowserBack();
    await t.settle();
    await t.browserBack();
    expect(t.document.dialog.close).not.toHaveBeenCalled();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
  });

  test('a phone\'s drawer pulled down: Back brings it back up, then the next Back closes the page', async () => {
    const t = setup();
    t.map.mapControl.viewStyleBottomSlide = true;
    t.map.mapControl._open = false;
    t.map.mapControl.openDrawerDefaultPartial = jest.fn(() => { t.map.mapControl._open = true; });
    t.show({ name: 'm1', close: true, back: null });
    await t.settle();
    const close = t.contents.button;
    await t.browserBack();
    expect(t.map.mapControl.openDrawerDefaultPartial).toHaveBeenCalled();
    expect(close.click).not.toHaveBeenCalled();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
    await t.browserBack();
    expect(close.click).toHaveBeenCalled();
  });

  test('an editor with changes asks first; kept, it stays with its entry; untouched, it doesn\'t ask', async () => {
    const t = setup();
    t.window.confirm = jest.fn(() => false);
    t.map._editingSomething = () => 'editing';
    const name = { type: 'text', value: 'Heart Piece' };
    t.contents.fields = [name];
    t.show({ name: 'markerEdit', back: category });
    await t.settle();
    name.value = 'Heart Piece #4';
    const back = t.contents.button;
    await t.browserBack();
    expect(t.window.confirm).toHaveBeenCalledWith('Leave without saving your changes?');
    expect(back.click).not.toHaveBeenCalled();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
    // Told yes: gone.
    t.window.confirm = jest.fn(() => true);
    await t.browserBack();
    expect(back.click).toHaveBeenCalled();

    const fresh = setup();
    fresh.window.confirm = jest.fn();
    fresh.map._editingSomething = () => 'editing';
    fresh.contents.fields = [{ type: 'text', value: 'Heart Piece' }];
    fresh.show({ name: 'markerEdit', back: category });
    await fresh.settle();
    const button = fresh.contents.button;
    await fresh.browserBack();
    expect(fresh.window.confirm).not.toHaveBeenCalled();
    expect(button.click).toHaveBeenCalled();
  });

  test('a page\'s own "leave without saving?" told no keeps its entry, so the next Back asks again', async () => {
    const t = setup();
    t.window.confirm = jest.fn(() => false);
    t.show({ name: 'mapSettings', back: null });
    await t.settle();
    t.contents.button.click = jest.fn(() => t.window.confirm('Leave without saving your changes? (map order)'));
    await t.browserBack();
    await t.settle();
    expect(t.history.state.zmSidebarBack).toBe(true);
    await t.browserBack();
    expect(t.window.confirm).toHaveBeenCalledTimes(2);
  });
});

test('a slow phone: our own step back, landing late, isn\'t taken for a Back', async () => {
  const t = setup({ slowBack: 600 });
  t.show(category);
  await new Promise(resolve => setTimeout(resolve, 700));
  // Back to the list in the page: the entry's left, slowly.
  t.show(null);
  await new Promise(resolve => setTimeout(resolve, 1400));
  expect(t.at()).toBe(0);
  // Then a page, and nothing pressed meanwhile.
  t.show(category);
  await new Promise(resolve => setTimeout(resolve, 200));
  expect(t.history.state.zmSidebarBack).toBe(true);
  expect(t.contents.button.click).not.toHaveBeenCalled();
});
