// Writes the migration that adds more OoT marker types, and its undo:
//   Travel: dungeon entrances (the game's own map icons, MapParam
//     EntranceAnchor), warp-song pads and Kaepora Gaebora;
//   Collectibles: Heart Containers and Silver Rupees;
//   Points of Interest: Gossip Stones, Magic Bean spots, Business Scrubs, cows.
// All but the entrances come from scene-data/objects.json (fetch-objects.cjs).
//
//   node dev/assets/oot/objects-to-sql.cjs maps.json <migration name>
//
// maps.json is ajax.php?command=get_map&game=64 saved to a file. IDs:
// categories 64004-64005, 64043-64046 and 64050-64053; markers 647xxxxx.
// Each insert is skipped if its ID exists.
const fs = require('fs');
const path = require('path');
const {placement, categorySQL, markerSQL, removalSQL} = require('./marker-sql.cjs');

const [mapsFile, name] = process.argv.slice(2);
if(!mapsFile || !name) throw new Error('Usage: node objects-to-sql.cjs maps.json <migration name>');
const maps = JSON.parse(fs.readFileSync(mapsFile, 'utf8'));
const points = require('./scene-data/map-points.json');
const objects = require('./scene-data/objects.json').objects;

// [id, parent, name, image, colour]: glyphs from the site's icon font, or
// OoT_* SVGs in images/icons/oot/ (styles/poi.css).
const CATEGORIES = [
  [64050, null, 'Travel', 'BotW_Dungeon', '#8e72b9'],
  [64051, 64050, 'Dungeon Entrances', 'BotW_Dungeon', '#8e72b9'],
  [64052, 64050, 'Warp Pads', 'LA_Portal', '#8e72b9'],
  [64053, 64050, 'Kaepora Gaebora', 'OoT_Kaepora', '#8e72b9'],
  [64004, 64000, 'Heart Containers', 'General_Heart', '#cdb269'],
  [64005, 64000, 'Silver Rupees', 'OoT_SilverRupee', '#cdb269'],
  [64043, 64040, 'Gossip Stones', 'OoT_GossipStone', '#4bc5ee'],
  [64044, 64040, 'Magic Bean Spots', 'BotW_Herbs', '#4bc5ee'],
  [64045, 64040, 'Business Scrubs', 'General_Store', '#4bc5ee'],
  [64046, 64040, 'Cows', 'BotW_Beef', '#4bc5ee']
];
const CATEGORY_OF = {entrance: 64051, warp: 64052, owl: 64053, heart: 64004, silver: 64005, gossip: 64043, bean: 64044, scrub: 64045, cow: 64046};

const DUNGEON_NAMES = {
  InsideTheDekuTree: 'Inside the Deku Tree', DodongoCavern: "Dodongo's Cavern", InsideJabuJabuBelly: "Inside Jabu-Jabu's Belly",
  ForestTemple: 'Forest Temple', FireTemple: 'Fire Temple', WaterTemple: 'Water Temple', ShadowTemple: 'Shadow Temple',
  SpiritTemple: 'Spirit Temple', BottomOfTheWell: 'Bottom of the Well', IceCavern: 'Ice Cavern',
  GerudoTrainingGround: 'Gerudo Training Ground', InsideGanonCastle: "Inside Ganon's Castle", GanonCastle: "Ganon's Castle"
};
const BOSSES = {
  InsideTheDekuTree: 'Gohma', DodongoCavern: 'King Dodongo', InsideJabuJabuBelly: 'Barinade', ForestTemple: 'Phantom Ganon',
  FireTemple: 'Volvagia', WaterTemple: 'Morpha', ShadowTemple: 'Bongo Bongo', SpiritTemple: 'Twinrova'
};
// The warp pads, by object: the song that brings you there.
const WARP_SONGS = {
  Obj_WarpPoint_A_02: 'Minuet of Forest', Obj_DeathMtCrater_WarpPoint_A_01: 'Bolero of Fire',
  Obj_LakeHrl_WarpPoint_A_01: 'Serenade of Water', Obj_Graveyard_WarpPoint_A_01: 'Nocturne of Shadow',
  Obj_DesertColossus_WarpPoint_A_01: 'Requiem of Spirit', Obj_TimeTemple_WarpPoint_A_01: 'Prelude of Light'
};
// What Business Scrubs sell, by the game's item names.
const ITEMS = {
  Obj_MagicJar_Small: 'Small Magic Jar', Item_StickBag_Medium: 'Deku Stick upgrade', Item_NutBag_Medium: 'Deku Nut upgrade',
  Item_Bottle_GreenPotion: 'Green Potion', Item_Bottle_RedPotion: 'Red Potion', Item_Bottle_Bug: 'Bugs',
  Item_ScrubBusinessSeed: 'Business Scrub Seed', Obj_Heart_Piece: 'Piece of Heart', Obj_Heart: 'Recovery Hearts',
  Shop_Heart_Bundle: 'Recovery Hearts', Shop_DekuSeedBundle_01: 'Deku Seeds', Shop_DekuSeedBundle_02: 'Deku Seeds',
  Shop_DekuNutBundle_01: 'Deku Nuts', Shop_BombBundle_01: 'Bombs', Shop_BombBundle_02: 'Bombs',
  Shop_BombchuBundle_01: 'Bombchus', Shop_ArrowBundle_01: 'Arrows', Shop_ArrowBundle_02: 'Arrows'
};

