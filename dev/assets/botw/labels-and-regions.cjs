#!/usr/bin/env node
// Builds Breath of the Wild's place labels and tower regions from the game's
// own data, as two migrations. The data is the datamined game files that the
// ZeldaMods object map (objmap.zeldamods.org, github.com/zeldamods/objmap)
// publishes; see docs/BotW-Labels-and-Regions.md for how to download them.
//
//   node dev/assets/botw/labels-and-regions.cjs /path/to/objmap-game-files
//
// Reads, under that folder:
//   map_summary/MainField/static.json   location labels (Location.mubin)
//   text/StaticMsg/LocationMarker.json  their English names
//   ecosystem/MapTower.json             tower regions, as GeoJSON polygons
// Writes:
//   migrations/20261106030000_botw_location_labels.sql (+ .down.sql)
//   migrations/20261106040000_botw_tower_regions.sql   (+ .down.sql)
'use strict';
const fs = require('fs');
const path = require('path');

const GAME = 19;          // Breath of the Wild
const SUBMAP = 1901;      // its Hyrule map
const LABEL_USER = 1;     // as TotK's labels
const ROOT = path.resolve(__dirname, '../../..');
const MIGRATIONS = path.join(ROOT, 'migrations');
const LABELS_FILE = '20261106030000_botw_location_labels';
const REGIONS_FILE = '20261106040000_botw_tower_regions';
// How far a simplified border may stray from the game's, in game units
// (1 unit = 1/64 of a map unit, 4 pixels at the deepest zoom).
const SIMPLIFY = 2;

// The game's coordinates (X east, Z south) onto the site's BotW map. Exact:
// it puts all 15 towers on the site's existing tower markers.
const toSite = (X, Z) => [round(X / 64 + 128), round(-Z / 64 - 128)];
const round = (v) => Math.round(v * 10000) / 10000;

// Location.mubin's ShowLevel is the zoom tier a name appears at; these are
// the four label categories TotK already uses on the site.
const TIERS = { 1: 'Region Labels', 2: 'Area Labels', 4: 'Places Labels', 8: 'Places Labels - Close' };
const CATEGORIES = [
  // name, parent, img, color, visible_zoom (as TotK's)
  ['Labels', null, 'General_Map', '#3cbc75', 6],
  ['Region Labels', 'Labels', '', '', 2],
  ['Area Labels', 'Labels', '', '', 3],
  ['Places Labels', 'Labels', '', '', 3],
  ['Places Labels - Close', 'Labels', '', '', 3],
];

// MapTower.json's keys, in the game's order (as objmap's AppMap.ts).
const TOWERS = ['Hebra', 'Tabantha', 'Gerudo', 'Wasteland', 'Woodland', 'Central', 'Great Plateau',
  'Dueling Peaks', 'Lake', 'Eldin', 'Akkala', 'Lanayru', 'Hateno', 'Faron', 'Ridgeland'];

// Marker names are stored HTML-encoded, as add_marker.php's htmlentities(…, ENT_QUOTES).
const ENTITIES = { '&': '&amp;', "'": '&#039;', '"': '&quot;', '<': '&lt;', '>': '&gt;', 'é': '&eacute;' };
function htmlEncode(text) {
  return text.replace(/[&'"<>é]/g, (c) => ENTITIES[c]).replace(/[^\x00-\x7f]/g, (c) => {
    throw new Error(`No HTML entity for "${c}" in "${text}"`);
  });
}
function sqlString(text) {
  // bin/migrate.php splits statements on a ';' that ends a line.
  if (/[\r\n]/.test(text)) throw new Error(`Line break in "${text}"`);
  return "'" + text.replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
}

// Douglas–Peucker on one ring; keeps its first and last points.
function simplify(points, tolerance) {
  if (points.length < 3) return points;
  const keep = new Uint8Array(points.length);
  keep[0] = keep[points.length - 1] = 1;
  const stack = [[0, points.length - 1]];
  while (stack.length) {
    const [a, b] = stack.pop();
    const [ax, ay] = points[a], [bx, by] = points[b];
    const dx = bx - ax, dy = by - ay, length = Math.hypot(dx, dy);
    let worst = -1, index = -1;
    for (let i = a + 1; i < b; i++) {
      const [px, py] = points[i];
      const distance = length === 0 ? Math.hypot(px - ax, py - ay)
        : Math.abs(dy * px - dx * py + bx * ay - by * ax) / length;
      if (distance > worst) { worst = distance; index = i; }
    }
    if (worst > tolerance) { keep[index] = 1; stack.push([a, index], [index, b]); }
  }
  return points.filter((_, i) => keep[i]);
}

