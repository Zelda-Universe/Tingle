// Exact game anchors, including holes absent from Radar's mesh-name search.
const fs=require('fs'),path=require('path');
const {load}=require('./extract-scene-data.cjs');
function collect(folder) {
  const result=[];
  for(const file of fs.readdirSync(folder).filter(f=>/^oot-banc-.*\.yaml$/.test(f)).sort()) {
    const scene=file.slice(9,-5),data=load(path.join(folder,file));
    const actors=new Map(data.Actors.map(a=>[a.Hash,a])),groups=new Map((data.AiGroups||[]).map(g=>[g.Hash,g]));
    for(const anchor of data.Actors.filter(a=>a.Name==='HidingHole_HoleEntrance')) {
      const owners=[...groups.values()].filter(g=>(g.References||[]).some(r=>r.Reference===anchor.Hash));
      const ids=new Set(),seen=new Set();
      function visit(g) {if(seen.has(g.Hash))return;seen.add(g.Hash);for(const r of g.References||[]){ids.add(r.Reference);if(groups.has(r.Reference))visit(groups.get(r.Reference));}}
      // Scene-wide Common groups also reference unrelated interiors.
      // Only enumerate contents when the owner is a scoped grotto module.
      owners.filter(g=>/HidingHole_Level_Hole_|_Room_\d+\//.test(g.Logic)).forEach(visit);
      const contents=[...ids].map(id=>actors.get(id)).filter(a=>a&&/^(Enemy_|Obj_(TBox|Fairy|Gossip|Cow))/.test(a.Gyaml))
        .filter(a=>!/_Leaf$|_Hand$/.test(a.Gyaml)).map(a=>({id:a.Hash,name:a.Gyaml,position:a.Translate}));
      result.push({scene,id:anchor.Hash,position:anchor.Translate,kind:scene.startsWith('Graveyard')?'grave':'grotto',
        logic:owners.map(g=>g.Logic),contents});
    }
  }
  return result;
}
if(require.main===module){const data=collect(process.argv[2]);console.log(JSON.stringify(process.argv[3]?data.filter(r=>r.scene===process.argv[3]):data));}
module.exports={collect};
