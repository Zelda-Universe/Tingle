// Compares the Hyrule map's connector lines with the game's own exits.
// Read-only: prints a report and writes scene-data/connection-comparison.json.
//
//   node dev/assets/oot/compare-connections.cjs hyrule-links.json
//
// hyrule-links.json: for each Hyrule submap (650000 Child, 650001 Adult),
// its stored connections and its area outlines (map_region, kind 'area'):
// {"650000": {"connections": [...], "regions": [{name, kind, polygon}]}, ...}
//
// A connector end is [area, u, v]: a fraction across and down the bounding
// box of that area's outline (scripts/controls/OotFloors.js draws them so).
// The game's exits are its EntranceAnchors (scene-data/map-points.json),
// each naming where it leads (Location). An end's exit is the entrance in
// its area that leads to the area at the link's other end.
const fs = require('fs');
const path = require('path');
const {project} = require('./game-to-map.cjs');

const SUBMAP_AGE = {'650000': 'Child', '650001': 'Adult'};
// Our area names and the game's.
const REGIONS = {
  'Hyrule Field': 'HyruleField', 'Market': 'Market', 'Hyrule Castle': 'HyruleCastle', "Ganon's Castle": 'GanonCastle',
  'Kakariko Village': 'KakarikoVillage', 'Graveyard': 'Graveyard', 'Death Mountain Trail': 'DeathMountainTrail',
  'Goron City': 'GoronCity', 'Death Mountain Crater': 'DeathMountainCrater', "Zora's River": 'ZoraRiver',
  "Zora's Domain": 'ZoraDomain', "Zora's Fountain": 'ZoraFountain', 'Kokiri Forest': 'KokiriForest',
  'Lost Woods': 'LostWood', 'Sacred Forest Meadow': 'SacredForestMeadow', 'Lake Hylia': 'LakeHylia',
  'Gerudo Valley': 'GerudoValley', "Gerudo's Fortress": 'GerudoFortress', 'Haunted Wasteland': 'HountedWasteland',
  'Desert Colossus': 'DesertColossus'
};
const NAMES = Object.fromEntries(Object.entries(REGIONS).map(([name, key]) => [key, name]));

// The area's outline box, as OotFloors.js measures it: [west, east, south, north].
function areaBoxes(regions) {
  const boxes = {};
  regions.forEach(region => {
    const polygon = typeof region.polygon === 'string' ? JSON.parse(region.polygon) : region.polygon;
    const points = polygon.coordinates.flat(2);
    const xs = points.map(p => Number(p[0])), ys = points.map(p => Number(p[1]));
    boxes[region.name] = [Math.min(...xs), Math.max(...xs), Math.min(...ys), Math.max(...ys)];
  });
  return boxes;
}

const toPoint = (box, [, u, v]) => [box[0] + u * (box[1] - box[0]), box[3] - v * (box[3] - box[2])];
// Kept inside the area's box: a few exits (Ganon's Castle's) are just past
// the edge of the artwork, and a line ending in empty space looks broken.
const clamp = value => Math.min(1, Math.max(0, value));
const toEnd = (box, name, [x, y]) => [name, round(clamp((x - box[0]) / (box[1] - box[0]))), round(clamp((box[3] - y) / (box[3] - box[2])))];
const round = value => Math.round(value * 1000) / 1000;

// Where a game exit leads: its Location, or for the Lost Woods' unnamed
// exits, scene-data/lost-woods-exits.json.
const lostWoodsExits = require('./scene-data/lost-woods-exits.json').exits;
function destination(p) {
  if(p.properties.Location) return p.properties.Location;
  if(!p.scene.startsWith('LostWood')) return '';
  const exit = lostWoodsExits.find(e => Math.abs(e.at[0] - p.position[0]) < 0.5 && Math.abs(e.at[1] - p.position[2]) < 0.5);
  return exit ? exit.to : '';
}

// Every field exit on this version of the map: {region, to, x, y}.
function exits(age) {
  return require('./scene-data/map-points.json')
    .filter(p => p.kind === 'EntranceAnchor' && p.floor === null && destination(p))
    .map(p => ({...p, properties: {...p.properties, Location: destination(p)}}))
    .map(p => {
      const at = project(p.scene, p.position[0], p.position[2]);
      const region = p.scene.split('_')[0];
      return at && at.age === age && NAMES[region] ? {region, to: p.properties.Location, x: at.x, y: at.y, id: p.id} : null;
    }).filter(Boolean);
}

