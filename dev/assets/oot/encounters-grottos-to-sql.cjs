// Read-only generator. node encounters-grottos-to-sql.cjs maps.json markers.json
const fs=require('fs');
const {placement,DUNGEONS,markerSQL,categorySQL,removalSQL,encoded,sql}=require('./marker-sql.cjs');
const source=require('./scene-data/encounter-grotto-sources.json');
const anchors=require('./scene-data/grotto-anchors.json').anchors;
const doors=require('./scene-data/encounter-floor-doors.json');
const coverageFile=__dirname+'/scene-data/encounter-artwork-coverage.json';
const categories=[[64070,null,'Enemies & Bosses','BotW_Boss','#e85040'],
  [64071,64070,'Bosses','BotW_Boss','#e85040'],[64072,64070,'Minibosses','BotW_Boss','#e85040'],
  [64034,64030,'Grottos','General_Cave','#8f773a'],[64035,64030,'Graves','General_Cave','#8f773a']];
const decimal=id=>BigInt(id).toString();
const floorNumber=name=>name[0]==='B'?-Number(name.slice(1)):Number(name.replace('F',''))-1;
const mean=actors=>[0,1,2].map(i=>actors.reduce((s,o)=>s+o.pos[i],0)/actors.length);
function inferredFloor(scene,pos,param) {
  // Floor thresholds are MapParam's, not guessed from an actor's spawn height.
  const floors=param.Floor.map((f,i)=>({floor:i+param.MinFloor,y:f.TransY})).filter(f=>f.y<=pos[1]+.5);
  return floors.length?floors[floors.length-1].floor:param.MinFloor;
}
function build(maps,existing,options={}) {
  const artwork=!options.audit&&fs.existsSync(coverageFile)?JSON.parse(fs.readFileSync(coverageFile)):null;
  const encounters=[],grottos=new Map(),doorCandidates=[];
  for(const [scene,floors] of Object.entries(doors)) for(const f of floors) for(const d of f.doors) {
    const where=placement([{scene,floor:f.floor,position:d.position}],maps);
    if(where) doorCandidates.push({key:'door:'+d.id,scene,floor:f.floor,position:d.position,where});
  }
  for(const s of source.scenes) {
    const groups=new Map();
    for(const o of s.encounters) {
      const paired=/Enemy_MiddleBoss_Lizalfos|Enemy_Stalfos_Weak/.test(o.name);
      const key=paired?s.scene+':'+o.name+':'+o.gen_group:s.scene+':'+o.hash_id;
      if(!groups.has(key))groups.set(key,[]);groups.get(key).push(o);
    }
    for(const [key,actors] of groups) {
      const lead=actors[0],boss=/^Enemy_DungeonBoss_/.test(lead.name),position=mean(actors);
      let floor=s.mapParam?inferredFloor(s.scene,position,s.mapParam):null;
      if(boss&&s.mapParam) {
        const room=s.mapParam.Room[s.mapParam.BossRoomId];
        if(room&&room.Floor?.length)floor=room.Floor[0];
      }
      let name=lead.ui_name;
      if(/GerudoThief/.test(lead.name))name='Gerudo Guard';
      if(/Lizalfos/.test(lead.name))name='Lizalfos Pair';
      if(lead.name==='Enemy_Stalfos_Weak')name='Stalfos Encounter';
      if(/IronKnuckle_Nabooru/.test(lead.name))name='Iron Knuckle - Nabooru';
      let where=placement([{scene:s.scene,floor,position}],maps);
      encounters.push({key,kind:boss?'boss':'miniboss',name,category:boss?64071:64072,
        gameId:decimal(lead.hash_id),gameRecord:'Object.'+lead.name,scene:s.scene,floor,position,
        sourceIds:actors.map(a=>decimal(a.hash_id)),where,text:'<p>'+name+' encounter.</p>'});
    }
  }
  for(const a of anchors) {
    // Quantize only to source precision (one centimetre), never proximity-match holes.
    const key=a.scene.split('_')[0]+':'+a.position[0].toFixed(2)+':'+a.position[2].toFixed(2);
    const label=n=>n==='Enemy_Scrub_Business'?'Business Scrub':/Obj_TBox/.test(n)?'Treasure chest':
      /Obj_Fairy/.test(n)?'Fairies':/Obj_Gossip/.test(n)?'Gossip Stone':/Cow/.test(n)?'Cow':
      /Skulltula_Gold/.test(n)?'Gold Skulltula':/^Enemy_/.test(n)?'Enemies':null;
    const g={scene:a.scene,kind:a.kind,logic:a.logic,base:{hash_id:'0x'+BigInt(a.id).toString(16),pos:a.position,name:'HidingHole_HoleEntrance'},
      contents:a.contents.filter(o=>label(o.name)).map(o=>({name:o.name,ui_name:label(o.name)}))};
    if(!grottos.has(key))grottos.set(key,[]);grottos.get(key).push(g);
  }
  encounters.sort((a,b)=>a.kind.localeCompare(b.kind)||a.scene.localeCompare(b.scene)||a.gameId.localeCompare(b.gameId));
  encounters.forEach((e,i)=>e.id=64708001+i);
  const bySubmap=new Map(maps.flatMap(m=>m.subMap.map(s=>[String(s.id),m])));
  const referenceFor=e=>{
    const bossDoor=existing.find(m=>String(m.markerCategoryId)==='64042'&&
      String(bySubmap.get(String(m.submapId))?.id)===String(DUNGEONS[e.scene]?.[0]));
    if((e.kind==='boss'||e.name==='Iron Knuckle - Nabooru')&&bossDoor)return {...e.where,mapId:String(DUNGEONS[e.scene][0]),submapId:String(bossDoor.submapId),
      x:Number(bossDoor.x),y:Number(bossDoor.y),area:bySubmap.get(String(bossDoor.submapId)).name,global:0,age:DUNGEONS[e.scene][1]};
    const candidates=doorCandidates.filter(d=>d.scene===e.scene&&artwork?.[d.key]?.visible)
      .sort((a,b)=>Math.hypot(...a.position.map((v,i)=>v-e.position[i]))-Math.hypot(...b.position.map((v,i)=>v-e.position[i])));
    return candidates[0]?.where||null;
  };
  for(const e of encounters) {
    if(e.scene==='FinalBattleField') {
      const entrance=existing.find(m=>String(m.markerCategoryId)==='64051'&&m.name.includes('Ganon'));
      if(!entrance)throw Error('Missing final-battle entrance reference');
      e.where={mapId:'65000',submapId:String(entrance.submapId),x:Number(entrance.x),y:Number(entrance.y),global:0,
        area:"Ganon's Castle",region:'GanonCastle',age:'Adult Link'};
      e.reference='castle entrance';e.text+='<p>The final battle takes place after escaping the castle. Shown at the castle entrance because the final arena has no map artwork.</p>';
    } else if(artwork&&(!e.where||!artwork[e.key]?.visible)) {
      const ref=referenceFor(e);if(!ref)throw Error('No safe artwork/reference for '+e.key);
      e.where={...e.where,...ref};e.reference=e.kind==='boss'||e.name==='Iron Knuckle - Nabooru'?'boss-room entrance':'nearby mapped doorway';
      e.text+='<p>Shown at the '+e.reference+' because the encounter position is not drawn on this floor’s artwork.</p>';
    }
  }
  const grottoMarkers=[...grottos.entries()].sort(([a],[b])=>a.localeCompare(b)).map(([key,records],i)=>{
    // Match eras by exact region + base X/Z. Do not fuzzy-merge nearby holes.
    records.sort((a,b)=>a.scene.includes('Alternative')-b.scene.includes('Alternative'));
    const ages=new Map();for(const r of records) {const age=r.scene.includes('Adult')?'Adult':'Child';if(!ages.has(age))ages.set(age,r);}
    const list=[...ages.values()],lead=list.find(r=>r.scene.includes('Child'))||list[0];
    const position=r=>r.base.pos;
    const where=placement(list.map(r=>({scene:r.scene,floor:null,position:position(r)})),maps);
    if(!where)throw Error('Unmapped grotto '+key);
    const contents=[...new Set(lead.contents.filter(o=>/^Enemy_|^Obj_(TBox|Fairy|Gossip|Cow)/.test(o.name))
      .filter(o=>!/_Leaf$|_Hand$/.test(o.name)).map(o=>o.ui_name))].sort();
    let name='Grotto';if(contents.some(n=>/Fairy|Fairies/.test(n)))name='Fairy Fountain Grotto';
    else if(contents.some(n=>/Cow/i.test(n)))name='Cow Grotto';
    else if(contents.some(n=>/Business Scrub/.test(n)))name='Business Scrub Grotto';
    else if(contents.some(n=>/chest/i.test(n)))name='Treasure Grotto';
    const grave=lead.kind==='grave';
    if(grave)name=lead.logic.some(l=>/Dampe/.test(l))?"Dampé's Grave":'Grave';
    return {key,kind:grave?'grave':'grotto',id:64709001+i,name,category:grave?64035:64034,where,
      gameId:decimal(lead.base.hash_id),gameRecord:'Actor.DestinationAnchor',
      sourceIds:records.map(r=>decimal(r.base.hash_id)),position:position(lead),
      text:(grave?'<p>Entrance to a grave interior.</p>':'<p>Underground grotto entrance.</p>')+(contents.length?'<p>Inside: '+contents.join('; ')+'.</p>':'')};
  });
  const markers=[...encounters,...grottoMarkers];
  for(const m of markers)m.metadata={sourceIds:m.sourceIds,sourceScene:m.scene||m.key.split(':')[0],
    sourcePosition:m.position,locationReference:m.reference||null};
  if(artwork&&markers.some(m=>!m.where||!Number.isFinite(m.where.x)||!Number.isFinite(m.where.y)))throw Error('Invalid marker placement');
  const up=[...categories.map(categorySQL),
    "UPDATE marker_category SET menu_section='Locations',menu_order=14 WHERE id=64034 AND menu_section IS NULL;",
    "UPDATE marker_category SET menu_section='Locations',menu_order=14 WHERE id=64035 AND menu_section IS NULL;",
    "UPDATE marker_category SET menu_section='Enemies & Bosses',menu_order=39 WHERE id=64071 AND menu_section IS NULL;",
    "UPDATE marker_category SET menu_section='Enemies & Bosses',menu_order=40 WHERE id=64072 AND menu_section IS NULL;",
    "UPDATE marker_category SET visible_zoom=3 WHERE id=64071 AND visible_zoom=0;",
    "UPDATE marker_category SET visible_zoom=4 WHERE id IN (64072,64034,64035) AND visible_zoom=0;",
    "UPDATE marker SET name='Gerudo Proving Grounds Entrance',marker_category_id=64051,last_updated=NOW() WHERE id=64600029 AND name='Gerudo Training Ground' AND marker_category_id=64033;",
    ...markers.filter(m=>m.where).flatMap(markerSQL)].join('\n')+'\n';
  const down=[...removalSQL(markers.map(m=>m.id),categories),
    "UPDATE marker SET name='Gerudo Training Ground',marker_category_id=64033,last_updated=NOW() WHERE id=64600029 AND name='Gerudo Proving Grounds Entrance' AND marker_category_id=64051;"].join('\n')+'\n';
  return {markers,doorCandidates,up,down,counts:{bosses:encounters.filter(e=>e.kind==='boss').length,minibosses:encounters.filter(e=>e.kind==='miniboss').length,grottos:grottoMarkers.filter(g=>g.kind==='grotto').length,graves:grottoMarkers.filter(g=>g.kind==='grave').length},artworkVerified:!!artwork};
}
if(require.main===module){
  const result=build(JSON.parse(fs.readFileSync(process.argv[2])),JSON.parse(fs.readFileSync(process.argv[3])),{audit:process.argv[4]==='audit'});
  if(!result.artworkVerified&&process.argv[4]!=='audit')throw Error('Run the artwork coverage audit before generating a migration');
  console.log(JSON.stringify(process.argv[4]&&process.argv[4]!=='audit'?result[process.argv[4]]:result));
}
module.exports={build,categories};
