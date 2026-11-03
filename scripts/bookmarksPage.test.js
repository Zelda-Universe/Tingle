/** @jest-environment jsdom */
const fs = require('fs');
const vm = require('vm');
const $ = require('jquery');
const source = fs.readFileSync(__dirname + '/zmap.js', 'utf8');
const context = { ZMap: function() {}, $ };
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._createBookmarksPage ='),
  source.indexOf('ZMap.prototype._createMarkerBookmarkEntry =')), context);

describe('Bookmarks transition height measurement', () => {
  test.each([false, true])('content is complete before setContent, populated=%s', populated => {
    const map = Object.create(context.ZMap.prototype);
    map.bookmarks = populated ? [{ markerId: '42' }, { x: 1, y: 2 }] : [];
    map._createMarkerBookmarkEntry = () => $('<li class="marker-list-entry">POI</li>');
    map._createPinBookmarkEntry = () => $('<li class="marker-list-entry">Pin</li>');
    map.mapControl = { setContent: jest.fn((page, type) => {
      expect(type).toBe('bookmarksPage');
      if(populated) expect(page.find('.marker-list-entry')).toHaveLength(2);
      else {
        expect(page.find('.bookmarks-empty')).toHaveLength(1);
        expect(page.find('.bookmarks-empty-title').text()).toBe('No Bookmarks');
        expect(page.find('.bookmarks-empty p').text()).toBe('Bookmark POIs and dropped pins to find them here.');
      }
    }) };
    document.body.innerHTML = '<div id="bookmarks"><ul class="marker-list"><li>Outgoing page</li></ul></div>';
    map._createBookmarksPage();
    expect(map.mapControl.setContent).toHaveBeenCalledTimes(1);
    expect(document.querySelector('#bookmarks .marker-list').textContent).toBe('Outgoing page');
  });
});
