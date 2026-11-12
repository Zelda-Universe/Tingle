// Read downloaded Radar scene snapshots; print a compact, reviewable inventory.
// curl each maps.json field/dungeon /objs/<type>/<scene>?q=HidingHole|Enemy...
const fs=require('fs'),path=require('path');
const {load}=require('./extract-scene-data.cjs');
const boss=/^Enemy_DungeonBoss_(Gohma|Dodongo|Barinade|PhantomGanon|Volvagia|Morpha|BongoBongo|Twinrova|Ganondorf|Ganon)$/;
function mini(o,scene) {
  return /^Enemy_MiddleBoss_/.test(o.name)||o.name==='Enemy_DeadHand'||
    (scene==='ForestTemple'&&/^Enemy_(Poe_(Joelle|Beth|Amy)|Stalfos_Weak)$/.test(o.name))||
    (scene==='SpiritTemple'&&o.name==='Enemy_IronKnuckle_Silver')||
    (scene==='IceCavern'&&o.name==='Enemy_Wolfos_White');
}
function collect(folder,paramFile) {
  const params=load(paramFile),scenes=[];
  for(const file of fs.readdirSync(folder).filter(f=>/^oot-source-.*\.json$/.test(f)).sort()) {
    const scene=file.slice(11,-5),objects=JSON.parse(fs.readFileSync(path.join(folder,file)));
    const encounters=objects.filter(o=>boss.test(o.name)||mini(o,scene));
    const bases=objects.filter(o=>/^Land_HidingHole_Base_/.test(o.name));
    const grottos=bases.map(base=>({base,contents:objects.filter(o=>o.gen_group===base.gen_group&&
      /^(Land_.*HidingHoleCover|FldObj_AirWall_HidingHoleCover|Enemy_|Obj_(TBox|Fairy|Gossip|BrokenRock|Cow)|Agony)/.test(o.name))}));
    const p=params[scene];
    if(encounters.length||grottos.length) scenes.push({scene,encounters,grottos,
      mapParam:p?{BossRoomId:p.BossRoomId,MinFloor:p.MinFloor,
        Floor:(p.Floor||[]).map(f=>({TransY:f.TransY})),
        Room:(p.Room||[]).map(r=>({CenterTrans:r.CenterTrans,Floor:r.Floor}))}:null});
  }
  for(const [file,scene] of [['oot-gerudo-enemies.json','GerudoFortress_Adult'],['oot-final-enemies.json','FinalBattleField']]) {
    const objects=JSON.parse(fs.readFileSync(path.join(folder,file)));
    scenes.push({scene,encounters:objects.filter(o=>boss.test(o.name)||mini(o,scene)),grottos:[],mapParam:null});
  }
  return {source:'https://radar-oot.zeldamods.org',note:'Snapshots exclude Dream World, dictionary, museum and boss-rush copies. Grotto contents retain engine records only for evidence, not separate markers.',scenes};
}
if(require.main===module){const d=collect(process.argv[2],process.argv[3]);console.log(JSON.stringify(process.argv[4]?d.scenes[Number(process.argv[4])]:d));}
module.exports={collect,boss,mini};
