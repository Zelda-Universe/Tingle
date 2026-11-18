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

test('3D maps are layers the map list can switch to', () => {
  const zmap = read('scripts/zmap.js');
  expect(zmap).toContain("vMap.kind === '3d'");
  expect(read('javascript.txt')).toContain('scripts/controls/Map3D.js');
  const map3d = read('scripts/controls/Map3D.js');
  expect(map3d).toContain("'oot-floor-pill oot-age-pill'");
  expect(map3d).toContain("marker.fire('click')");
});
