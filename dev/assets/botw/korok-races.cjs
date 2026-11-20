#!/usr/bin/env node
// Builds Breath of the Wild's 51 Korok races as paths, the same way TotK's
// are (migrations/20261115190000_totk_lines_to_paths.sql): official,
// unlisted, one check each, a shown "Korok Race: Start" pin at the stump
// followed by the Korok Seed marker where the korok appears. Created as
// Jess's (user 15), each with its history.
//
//   node dev/assets/botw/korok-races.cjs
//
// Reads korok-races.json beside it (from zeldamods' radar; see its
// description). Writes:
//   migrations/20261120120000_botw_korok_races.sql (+ .down.sql)
'use strict';
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const GAME = 19;        // Breath of the Wild
const SUBMAP = 1901;    // its Hyrule map
const CATEGORY = 1916;  // Korok Seeds
const USER = 15;        // Jess
const COLOR = '#3cbc75';
const ROOT = path.resolve(__dirname, '../../..');
const FILE = '20261120120000_botw_korok_races';

// The game's coordinates (X east, Z south) onto the site's BotW map, as
// labels-and-regions.cjs.
const round = (v) => Math.round(v * 10000) / 10000;
const toSite = (X, Z) => [round(X / 64 + 128), round(-Z / 64 - 128)];

// Stable per race, so regenerating gives the same file.
const pinKey = (race) => crypto.createHash('sha1').update('botw-korok-race-' + race.goalHashId).digest('hex').slice(0, 10);
const slug = (race) => 'korok-race-' + race.markerId;
const q = (s) => "'" + String(s).replace(/\\/g, '\\\\').replace(/'/g, "\\'").replace(/"/g, '\\"') + "'";

function race(r) {
  const [x, y] = toSite(r.start[0], r.start[2]);
  const key = pinKey(r);
  const s = q(slug(r));
  const snapshot = {
    name: 'Korok Race', description: '', kind: 'single', loops: false, numbered: false, smooth: false,
    alwaysShow: true, categoryId: CATEGORY, color: COLOR, scope: 'official', visibility: 'unlisted',
    editAccess: 'editors', publishedAt: null, published: true,
    steps: [{submapId: SUBMAP, x, y, name: 'Korok Race: Start', shown: true, pinKey: key}, {markerId: r.markerId}],
  };
  return [
    `-- Korok Race (${slug(r)})`,
    "INSERT INTO `path` (container_id, user_id, scope, visibility, edit_access, published_at, name, slug, description, kind, loops, numbered, smooth, always_show, category_id, color, visible, created, updated) " +
      `SELECT ${GAME}, ${USER}, 'official', 'unlisted', 'editors', NOW(), 'Korok Race', ${s}, '', 'single', 0, 0, 0, 1, ${CATEGORY}, '${COLOR}', 1, NOW(), NOW() FROM DUAL ` +
      `WHERE NOT EXISTS (SELECT 1 FROM \`path\` WHERE container_id = ${GAME} AND slug = ${s}) AND EXISTS (SELECT 1 FROM \`marker\` WHERE id = ${r.markerId} AND marker_category_id = ${CATEGORY} AND submap_id = ${SUBMAP});`,
    `SET @p = (SELECT id FROM \`path\` WHERE container_id = ${GAME} AND slug = ${s});`,
    "INSERT INTO `path_step` (path_id, step_order, marker_id, submap_id, x, y, name, note, shown, pin_key, content) SELECT t.* FROM (" +
      `SELECT @p AS \`path_id\`, 1 AS \`step_order\`, NULL AS \`marker_id\`, ${SUBMAP} AS \`submap_id\`, ${x} AS \`x\`, ${y} AS \`y\`, 'Korok Race: Start' AS \`name\`, NULL AS \`note\`, 1 AS \`shown\`, '${key}' AS \`pin_key\`, NULL AS \`content\` UNION ALL ` +
      `SELECT @p AS \`path_id\`, 2 AS \`step_order\`, ${r.markerId} AS \`marker_id\`, NULL AS \`submap_id\`, NULL AS \`x\`, NULL AS \`y\`, NULL AS \`name\`, NULL AS \`note\`, 1 AS \`shown\`, NULL AS \`pin_key\`, NULL AS \`content\`` +
      ") t WHERE @p IS NOT NULL AND NOT EXISTS (SELECT 1 FROM `path_step` WHERE path_id = @p);",
    "INSERT INTO `path_revision` (path_id, user_id, action, summary, snapshot, created) " +
      `SELECT @p, ${USER}, 'create', 'Created the path', JSON_SET(${q(JSON.stringify(snapshot))}, '$.publishedAt', DATE_FORMAT(p.published_at, '%Y-%m-%d %H:%i:%s')), NOW() ` +
      "FROM `path` p WHERE p.id = @p AND NOT EXISTS (SELECT 1 FROM `path_revision` WHERE path_id = @p);",
    '',
  ].join('\n');
}

function main() {
  const {races} = JSON.parse(fs.readFileSync(path.join(__dirname, 'korok-races.json'), 'utf8'));
  const up = [
    "-- BotW's 51 Korok races as paths, as TotK's: a timed run from a stump",
    '-- (a shown Korok Race: Start pin) to where the korok appears (its Korok',
    "-- Seed marker). Official but unlisted: on the map and opened from their",
    '-- markers, kept out of lists, the sitemap and feeds. From zeldamods\' radar',
    '-- by dev/assets/botw/korok-races.cjs. Each is created as Jess\'s, in its history.',
    '',
    '',
  ].join('\n') + races.map(race).join('\n');
  const slugs = races.map((r) => q(slug(r))).join(', ');
  const mine = `p.container_id = ${GAME} AND p.user_id = ${USER} AND p.slug IN (${slugs})`;
  const down = [
    "-- BotW's Korok race paths gone, as before the migration.",
    '',
    `DELETE r FROM \`path_revision\` r JOIN \`path\` p ON p.id = r.path_id WHERE ${mine};`,
    '',
    `DELETE s FROM \`path_step\` s JOIN \`path\` p ON p.id = s.path_id WHERE ${mine};`,
    '',
    `DELETE FROM \`path\` WHERE container_id = ${GAME} AND user_id = ${USER} AND slug IN (${slugs});`,
    '',
  ].join('\n');
  for (const [file, text] of [[`${FILE}.sql`, up], [`${FILE}.down.sql`, down]]) {
    fs.writeFileSync(path.join(ROOT, 'migrations', file), text);
    console.log(`${file}: ${(text.length / 1024).toFixed(0)} KB`);
  }
}

main();