// Links the game has that we add (both directions are ordinary exits).
// The others it has are shortcuts or one-way drops, left undrawn: Kokiri
// Forest/Zora's River (the Lost Woods' water shortcut), Gerudo Valley's
// river to Lake Hylia and Zora's Domain's dive to Lake Hylia.
const ADDED = [['DeathMountainCrater', 'GoronCity'], ['GoronCity', 'LostWood']];

function compare(links) {
  const result = {};
  for(const [submapId, {connections, regions}] of Object.entries(links)) {
    const age = SUBMAP_AGE[submapId], boxes = areaBoxes(regions), gameExits = exits(age);
    const ends = [];
    const updated = connections.map(link => {
      const next = {...link};
      [['from', 'to'], ['to', 'from']].forEach(([side, other]) => {
        const end = link[side], box = boxes[end[0]];
        const here = REGIONS[end[0]], there = REGIONS[link[other][0]];
        const current = toPoint(box, end);
        const candidates = gameExits.filter(e => e.region === here && e.to === there)
          .map(e => ({...e, distance: Math.hypot(e.x - current[0], e.y - current[1])}))
          .sort((a, b) => a.distance - b.distance);
        const best = candidates[0];
        ends.push({link: link.from[0] + ' -> ' + link.to[0], end: end[0], exitTo: link[other][0],
          offsetPixels: best ? Math.round(best.distance * 32) : null, candidates: candidates.length});
        if(best) next[side] = toEnd(box, end[0], [best.x, best.y]);
      });
      return next;
    });
    // Area-to-area exits with no line on our map.
    const linked = new Set(connections.flatMap(l => [REGIONS[l.from[0]] + '>' + REGIONS[l.to[0]], REGIONS[l.to[0]] + '>' + REGIONS[l.from[0]]]));
    // New links: each end is the exit in its area leading to the other area
    // (the closest pair, where an area has more than one).
    ADDED.forEach(([a, b]) => {
      if(linked.has(a + '>' + b) || !boxes[NAMES[a]] || !boxes[NAMES[b]]) return;
      const pairs = [];
      gameExits.filter(e => e.region === a && e.to === b).forEach(x =>
        gameExits.filter(e => e.region === b && e.to === a).forEach(y => pairs.push([x, y, Math.hypot(x.x - y.x, x.y - y.y)])));
      if(!pairs.length) return;
      const [x, y] = pairs.sort((p, q) => p[2] - q[2])[0];
      updated.push({from: toEnd(boxes[NAMES[a]], NAMES[a], [x.x, x.y]), to: toEnd(boxes[NAMES[b]], NAMES[b], [y.x, y.y]), route: 'd'});
      linked.add(a + '>' + b); linked.add(b + '>' + a);
    });
    const missing = [...new Set(gameExits.filter(e => NAMES[e.to] && boxes[NAMES[e.to]] && boxes[NAMES[e.region]] && e.to !== e.region && !linked.has(e.region + '>' + e.to))
      .map(e => [e.region, e.to].sort().join(' <-> ')))];
    result[submapId] = {age, ends, updated, missing};
  }
  return result;
}

if(require.main === module) {
  const result = compare(JSON.parse(fs.readFileSync(process.argv[2], 'utf8')));
  fs.writeFileSync(path.join(__dirname, 'scene-data', 'connection-comparison.json'), JSON.stringify(result, null, 1) + '\n');
  for(const {age, ends, missing} of Object.values(result)) {
    const found = ends.filter(e => e.offsetPixels !== null);
    console.log(`${age}: ${found.length} of ${ends.length} ends have a game exit; ` +
      `${found.filter(e => e.offsetPixels > 10).length} are more than 10px off`);
    ends.filter(e => e.offsetPixels === null || e.offsetPixels > 10).sort((a, b) => (b.offsetPixels || 1e9) - (a.offsetPixels || 1e9))
      .forEach(e => console.log(`   ${e.offsetPixels === null ? '  none' : String(e.offsetPixels).padStart(4) + 'px'}  ${e.end} exit to ${e.exitTo}`));
    console.log('   game links not drawn: ' + (missing.join('; ') || 'none'));
  }
}

module.exports = {compare};
