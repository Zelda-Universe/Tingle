const fs = require('fs');
const path = require('path');
const vm = require('vm');
const { toSite, simplify, htmlEncode } = require('../dev/assets/botw/labels-and-regions.cjs');

const migration = (name) => fs.readFileSync(path.join(__dirname, '../migrations', name), 'utf8');

test('game coordinates land on the site\'s BotW map, as its towers do', () => {
  // Hebra Tower: game (-2173, -2034); the site's marker 2822 is at (94.046875, -96.21875).
  const [x, y] = toSite(-2173, -2034);
  expect(x).toBeCloseTo(94.046875, 3);
  expect(y).toBeCloseTo(-96.21875, 3);
  expect(toSite(0, 0)).toEqual([128, -128]);
  expect(toSite(-5000, 4000)).toEqual([49.875, -190.5]);
});

test('marker names are HTML-encoded as add_marker.php stores them', () => {
  expect(htmlEncode("Arbiter's Grounds")).toBe('Arbiter&#039;s Grounds');
  expect(htmlEncode('Boné Pond')).toBe('Bon&eacute; Pond');
  expect(() => htmlEncode('Ünknown')).toThrow();
});

test('border simplification keeps corners and drops points along straight edges', () => {
  const square = [[0, 0], [5, 0], [10, 0], [10, 5], [10, 10], [5, 10], [0, 10], [0, 5], [0, 0]];
  expect(simplify(square, 1)).toEqual([[0, 0], [10, 0], [10, 10], [0, 10], [0, 0]]);
});

test('the label migration adds each of the 622 names once, in four tiers, and is safe to rerun', () => {
  const sql = migration('20261106030000_botw_location_labels.sql');
  const markers = sql.split('\n').filter((line) => line.startsWith('INSERT INTO marker '));
  expect(markers).toHaveLength(622);
  // Every insert checks for itself first, by its own game data.
  expect(markers.every((line) => /AND NOT EXISTS \(SELECT 1 FROM marker m WHERE m\.marker_category_id = c\.id AND m\.game_data = '\{"source":"BotW LocationMarker"/.test(line))).toBe(true);
  const tiers = {};
  markers.forEach((line) => { const tier = line.match(/c\.name = '([^']+)' AND NOT EXISTS/)[1]; tiers[tier] = (tiers[tier] || 0) + 1; });
  expect(tiers).toEqual({ 'Region Labels': 8, 'Area Labels': 24, 'Places Labels': 483, 'Places Labels - Close': 107 });
  // bin/migrate.php splits on a ';' that ends a line: every statement is one line.
  expect(sql.split('\n').filter((line) => line && !line.startsWith('--')).every((line) => line.endsWith(';'))).toBe(true);
});

test('the 15 tower regions place each tower inside its own region, and a marker in the smallest', () => {
  const sql = migration('20261106040000_botw_tower_regions.sql');
  const rows = [...sql.matchAll(/VALUES \(1901, '([^']+)', '([^']+)', (\d+), '(.+)'\);$/gm)]
    .map((m) => ({ name: m[1], shortName: m[2], polygon: JSON.parse(m[4]) }));
  expect(rows).toHaveLength(15);

  const context = { ZMap: function() {} };
  vm.runInNewContext(fs.readFileSync(path.join(__dirname, '../scripts/services/AreaSearch.js'), 'utf8'), context);
  const zmap = Object.create(context.ZMap.prototype);
  const layer = { submapRegions: [{ submapId: '1901', regions: rows }] };
  // The site's tower markers (zeldamaps.com marker IDs 2809–2929).
  const towers = {
    Hebra: [94.046875, -96.21875], Tabantha: [71.5351875, -112.5286765625], Gerudo: [70.71875, -156.571875],
    Wasteland: [91.9556875, -166.083125], Ridgeland: [100.5734375, -115.9015625], Central: [115.677421875, -134.906728125],
    'Great Plateau': [119.24945, -154.482234375], Lake: [127.50288203125, -174.275015625], Woodland: [141.8106921875, -102.91078125],
    'Dueling Peaks': [143.887140625, -154.78253125], Faron: [148.800046875, -179.151921875], Eldin: [161.971109375, -103.675296875],
    Lanayru: [163.28125, -126.296875], Hateno: [170.7421875, -161.3359375], Akkala: [179.6875, -104.5609375],
  };
  for (const [name, [x, y]] of Object.entries(towers)) {
    const region = zmap.regionAt(layer, '1901', y, x);
    expect(region.name).toBe(name + ' Tower Region');
    expect(region.shortName).toBe(name);
  }
  expect(zmap.regionAt(layer, '1902', -96.21875, 94.046875)).toBeNull();
});
