/** @jest-environment jsdom */
const fs = require('fs');
const vm = require('vm');
const $ = require('jquery');
const source = fs.readFileSync(__dirname + '/zmap.js', 'utf8');

// A stand-in for the TinyMCE 5.10.9 the page loads from its CDN. It records
// editors by textarea id, calls setup() synchronously like the real one, and
// fires init on the next tick after normalizing the loaded content the way
// TinyMCE does (plain text becomes <p>…</p>), which is what the real thing
// is for: the tests can prove a plain-text marker opens clean, that clicking
// in the editor (nodeChange) keeps it clean, and that only real edits flip
// the Save Changes button on.
function makeFakeTinymce() {
  const editors = new Map();
  const normalize = html => {
    const text = (html || '').trim();
    if (!text) return '';
    if (/<[a-z]/i.test(text)) return text;
    return '<p>' + text + '</p>';
  };
  const tinymce = {
    init(options) {
      const target = options.target;
      const editor = {
        id: target.id,
        _target: target,
        _content: target.value || '',
        _listeners: {},
        ui: { registry: { addIcon() {}, addButton() {} } },
        on(events, fn) {
          events.split(' ').forEach(evt => {
            (this._listeners[evt] = this._listeners[evt] || []).push(fn);
          });
        },
        fire(evt) {
          (this._listeners[evt] || []).slice().forEach(fn => fn.call(this));
        },
        getContent() { return this._content; },
        setContent(html) { this._content = html; },
        remove() { this._target.value = this._content; }
      };
      editors.set(target.id, editor);
      if (options.setup) options.setup(editor);
      // Like the real editor: init fires after the content has loaded and
      // been normalized, never synchronously inside tinymce.init().
      setTimeout(() => {
        editor._content = normalize(editor._content);
        editor.fire('init');
      }, 0);
      return editor;
    },
    get(id) { return editors.get(id) || null; },
    triggerSave() {
      editors.forEach(editor => { editor._target.value = editor.getContent(); });
    },
    remove() {
      editors.forEach(editor => { editor._target.value = editor.getContent(); });
      editors.clear();
    }
  };
  return tinymce;
}

const context = {
  ZMap: function() {},
  $,
  jQuery: $,
  document,
  window,
  user: { id: 7, level: 10 },   // level 10: sees Edit Summary and the visibility checkbox
  markers: [],
  newMarker: null,
  toastr: { success: jest.fn(), error: jest.fn(), warning: jest.fn(), info: jest.fn() },
  tinymce: null                 // assigned in beforeEach
};
const editorHelpers=fs.readFileSync(__dirname + '/zwiki.js','utf8');
vm.runInNewContext(editorHelpers.slice(editorHelpers.indexOf('ZMap.prototype._editorFieldHTML ='),editorHelpers.indexOf('ZMap.prototype._wikiPageSettled =')),context);
vm.runInNewContext(
  source.slice(
    source.indexOf('ZMap.prototype._createMarkerForm ='),
    source.indexOf('ZMap.prototype.clearCompletedMarkers')
  ),
  context
);

// Let the fake editors' init callbacks (scheduled on a 0ms timer when the
// form was created) run before asserting on the button state.
const flush = () => new Promise(resolve => setTimeout(resolve, 0));

const latLng = { lng: 16.2, lat: -8.5 };
const makeMarker = (title, sections) => ({
  id: '42',
  title,
  z: 3,
  categoryId: 1,
  description: 'An old note.',
  globalMarker: 0,
  dbVisible: 1,
  submapId: '1901',
  tabText: sections,
  getLatLng: () => [latLng.lat, latLng.lng],
  setLatLng: jest.fn()
});

function makeMap() {
  const map = Object.create(context.ZMap.prototype);
  map.categoriesArr = [{ id: 1, name: 'Items' }];
  map.mapOptions = { id: 'OoT' };
  map.mapControl = {
    getCurrentMap: () => ({ subMapId: '1901' }),
    setContent: html => document.body.insertAdjacentHTML('beforeend', html),
    addHandler: jest.fn()
  };
  map.map = { removeLayer: jest.fn(), addLayer: jest.fn() };
  map.cachedMarkersById = {};
  map._wikiEscape = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  map._wikiBackToMarker = jest.fn(() => jest.fn());
  map._wikiError = (xhr, fallback) => fallback;
  map.addMarker = jest.fn();
  map._createMarkerPopup = jest.fn();
  map._uploadEditorVideo = jest.fn();
  map.langMsgs = {
    GENERAL_ERROR: 'I am error. %1',
    MARKER_ADD_SUCCESS: 'Marker %1 has been successfully added.',
    MARKER_ADD_SUCCESS_RESTRICTED: 'Thanks, your marker is pending review.'
  };
  return map;
}

function openEditForm(sections) {
  const map = makeMap();
  map._createMarkerForm(makeMarker('Zelda', sections), latLng);
  const $form = $('#newMarkerForm');
  const $button = $form.find('button[type="submit"]');
  const $pending = $form.find('.marker-edit-pending');
  return {
    map,
    $button,
    $pending,
    disabled: () => $button.prop('disabled'),
    pendingHidden: () => $pending.prop('hidden')
  };
}

