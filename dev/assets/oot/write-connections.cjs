// Refreshes the connector lines in data/OoT/maps.json from connections.json
// without a full asset import: node dev/assets/oot/write-connections.cjs
const fs = require('fs'), path = require('path');
const { friendly } = require('./import-assets.cjs');
const names = {ZoraDomain:"Zora's Domain",ZoraFountain:"Zora's Fountain",ZoraRiver:"Zora's River",LonLonRanch:'Lon Lon Ranch',GanonCastle:"Ganon's Castle"};
const file = path.join(__dirname, '../../../data/OoT/maps.json');
const maps = JSON.parse(fs.readFileSync(file, 'utf8'));
for (const submap of maps.find(map => map.id === '65000').subMap) {
  submap.connections = require('./connections.cjs')(submap.placeLabels, key => names[key] || friendly(key), submap.name);
}
fs.writeFileSync(file, JSON.stringify(maps, null, 2) + '\n');
