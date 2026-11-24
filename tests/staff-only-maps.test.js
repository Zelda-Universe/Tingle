const fs = require('fs');
const read = (p) => fs.readFileSync(__dirname + '/../' + p, 'utf8');

// Maps still being built (map.visible = 2, BotW's 3D Divine Beasts) go to
// staff only, with their markers, and staff never get a cached copy.
test('get_map and get_markers send staff-only maps to staff alone', () => {
  for (const file of ['ajax/get_map.php', 'ajax/get_markers.php']) {
    const src = read(file);
    expect(src).toContain('$staff = adminSignedIn($db, $map_prefix);');
    expect(src).toContain('(m' + (file.includes('markers') ? 'p' : '') + '.visible = 1 or (m' + (file.includes('markers') ? 'p' : '') + '.visible = 2 and ?))');
    expect(src).toMatch(/if \(!\$staff && file_exists\(/);
  }
});

// The 3D work is a bundle of its own (staffjs.txt) that only staff load (Load3D.js):
// nobody else downloads or runs any of it.
test('the 3D code is a staff-only bundle, out of the page everyone loads', () => {
  const main = read('javascript.txt'), staff = read('staffjs.txt');
  for (const f of ['Map3D.js', 'StreetView.js', 'StreetViewGame.js', 'StreetViewTerrain.js', 'StreetViewWater.js']) {
    expect(main).not.toContain('scripts/controls/' + f);
    expect(staff).toContain('scripts/controls/' + f);
  }
  expect(main).toContain('scripts/controls/Load3D.js');
  expect(read('res.php')).toContain('$type != "staffjs"');
  expect(read('lib/common/assets.php')).toContain("'staffjs.txt'");
  const load = read('scripts/controls/Load3D.js');
  expect(load).toContain('STAFF_LEVEL = 10');
  expect(load).toContain("ensure: function(u) { return staff(u) ? load() : $.Deferred().reject().promise(); }");
  expect(read('scripts/zmain.lib.js')).toContain('ZLoad3D.forMaps(vResults).always(');
  expect(read('scripts/zmap.js')).toContain('ZLoad3D.streetViewHere(this, this.getUser())');
});

test('3D maps are layers the map list can switch to', () => {
  const zmap = read('scripts/zmap.js');
  expect(zmap).toContain("vMap.kind === '3d'");
  const map3d = read('scripts/controls/Map3D.js');
  expect(map3d).toContain("'oot-floor-pill oot-age-pill'");
  expect(map3d).toContain("marker.fire('click')");
});
