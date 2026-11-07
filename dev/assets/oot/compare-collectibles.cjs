// Compares the Hyrule map's collectible markers with the game's own
// positions, converted with game-to-map.cjs. Read-only: prints a report and
// writes collectible-comparison.json; it changes no markers.
//
//   node dev/assets/oot/compare-collectibles.cjs markers.json maps.json
//
// markers.json and maps.json are ajax.php?command=get_markers&game=64 and
// get_map&game=64 saved to files.
//
// Game positions: Heart Pieces and Gold Skulltulas are the game's map icons
// (MapParam CollectHeart and CollectSign, scene-data/map-points.json), so
// they're where the in-game map draws them. Big Poes have no map icon, so
// they're their actors (scene-data/actors.json, Enemy_Poe_Big).
//
// Hyrule markers are matched to the nearest game point of their type and
// age. Dungeon Gold Skulltulas had placeholder positions, so distance can't
// identify them: scene-data/dungeon-skulltula-matches.json says which is
// which, decided by hand. A dungeon marker on the wrong floor also gets the
// submap it belongs on (targetSubmapId).
const fs = require('fs');
const path = require('path');
const {project, projectDungeon} = require('./game-to-map.cjs');

const HYRULE = '65000';
// Our dungeon maps, by the game's scene name.
const DUNGEON_MAPS = {
  BottomOfTheWell: '64022', DodongoCavern: '64023', FireTemple: '64024', ForestTemple: '64025',
  IceCavern: '64026', InsideJabuJabuBelly: '64027', InsideTheDekuTree: '64028', ShadowTemple: '64029',
  SpiritTemple: '64030', WaterTemple: '64031'
};
const SUBMAP_AGE = {'650000': 'Child', '650001': 'Adult'};
const CATEGORY = {CollectHeart: '64002', CollectSign: '64001', Poe: '64003'};
const NAMES = {'64001': 'Gold Skulltula', '64002': 'Heart Piece', '64003': 'Big Poe'};

const points = require('./scene-data/map-points.json');
const dungeonMatches = require('./scene-data/dungeon-skulltula-matches.json').matches;
const actors = require('./scene-data/actors.json');

// The game's collectibles on the Hyrule map, one entry per age it appears in.
function gamePoints() {
  const out = [];
  points.filter(p => p.kind === 'CollectSign' && p.floor !== null).forEach(p => {
    const at = projectDungeon(p.scene, p.floor, p.position[0], p.position[2]);
    if(at && DUNGEON_MAPS[p.scene]) out.push({sourceId: p.id, actorId: p.actorId, scene: p.scene, category: CATEGORY.CollectSign,
      mapId: DUNGEON_MAPS[p.scene], age: at.floor, x: at.x, y: at.y});
  });
  points.filter(p => CATEGORY[p.kind] && p.floor === null).forEach(p => {
    const at = project(p.scene, p.position[0], p.position[2]);
    if(at) out.push({sourceId: p.id, actorId: p.actorId, scene: p.scene, category: CATEGORY[p.kind], mapId: HYRULE, ...at});
  });
  actors.filter(a => a.type === 'Enemy_Poe_Big' && a.scene !== 'EnemyMuseum').forEach(a => {
    const at = project(a.scene, a.position[0], a.position[2]);
    if(at) out.push({sourceId: a.id, actorId: a.id, scene: a.scene, category: CATEGORY.Poe, mapId: HYRULE, ...at});
  });
  return out;
}

// A marker's "ages" are where it can match: Child and/or Adult on Hyrule; on
// a dungeon, its floor (1F, B1...) from its submap's name ("1F · Water
// level 2"), whichever water level or state it's on.
function markerAges(m, submapNames) {
  if(m.mapId === HYRULE) return m.globalMarker == 1 ? ['Child', 'Adult'] : [SUBMAP_AGE[m.submapId]];
  return [String(submapNames[m.submapId] || '').split(' ')[0]];
}

// The submap a dungeon marker belongs on: one on the game's floor, keeping
// the marker's water level or state ("1F · Water level 2") where the new
// floor has it, otherwise the floor's first.
function floorSubmap(map, currentName, floor) {
  const variant = String(currentName || '').split(' · ').slice(1).join(' · ');
  const onFloor = (map ? map.subMap : []).filter(s => String(s.name).split(' ')[0] === floor);
  const same = onFloor.find(s => String(s.name).split(' · ').slice(1).join(' · ') === variant);
  return (same || onFloor[0] || {}).id;
}

