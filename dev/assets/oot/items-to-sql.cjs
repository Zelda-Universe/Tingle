// Preserve existing marker IDs; add missing chests and non-chest item sources.
// node items-to-sql.cjs maps.json markers.json <new migration-name>
const fs=require('fs'),path=require('path');
const {placement,categorySQL,markerSQL,removalSQL}=require('./marker-sql.cjs');
const {categories,chestCategory,rewardCategory}=require('./item-categories.cjs');
const {areaBounds,sceneArea}=require('./game-to-map.cjs');
const [mapsFile,markersFile,name]=process.argv.slice(2);
if(!name)throw Error('Pass maps.json, markers.json, migration-name');
const maps=JSON.parse(fs.readFileSync(mapsFile,'utf8')),markers=JSON.parse(fs.readFileSync(markersFile,'utf8'));
const {sources,unresolved}=require('./scene-data/item-sources.json');
const points=require('./scene-data/map-points.json');
const byGameId=new Map(markers.filter(m=>m.markerCategoryId==='64021').map(m=>[String(JSON.parse(m.gameData||'{}').gameId),m]));
const registryFile=path.join(__dirname,'scene-data/item-ids.json');
const ids=fs.existsSync(registryFile)?JSON.parse(fs.readFileSync(registryFile,'utf8')):{};
let nextChest=Math.max(64704000,...Object.entries(ids).filter(([k])=>k.startsWith('chest:')).map(([,id])=>id))+1;
let nextItem=Math.max(64705000,...Object.entries(ids).filter(([k])=>!k.startsWith('chest:')).map(([,id])=>id))+1;
const added=[],changed=[],skipped=[...unresolved],counts={};
function locate(source){
  let records=source.records.map(r=>({...r})),note=source.proxy==='temple'?'Shown at the Temple of Time entrance; the item is obtained inside.':'';
  if(source.proxy==='temple') {
    const p=points.find(p=>p.scene===records[0].scene&&p.kind==='PlayerIconAnchor');
    records=records.map(r=>({...r,position:p.position}));
  }
  if(source.kind==='chest'&&source.item==='Hookshot'){
    const entrance=points.find(p=>p.kind==='Facility'&&p.scene==='Graveyard_Adult'&&p.properties.GameDataHashName==='UnderTheGrave_MinigameIconON');
    if(entrance){records=[entrance];note='Inside Dampé’s grave. Shown at the mapped race entrance because the interior is not drawn on the overworld map.';}
  }
  if(source.key==='reward:zelda-letter'){
    const lesson=require('./scene-data/song-sources.json').songs.find(s=>s.id===64703001);
    records=[{scene:lesson.scene,position:lesson.position,floor:null}];
    note='Obtained from Zelda in the castle courtyard. Shown at the mapped courtyard approach.';
  }
  if(source.proxy==='lake'||records.every(r=>r.scene.startsWith('HyruleField')&&r.position[2]>420))
    records=records.map(r=>({...r,scene:r.scene.replace('HyruleField','LakeHylia')}));
  let at=placement(records,maps);
  // Unmapped dungeons: retain important item locations as explicitly labelled
  // entrance references, rather than drawing an invented dungeon position.
  if(!at&&source.kind==='chest'&&/Ice Arrow|Golden Gauntlets/.test(source.item)){
    const scene=source.records[0].scene;
    const entrance=points.find(p=>p.kind==='EntranceAnchor'&&p.properties.Location===scene);
    if(entrance){at=placement([entrance],maps);note='Inside '+(scene==='GerudoTrainingGround'?'the Gerudo Training Ground':'Ganon’s Castle')+'. Shown at the entrance because this dungeon does not yet have map artwork.';}
  }
  if(!at)return null;
  // Never project off-canvas interior actors onto unrelated map areas.
  if(at.mapId==='65000'&&!note){
    for(const r of records){const {region,age}=sceneArea(r.scene);const rect=areaBounds(region,age);
      if(rect&&(r.position[0]<rect[0][0]||r.position[0]>rect[0][1]||r.position[2]<rect[1][0]||r.position[2]>rect[1][1]))return null;
    }
  }
  return {where:at,note};
}
// Split every existing chest, even if its latest actor is outside our artwork.
for(const m of markers.filter(m=>m.markerCategoryId==='64021')){
  const data=JSON.parse(m.gameData||'{}');
  const source=sources.find(s=>s.kind==='chest'&&s.gameId===String(data.gameId));
  const item=source?source.item:m.name;
  const category=chestCategory(item);
  if(category!==64021)changed.push({id:m.id,old:64021,category});
  counts[category]=(counts[category]||0)+1;
}
for(const s of sources){
  if(s.kind==='chest'&&byGameId.has(s.gameId))continue;
  // Heart Piece locations already have their own completion markers.
  if(s.kind==='chest'&&/^Piece of Heart/.test(s.item))continue;
  const at=locate(s);
  if(!at){skipped.push({key:s.key,item:s.item,scenes:s.records.map(r=>r.scene),reason:'No supported artwork placement; not guessed'});continue;}
  if(!ids[s.key])ids[s.key]=s.kind==='chest'?nextChest++:nextItem++;
  const category=s.kind==='chest'?chestCategory(s.item):rewardCategory[s.group];
  if(!category)throw Error('No item category '+s.key);
  const text=s.kind==='chest'?'<p>Contains: '+s.item.replace('Lenses of Truth','Lens of Truth')+'.</p>'+
    (/invisible/i.test(s.label)?'<p>Requires the Lens of Truth to see.</p>':'')+
    (/substitute/i.test(s.label)?'<p>Contains a substitute reward if the equipment is already owned.</p>':''):'<p>'+s.text+'</p>';
  added.push({id:ids[s.key],category,name:(s.kind==='chest'?'Chest - ':'')+s.item.replace('Lenses of Truth','Lens of Truth'),text:text+(at.note?'<p>'+at.note+'</p>':''),gameId:s.gameId,
    gameRecord:(s.kind==='chest'?'Object.':s.event?'Event.':'Object.')+(s.event||s.object),where:at.where});
  counts[category]=(counts[category]||0)+1;
}
const up=['-- Add item sources and split chests without changing any existing marker IDs.',...categories.map(categorySQL),
  "UPDATE marker_category SET name='Other Treasure' WHERE id=64021 AND container_id=64 AND name='Treasure Chests';",
  ...changed.map(m=>`UPDATE marker SET marker_category_id=${m.category}, last_updated=NOW() WHERE id=${m.id} AND marker_category_id=${m.old};`),...added.flatMap(markerSQL)];
const down=[...changed.map(m=>`UPDATE marker SET marker_category_id=${m.old}, last_updated=NOW() WHERE id=${m.id} AND marker_category_id=${m.category};`),
  "UPDATE marker_category SET name='Treasure Chests' WHERE id=64021 AND container_id=64 AND name='Other Treasure';",...removalSQL(added.map(m=>m.id),categories)];
const folder=path.resolve(__dirname,'../../../migrations');
fs.writeFileSync(registryFile,JSON.stringify(ids,null,2)+'\n');
fs.writeFileSync(path.join(folder,name+'.sql'),up.join('\n')+'\n');
fs.writeFileSync(path.join(folder,name+'.down.sql'),down.join('\n')+'\n');
fs.writeFileSync(path.join(__dirname,'scene-data/item-import-report.json'),JSON.stringify({existingChests:byGameId.size,recategorized:changed.length,added:added.length,counts,skipped},null,2)+'\n');
console.log(JSON.stringify({recategorized:changed.length,added:added.length,counts,skipped}));
