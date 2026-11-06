#!/usr/bin/env node
// Builds the game's own named area borders for Breath of the Wild and Tears
// of the Kingdom, and TotK's tower regions, as one migration. The data is the
// datamined game files the ZeldaMods object maps publish (BotW:
// objmap.zeldamods.org; TotK: github.com/zeldamods/objmap-totk); see
// docs/BotW-Labels-and-Regions.md for downloading them.
//
//   node dev/assets/area-borders.cjs /path/to/botw-files /path/to/totk-files
//
// BotW files: ecosystem/FieldMapArea.json, ecosystem/area_data.json,
//   text/StaticMsg/LocationMarker.json
// TotK files: ecosystem/MapTower.json, ecosystem/Ground.json, Sky.json,
//   MinusField.json, area_data.json, map_summary/MainField/static.json,
//   text/StaticMsg/LocationMarker.json
// Writes migrations/20261106050000_area_borders.sql (+ .down.sql).
'use strict';
const fs = require('fs');
const path = require('path');
const { simplify } = require('./botw/labels-and-regions.cjs');

const ROOT = path.resolve(__dirname, '../..');
const FILE = '20261106050000_area_borders';

// Each game's coordinates onto its site map: exact, from the towers.
const GAMES = {
  botw: { submaps: { Ground: 1901 }, simplify: 6,
    toSite: (X, Z) => [X / 64 + 128, -Z / 64 - 128], decimals: 2 },
  totk: { submaps: { Ground: 2101, Sky: 2102, MinusField: 2103 }, simplify: 8,
    toSite: (X, Z) => [X, -Z], decimals: 0 },
};

const read = (dir, file) => JSON.parse(fs.readFileSync(path.join(dir, file), 'utf8'));
const textNames = (dir) => {
  const names = read(dir, 'text/StaticMsg/LocationMarker.json');
  return Object.fromEntries(Object.entries(names).filter(([, v]) => typeof v === 'string'));
};
function sqlString(text) {
  if (/[\r\n]/.test(text)) throw new Error(`Line break in "${text}"`);
  return "'" + text.replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
}
// Polygons in game units → simplified, in site units, GeoJSON [x, y] order.
function convert(game, polygons) {
  const factor = Math.pow(10, game.decimals);
  return polygons.map((rings) => rings.map((ring) => simplify(ring, game.simplify)
    .map(([X, Z]) => game.toSite(X, Z).map((v) => Math.round(v * factor) / factor))));
}
function inside(point, rings) {
  let hit = false;
  for (const ring of rings) {
    for (let i = 0, j = ring.length - 1; i < ring.length; j = i++) {
      const [xi, yi] = ring[i], [xj, yj] = ring[j];
      if ((yi > point[1]) !== (yj > point[1]) && point[0] < (xj - xi) * (point[1] - yi) / (yj - yi) + xi) hit = !hit;
    }
  }
  return hit;
}
// Areas sharing a name become one region: their polygons together.
function group(entries) {
  const byName = new Map();
  for (const { name, polygons } of entries) {
    if (!byName.has(name)) byName.set(name, []);
    byName.get(name).push(...polygons);
  }
  return [...byName].sort(([a], [b]) => a.localeCompare(b));
}

function botwAreas(dir) {
  const game = GAMES.botw, names = textNames(dir);
  const areaNames = Object.fromEntries(read(dir, 'ecosystem/area_data.json').map((a) => [a.AreaNumber, a.Area]));
  const areas = read(dir, 'ecosystem/FieldMapArea.json');
  const entries = Object.entries(areas).map(([number, features]) => {
    const name = names['MapArea_' + areaNames[number]];
    if (!name) throw new Error(`BotW area ${number} (${areaNames[number]}) has no name`);
    return { name, polygons: features.map((f) => f.coordinates) };
  });
  return group(entries).map(([name, polygons], order) => ({
    submap: game.submaps.Ground, name, shortName: name, kind: 'area', order,
    polygon: { type: 'MultiPolygon', coordinates: convert(game, polygons) },
  }));
}

function totkAreas(dir) {
  const game = GAMES.totk, names = textNames(dir), areaData = read(dir, 'area_data.json');
  const rows = [];
  for (const layer of ['Ground', 'Sky', 'MinusField']) {
    const entries = read(dir, `ecosystem/${layer}.json`).features.map((feature) => {
      const number = feature.properties.Area;
      const key = areaData[layer][String(number)].Area.split('/').pop().split('.')[0];
      const name = names[key];
      if (!name) throw new Error(`TotK ${layer} area ${number} (${key}) has no name`);
      const polygons = feature.geometry.type === 'MultiPolygon' ? feature.geometry.coordinates : [feature.geometry.coordinates];
      return { name, polygons };
    });
    group(entries).forEach(([name, polygons], order) => rows.push({
      // "Eldin Mountains Sky" is the Sky map's Eldin Mountains.
      submap: game.submaps[layer], name, shortName: name.replace(/ (Sky|Depths)$/, ''), kind: 'area', order,
      polygon: { type: 'MultiPolygon', coordinates: convert(game, polygons) },
    }));
  }
  return rows;
}

