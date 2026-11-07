// Converts a game position (x, z) in a field scene to a point on the Zelda
// Maps Hyrule map (map 65000), exactly, with no fitted estimates:
//
//   1. Game (x, z) -> the area's full map texture (2000x1440 pixels), which
//      covers a fixed rectangle of game coordinates (field-map-bounds.json,
//      from zeldamods' Owl Object Map).
//   2. Full texture -> the minimap texture (Mini_*.png) our artwork is made
//      from. Every minimap is the full texture shrunk to the minimap's width
//      and centred in a square: mini = (full + [0, 280]) * miniWidth / 2000.
//      Checked by matching image features on all 51 textures (held-out
//      matches agree to about 0.3 pixels).
//   3. Minimap -> our 8192px canvas: compose-world.cjs trims the minimap and
//      pastes it, resized, into the area's box (world-boxes.json).
//   4. Canvas pixels -> map units: x / 32, -y / 32.
//
// Dungeon floors (projectDungeon) are simpler: each floor's tiles are its
// full texture (<dungeon>_<floor>_Main.png, 2000x1440), untrimmed, centred
// on a 2048px square (import-assets.cjs), and every floor of a dungeon covers
// the same game rectangle (dungeon-map-bounds.json). Map units: pixels / 8.
const bounds = require('./scene-data/field-map-bounds.json').maps;
const dungeonBounds = require('./scene-data/dungeon-map-bounds.json').dungeons;
const textures = require('./minimap-textures.json').textures;
const layout = require('./world-boxes.json');

const FULL_WIDTH = 2000, FULL_HEIGHT = 1440, MINI_SHIFT = (FULL_WIDTH - FULL_HEIGHT) / 2;
const PIXELS_PER_UNIT = 32;

// A MapParam or Owl scene name ("KakarikoVillage_Adult_Alternative",
// "LakeHylia_Child", "HyruleCastle") -> its area and age on our map.
function sceneArea(scene) {
  const parts = scene.split('_');
  const region = parts[0];
  const age = parts.includes('Adult') ? 'Adult' : parts.includes('Child') ? 'Child'
    : region === 'GanonCastle' || region === 'GerudoFortress' ? 'Adult' : 'Child';
  return {region, age};
}

// The game-coordinate rectangle covered by an area's full texture.
function areaBounds(region, age) {
  const field = bounds['HyruleField_' + age];
  if(field.overlays && field.overlays[region]) return field.overlays[region];
  return (bounds[region + '_' + age] || bounds[region] || {}).bounds || null;
}

// {age, region, x, y} on map 65000, or null when the scene isn't on it.
function project(scene, gameX, gameZ) {
  let {region, age} = sceneArea(scene);
  // Lon Lon Ranch is drawn as part of Hyrule Field's artwork, in the same
  // game coordinates.
  if(region === 'LonLonRanch') region = 'HyruleField';
  const rect = areaBounds(region, age);
  const box = layout.boxes[age][region];
  // Our map draws Gerudo Fortress from its Adult artwork for both ages.
  const texture = textures[region + '_' + age + '_00'] || textures[region + '_Adult_00'];
  if(!rect || !box || !texture) return null;
  const [[x0, x1], [z0, z1]] = rect;
  const fullX = (gameX - x0) / (x1 - x0) * FULL_WIDTH;
  const fullY = (gameZ - z0) / (z1 - z0) * FULL_HEIGHT;
  const miniScale = texture.width / FULL_WIDTH;
  const miniX = fullX * miniScale, miniY = (fullY + MINI_SHIFT) * miniScale;
  const [trimLeft, trimTop, trimWidth, trimHeight] = texture.trim;
  const [left, top, width, height] = box;
  const canvasX = left + (miniX - trimLeft) * width / trimWidth;
  const canvasY = top + (miniY - trimTop) * height / trimHeight;
  return {age, region, x: canvasX / PIXELS_PER_UNIT, y: -canvasY / PIXELS_PER_UNIT};
}

// The game numbers floors from 0 (1F) up and -1 (B1) down; floor textures
// and our submap names use 1F, 2F, B1...
function floorName(floor) {
  return floor >= 0 ? (floor + 1) + 'F' : 'B' + (-floor);
}

const DUNGEON_SIDE = 2048, DUNGEON_ZOOM = 3;
const DUNGEON_OFFSET = [(DUNGEON_SIDE - FULL_WIDTH) / 2, (DUNGEON_SIDE - FULL_HEIGHT) / 2];

// {floor, x, y} on the dungeon's map, or null for a scene that isn't one.
function projectDungeon(scene, floor, gameX, gameZ) {
  const dungeon = dungeonBounds[scene];
  if(!dungeon) return null;
  const [[x0, x1], [z0, z1]] = dungeon.bounds;
  const fullX = (gameX - x0) / (x1 - x0) * FULL_WIDTH;
  const fullY = (gameZ - z0) / (z1 - z0) * FULL_HEIGHT;
  const scale = 2 ** DUNGEON_ZOOM;
  return {floor: floorName(floor), x: (DUNGEON_OFFSET[0] + fullX) / scale, y: -(DUNGEON_OFFSET[1] + fullY) / scale};
}

module.exports = {project, projectDungeon, floorName, sceneArea, areaBounds};
