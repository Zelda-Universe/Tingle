// Read-only generator: node ganon-castle-to-sql.cjs maps.json
const fs=require('fs');
const {placement,markerSQL,removalSQL,sql,encoded}=require('./marker-sql.cjs');
const {chestCategory}=require('./item-categories.cjs');
const source=require('./scene-data/ganon-castle-source.json');
const items=require('./scene-data/item-sources.json').sources;
const GOLD_ID='17657623307936361670',GOLD_MARKER=64704026;
const entranceNote='<p>Inside Ganon’s Castle. Shown at the entrance because this dungeon does not yet have map artwork.</p>';
const oldGoldText='<p>Contains: Golden Gauntlets.</p>'+entranceNote+'<p><em>Adult Link</em></p>';
function build(maps) {
  const points=new Map();
  source.mapParam.Floor.forEach((f,floor)=>f.TBox.forEach(p=>points.set(p.InstanceID,{floor,p:p.Trans})));
  const records=[];
  for(const o of source.objects.filter(o=>/^Obj_TBox_/.test(o.name)&&o.name!=='Obj_TBox_A_04')) {
    const gameId=BigInt(o.hash_id).toString(),anchor=points.get(gameId);
    const item=items.find(s=>s.kind==='chest'&&s.gameId===gameId);
    if(!anchor&&o.pos[1]>110) throw Error('Unresolved elevated chest '+gameId);
    const label=item?item.item:o.ui_name.replace(/ \(in .*$/,'');
    let text='<p>Contains: '+label+'.</p>';
    if(/invisible/i.test(o.ui_name)) text+='<p>Use the Lens of Truth to see this chest.</p>';
    records.push({kind:'chest',gameId,gameRecord:'Object.'+o.name,position:anchor?anchor.p:o.pos,
      floor:anchor?anchor.floor:0,category:chestCategory(label),name:'Chest - '+label,text});
  }
  for(const o of source.objects.filter(o=>o.name==='Obj_RupeeToken_Silver')) {
    const room=o.ui_name.match(/room (\d+)/);
    records.push({kind:'silver',gameId:BigInt(o.hash_id).toString(),gameRecord:'Object.'+o.name,position:o.pos,
      floor:0,category:64005,name:'Silver Rupee',text:'<p>Part of the Silver Rupee puzzle'+(room?' in room '+room[1]:'')+'.</p>'});
  }
  source.mapParam.Floor.forEach((f,floor)=>f.Door.filter(p=>p.IsBossRoom).forEach(p=>records.push({
    kind:'boss-door',gameId:p.InstanceID,gameRecord:'MapParam.Door',position:p.Trans,floor,
    category:64042,name:'Ganondorf - Boss Door',text:'<p>The locked door at the top of the tower. Requires the Boss Key.</p>'
  })));
  records.sort((a,b)=>a.kind.localeCompare(b.kind)||a.gameId.localeCompare(b.gameId));
  let next=64707001;
  const markers=records.map(r=>{
    const where=placement([{scene:'InsideGanonCastle',floor:r.floor,position:r.position}],maps);
    if(!where||where.x<0||where.x>256||where.y>0||where.y< -256) throw Error('Invalid Castle placement '+r.gameId);
    return {...r,id:r.gameId===GOLD_ID?GOLD_MARKER:next++,where};
  });
  if(new Set(markers.map(m=>m.gameId)).size!==markers.length) throw Error('Duplicate source ID');
  const gold=markers.find(m=>m.id===GOLD_MARKER),added=markers.filter(m=>m!==gold);
  const nx=Number(gold.where.x.toFixed(3)),ny=Number(gold.where.y.toFixed(3));
  const up=['-- Castle artwork must be applied first. Preserve the Golden Gauntlets marker ID.',
    ...added.flatMap(markerSQL),
    `UPDATE marker SET submap_id=${gold.where.submapId},x=${nx},y=${ny},game_data=JSON_SET(game_data,'$.areaName',${sql(gold.where.area)},'$.region',NULL),last_updated=NOW() WHERE id=${GOLD_MARKER} AND submap_id=650001 AND x=118.829 AND y=-94.378 AND JSON_UNQUOTE(JSON_EXTRACT(game_data,'$.gameId'))=${sql(GOLD_ID)};`,
    `UPDATE marker_tab SET tab_text=REPLACE(tab_text,${sql(encoded(entranceNote))},'') WHERE marker_id=${GOLD_MARKER} AND EXISTS (SELECT 1 FROM marker WHERE id=${GOLD_MARKER} AND submap_id=${gold.where.submapId});`
  ].join('\n')+'\n';
  const oldData=JSON.stringify({areaName:"Ganon's Castle",region:'GanonCastle',gameId:GOLD_ID,gameRecord:'Object.Obj_TBox_A_02_NoBake'});
  const down=[...removalSQL(added.map(m=>m.id),[]),
    `UPDATE marker_tab SET tab_text=${sql(encoded(oldGoldText))} WHERE marker_id=${GOLD_MARKER} AND tab_text=${sql(encoded(oldGoldText.replace(entranceNote,'')))};`,
    `UPDATE marker SET submap_id=650001,x=118.829,y=-94.378,game_data=${sql(oldData)},last_updated=NOW() WHERE id=${GOLD_MARKER} AND submap_id=${gold.where.submapId} AND x=${nx} AND y=${ny};`
  ].join('\n')+'\n';
  return {up,down,markers,added:added.length,updated:[GOLD_MARKER],sourceObjects:source.objects.length,
    calibration:'Approximate door/room landmark registration. The 7F stairwell and boss-door alignment need in-game visual confirmation.',
    excluded:'Four attacking trap chests, enemies, switches and respawning drops remain staged in the source snapshot, not mislabeled as collectible markers.'};
}
if(require.main===module) console.log(JSON.stringify(build(JSON.parse(fs.readFileSync(process.argv[2],'utf8')))));
module.exports={build};
