// Read-only source extraction. This deliberately never writes to the database.
// Usage: node dev/assets/oot/extract-scene-data.cjs /path/to/oot-switch2-tools
const fs=require('fs'),path=require('path'),crypto=require('crypto');
const yaml=require('js-yaml');
// IDs exceed Number.MAX_SAFE_INTEGER. Preserve their complete decimal text.
const schema=yaml.DEFAULT_SCHEMA.extend(['!ul','!u'].map(tag=>new yaml.Type(tag,{kind:'scalar',construct:value=>String(value)})));
const load=file=>yaml.load(fs.readFileSync(file,'utf8'),{schema});
const hash=file=>crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex');
function walk(dir) {return fs.readdirSync(dir,{withFileTypes:true}).flatMap(e=>e.isDirectory()?walk(path.join(dir,e.name)):[path.join(dir,e.name)]);}
const pointTypes=['CollectHeart','CollectSign','TBox','Facility','EntranceAnchor','StoneTablet','PlayerIconAnchor'];
function mapPoints(data) {
  const points=[];
  for(const [scene,params] of Object.entries(data)) {
    const scopes=params.Floor ? params.Floor.map((floor,index)=>({floor:params.MinFloor+index,data:floor})) : [{floor:null,data:params}];
    for(const scope of scopes) for(const kind of pointTypes) for(const item of scope.data[kind] || []) {
      if(!Array.isArray(item.Trans)) continue;
      points.push({scene,floor:scope.floor,kind,id:String(item.InstanceID),position:item.Trans,
        actorId:item.ActorHash || null,properties:Object.fromEntries(Object.entries(item).filter(([k])=>!['Trans','InstanceID','ActorHash'].includes(k)))});
    }
  }
  return points;
}
function main(source) {
  const root=path.join(source,'Banc'), paramFile=path.join(root,'BancBasedResource/MapParam.byml.yaml');
  if(!fs.existsSync(paramFile)) throw new Error('Expected a checkout of MrCheeze/oot-switch2-tools');
  const params=load(paramFile),points=mapPoints(params),actors=[];
  const files=walk(root).filter(f=>f.endsWith('.bcett.byml.yaml'));
  for(const file of files) {
    const scene=path.basename(file).replace(/_(?:Dynamic|Static)\.bcett\.byml\.yaml$/,'');
    const data=load(file);
    for(const actor of data.Actors || []) {
      if(!/^(Npc_|Enemy_|Item_|TBox|HeartPiece|MapIcon|Obj_Plant_MagicBean)/.test(actor.Gyaml || '')) continue;
      actors.push({scene,id:String(actor.Hash),type:actor.Gyaml,name:actor.Name || null,
        position:actor.Translate || null,rotation:actor.Rotate || null,
        properties:actor.Dynamic || {},links:actor.Links || [],source:path.relative(source,file)});
    }
  }
  const counts=rows=>rows.reduce((out,row)=>(out[row.kind || row.type]=(out[row.kind || row.type] || 0)+1,out),{});
  const out=path.join(__dirname,'scene-data');fs.mkdirSync(out,{recursive:true});
  const write=(name,data)=>fs.writeFileSync(path.join(out,name),JSON.stringify(data,null,2)+'\n');
  write('map-points.json',points);
  write('actors.json',actors);
  write('locations.json',load(path.join(root,'BancBasedResource/LocationArea.byml.yaml')));
  const report={source:'https://github.com/MrCheeze/oot-switch2-tools',
    revision:require('child_process').execFileSync('git',['-C',source,'rev-parse','HEAD'],{encoding:'utf8'}).trim(),
    mapParamSHA256:hash(paramFile),sceneFiles:files.length,scenes:Object.keys(params).length,
    mapPoints:points.length,pointKinds:counts(points),actors:actors.length,actorTypes:counts(actors),
    uniqueHeartPieces:new Set(points.filter(p=>p.kind==='CollectHeart').map(p=>p.id)).size,
    uniqueGoldSkulltulas:new Set(points.filter(p=>p.kind==='CollectSign').map(p=>p.id)).size,
    bigPoes:actors.filter(a=>a.type==='Enemy_Poe_Big').length,
    limitations:['Coordinates are source scene coordinates, not Zelda Maps coordinates.',
      'MapIconOffsetAnchor and collectible OriginTrans must be resolved before displaying interiors.',
      'Floor numbers are derived from MinFloor plus Floor array index; verify against artwork.',
      'Existing marker IDs and completion data have not been changed.']};
  write('report.json',report);console.log(JSON.stringify({sceneFiles:report.sceneFiles,scenes:report.scenes,mapPoints:report.mapPoints,actors:report.actors,
    uniqueHeartPieces:report.uniqueHeartPieces,uniqueGoldSkulltulas:report.uniqueGoldSkulltulas,bigPoes:report.bigPoes},null,2));
}
if(require.main===module) {try {main(process.argv[2]);}catch(e){console.error(e.message);process.exitCode=1;}}
module.exports={schema,load,mapPoints};
