// Additive local import: Fairy Thoughts and song-learning locations.
// node dev/assets/oot/guidance-to-sql.cjs maps.json <migration-name>
// Existing allocated IDs are retained in guidance-ids.json; never reassign them.
const fs=require('fs'),path=require('path');
const {placement,categorySQL,markerSQL,removalSQL}=require('./marker-sql.cjs');
const [mapsFile,name]=process.argv.slice(2);
if(!mapsFile||!name)throw Error('Pass maps.json and a new migration name');
const maps=JSON.parse(fs.readFileSync(mapsFile,'utf8'));
const objects=require('./scene-data/objects.json').objects;
const songs=require('./scene-data/song-sources.json').songs;
const categories=[[64007,64000,'Fairy Thoughts','OoT_FairyThought','#cdb269'],[64008,64000,'Ocarina Songs','OoT_Song','#cdb269']];
const registryFile=path.join(__dirname,'scene-data/guidance-ids.json');
const ids=fs.existsSync(registryFile)?JSON.parse(fs.readFileSync(registryFile,'utf8')):{};
const groups=new Map();
for(const o of objects.filter(o=>o.type==='thought')) {
  // Multiple interaction actors can expose the same HaveReadHrlField_Note
  // flag. Count the thought once, retaining one source placement per age.
  const key=o.name;
  if(!groups.has(key))groups.set(key,[]);
  if(groups.get(key).some(r=>r.scene===o.scene))continue;
  groups.get(key).push({...o,position:o.pos,floor:o.floor??null});
}
let next=Math.max(64702000,...Object.values(ids))+1;
const added=[],skipped=[];
for(const [key,records] of [...groups].sort(([a],[b])=>a.localeCompare(b))) {
  // The Royal Family's Tomb is off-canvas in the Graveyard game scene.
  // Use its mapped gravestone entrance, not the interior's distant coordinates.
  const tomb=records[0].name==='HrlField_Note_26';
  const where=placement(tomb?records.map(r=>({...r,position:[48.364715576171875,104.557861328125,2.6127378940582275]})):records,maps);
  if(!where){skipped.push(key);continue;}
  const first=records[0];
  const legacyKey=[first.name,first.scene.split('_')[0],first.floor||'',Math.round(first.pos[0]*2),Math.round(first.pos[2]*2)].join(':');
  if(!ids[key])ids[key]=ids[legacyKey]||next++;
  added.push({id:ids[key],category:64007,name:'Fairy Thought',
    text:'<p>Read the fairy’s thoughts at this spot with Navi.</p>'+(tomb?'<p>Inside the Royal Family’s Tomb. Shown at the entrance because the interior is not drawn on this map.</p>':''),gameId:String(BigInt(records[0].hash)),gameRecord:'Object.'+records[0].name,where});
}
for(const song of songs) {
  const floor=song.scene==='IceCavern'?'1F':null;
  const where=placement([{scene:song.scene,position:song.position,floor}],maps);
  if(!where)throw Error('Unmapped song: '+song.title);
  added.push({id:song.id,category:64008,name:song.title,text:'<p>'+song.text+'</p>'+(song.proxy?'<p>'+song.proxy+'</p>':''),
    gameId:song.gameId,gameRecord:'Event.'+song.event,where});
}
if(new Set(added.map(p=>p.id)).size!==added.length)throw Error('Duplicate marker ID');
const folder=path.resolve(__dirname,'../../../migrations');
// Normalize the never-deployed first draft's position keys to thought IDs.
for(const key of Object.keys(ids))if(key.includes(':'))delete ids[key];
fs.writeFileSync(registryFile,JSON.stringify(ids,null,2)+'\n');
fs.writeFileSync(path.join(folder,name+'.sql'),['-- Additive Fairy Thoughts and song lessons. Existing rows are never overwritten.',...categories.map(categorySQL),...added.flatMap(markerSQL)].join('\n')+'\n');
fs.writeFileSync(path.join(folder,name+'.down.sql'),removalSQL(added.map(p=>p.id),categories).join('\n')+'\n');
console.log(JSON.stringify({thoughts:added.filter(p=>p.category===64007).length,songs:songs.length,skipped}));
