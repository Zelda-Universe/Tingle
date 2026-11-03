/** @jest-environment jsdom */
const fs = require('fs');
const vm = require('vm');
const $ = require('jquery');
const source = fs.readFileSync(__dirname + '/zmap.js', 'utf8');
const context = { ZMap: function() {}, $, document, Object };
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._showBookmarkRegistrationPrompt ='),
  source.indexOf('ZMap.prototype._createBookmarksPage =')), context);

describe('bookmark registration prompt', () => {
  let map;
  beforeEach(() => {
    document.body.innerHTML = '<button id="bookmark">Bookmark</button>';
    HTMLDialogElement.prototype.showModal = function() { this.open = true; };
    HTMLDialogElement.prototype.close = function() { this.open = false; this.dispatchEvent(new Event('close')); };
    map = Object.create(context.ZMap.prototype);
    map._createRegisterForm = jest.fn();
    map.mapControl = { viewStyleBottomSlide: true, openDrawerLarge: jest.fn() };
  });
  test('does not navigate until Register Now is selected', () => {
    map._showBookmarkRegistrationPrompt({ markerId: '42' });
    expect(document.querySelector('dialog h2').textContent).toBe('Register to save bookmarks.');
    expect(document.querySelector('dialog p').textContent).toBe('Bookmarking POIs requires a free Zelda Maps account. Register to bookmark this POI and get other cool features like Offline Maps and ad-free browsing!');
    expect(map._createRegisterForm).not.toHaveBeenCalled();
    document.querySelector('[data-action="cancel"]').click();
    expect(document.querySelector('dialog')).toBeNull();
    expect(map._pendingBookmarkRegistration).toBeUndefined();
  });
  test('Register Now retains an independent copy of the POI target', () => {
    const target = { markerId: '42' };
    map._showBookmarkRegistrationPrompt(target);
    document.querySelector('[data-action="register"]').click();
    target.markerId = '99';
    expect(map._pendingBookmarkRegistration.markerId).toBe('42');
    expect(map._createRegisterForm).toHaveBeenCalledTimes(1);
    expect(map.mapControl.openDrawerLarge).toHaveBeenCalledTimes(1);
  });
  test('saves before returning to the POI and does not toggle an existing bookmark off', () => {
    map._pendingBookmarkRegistration = { markerId: '42' };
    map.getUser = () => ({ id: 1 });
    map._findBookmark = () => null;
    map.getUserBookmarks = jest.fn();
    map.goTo = jest.fn();
    map._updateBookmarkButton = jest.fn();
    const ajax = jest.spyOn($, 'ajax').mockImplementation(options => {
      expect(options.url).toBe('ajax.php?command=add_bookmark');
      expect(map.goTo).not.toHaveBeenCalled();
      options.success({ success: true, id: 123 });
    });
    try {
      map._saveRegistrationBookmark();
      expect(map.bookmarks[0]).toEqual({ id: 123, markerId: '42' });
      expect(map.goTo).toHaveBeenCalledWith({ marker: '42', panTo: false, centerInVisibleArea: true });
      expect(map._pendingBookmarkRegistration).toBeNull();
    } finally { ajax.mockRestore(); }
  });
});