const p = text => `<p>${text}</p>`;

// The same place's objects (one per age): by type, area and position.
function grouped(type) {
  const groups = new Map();
  objects.filter(o => o.type === type).forEach(o => {
    const key = [o.scene.split('_')[0], o.floor || '', Math.round(o.pos[0] * 2), Math.round(o.pos[2] * 2)].join(':');
    if(!groups.has(key)) groups.set(key, []);
    groups.get(key).push(o);
  });
  return [...groups.values()].map(list => list.map(o => ({...o, position: o.pos, floor: o.floor === undefined ? null : o.floor})));
}

// Each Silver Rupee set's floor is where most of its five are (one can sit
// at the edge of a floor's height range).
function silverFloors() {
  const floors = {};
  objects.filter(o => o.type === 'silver').forEach(o => {
    const counts = floors[o.label] = floors[o.label] || {};
    counts[o.floor] = (counts[o.floor] || 0) + 1;
  });
  return Object.fromEntries(Object.entries(floors).map(([label, counts]) =>
    [label, Object.entries(counts).sort((a, b) => b[1] - a[1])[0][0]]));
}

function describe(type, list) {
  const o = list[0];
  switch(type) {
    case 'warp': return {name: 'Warp Pad - ' + WARP_SONGS[o.name], text: (o.name === 'Obj_TimeTemple_WarpPoint_A_01'
      ? p('Inside the Temple of Time.') : '') + p(`Play the ${WARP_SONGS[o.name]} to warp here.`)};
    case 'owl': return {name: 'Kaepora Gaebora', text: p('The owl waits here with advice.')};
    case 'heart': return {name: 'Heart Container - ' + BOSSES[o.scene], text: p(`Appears after you defeat ${BOSSES[o.scene]}.`)};
    case 'silver': return {name: 'Silver Rupee', text: p('Collect all five in this room to open the way.')};
    case 'gossip': return /inactive/.test(o.label)
      ? {name: 'Gossip Stone', text: p("Frozen with Zora's Domain.")}
      : {name: 'Gossip Stone', text: p('Play the ocarina here for a Fairy Spirit.')};
    case 'bean': return {name: 'Magic Bean Spot',
      text: p('Plant a Magic Bean here as a child; as an adult it grows into a platform to ride.') + p('Release Bugs here to find a Gold Skulltula.')};
    case 'scrub': {
      const sells = [...new Set((o.sells || []).map(item => ITEMS[item] || item))];
      return {name: 'Business Scrub', text: sells.length ? p('Sells: ' + sells.join(', ') + '.') : ''};
    }
    case 'cow': return /Link's house/.test(o.label)
      ? {name: "Cow - Link's House", text: p("Malon's reward for winning Epona. Play Epona's Song for milk.")}
      : {name: 'Cow', text: p("Play Epona's Song for milk.")};
  }
  throw new Error('No description for ' + type);
}

