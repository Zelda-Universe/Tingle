// Shared by the generators that add OoT markers (places-to-sql.cjs,
// objects-to-sql.cjs): placing a game record on our maps and writing the
// SQL for categories, markers and their text.
const {project, projectDungeon, floorName} = require('./game-to-map.cjs');

const HYRULE = {id: '65000', Child: '650000', Adult: '650001'};
// Our dungeon maps, and who explores each.
const DUNGEONS = {
  InsideTheDekuTree: ['64028', 'Young Link'], DodongoCavern: ['64023', 'Young Link'], InsideJabuJabuBelly: ['64027', 'Young Link'],
  BottomOfTheWell: ['64022', 'Young Link'], ForestTemple: ['64025', 'Adult Link'], FireTemple: ['64024', 'Adult Link'],
  IceCavern: ['64026', 'Adult Link'], WaterTemple: ['64031', 'Adult Link'], ShadowTemple: ['64029', 'Adult Link'],
  SpiritTemple: ['64030', null], GerudoTrainingGround: ['64032', 'Adult Link'], InsideGanonCastle: ['64033', 'Adult Link']
};
// The game's area names and ours (area pages and pills use ours).
const AREAS = {
  HyruleField: 'Hyrule Field', LonLonRanch: 'Lon Lon Ranch', Market: 'Market', HyruleCastle: 'Hyrule Castle',
  GanonCastle: "Ganon's Castle", KakarikoVillage: 'Kakariko Village', Graveyard: 'Graveyard',
  DeathMountainTrail: 'Death Mountain Trail', GoronCity: 'Goron City', DeathMountainCrater: 'Death Mountain Crater',
  ZoraRiver: "Zora's River", ZoraDomain: "Zora's Domain", ZoraFountain: "Zora's Fountain", KokiriForest: 'Kokiri Forest',
  LostWood: 'Lost Woods', SacredForestMeadow: 'Sacred Forest Meadow', LakeHylia: 'Lake Hylia', GerudoValley: 'Gerudo Valley',
  GerudoFortress: "Gerudo's Fortress", HountedWasteland: 'Haunted Wasteland', DesertColossus: 'Desert Colossus'
};

const sql = value => value === null || value === undefined ? 'NULL'
  : typeof value === 'number' ? String(value) : "'" + String(value).replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
// The site stores marker text HTML-encoded (PHP htmlentities, ENT_QUOTES).
const encoded = text => String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
  .replace(/"/g, '&quot;').replace(/'/g, '&#039;');
const num = value => Number(value.toFixed(3));
// Jess's account (15) on the live sites; local copies credit account 1.
const AUTHOR = 'COALESCE((SELECT id FROM user WHERE id = 15), 1)';

// The dungeon floor's first submap ("B1", "1F · Water level 1").
function floorSubmap(maps, mapId, floor) {
  const map = maps.find(m => String(m.id) === mapId);
  const submap = map && map.subMap.find(s => String(s.name).split(' ')[0] === floor);
  return submap && String(submap.id);
}

// Where a place goes: {mapId, submapId, global, x, y, area, region, age}, or
// null when it isn't on our maps. records are the same place's game records,
// one per age it appears in: {scene, floor (a number, or a name like "B1"),
// position [x, y, z]}. A place in both ages shows on both (global).
function placement(records, maps) {
  const first = records[0];
  if(first.floor !== null && first.floor !== undefined) {
    const dungeon = DUNGEONS[first.scene];
    if(!dungeon) return null;
    const floor = typeof first.floor === 'number' ? floorName(first.floor) : first.floor;
    const at = projectDungeon(first.scene, 0, first.position[0], first.position[2]);
    const submapId = floorSubmap(maps, dungeon[0], floor);
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

// [id, parent, name, image, colour] -> an insert skipped if the ID exists.
function categorySQL([id, parent, title, img, color]) {
  return `INSERT INTO marker_category (id, parent_id, marker_category_type_id, container_id, name, default_checked, img, color, visible_zoom, visible) ` +
    `SELECT ${id}, ${sql(parent)}, 1, 64, ${sql(title)}, 1, ${sql(img)}, ${sql(color)}, 0, 1 FROM DUAL ` +
    `WHERE NOT EXISTS (SELECT 1 FROM marker_category WHERE id = ${id});`;
}

// A marker and its text: {id, category, name, text, gameId, gameRecord,
// where (from placement)}. The age goes at the end of the text, as on the
// collectibles. Each insert is skipped if the ID exists.
function markerSQL(p) {
  const w = p.where;
  const gameData = JSON.stringify({...{areaName: w.area, region: w.region, gameId: p.gameId, gameRecord: p.gameRecord}, ...(p.metadata || {})});
  const lines = [`-- ${p.name.replace(/[\r\n]/g, ' ')}`,
    `INSERT INTO marker (id, submap_id, overlay_id, marker_status_id, marker_category_id, user_id, name, description, x, y, z, jump_marker_id, global, path, game_data, visible, last_updated) ` +
    `SELECT ${p.id}, ${w.submapId}, NULL, 2, ${p.category}, ${AUTHOR}, ${sql(encoded(p.name))}, '', ${num(w.x)}, ${num(w.y)}, NULL, 0, ${w.global}, '', ${sql(gameData)}, 1, NOW() FROM DUAL ` +
    `WHERE NOT EXISTS (SELECT 1 FROM marker WHERE id = ${p.id});`];
  const text = p.text + (w.age ? `<p><em>${w.age}</em></p>` : '');
  if(text) lines.push(`INSERT INTO marker_tab (marker_id, marker_tab_status_id, user_id, tab_title, tab_text, tab_order, visible) ` +
    `SELECT ${p.id}, 2, ${AUTHOR}, '', ${sql(encoded(text))}, 1, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM marker_tab WHERE marker_id = ${p.id});`);
  return lines;
}

// The undo: the markers, their text, completions and bookmarks, then the
// categories (children before parents).
function removalSQL(ids, categories) {
  return [
    `DELETE FROM user_completed_marker WHERE marker_id IN (${ids.join(', ')});`,
    `DELETE FROM user_bookmark WHERE marker_id IN (${ids.join(', ')});`,
    `DELETE FROM marker_tab WHERE marker_id IN (${ids.join(', ')});`,
    `DELETE FROM marker WHERE id IN (${ids.join(', ')});`,
    ...[categories.filter(c => c[1] !== null), categories.filter(c => c[1] === null)]
      .filter(group => group.length).map(group => `DELETE FROM marker_category WHERE id IN (${group.map(c => c[0]).join(', ')});`)
  ];
}

module.exports = {HYRULE, DUNGEONS, AREAS, sql, encoded, num, AUTHOR, floorSubmap, placement, categorySQL, markerSQL, removalSQL};