function totkTowers(dir) {
  const game = GAMES.totk, names = textNames(dir);
  const towers = read(dir, 'map_summary/MainField/static.json').markers.Tower
    .map((t) => ({ name: names[t.MessageID], point: [t.Translate.X, t.Translate.Z] }));
  const regions = read(dir, 'ecosystem/MapTower.json');
  return Object.keys(regions).map(Number).sort((a, b) => a - b).map((key) => {
    const polygons = regions[key].map((f) => f.coordinates);
    const tower = towers.find((t) => polygons.some((rings) => inside(t.point, rings)));
    if (!tower) throw new Error(`TotK tower region ${key} has no tower inside it`);
    const place = tower.name.replace(/ Skyview Tower$/, '');
    return { submap: game.submaps.Ground, name: `${tower.name} Region`, shortName: place, kind: 'tower', order: key,
      polygon: { type: 'MultiPolygon', coordinates: convert(game, polygons) } };
  });
}

function migration(rows) {
  const lines = [
    "-- The games' own named area borders: BotW's 23 areas, TotK's 23 on each of",
    "-- the Surface, Sky and Depths, and TotK's 15 tower regions. Generated by",
    '-- dev/assets/area-borders.cjs, do not edit the rows by hand.',
    '-- kind is tower (a tower region, the region pill) or area (the area pill).',
    '-- The site works without this: get_map.php serves what the table holds.',
    '',
    'CREATE TABLE IF NOT EXISTS map_region (',
    '  id INT NOT NULL AUTO_INCREMENT,',
    '  submap_id INT NOT NULL,',
    '  name VARCHAR(100) NOT NULL,',
    '  short_name VARCHAR(100) NOT NULL,',
    "  kind VARCHAR(16) NOT NULL DEFAULT 'tower',",
    '  region_order INT NOT NULL DEFAULT 0,',
    '  polygon MEDIUMTEXT NOT NULL,',
    '  visible TINYINT(1) NOT NULL DEFAULT 1,',
    '  PRIMARY KEY (id),',
    '  UNIQUE KEY map_region_submap_name (submap_id, name)',
    ');',
    '',
    "ALTER TABLE map_region ADD COLUMN IF NOT EXISTS kind VARCHAR(16) NOT NULL DEFAULT 'tower' AFTER short_name;",
    '',
  ];
  for (const row of rows) {
    lines.push(`INSERT IGNORE INTO map_region (submap_id, name, short_name, kind, region_order, polygon) VALUES ` +
      `(${row.submap}, ${sqlString(row.name)}, ${sqlString(row.shortName)}, '${row.kind}', ${row.order}, ${sqlString(JSON.stringify(row.polygon))});`);
  }
  return lines.join('\n') + '\n';
}

function main() {
  const [botwDir, totkDir] = process.argv.slice(2);
  if (!botwDir || !totkDir) {
    console.error('Usage: node dev/assets/area-borders.cjs /path/to/botw-files /path/to/totk-files');
    process.exit(1);
  }
  const rows = [...botwAreas(botwDir), ...totkTowers(totkDir), ...totkAreas(totkDir)];
  const text = migration(rows);
  fs.writeFileSync(path.join(ROOT, 'migrations', `${FILE}.sql`), text);
  fs.writeFileSync(path.join(ROOT, 'migrations', `${FILE}.down.sql`), [
    '-- Removes the area borders and TotK tower regions (BotW tower regions stay).',
    "DELETE FROM map_region WHERE kind = 'area' OR submap_id IN (2101, 2102, 2103);",
    '',
  ].join('\n'));
  console.log(`${FILE}.sql: ${(text.length / 1024).toFixed(0)} KB`);
  const count = {};
  rows.forEach((r) => { const k = `${r.submap} ${r.kind}`; count[k] = (count[k] || 0) + 1; });
  console.log(count);
  console.log('points per submap:', rows.reduce((t, r) => { t[r.submap] = (t[r.submap] || 0) + r.polygon.coordinates.flat(2).length; return t; }, {}));
  console.log('TotK towers:', rows.filter((r) => r.kind === 'tower').map((r) => r.shortName).join(', '));
}

if (require.main === module) main();
