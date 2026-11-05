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

function presentation(poi) {
  const maps=require('../../../data/OoT/maps.json');
  const map=maps.find(m=>m.id==poi.map);
  const friendly=require('./import-assets.cjs').friendly;
  const names={Market:'Market',ZoraDomain:"Zora's Domain",ZoraRiver:"Zora's River",ZoraFountain:"Zora's Fountain",GanonCastle:"Ganon's Castle"};
  let areaName=poi.region ? (names[poi.region] || friendly(poi.region)) : (map && map.name) || 'Hyrule';
  const aliases={Market:['Castle Town','Market'],KakarikoVillage:['Kakariko Village','Kakariko'],
    ZoraRiver:["Zora's River",'Zora River'],ZoraDomain:["Zora's Domain",'Zora Domain'],ZoraFountain:["Zora's Fountain",'Zora Fountain'],
    DeathMountainTrail:['Death Mountain Trail','Death Mountain'],DeathMountainCrater:['Death Mountain Crater','Crater'],
    KokiriForest:['Kokiri Forest','Kokiri'],DesertColossus:['Desert Colossus','Colossus'],
    GerudoFortress:["Gerudo's Fortress",'Gerudo Fortress'],GanonCastle:["Ganon's Castle",'Ganon Castle'],
    '64028':['Inside the Deku Tree','Deku Tree'],'64027':["Inside Jabu-Jabu's Belly",'Jabu-Jabu'],
    '64022':['Bottom Of The Well','Well']};
  let prefixes=[areaName].concat(aliases[poi.region || poi.map] || []);
  const parts=poi.title.split(' — '), detail=parts.slice(1).join(' — ');
  if(/^Lon Lon Ranch\b/i.test(detail)) {areaName='Lon Lon Ranch';prefixes=['Lon Lon Ranch'];}
  const prefix=prefixes.sort((a,b)=>b.length-a.length).find(name=>detail.toLowerCase()===name.toLowerCase() || detail.toLowerCase().startsWith(name.toLowerCase()+' '));
  const remainder=prefix ? detail.slice(prefix.length).trim() : detail;
  const title=prefix ? parts[0]+(remainder ? ' - '+remainder : '') :
    (parts.length>1 ? parts[0]+' - '+detail : poi.title);
  return {name:title.replace(/—/g,'-'),areaName};
}

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
    const display=presentation(poi);
    const [x, y] = place(poi);
    const submap = poi.submap || (SUBMAPS[poi.map] || {})[poi.age];
    if (!submap) throw new Error('No submap for ' + poi.id);
    const text = '<p>' + escape(poi.how.replace(/—/g,'-')) + '</p>' +
      (poi.needs ? '<p><strong>Needs:</strong> ' + escape(poi.needs.replace(/—/g,'-')) + '</p>' : '') +
      '<p><em>' + ages[poi.age] + '</em></p>';
    return {
      id: String(poi.id), mapId: String(poi.map), submapId: String(submap), overlayId: null,
      markerCategoryId: String(poi.category), markerCategoryTypeId: '1',
      userId: '0', userName: 'Zelda Maps', name: display.name, description: '',
      x: String(x), y: String(y), z: null, jumpMakerId: '0',
      tabId: String(poi.id), tabTitle: '', tabText: text, tabUserId: '0', tabUserName: 'Zelda Maps',
      path: '', gameData: JSON.stringify({areaName:display.areaName,region:poi.region || null}), globalMarker: poi.age === 'both' ? '1' : '0', visible: '1'
    };
  });
};

if (require.main === module) {
  const fs = require('fs'), path = require('path');
  const pois = JSON.parse(fs.readFileSync(path.join(__dirname, 'pois.json'), 'utf8'));
  const output=JSON.stringify(module.exports(pois), null, 2) + '\n';
  if(process.argv.includes('--write')) fs.writeFileSync(path.join(__dirname,'../../../data/OoT/markers.json'),output);
  else process.stdout.write(output);
}
