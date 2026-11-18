const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/zmap.js', 'utf8');
const start = source.indexOf('ZMap.prototype.focusSingleMapCategory =');
const end = source.indexOf('ZMap.prototype.refreshMap =', start);
const context = { ZMap: function() {}, L: { latLngBounds: points => points } };
vm.runInNewContext(source.slice(start, end), context);

describe('category viewport navigation', () => {
  function setup(inView) {
    const category = { id: '1', checked: true, childrenArr: [] };
    const markers = [false, inView].map(visible => ({
      visible: true, mapId: '19', submapId: '1901', categoryTypeId: 1,
      getLatLng: () => ({ inView: visible })
    }));
    const map = {
      mapOptions: { showCompleted: true }, cachedMarkersByCategory: { '1': markers },
      mapControl: { getCurrentMap: () => ({ mapId: 19, subMapId: 1901 }),
        _container: { getBoundingClientRect: () => ({ width: 360 }) }, options: { collapsed: true } },
      map: { getZoom: () => 7, getMaxZoom: () => 8,
        getBounds: () => ({ contains: point => point.inView }),
        getContainer: () => ({ getBoundingClientRect: () => ({ bottom: 900 }) }), fitBounds: jest.fn() },
      _visibleMapPadding: context.ZMap.prototype._visibleMapPadding
    };
    return { category, map };
  }
  test('even one POI in view preserves zoom and position', () => {
    const { category, map } = setup(true);
    context.ZMap.prototype.focusSingleMapCategory.call(map, category);
    expect(map.map.fitBounds).not.toHaveBeenCalled();
  });
  test('no POIs in view fits the category without zooming in', () => {
    const { category, map } = setup(false);
    context.ZMap.prototype.focusSingleMapCategory.call(map, category);
    expect(map.map.fitBounds).toHaveBeenCalledTimes(1);
    expect(map.map.fitBounds.mock.calls[0][1].maxZoom).toBe(7);
  });
});
