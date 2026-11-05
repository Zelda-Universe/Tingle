// Turns pois.json (one entry per collectible, written by hand) into the rows
// get_markers serves. Usable alone: node pois-to-markers.cjs > ../../../data/OoT/markers.json
//
// A poi: { id, category, title, age: 'child'|'adult'|'both', map, x, y,
//          how (where it is and how to get it), needs (optional) }
// Child and adult markers sit on the Hyrule map's Child or Adult version;
// 'both' shows on either (zmap.js). Dungeon markers name their own submap.
const SUBMAPS = { '65000': { child: '650000', adult: '650001', both: '650000' } };
const escape = text => String(text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const ages = { child: 'Young Link', adult: 'Adult Link', both: 'Young or Adult Link' };

// Overworld entries are stored as a region plus u,v (0-1) inside that area's
// artwork, so they move with the area when world-layout.json changes.
function place(poi) {
  if(!poi.region) return [poi.x, poi.y];
  const world = require('./world-boxes.json');
  const age = poi.age === 'adult' ? 'Adult' : 'Child';
  const box = world.boxes[age][poi.region];
  if(!box) throw new Error('No area ' + poi.region + ' for ' + poi.id);
  const scale = world.canvas / 256;
  const round = n => Math.round(n * 100) / 100;
  return [round((box[0] + poi.u * box[2]) / scale), round(-(box[1] + poi.v * box[3]) / scale)];
}
module.exports = function(pois) {
  return pois.map(poi => {
    const [x, y] = place(poi);
    const submap = poi.submap || (SUBMAPS[poi.map] || {})[poi.age];
    if (!submap) throw new Error('No submap for ' + poi.id);
    const text = '<p>' + escape(poi.how) + '</p>' +
      (poi.needs ? '<p><strong>Needs:</strong> ' + escape(poi.needs) + '</p>' : '') +
      '<p><em>' + ages[poi.age] + '</em></p>';
    return {
      id: String(poi.id), mapId: String(poi.map), submapId: String(submap), overlayId: null,
      markerCategoryId: String(poi.category), markerCategoryTypeId: '1',
      userId: '0', userName: 'Zelda Maps', name: poi.title, description: '',
      x: String(x), y: String(y), z: null, jumpMakerId: '0',
      tabId: String(poi.id), tabTitle: '', tabText: text, tabUserId: '0', tabUserName: 'Zelda Maps',
      path: '', gameData: null, globalMarker: poi.age === 'both' ? '1' : '0', visible: '1'
    };
  });
};

if (require.main === module) {
  const fs = require('fs'), path = require('path');
  const pois = JSON.parse(fs.readFileSync(path.join(__dirname, 'pois.json'), 'utf8'));
  process.stdout.write(JSON.stringify(module.exports(pois), null, 2) + '\n');
}
