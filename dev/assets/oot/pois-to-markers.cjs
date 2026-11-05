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

module.exports = function(pois) {
  return pois.map(poi => {
    const submap = poi.submap || (SUBMAPS[poi.map] || {})[poi.age];
    if (!submap) throw new Error('No submap for ' + poi.id);
    const text = '<p>' + escape(poi.how) + '</p>' +
      (poi.needs ? '<p><strong>Needs:</strong> ' + escape(poi.needs) + '</p>' : '') +
      '<p><em>' + ages[poi.age] + '</em></p>';
    return {
      id: String(poi.id), mapId: String(poi.map), submapId: String(submap), overlayId: null,
      markerCategoryId: String(poi.category), markerCategoryTypeId: '1',
      userId: '0', userName: 'Zelda Maps', name: poi.title, description: '',
      x: String(poi.x), y: String(poi.y), z: null, jumpMakerId: '0',
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