function compare(markers, maps) {
  const submapNames = {}, mapsById = {};
  (maps || []).forEach(map => { mapsById[map.id] = map; (map.subMap || []).forEach(s => { submapNames[s.id] = s.name; }); });
  const mapIds = new Set([HYRULE, ...Object.values(DUNGEON_MAPS)]);
  const ours = markers.filter(m => mapIds.has(m.mapId) && NAMES[m.markerCategoryId]);
  const game = gamePoints();
  // Every pairing of one of our markers with a game point of the same type
  // in an age the marker shows in, closest first; each side is used once.
  const pairs = [];
  ours.filter(m => m.mapId === HYRULE).forEach(m => {
    const ages = markerAges(m, submapNames);
    game.forEach((g, index) => {
      if(g.mapId !== m.mapId || g.category !== m.markerCategoryId || !ages.includes(g.age)) return;
      pairs.push({marker: m, index, distance: Math.hypot(g.x - Number(m.x), g.y - Number(m.y))});
    });
  });
  pairs.sort((a, b) => a.distance - b.distance);
  const usedMarker = new Set(), usedSource = new Set(), matches = [];
  pairs.forEach(p => {
    const g = game[p.index];
    // A collectible in both ages is one source ID: match a marker to it once.
    const sourceKey = g.sourceId + ':' + g.category;
    if(usedMarker.has(p.marker.id) || usedSource.has(sourceKey)) return;
    usedMarker.add(p.marker.id); usedSource.add(sourceKey);
    matches.push({
      markerId: p.marker.id, name: p.marker.name, category: NAMES[g.category], age: g.age, scene: g.scene,
      sourceId: g.sourceId, actorId: g.actorId,
      ours: [Number(p.marker.x), Number(p.marker.y)], game: [round(g.x), round(g.y)],
      // Distance on our artwork at full size (32 pixels per map unit).
      // Distance on the artwork at full size: 32 pixels per map unit on
      // Hyrule, 8 on a dungeon floor.
      mapId: p.marker.mapId, submapId: p.marker.submapId,
      offsetPixels: Math.round(p.distance * (p.marker.mapId === HYRULE ? 32 : 8))
    });
  });
  dungeonMatches.forEach(({markerId, gameId}) => {
    const m = ours.find(o => o.id === markerId);
    const g = game.find(o => o.sourceId === gameId && o.mapId !== HYRULE);
    if(!m || !g) return;
    usedMarker.add(m.id); usedSource.add(g.sourceId + ':' + g.category);
    const targetSubmapId = floorSubmap(mapsById[m.mapId], submapNames[m.submapId], g.age);
    matches.push({
      markerId: m.id, name: m.name, category: NAMES[g.category], age: g.age, scene: g.scene,
      sourceId: g.sourceId, actorId: g.actorId,
      ours: [Number(m.x), Number(m.y)], game: [round(g.x), round(g.y)],
      mapId: m.mapId, submapId: m.submapId, targetSubmapId,
      offsetPixels: Math.round(Math.hypot(g.x - Number(m.x), g.y - Number(m.y)) * 8)
    });
  });
  return {
    matches: matches.sort((a, b) => b.offsetPixels - a.offsetPixels),
    unmatchedMarkers: ours.filter(m => !usedMarker.has(m.id)).map(m => ({markerId: m.id, name: m.name})),
    unmatchedGame: game.filter(g => !usedSource.has(g.sourceId + ':' + g.category))
      .filter((g, i, all) => all.findIndex(o => o.sourceId === g.sourceId) === i)
      .map(g => ({sourceId: g.sourceId, category: NAMES[g.category], scene: g.scene, mapId: g.mapId, floor: g.age, at: [round(g.x), round(g.y)]}))
  };
}

function round(value) { return Math.round(value * 100) / 100; }

if(require.main === module) {
  const markers = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
  const maps = process.argv[3] ? JSON.parse(fs.readFileSync(process.argv[3], 'utf8')) : [];
  const result = compare(markers, maps);
  fs.writeFileSync(path.join(__dirname, 'scene-data', 'collectible-comparison.json'), JSON.stringify(result, null, 1) + '\n');
  const offsets = result.matches.map(m => m.offsetPixels).sort((a, b) => a - b);
  const median = offsets[Math.floor(offsets.length / 2)];
  console.log(`${result.matches.length} matched; median offset ${median}px; ` +
    `${offsets.filter(o => o > 40).length} over 40px; ` +
    `${result.unmatchedMarkers.length} of ours unmatched; ${result.unmatchedGame.length} game points unmatched`);
  result.matches.slice(0, 25).forEach(m => console.log(`  ${String(m.offsetPixels).padStart(5)}px  ${m.age.padEnd(5)} ${m.markerId} ${m.name}  (${m.scene})`));
}

module.exports = {compare, gamePoints};
