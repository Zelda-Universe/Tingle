const fs = require('fs');
const vm = require('vm');

test('Koholint tiles remain visible at map zoom 6 while requesting only downloaded native zoom 4', () => {
  const source = fs.readFileSync(__dirname + '/../scripts/zmap.js', 'utf8');
  const context = { ZMap: function() {}, L: {
    tileLayer: (url, options) => ({ _url: url, options, on() { return this; } }),
    latLng: (lat, lng) => ({ lat: lat + 0, lng: lng + 0 }),
    latLngBounds: (a, b) => [a, b]
  } };
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._tilePyramidBounds ='), source.indexOf('ZMap.prototype.addMarkers =')), context);
  const map = Object.assign(Object.create(context.ZMap.prototype), {
    maps: [], mapOptions: { maxZoom: '6', tileSize: 256, scaleP: '1', scaleN: '-1', offsetX: '0', offsetY: '0' },
    tilesBaseURL: 'https://zeldamaps.com/tiles/', tileNameFormat: '{z}_{x}_{y}', defaultIconURL: 'images/icons/'
  });
  map.addMap({ id: 20, name: 'Koholint Island', maxZoom: '4', subMap: [
    { tileURL: 'la_rmk/koholint_island/', tileExt: 'png', submapLayer: [] }
  ] });
  expect(map.maps[0].options.maxZoom).toBe(6);
  expect(map.maps[0].options.maxNativeZoom).toBe(4);
  expect(map.maps[0].options.bounds).toEqual([{ lat: 0, lng: 0 }, { lat: -256, lng: 256 }]);
  // Its low-resolution backdrop: one fixed level, in its own pane, inside the
  // artwork, and usable at every zoom the map allows.
  const backdrop = map.maps[0].backdrop.options;
  expect([backdrop.minNativeZoom, backdrop.maxNativeZoom, backdrop.maxZoom]).toEqual([2, 2, 6]);
  expect(backdrop.pane).toBe('tileBackdropPane');
  expect(backdrop.bounds).toEqual([{ lat: 0, lng: 0 }, { lat: -256, lng: 256 }]);
});
