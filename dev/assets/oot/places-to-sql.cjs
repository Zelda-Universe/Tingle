// Writes the migration that adds the places the game marks on its own maps
// as new OoT categories and markers: treasure chests, shops, Great Fairy
// Fountains, minigames, people and boss doors. And its undo.
//
//   node dev/assets/oot/places-to-sql.cjs maps.json <migration name>
//
// maps.json is ajax.php?command=get_map&game=64 saved to a file (for the
// dungeon floors' submaps). Positions come from the game's map records
// (scene-data/map-points.json: MapParam TBox and Facility), converted with
// game-to-map.cjs. Chest contents: scene-data/chest-contents.json. Place
// names: scene-data/facility-names.json.
//
// IDs: categories 64020-64042, chests 645xxxxx, other places 646xxxxx. Each
// insert is skipped if its ID exists, so the migration can run twice.
const fs = require('fs');
const path = require('path');
const {project, projectDungeon} = require('./game-to-map.cjs');

const [mapsFile, name] = process.argv.slice(2);
if(!mapsFile || !name) throw new Error('Usage: node places-to-sql.cjs maps.json <migration name>');
const maps = JSON.parse(fs.readFileSync(mapsFile, 'utf8'));
const points = require('./scene-data/map-points.json');
const chests = require('./scene-data/chest-contents.json').chests;
const places = require('./scene-data/facility-names.json').places;

const HYRULE = {id: '65000', Child: '650000', Adult: '650001'};
const DUNGEONS = {
  InsideTheDekuTree: ['64028', 'Young Link'], DodongoCavern: ['64023', 'Young Link'], InsideJabuJabuBelly: ['64027', 'Young Link'],
  BottomOfTheWell: ['64022', 'Young Link'], ForestTemple: ['64025', 'Adult Link'], FireTemple: ['64024', 'Adult Link'],
  IceCavern: ['64026', 'Adult Link'], WaterTemple: ['64031', 'Adult Link'], ShadowTemple: ['64029', 'Adult Link'],
  SpiritTemple: ['64030', null]
};
const AREAS = {
  HyruleField: 'Hyrule Field', LonLonRanch: 'Lon Lon Ranch', Market: 'Market', HyruleCastle: 'Hyrule Castle',
  GanonCastle: "Ganon's Castle", KakarikoVillage: 'Kakariko Village', Graveyard: 'Graveyard',
  DeathMountainTrail: 'Death Mountain Trail', GoronCity: 'Goron City', DeathMountainCrater: 'Death Mountain Crater',
  ZoraRiver: "Zora's River", ZoraDomain: "Zora's Domain", ZoraFountain: "Zora's Fountain", KokiriForest: 'Kokiri Forest',
  LostWood: 'Lost Woods', SacredForestMeadow: 'Sacred Forest Meadow', LakeHylia: 'Lake Hylia', GerudoValley: 'Gerudo Valley',
  GerudoFortress: "Gerudo's Fortress", HountedWasteland: 'Haunted Wasteland', DesertColossus: 'Desert Colossus'
};

// [id, parent, name, image, colour]: images and colours as BotW's.
const CATEGORIES = [
  [64020, null, 'Treasure', 'BotW_Treasure-Chest', '#3cbc75'],
  [64021, 64020, 'Treasure Chests', 'BotW_Treasure-Chest', '#3cbc75'],
  [64030, null, 'Locations', 'BotW_Locations', '#8e72b9'],
  [64031, 64030, 'Shops', 'General_Store', '#8e72b9'],
  [64032, 64030, 'Great Fairy Fountains', 'BotW_Great-Fairy', '#8e72b9'],
  [64033, 64030, 'Minigames', 'BotW_Locations', '#8e72b9'],
  [64040, null, 'Points of Interest', 'BotW_Points-of-Interest', '#4bc5ee'],
  [64041, 64040, 'People', 'TotK_Npc', '#4bc5ee'],
  [64042, 64040, 'Boss Doors', 'BotW_Boss', '#ff422e']
];
const CATEGORY_OF = {chest: 64021, shop: 64031, fairy: 64032, minigame: 64033, person: 64041, boss: 64042};

const sql = value => value === null || value === undefined ? 'NULL'
  : typeof value === 'number' ? String(value) : "'" + String(value).replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
