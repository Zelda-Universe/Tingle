// Preserve the official Zelda Notes quest catalog without inventing positions.
// node dev/assets/oot/extract-gossip-quests.cjs /path/to/notes-default_oot/en-US.json
const fs=require('fs'),path=require('path');
const file=process.argv[2];
if(!file)throw Error('Pass the Zelda Notes en-US.json localization file');
const source=JSON.parse(fs.readFileSync(file,'utf8')).OotGossipResearch;
const quests=[];
for(const type of ['Actor','Stone'])for(const [id,title] of Object.entries(source[type])) {
  if(!new RegExp('^'+type+'\\d+$').test(id))continue;
  quests.push({id,type,title,hint:source[type][id+'Before'],solution:source[type][id+'After'],position:null});
}
if(quests.length!==100)throw Error('Expected 100 official Gossip Quests');
fs.writeFileSync(path.join(__dirname,'scene-data/gossip-quests.json'),JSON.stringify({
  source:'Zelda Notes notes-default_oot/en-US.json, OotGossipResearch',
  note:'Names and hints only. Target coordinates have not been recovered; these are not imported as map markers.',quests
},null,2)+'\n');
console.log(quests.length+' quest definitions extracted; no inferred coordinates');
