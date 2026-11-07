// Build an auditable item-source catalog from Owl objects and primary events.
// node extract-items.cjs <80-scene radar audit.json> <oot-switch2-tools>
const fs=require('fs'),path=require('path'),yaml=require('js-yaml');
const [auditFile,root]=process.argv.slice(2);
if(!auditFile||!root)throw Error('Pass radar scene audit.json and oot-switch2-tools');
const audit=JSON.parse(fs.readFileSync(auditFile,'utf8'));
const schema=yaml.DEFAULT_SCHEMA.extend(['!ul','!u'].map(tag=>new yaml.Type(tag,{kind:'scalar',construct:s=>s})));
const actors=[];
for(const dir of fs.readdirSync(path.join(root,'Banc')))for(const file of fs.readdirSync(path.join(root,'Banc',dir))) {
  if(!file.endsWith('.yaml'))continue;
  const scene=file.replace(/_(Static|Dynamic).*$/,'');
  for(const a of yaml.load(fs.readFileSync(path.join(root,'Banc',dir,file),'utf8'),{schema}).Actors||[])actors.push({scene,...a});
}
const sources=[],unresolved=[];
const record=(o,scene,floor=null)=>({scene,position:o.pos||o.Translate,floor,hash:o.hash_id?String(BigInt(o.hash_id)):o.Hash});
// Keep all ages/states of a chest together by its actual object hash.
const chests=new Map();
for(const map of audit.filter(m=>['field','dungeon'].includes(m.kind)))for(const o of map.objects) {
  if(!/^Obj_TBox/.test(o.name)||!/\(.*chest/.test(o.ui_name||'')||/pedestal|trap/i.test(o.ui_name))continue;
  const id=String(BigInt(o.hash_id));
  if(!chests.has(id))chests.set(id,{key:'chest:'+id,kind:'chest',label:o.ui_name,item:o.ui_name.split(' (')[0],object:o.name,gameId:id,records:[]});
  const layer=map.layers.find(l=>l.y&&o.pos[1]>=l.y[0]&&o.pos[1]<l.y[1]);
  chests.get(id).records.push(record(o,map.map_name,map.kind==='dungeon'?(layer?layer.id.split('_')[0]:'1F'):null));
}
sources.push(...chests.values());
// These are actual shop-stock actors, not equipment held by enemies or props.
const stocks=new Map();
for(const map of audit.filter(m=>m.kind==='field'&&!/_Alternative$/.test(m.map_name)))for(const o of map.objects) {
  if(!/^Shop_(Armor_|Weapon_Shield_|Mask_)/.test(o.name))continue;
  const key='stock:'+map.map_name.split('_')[0]+':'+o.name;
  if(!stocks.has(key))stocks.set(key,{key,kind:'stock',item:o.ui_name,object:o.name,gameId:String(BigInt(o.hash_id)),group:/Mask/.test(o.name)?'masks':'armor',text:'Available from the shop here. Stock and access can depend on story progress.',records:[]});
  if(!stocks.get(key).records.some(r=>r.scene===map.map_name))stocks.get(key).records.push(record(o,map.map_name));
}
sources.push(...stocks.values());
function reward(key,item,group,scene,actor,event,itemCode,text,proxy) {
  const script=fs.readFileSync(path.join(root,'event',event+'.c'),'utf8');
  if(!script.includes(itemCode))throw Error('Reward not verified: '+key+' '+itemCode);
  const matches=actors.filter(a=>a.scene===scene&&(typeof actor==='function'?actor(a):a.Gyaml===actor));
  if(!matches.length){unresolved.push({key,item,reason:'No source placement found',event});return;}
  const a=matches[0];
  sources.push({key:'reward:'+key,kind:'reward',item,group,gameId:a.Hash,object:a.Gyaml,event,itemCode,text,proxy:proxy||null,records:[record(a,scene)]});
}
reward('biggoron','Biggoron’s Sword','weapons','DeathMountainTrail_Adult','Npc_Goron_Biggoron_Adult','Npc_Goron_Biggoron_Adult','Item_Sword_Biggoron','Complete Biggoron’s trading sequence to receive the repaired sword.');
reward('giant-knife','Giant’s Knife','weapons','GoronCity_Adult','Npc_Goron_Medigoron_Adult','Npc_Goron_Medigoron_Adult','Shop_Sword_Giant','Buy this sword from Medigoron.');
reward('goron-bracelet','Goron’s Bracelet','tools','GoronCity_Child','Npc_Goron_Darunia_Child','Dm_Goron_0030','Item_Gauntlet_Goron','Play Saria’s Song for Darunia to receive the bracelet.');
reward('goron-tunic','Goron Tunic','armor','GoronCity_Adult','Npc_Goron_DaruniaJr_Adult','SageOfFire','Obj_Armor_Goron','Stop the rolling Goron and speak to him about the Gorons and the Fire Temple.');
reward('zora-tunic','Zora Tunic','armor','ZoraDomain_Adult','Npc_Zora_KingZora_adult','SageOfWater','Obj_Armor_Zora','Thaw King Zora with Blue Fire and speak to him.');
reward('bomb-bag','Bomb Bag Upgrade','upgrades','GoronCity_Child','Npc_Goron_006_Child','Npc_Goron_006_Child','Item_BombBag_Medium','Stop the rolling Goron in the correct place with a bomb. The reward upgrades your Bomb Bag.');
const facilities=require('./scene-data/facility-names.json').places;
const points=require('./scene-data/map-points.json');
function facilityReward(key,item,group,place,event,itemCode,text,age) {
  const script=fs.readFileSync(path.join(root,'event',event+'.c'),'utf8');
  if(!script.includes(itemCode))throw Error('Unverified facility reward '+item);
  const keys=Object.entries(facilities).filter(([,p])=>p.name===place).map(([key])=>key);
  const records=points.filter(p=>p.kind==='Facility'&&keys.includes(p.properties.GameDataHashName)&&(!age||p.scene.includes(age)));
  if(!records.length)throw Error('No mapped facility '+place);
  sources.push({key:'reward:'+key,kind:'reward',item,group,event,itemCode,gameId:records[0].id,object:'MapParam.Facility',text,records});
}
facilityReward('silver-scale','Silver Scale','upgrades','Diving Game','MiniGame_Diving','Item_Scale_Silver','Win the Diving Game to earn the Silver Scale.','Child');
facilityReward('gold-scale','Golden Scale','upgrades','Fishing Pond','MiniGame_Fishing','Item_Scale_Gold','Catch a sufficiently large fish as an adult and show it to the Fishing-Pond Man.','Adult');
facilityReward('seed-bag-gallery','Deku Seed Bag Upgrade','upgrades','Shooting Gallery','MiniGame_HitTarget','Item_BulletBag_Medium','Win the child’s Shooting Gallery game.','Child');
facilityReward('quiver-gallery','Quiver Upgrade','upgrades','Kakariko Shooting Gallery','MiniGame_HitTarget','Item_Quiver_Medium','Win the adult’s Shooting Gallery game.','Adult');
facilityReward('quiver-archery','Quiver Upgrade','upgrades','Horseback Archery','Minigame_HorsebackArchery','Item_Quiver_Large','Earn the high-score reward in horseback archery.','Adult');
facilityReward('bomb-bag-bowling','Bomb Bag Upgrade','upgrades','Bombchu Bowling Alley','MiniGame_BombchuBowling','Item_BombBag_Medium','Win the Bomb Bag prize at Bombchu Bowling.','Child');
facilityReward('stick-bag-stage','Deku Stick Capacity Upgrade','upgrades','Forest Stage','LostWood_ScrubForestStageElder_SkullMaskFirst','Item_StickBag_Medium','Wear the Skull Mask for the Forest Stage audience.','Child');
facilityReward('nut-bag-stage','Deku Nut Capacity Upgrade','upgrades','Forest Stage','LostWood_ScrubForestStageElder_TrueMaskFirst','Item_NutBag_Medium','Wear the Mask of Truth for the Forest Stage audience.','Child');
facilityReward('adult-wallet','Adult’s Wallet','upgrades','House of Skulltula','GatheringTokenGold','Item_Wallet_Medium','Bring 10 Gold Skulltula Tokens to the family.');
facilityReward('giant-wallet','Giant’s Wallet','upgrades','House of Skulltula','GatheringTokenGold','Item_Wallet_Large','Bring 30 Gold Skulltula Tokens to the family.');
facilityReward('agony-stone','Stone of Agony','tools','House of Skulltula','GatheringTokenGold','Item_AgonyStone','Bring 20 Gold Skulltula Tokens to the family.');
for(const [key,item,place,event,code,group] of [
  ['magic','Magic Meter','Great Fairy of Power','Dm_FairyFountain_Power','Item_FairyBless_MP','upgrades'],
  ['double-magic','Double Magic','Great Fairy of Wisdom','Dm_FairyFountain_Wisdom','Item_FairyBless_MPDouble','upgrades'],
  ['double-defense','Double Defense','Great Fairy of Courage','Dm_FairyFountain_Courage','Item_FairyBless_DefenseDouble','upgrades'],
  ['din-fire','Din’s Fire','Great Fairy of Din','Dm_FairyFountain_Din','Item_DinFire','spells'],
  ['farore-wind','Farore’s Wind','Great Fairy of Farore','Dm_FairyFountain_Frore','Item_FaroreWind','spells'],
  ['nayru-love','Nayru’s Love','Great Fairy of Nayru','Dm_FairyFountain_Nayru','Item_NayruLove','spells']
])facilityReward(key,item,group,place,event,code,'Play Zelda’s Lullaby at the Great Fairy’s fountain and speak to her.');
// Exact physical pickups / event anchors; interiors use an explicit map proxy.
const named=name=>a=>a.Name===name;
reward('master-sword','Master Sword','weapons','Market_Child','Obj_TimeTemple_MasterSword_A_01','DoorOfTime','Weapon_Sword_Master','Draw the Master Sword from its pedestal inside the Temple of Time.','temple');
reward('light-arrows','Light Arrows','tools','Market_Adult','Npc_Hylia_Sheik_Adult','Dm_TimeTemple_0130','Item_Arrow_Light','Return to the Temple of Time after awakening the sages.','temple');
reward('fire-arrows','Fire Arrows','tools','HyruleField_Adult','Obj_Arrow_Fire','Dm_LakeHrl_0030','Obj_Arrow_Fire','Shoot the rising sun from the stone platform at Lake Hylia.','lake');
reward('fairy-ocarina','Fairy Ocarina','tools','KokiriForest_Child','Npc_Kokiri_Saria_Child_OcarinaHolder','Dm_Kokiri_0155','Item_Ocarina_Fairy','Receive this ocarina from Saria when leaving Kokiri Forest.');
reward('ocarina-time','Ocarina of Time','tools','HyruleField_Child','Obj_Ocarina_Time_A_01','Dm_MelodyGet_Time','Item_Ocarina_Time','Recover the ocarina left by Zelda in the water outside the castle town.');
reward('zelda-letter','Zelda’s Letter','quest','HyruleCastle','Npc_Hylia_Zelda_Child','Dm_HrlCastle_0050','Item_ZeldaLetter','Meet Princess Zelda in the castle courtyard.');
reward('gerudo-card','Gerudo Membership Card','quest','GerudoFortress_Adult','Npc_Gerudo_001','Dm_Gerudo_0025','Item_Token_Gerudo','Rescue the imprisoned carpenters to receive the Gerudo Membership Card.');
reward('magic-beans','Magic Beans','tools','ZoraRiver_Child','Npc_Hylia_047_Child','Npc_Hylia_047_Child','Item_MagicBean','Buy Magic Beans from the bean seller.');
reward('seed-bag-target','Deku Seed Bag Upgrade','upgrades','LostWood_Child','NPC_Scrub_Deku_TargetPractice','Dm_LostWood_0040','Item_BulletBag_Medium','Score three perfect hits on the target in the Lost Woods to earn the seed-bag upgrade.');
// Scrub stock is in the actor's Dynamic shop parameters, already fetched by
// fetch-objects.cjs. Only the capacity-upgrade stock becomes an item marker.
const scrubUpgrades=new Map();
for(const o of require('./scene-data/objects.json').objects.filter(o=>o.type==='scrub'))for(const itemCode of o.sells||[]){
  if(!/^Item_(Stick|Nut)Bag_/.test(itemCode))continue;
  const key=[o.scene.split('_')[0],o.floor||'',o.pos[0],o.pos[2],itemCode].join(':');
  if(!scrubUpgrades.has(key))scrubUpgrades.set(key,{key:'reward:scrub:'+key,kind:'reward',group:'upgrades',item:/Stick/.test(itemCode)?'Deku Stick Capacity Upgrade':'Deku Nut Capacity Upgrade',itemCode,event:'Enemy_Scrub_Business_Common',object:o.name,gameId:String(BigInt(o.hash)),text:'Purchase the capacity upgrade from this Business Scrub.',records:[]});
  scrubUpgrades.get(key).records.push({scene:o.scene,position:o.pos,floor:o.floor??null,hash:String(BigInt(o.hash))});
}
sources.push(...scrubUpgrades.values());
// The adult trade sequence is verified at the NPC who gives each item.
for(const [key,item,scene,actor,event,code,text,proxy] of [
  ['pocket-egg','Pocket Egg','KakarikoVillage_Adult','Npc_Hylia_049_Adult','Npc_Hylia_049_Adult','Item_PocketEgg','Speak to the Cucco Lady as an adult.'],
  ['cojiro','Cojiro','KakarikoVillage_Adult','Npc_Hylia_049_Adult','Npc_Hylia_049_Adult','Item_CojiroCucco','Return the awakened Pocket Cucco to the Cucco Lady.'],
  ['mushroom','Odd Mushroom','LostWood_Adult','Npc_Hylia_017_Adult','Npc_Hylia_017_Adult','Item_OddMushroom','Show Cojiro to the man in the Lost Woods.'],
  ['potion','Odd Potion','KakarikoVillage_Adult','Npc_Hylia_053_Adult','Npc_Hylia_053_Adult','Item_OddPowder','Deliver the Odd Mushroom to the potion maker before time runs out.'],
  ['saw','Poacher’s Saw','LostWood_Adult','Npc_Kokiri_Fado_Adult','Npc_Kokiri_Fado_Adult','Item_PoacherSaw','Take the Odd Potion back to the Lost Woods.'],
  ['broken-sword','Broken Goron’s Sword','GerudoValley_Adult','Npc_Hylia_012_Adult','Npc_Hylia_012_Adult','Item_BrokenSword','Trade the Poacher’s Saw to the carpenter.'],
  ['prescription','Prescription','DeathMountainTrail_Adult','Npc_Goron_Biggoron_Adult','Npc_Goron_Biggoron_Adult','Item_Prescription','Bring the broken sword to Biggoron.'],
  ['frog','Eyeball Frog','ZoraDomain_Adult','Npc_Zora_KingZora_adult','Npc_Zora_KingZora_adult','Item_EyeballFrog','Show the Prescription to the thawed King Zora.'],
  ['drops','World’s Finest Eye Drops','HyruleField_Adult','Npc_Hylia_045_Adult','Npc_Hylia_045_Adult','Item_EyeDrop','Deliver the Eyeball Frog to the Lakeside Laboratory.','lake'],
  ['claim-check','Claim Check','DeathMountainTrail_Adult','Npc_Goron_Biggoron_Adult','Dm_DeathMtTrail_0050','Item_ClaimCheck','Deliver the eye drops to Biggoron before time runs out.']
])reward(key,item,'quest',scene,actor,event,code,text,proxy);
fs.writeFileSync(path.join(__dirname,'scene-data/item-sources.json'),JSON.stringify({source:'Owl Object Map placed objects; MrCheeze/oot-switch2-tools event and Banc records',sources,unresolved},null,2)+'\n');
console.log(JSON.stringify({chests:chests.size,stock:stocks.size,rewards:sources.filter(s=>s.kind==='reward').length,unresolved}));