function toAdd() {
  const out = [];
  // Dungeon entrances: the game's own icons on the overworld map, one per
  // dungeon door (some dungeons have a door in each age).
  const doors = new Map();
  points.filter(r => r.kind === 'EntranceAnchor' && r.floor === null && r.properties.IconType === 1).forEach(r => {
    // Zora's Fountain's door has no destination recorded: it's Jabu-Jabu as
    // a child and the Ice Cavern as an adult, at different spots.
    if(!r.properties.Location && r.scene.startsWith('ZoraFountain'))
      r = {...r, properties: {...r.properties, Location: /_Adult/.test(r.scene) ? 'IceCavern' : 'InsideJabuJabuBelly'}};
    const key = r.properties.Location + ':' + r.scene.split('_')[0];
    if(!doors.has(key)) doors.set(key, []);
    doors.get(key).push(r);
  });
  doors.forEach(records => {
    const dungeon = DUNGEON_NAMES[records[0].properties.Location] || records[0].properties.Location;
    const where = placement(records, maps);
    if(where) out.push({kind: 'entrance', gameId: records[0].id, gameRecord: 'MapParam.EntranceAnchor',
      name: dungeon + ' Entrance', text: p(`The way into ${dungeon}.`), where});
  });
  const silver = silverFloors();
  // The Prelude of Light pad is inside the Temple of Time, which the
  // Market's artwork doesn't draw: it goes where the game's own map shows
  // Link while he's in there (the Market's PlayerIconAnchor).
  const templeAnchor = scene => points.find(r => r.scene === scene && r.kind === 'PlayerIconAnchor');
  for(const type of ['warp', 'owl', 'heart', 'silver', 'gossip', 'bean', 'scrub', 'cow']) {
    grouped(type).forEach(list => {
      if(type === 'silver') list = list.map(o => ({...o, floor: silver[o.label]}));
      if(type === 'warp' && list[0].name === 'Obj_TimeTemple_WarpPoint_A_01')
        list = list.map(o => ({...o, position: (templeAnchor(o.scene) || o).position || o.pos}));
      const where = placement(list, maps);
      if(where) out.push({kind: type, gameId: String(BigInt(list[0].hash)), gameRecord: 'Object.' + list[0].name, ...describe(type, list), where});
    });
  }
  // Stable IDs: by category, map, floor and position.
  const order = Object.keys(CATEGORY_OF);
  out.sort((a, b) => order.indexOf(a.kind) - order.indexOf(b.kind) || a.where.mapId.localeCompare(b.where.mapId) ||
    a.where.submapId.localeCompare(b.where.submapId) || a.where.y - b.where.y || a.where.x - b.where.x);
  out.forEach((place, index) => { place.id = 64700001 + index; });
  return out;
}

const added = toAdd();
const up = [
  '-- Adds more OoT marker types: dungeon entrances, warp pads and Kaepora',
  '-- Gaebora (Travel); Heart Containers and Silver Rupees (Collectibles); Gossip',
  '-- Stones, Magic Bean spots, Business Scrubs and cows (Points of Interest).',
  '-- Positions are the game\'s, converted exactly (dev/assets/oot/game-to-map.cjs);',
  '-- generated by dev/assets/oot/objects-to-sql.cjs. Credited to account 15 (Jess)',
  '-- where it exists. Each row is skipped if its ID exists.',
  '',
  ...CATEGORIES.map(categorySQL),
  ''
];
added.forEach(place => up.push(...markerSQL({...place, category: CATEGORY_OF[place.kind]})));
const down = ['-- Removes the markers objects-to-sql.cjs added, their text, and their categories.',
  ...removalSQL(added.map(place => place.id), CATEGORIES)];
const folder = path.join(__dirname, '..', '..', '..', 'migrations');
fs.writeFileSync(path.join(folder, name + '.sql'), up.join('\n') + '\n');
fs.writeFileSync(path.join(folder, name + '.down.sql'), down.join('\n') + '\n');
const counts = {};
added.forEach(place => { counts[place.kind] = (counts[place.kind] || 0) + 1; });
console.log(`${added.length} markers ${JSON.stringify(counts)} -> migrations/${name}.sql`);