// The site stores marker text HTML-encoded (PHP htmlentities, ENT_QUOTES).
const encoded = text => String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
  .replace(/"/g, '&quot;').replace(/'/g, '&#039;');
const num = value => Number(value.toFixed(3));
const AUTHOR = 'COALESCE((SELECT id FROM user WHERE id = 15), 1)';

// The dungeon floor's first submap ("B1", "1F · Water level 1").
function floorSubmap(mapId, floor) {
  const map = maps.find(m => String(m.id) === mapId);
  const submap = map && map.subMap.find(s => String(s.name).split(' ')[0] === floor);
  return submap && String(submap.id);
}

// Where a game record goes: {mapId, submapId, global, x, y, area, region, age}.
// records are the same place's records (one per age it appears in).
function placement(records) {
  const first = records[0];
  if(first.floor !== null) {
    const dungeon = DUNGEONS[first.scene];
    if(!dungeon) return null;
    const at = projectDungeon(first.scene, first.floor, first.position[0], first.position[2]);
    const submapId = floorSubmap(dungeon[0], at.floor);
    const map = maps.find(m => String(m.id) === dungeon[0]);
    return submapId && {mapId: dungeon[0], submapId, global: 0, x: at.x, y: at.y, area: map.name, region: null, age: dungeon[1]};
  }
  const placed = records.map(r => ({r, at: project(r.scene, r.position[0], r.position[2])})).filter(p => p.at);
  if(!placed.length) return null;
  const ages = new Set(placed.map(p => p.at.age));
  const lead = placed.find(p => p.at.age === 'Child') || placed[0];
  const region = first.scene.split('_')[0];
  return {mapId: HYRULE.id, submapId: HYRULE[lead.at.age], global: ages.size > 1 ? 1 : 0, x: lead.at.x, y: lead.at.y,
    area: AREAS[region] || null, region, age: ages.size > 1 ? null : (lead.at.age === 'Child' ? 'Young Link' : 'Adult Link')};
}

// "Small Key (in chest)" -> {name: "Chest - Small Key", text}.
function chestText(label) {
  const match = /^(.*?) \(in (.*)\)$/.exec(label) || [label, label, 'chest'];
  const item = match[1].replace(/^Lenses of Truth$/, 'Lens of Truth'), kind = match[2];
  if(/^Small chest$/i.test(item)) return {name: 'Chest', text: ''};
  if(/Boss Key/.test(kind)) return {name: 'Boss Key Chest', text: '<p>Contains the Boss Key.</p>'};
  const lines = [`<p>Contains: ${item}.</p>`];
  if(/invisible/.test(kind)) lines.push('<p><strong>Needs:</strong> Lens of Truth</p>');
  if(/substitute/.test(kind)) lines.push('<p>Holds something else if you already have one.</p>');
  const prefix = /invisible/.test(kind) ? 'Invisible Chest' : /large/.test(kind) ? 'Large Chest' : 'Chest';
  return {name: prefix + ' - ' + item, text: lines.join('')};
}

// One entry per place: chests by their ID, facilities by their name key.
function placesToAdd() {
  const out = [];
  const byChest = {};
  points.filter(p => p.kind === 'TBox' && chests[p.id]).forEach(p => (byChest[p.id] = byChest[p.id] || []).push(p));
  Object.entries(byChest).forEach(([id, records]) => {
    const where = placement(records);
    if(where) out.push({kind: 'chest', gameId: id, gameRecord: 'MapParam.TBox', ...chestText(chests[id].label), where});
  });
  const byPlace = {};
  points.filter(p => p.kind === 'Facility').forEach(p => {
    const key = p.properties.GameDataHashName || 'BossDoor:' + p.scene;
    (byPlace[key] = byPlace[key] || []).push(p);
  });
  Object.entries(byPlace).forEach(([key, records]) => {
    const place = places[key];
    if(!place) throw new Error('No name for ' + key);
    const where = placement(records);
    const lines = place.text ? (place.text.startsWith('Needs:')
      ? [`<p><strong>Needs:</strong> ${place.text.slice(7)}</p>`] : [`<p>${place.text}</p>`]) : [];
    if(where) out.push({kind: place.category, gameId: records[0].id, gameRecord: 'MapParam.Facility', name: place.name, text: lines.join(''), where});
  });
  // Stable IDs: by category, map, floor and position.
  const order = ['chest', 'shop', 'fairy', 'minigame', 'person', 'boss'];
  out.sort((a, b) => order.indexOf(a.kind) - order.indexOf(b.kind) || a.where.mapId.localeCompare(b.where.mapId) ||
    a.where.submapId.localeCompare(b.where.submapId) || a.where.y - b.where.y || a.where.x - b.where.x);
  let chestId = 64500000, placeId = 64600000;
  out.forEach(p => { p.id = p.kind === 'chest' ? ++chestId : ++placeId; });
  return out;
}

const added = placesToAdd();
const up = [
  '-- Adds the places the game marks on its own maps as OoT markers: treasure',
  '-- chests, shops, Great Fairy Fountains, minigames, people and boss doors.',
  '-- Positions are the game\'s, converted exactly (dev/assets/oot/game-to-map.cjs);',
  '-- generated by dev/assets/oot/places-to-sql.cjs. Credited to account 15 (Jess)',
  '-- where it exists. Each row is skipped if its ID exists.',
  ''
];
CATEGORIES.forEach(([id, parent, title, img, color]) => up.push(
  `INSERT INTO marker_category (id, parent_id, marker_category_type_id, container_id, name, default_checked, img, color, visible_zoom, visible) ` +
  `SELECT ${id}, ${sql(parent)}, 1, 64, ${sql(title)}, 1, ${sql(img)}, ${sql(color)}, 0, 1 FROM DUAL ` +
  `WHERE NOT EXISTS (SELECT 1 FROM marker_category WHERE id = ${id});`));
up.push('');
added.forEach(p => {
  const w = p.where;
  const gameData = JSON.stringify({areaName: w.area, region: w.region, gameId: p.gameId, gameRecord: p.gameRecord});
  up.push(`-- ${p.name.replace(/[\r\n]/g, ' ')}`);
  up.push(`INSERT INTO marker (id, submap_id, overlay_id, marker_status_id, marker_category_id, user_id, name, description, x, y, z, jump_marker_id, global, path, game_data, visible, last_updated) ` +
    `SELECT ${p.id}, ${w.submapId}, NULL, 2, ${CATEGORY_OF[p.kind]}, ${AUTHOR}, ${sql(encoded(p.name))}, '', ${num(w.x)}, ${num(w.y)}, NULL, 0, ${w.global}, '', ${sql(gameData)}, 1, NOW() FROM DUAL ` +
    `WHERE NOT EXISTS (SELECT 1 FROM marker WHERE id = ${p.id});`);
  const text = p.text + (w.age ? `<p><em>${w.age}</em></p>` : '');
  if(text) up.push(`INSERT INTO marker_tab (marker_id, marker_tab_status_id, user_id, tab_title, tab_text, tab_order, visible) ` +
    `SELECT ${p.id}, 2, ${AUTHOR}, '', ${sql(encoded(text))}, 1, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM marker_tab WHERE marker_id = ${p.id});`);
});
const ids = added.map(p => p.id);
const down = [
  '-- Removes the places places-to-sql.cjs added, their text, and their',
  '-- categories (completions and bookmarks of them go with them).',
  `DELETE FROM user_completed_marker WHERE marker_id IN (${ids.join(', ')});`,
  `DELETE FROM user_bookmark WHERE marker_id IN (${ids.join(', ')});`,
  `DELETE FROM marker_tab WHERE marker_id IN (${ids.join(', ')});`,
  `DELETE FROM marker WHERE id IN (${ids.join(', ')});`,
  `DELETE FROM marker_category WHERE id IN (${CATEGORIES.filter(c => c[1] !== null).map(c => c[0]).join(', ')});`,
  `DELETE FROM marker_category WHERE id IN (${CATEGORIES.filter(c => c[1] === null).map(c => c[0]).join(', ')});`
];
const folder = path.join(__dirname, '..', '..', '..', 'migrations');
fs.writeFileSync(path.join(folder, name + '.sql'), up.join('\n') + '\n');
fs.writeFileSync(path.join(folder, name + '.down.sql'), down.join('\n') + '\n');
const counts = {};
added.forEach(p => { counts[p.kind] = (counts[p.kind] || 0) + 1; });
console.log(`${added.length} places ${JSON.stringify(counts)} -> migrations/${name}.sql`);