function labels(dir) {
  const read = (file) => JSON.parse(fs.readFileSync(path.join(dir, file), 'utf8'));
  const names = read('text/StaticMsg/LocationMarker.json');
  const locations = read('map_summary/MainField/static.json').markers.Location;
  return locations.map((location) => {
    const name = names[location.MessageID];
    const tier = TIERS[location.ShowLevel];
    if (!name) throw new Error(`No name for ${location.MessageID}`);
    if (!tier) throw new Error(`Unknown ShowLevel ${location.ShowLevel} for ${name}`);
    const [x, y] = toSite(location.Translate.X, location.Translate.Z);
    // Enough to recognise each label again when real game data replaces it.
    const gameData = { source: 'BotW LocationMarker', messageId: location.MessageID,
      showLevel: location.ShowLevel, type: location.Type ?? null };
    return { name, tier, x, y, gameData };
  }).sort((a, b) => Object.values(TIERS).indexOf(a.tier) - Object.values(TIERS).indexOf(b.tier)
    || a.name.localeCompare(b.name) || a.x - b.x || a.y - b.y);
}

function regions(dir) {
  const towers = JSON.parse(fs.readFileSync(path.join(dir, 'ecosystem/MapTower.json'), 'utf8'));
  return Object.keys(towers).map(Number).sort((a, b) => a - b).map((key) => {
    const polygons = towers[key].map((feature) => {
      if (feature.type !== 'Polygon') throw new Error(`Region ${key}: ${feature.type}`);
      // GeoJSON order, [x, y], in site units: what L.geoJSON reads in this CRS.
      // 3 decimals: a thousandth of a map unit, a quarter pixel at the deepest zoom.
      return feature.coordinates.map((ring) => simplify(ring, SIMPLIFY)
        .map(([X, Z]) => toSite(X, Z).map((v) => Math.round(v * 1000) / 1000)));
    });
    // The page is "Great Plateau Tower Region"; a marker's pill says "Great Plateau".
    return { name: TOWERS[key] + ' Tower Region', shortName: TOWERS[key], order: key,
      polygon: { type: 'MultiPolygon', coordinates: polygons } };
  });
}

function labelsMigration(rows) {
  const lines = [
    "-- Breath of the Wild's place names, from the game's Location.mubin, as",
    '-- label markers in the four tiers TotK uses. Generated by',
    '-- dev/assets/botw/labels-and-regions.cjs, do not edit by hand.',
    '-- Safe to run twice: each row is added only if it is not there yet.',
    '',
  ];
  for (const [name, parent, img, color, zoom] of CATEGORIES) {
    const from = parent
      ? `FROM marker_category p WHERE p.container_id = ${GAME} AND p.marker_category_type_id = 3 AND p.name = ${sqlString(parent)} AND`
      : 'FROM DUAL WHERE';
    lines.push(`INSERT INTO marker_category (parent_id, marker_category_type_id, container_id, name, default_checked, img, color, visible_zoom, visible) ` +
      `SELECT ${parent ? 'p.id' : 'NULL'}, 3, ${GAME}, ${sqlString(name)}, 1, ${sqlString(img)}, ${sqlString(color)}, ${zoom}, 1 ` +
      `${from} NOT EXISTS (SELECT 1 FROM marker_category c WHERE c.container_id = ${GAME} AND c.marker_category_type_id = 3 AND c.name = ${sqlString(name)});`);
  }
  lines.push('');
  for (const row of rows) {
    const gameData = sqlString(JSON.stringify(row.gameData).replace(/}$/, `,"x":${row.x},"y":${row.y}}`));
    lines.push(`INSERT INTO marker (submap_id, marker_category_id, marker_status_id, user_id, name, description, x, y, z, global, path, game_data, visible, last_updated) ` +
      `SELECT ${SUBMAP}, c.id, 2, ${LABEL_USER}, ${sqlString(htmlEncode(row.name))}, '', ${row.x}, ${row.y}, 0, 0, '', ${gameData}, 1, NOW() ` +
      `FROM marker_category c WHERE c.container_id = ${GAME} AND c.marker_category_type_id = 3 AND c.name = ${sqlString(row.tier)} ` +
      `AND NOT EXISTS (SELECT 1 FROM marker m WHERE m.marker_category_id = c.id AND m.game_data = ${gameData});`);
  }
  return lines.join('\n') + '\n';
}