describe('marker edit form Save Changes dirty state', () => {
  beforeEach(() => {
    document.body.innerHTML = '';
    const fake = makeFakeTinymce();
    context.tinymce = fake;
    window.tinymce = fake;
  });

  test('opens disabled with the "No changes to save." hint', async () => {
    const form = openEditForm(['Just some notes.']);
    expect(form.$pending.text()).toBe('No changes to save.');
    expect(form.disabled()).toBe(true);   // before the editors are ready
    expect(form.pendingHidden()).toBe(false);
    await flush();                        // editors init and rewrite the content
    expect(form.disabled()).toBe(true);   // …and the marker is still untouched
    expect(form.pendingHidden()).toBe(false);
  });

  test('typing in a plain field enables the button and hides the hint', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    $('#markerTitle').val('Zelda the Brave').trigger('input');
    expect(form.disabled()).toBe(false);
    expect(form.pendingHidden()).toBe(true);
  });

  test('typing only in the Edit Summary does not enable it', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    expect($('#markerSummary').length).toBe(1);
    $('#markerSummary').val('fixed a typo').trigger('input');
    expect(form.disabled()).toBe(true);
    expect(form.pendingHidden()).toBe(false);
  });

  test('an editor change fires dirty through its TinyMCE events', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    const editor = window.tinymce.get('tabText0');
    editor.setContent('<p>Now with more content.</p>');
    editor.fire('change');
    expect(form.disabled()).toBe(false);
    expect(form.pendingHidden()).toBe(true);
    editor.setContent('<p>And a keystroke.</p>');
    editor.fire('keyup');
    expect(form.disabled()).toBe(false);
  });

  test('TinyMCE init normalizing the content does not count as an edit', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    // The editor rewrote the plain text into a <p>, and a caret move
    // (like a click) reports a node change.
    const editor = window.tinymce.get('tabText0');
    expect(editor.getContent()).toBe('<p>Just some notes.</p>');
    editor.fire('nodeChange');
    expect(form.disabled()).toBe(true);
    expect(form.pendingHidden()).toBe(false);
  });

  test('multi-section markers stay clean after every editor finishes init', async () => {
    const form = openEditForm(['First section text.', 'Second section text.']);
    await flush();
    window.tinymce.get('tabText0').fire('nodeChange');
    window.tinymce.get('tabText1').fire('nodeChange');
    expect(form.disabled()).toBe(true);
    expect(form.pendingHidden()).toBe(false);
  });

  test('a successful save re-baselines, so a no-op second save is impossible', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    $('#markerTitle').val('Zelda the Brave').trigger('input');
    expect(form.disabled()).toBe(false);
    const ajax = jest.spyOn($, 'ajax').mockImplementation(options => ({
      done(cb) { cb({
        success: true,
        action: 'UPDATE',
        marker: JSON.stringify([{ id: '42', title: 'Zelda the Brave' }])
      }); return this; },
      fail() { return this; }
    }));
    try {
      $('#newMarkerForm').trigger('submit');
    } finally {
      ajax.mockRestore();
    }
    expect(form.disabled()).toBe(true);
    expect(form.pendingHidden()).toBe(false);
    expect(form.$button.text()).toBe('Save Changes');
    expect(window.tinymce.get('tabText0')).toBeNull();
    expect($('#markerTitle').val()).toBe('Zelda the Brave');
  });

  test('the button itself reads "Saving..." while the request is in flight', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    $('#markerTitle').val('Zelda the Brave').trigger('input');
    let resolveDone;
    const ajax = jest.spyOn($, 'ajax').mockImplementation(options => ({
      done(cb) {
        resolveDone = cb;
        return this;
      },
      fail() { return this; }
    }));
    try {
      $('#newMarkerForm').trigger('submit');
      expect(form.$button.prop('disabled')).toBe(true);
      expect(form.$button.text()).toBe('Saving...');
      // The status line above the button no longer carries the indicator.
      expect($('.admin-user-status').text()).toBe('');
      resolveDone({
        success: true,
        action: 'UPDATE',
        marker: JSON.stringify([{ id: '42', title: 'Zelda the Brave' }])
      });
      expect(form.$button.text()).toBe('Save Changes');
      expect(form.disabled()).toBe(true);
    } finally {
      ajax.mockRestore();
    }
  });

  test('a failed save keeps the button on so the edit can be retried', async () => {
    const form = openEditForm(['Just some notes.']);
    await flush();
    $('#markerTitle').val('Zelda the Brave').trigger('input');
    const ajax = jest.spyOn($, 'ajax').mockImplementation(options => ({
      done(cb) { cb({ success: false, msg: 'The title is too long.' }); return this; },
      fail() { return this; }
    }));
    try {
      $('#newMarkerForm').trigger('submit');
    } finally {
      ajax.mockRestore();
    }
    expect(form.disabled()).toBe(false);
    expect(form.$button.text()).toBe('Save Changes');
    expect($('.admin-user-status').text()).toBe('The title is too long.');
  });

  test('a new marker has no dirty state: its button is always on', () => {
    const map = makeMap();
    map._createMarkerForm(null, latLng);
    const $button = $('#newMarkerForm button[type="submit"]');
    expect($button.attr('disabled')).toBeUndefined();
    expect($button.prop('disabled')).toBe(false);
    expect($('#markerSummary').length).toBe(0);
    expect($('.marker-edit-pending').length).toBe(0);
  });
});
