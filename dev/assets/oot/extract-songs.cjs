// Extract song-learning locations from the dumped Banc/event data.
// node dev/assets/oot/extract-songs.cjs /path/to/oot-switch2-tools
// Interior-only lessons use the mapped entrance, explicitly noted below.
const fs=require('fs'),path=require('path'),yaml=require('js-yaml');
const root=process.argv[2];
if(!root) throw Error('Pass the oot-switch2-tools source directory');
const schema=yaml.DEFAULT_SCHEMA.extend(['!ul','!u'].map(tag=>new yaml.Type(tag,{kind:'scalar',construct:s=>s})));
const actors=[];
for(const dir of fs.readdirSync(path.join(root,'Banc'))) {
  for(const file of fs.readdirSync(path.join(root,'Banc',dir))) {
    if(!file.endsWith('.yaml'))continue;
    const scene=file.replace(/_(Static|Dynamic).*$/,'');
    const data=yaml.load(fs.readFileSync(path.join(root,'Banc',dir,file),'utf8'),{schema});
    for(const actor of data.Actors||[])actors.push({scene,...actor});
  }
}
const result=[];
function add(id,title,scene,selector,text,event,proxy) {
  const a=actors.find(a=>a.scene===scene&&selector(a));
  if(!a)throw Error('Missing song source: '+title);
  result.push({id,title,scene,position:a.Translate,gameId:a.Hash,source:a.Name||a.Gyaml,event,text,proxy:proxy||null});
}
const named=name=>a=>a.Name===name;
const actor=name=>a=>a.Gyaml===name;
const event=name=>a=>a.Dynamic&&Object.values(a.Dynamic).includes(name);
add(64703001,"Zelda's Lullaby",'HyruleCastle',named('DoorOfTime_MeetImpa_StartPos'),'Impa teaches this song after meeting Princess Zelda.','Dm_MelodyGet_Zelda');
add(64703002,"Epona's Song",'HyruleField_Child',actor('Npc_Hylia_Malon_Child'),'Show Malon your ocarina at Lon Lon Ranch to learn her song.','SubEvent_GetEponaSong');
add(64703003,"Saria's Song",'SacredForestMeadow_Child',named('Dm_MelodyGet_Saria_in_front_of_Saria'),'Learn this song from Saria in the Sacred Forest Meadow.','Dm_MelodyGet_Saria');
add(64703004,"Sun's Song",'Graveyard_Child',named('GraveYard_Monument_00'),'Enter the Royal Family’s Tomb and read the inscription to learn this song.','Dm_MelodyGet_Sun','Shown at the tomb entrance because the interior is not drawn on the overworld map.');
add(64703005,'Song of Time','HyruleField_Child',event('HyruleField_DoorOfTime_GetOcarinaOfTime'),'Recover the Ocarina of Time to learn the song from Zelda’s message.','Dm_MelodyGet_Time');
add(64703006,'Song of Storms','KakarikoVillage_Adult',actor('OcarinaPoint_Kakariko_WindmillHouse_Adult'),'Show your ocarina to the music man inside the windmill as an adult.','Dm_MelodyGet_Storm');
add(64703007,'Minuet of Forest','SacredForestMeadow_Adult',named('Dm_MelodyGet_Forest_Position'),'Learn this warp song from Sheik in the Sacred Forest Meadow.','Dm_MelodyGet_Forest');
add(64703008,'Bolero of Fire','DeathMountainCrater_Adult',named('Dm_MelodyGet_Fire_LinkPosition'),'Learn this warp song from Sheik in Death Mountain Crater.','Dm_MelodyGet_Fire');
add(64703009,'Serenade of Water','IceCavern',event('SageOfWater_MelodyGet_Water'),'Learn this warp song from Sheik in the Ice Cavern after obtaining the Iron Boots.','Dm_MelodyGet_Water');
add(64703010,'Requiem of Spirit','DesertColossus_Child',event('Dm_MelodyGet_Spilit'),'Learn this warp song from Sheik after leaving the Spirit Temple.','Dm_MelodyGet_Spilit');
add(64703011,'Prelude of Light','Market_Adult',named('Dm_TimeTemple_0065Destination'),'Return to the Temple of Time and learn this warp song from Sheik.','Dm_MelodyGet_Shine','Shown at the Temple of Time entrance; the lesson takes place inside.');
add(64703012,"Scarecrow's Song",'HyruleField_Child',actor('Npc_Pierre'),'Play your own tune for the scarecrow at Lake Hylia as a child, then play it again as an adult.','SubEvent_GetScarecrow');
// This cutscene places the player numerically, rather than using a Banc anchor.
const shadow=fs.readFileSync(path.join(root,'event/Dm_MelodyGet_Shadow.c'),'utf8');
const position=shadow.match(/Player_Event\.EventPlayerWarpToTargetPosAndRot\([^\n]*'Position': (\[[^\]]+\])/);
if(!position)throw Error('Missing Nocturne learning position');
result.push({id:64703013,title:'Nocturne of Shadow',scene:'KakarikoVillage_Adult',position:JSON.parse(position[1]),gameId:'Dm_MelodyGet_Shadow',source:'EventPlayerWarpToTargetPosAndRot',event:'Dm_MelodyGet_Shadow',text:'Learn this warp song from Sheik after the burning-village event in Kakariko Village.'});
// Lake Hylia is a separately drawn overlay of the Hyrule Field game scene.
result.find(r=>r.id===64703012).scene='LakeHylia_Child';
const points=require('./scene-data/map-points.json');
const temple=points.find(r=>r.scene==='Market_Adult'&&r.kind==='PlayerIconAnchor');
if(!temple)throw Error('Missing mapped Temple of Time entrance');
result.find(r=>r.id===64703011).position=temple.position;
fs.writeFileSync(path.join(__dirname,'scene-data/song-sources.json'),JSON.stringify({source:'MrCheeze/oot-switch2-tools Banc and event scripts',songs:result},null,2)+'\n');
console.log(result.length+' song sources extracted');
