// Generate a new local migration; never regenerate a shipped import.
// node gerudo-proving-to-sql.cjs maps.json
const fs=require('fs');
const {markerSQL,removalSQL,placement}=require('./marker-sql.cjs');
const {chestCategory}=require('./item-categories.cjs');
const source=require('./scene-data/gerudo-proving-source.json');
const items=require('./scene-data/item-sources.json').sources;
const {validation}=require('./gerudo-proving-projection.cjs');
const decimal=id=>BigInt(id).toString();
function build(maps) {
  if(validation.some(a=>a.errorPixels>3)) throw Error('Gerudo landmark validation failed');
  const records=[],objects=new Map(source.objects.map(o=>[decimal(o.hash_id),o]));
  source.mapParam.Floor.forEach((floor,index)=>floor.TBox.forEach(p=>{
    const o=objects.get(p.InstanceID);
    if(!o) throw Error('Missing chest actor '+p.InstanceID);
    const known=items.find(s=>s.kind==='chest'&&s.gameId===p.InstanceID);
    const item=known?known.item:null;
    const name=item?'Chest - '+item:/invisible/i.test(o.ui_name)?'Invisible Treasure Chest':'Treasure Chest';
    let text=item?'<p>Contains: '+item+'.</p>':'<p>'+o.ui_name.replace('Lenses of Truth','Lens of Truth')+'.</p>';
    if(/invisible/i.test(o.ui_name)) text+='<p>Use the Lens of Truth to see this chest.</p>';
    if(/substitut/i.test(o.ui_name)) text+='<p>This is a substitute reward when the original item is already owned.</p>';
    records.push({kind:'chest',gameId:p.InstanceID,gameRecord:'Object.'+o.name,position:p.Trans,floor:index,
      category:item?chestCategory(item):64021,name,text});
  }));
  for(const o of source.objects.filter(o=>o.name==='Obj_RupeeToken_Silver')) {
    // Rooms 02, 06 and 09 are 1F. Jumping/floating pickups stay on that
    // floor; their Y height alone is not evidence of a separate floor.
    const room=o.ui_name.match(/room ([^)]+)/i);
    records.push({kind:'silver',gameId:decimal(o.hash_id),gameRecord:'Object.'+o.name,position:o.pos,floor:0,
      category:64005,name:'Silver Rupee',text:'<p>Part of the Silver Rupee puzzle'+(room?' in room '+room[1]:'')+'.</p>'});
  }
  const pierre=source.objects.find(o=>o.name==='Npc_Pierre_CallOcarina');
  if(pierre) records.push({kind:'npc',gameId:decimal(pierre.hash_id),gameRecord:'Object.'+pierre.name,
    position:pierre.pos,floor:1,category:64041,name:'Pierre',text:'<p>Play the Scarecrow Song to summon Pierre at this spot on the upper walkway.</p>'});
  records.sort((a,b)=>a.kind.localeCompare(b.kind)||a.gameId.localeCompare(b.gameId));
  const markers=records.map((r,i)=>{
    const where=placement([{scene:'GerudoTrainingGround',floor:r.floor,position:r.position}],maps);
    if(!where||where.x<0||where.x>256||where.y>0||where.y< -256) throw Error('Invalid Gerudo placement '+r.gameId);
    return {...r,id:64706001+i,where};
  });
  if(new Set(markers.map(m=>m.gameId)).size!==markers.length) throw Error('Duplicate source IDs');
  const up=['-- Gerudo Proving Grounds: map-facing chests, Silver Rupees and Pierre.',
    '-- Chests use exact MapParam positions/floors; source IDs remain 64-bit strings.',
    '-- Artwork placement is landmark-calibrated; see gerudo-proving-calibration.json.',...markers.flatMap(markerSQL)].join('\n')+'\n';
  const down=removalSQL(markers.map(m=>m.id),[]).join('\n')+'\n';
  return {up,down,markers,validation,sourceObjects:source.objects.length,
    excluded:'Engine actors, switches, scenery, respawning drops, ordinary enemies and the breakable trap chest are retained in the source snapshot, not imported into unrelated collectible categories.'};
}
if(require.main===module) console.log(JSON.stringify(build(JSON.parse(fs.readFileSync(process.argv[2],'utf8')))));
module.exports={build};
