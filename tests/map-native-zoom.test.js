const fs = require('fs');
const vm = require('vm');

test('Koholint tiles remain visible at map zoom 6 while requesting only downloaded native zoom 4', () => {
  const source = fs.readFileSync(__dirname + '/../scripts/zmap.js', 'utf8');
  const context = { ZMap: function() {}, L: { tileLayer: (url, options) => ({ _url: url, options }) } };
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.addMap ='), source.indexOf('ZMap.prototype.addMarkers =')), context);
  const map = Object.assign(Object.create(context.ZMap.prototype), {
    maps: [], mapOptions: { maxZoom: '6', tileSize: 256 },
    tilesBaseURL: 'https://zeldamaps.com/tiles/', tileNameFormat: '{z}_{x}_{y}', defaultIconURL: 'images/icons/'
  });
  map.addMap({ id: 20, name: 'Koholint Island', maxZoom: '4', subMap: [
    { tileURL: 'la_rmk/koholint_island/', tileExt: 'png', submapLayer: [] }
  ] });
  expect(map.maps[0].options.maxZoom).toBe(6);
  expect(map.maps[0].options.maxNativeZoom).toBe(4);
});