function labelsDown() {
  return [
    '-- Removes what the labels migration added: its markers, found by their',
    '-- game data, then the label categories if nothing else uses them.',
    `DELETE FROM marker WHERE submap_id = ${SUBMAP} AND game_data LIKE '{"source":"BotW LocationMarker"%';`,
    `DELETE c FROM marker_category c LEFT JOIN marker m ON m.marker_category_id = c.id WHERE c.container_id = ${GAME} AND c.marker_category_type_id = 3 AND c.parent_id IS NOT NULL AND m.id IS NULL;`,
    `DELETE c FROM marker_category c LEFT JOIN marker_category k ON k.parent_id = c.id WHERE c.container_id = ${GAME} AND c.marker_category_type_id = 3 AND c.name = 'Labels' AND k.id IS NULL;`,
    '',
  ].join('\n');
}

function regionsMigration(rows) {
  const lines = [
    "-- Breath of the Wild's 15 tower regions, from the game's MapTower data.",
    '-- polygon is a GeoJSON MultiPolygon in map units ([x, y]). short_name is',
    "-- what a marker's region pill says. Generated by",
    '-- dev/assets/botw/labels-and-regions.cjs, do not edit the rows by hand.',
    '-- The site works without this table: get_map.php serves no regions.',
    '',
    'CREATE TABLE IF NOT EXISTS map_region (',
    '  id INT NOT NULL AUTO_INCREMENT,',
    '  submap_id INT NOT NULL,',
    '  name VARCHAR(100) NOT NULL,',
    '  short_name VARCHAR(100) NOT NULL,',
    '  region_order INT NOT NULL DEFAULT 0,',
    '  polygon MEDIUMTEXT NOT NULL,',
    '  visible TINYINT(1) NOT NULL DEFAULT 1,',
    '  PRIMARY KEY (id),',
    '  UNIQUE KEY map_region_submap_name (submap_id, name)',
    ');',
    '',
  ];
  for (const row of rows) {
    lines.push(`INSERT IGNORE INTO map_region (submap_id, name, short_name, region_order, polygon) VALUES ` +
      `(${SUBMAP}, ${sqlString(row.name)}, ${sqlString(row.shortName)}, ${row.order}, ${sqlString(JSON.stringify(row.polygon))});`);
  }
  return lines.join('\n') + '\n';
}

function main() {
  const dir = process.argv[2];
  if (!dir) {
    console.error('Usage: node dev/assets/botw/labels-and-regions.cjs /path/to/objmap-game-files');
    process.exit(1);
  }
  const labelRows = labels(dir);
  const regionRows = regions(dir);
  const write = (file, text) => {
    fs.writeFileSync(path.join(MIGRATIONS, file), text);
    console.log(`${file}: ${(text.length / 1024).toFixed(0)} KB`);
  };
  write(`${LABELS_FILE}.sql`, labelsMigration(labelRows));
  write(`${LABELS_FILE}.down.sql`, labelsDown());
  write(`${REGIONS_FILE}.sql`, regionsMigration(regionRows));
  write(`${REGIONS_FILE}.down.sql`, '-- Removes the tower regions.\nDROP TABLE IF EXISTS map_region;\n');
  const tiers = {};
  labelRows.forEach((row) => { tiers[row.tier] = (tiers[row.tier] || 0) + 1; });
  console.log('labels', tiers);
  console.log('regions', regionRows.map((r) => `${r.name} (${r.polygon.coordinates.flat(2).length} points)`).join(', '));
}

if (require.main === module) main();
module.exports = { toSite, simplify, htmlEncode, TOWERS, TIERS };
