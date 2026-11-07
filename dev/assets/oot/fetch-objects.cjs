// Downloads the placed objects OoT markers are made from, from zeldamods'
// Owl Object Map (https://objmap-oot.zeldamods.org, its radar server), and
// saves the ones we use to scene-data/objects.json: Gossip Stones, Kaepora
// Gaebora, warp-song pads, soft soil for Magic Beans, Business Scrubs (with
// what they sell), cows, Silver Rupees and Heart Containers.
//
//   node dev/assets/oot/fetch-objects.cjs
//
// Each object keeps its scene, game position [x, y, z], object ID (hash),
// type and zeldamods' label. A dungeon object also gets its floor (1F, B1...)
// from the floors' height ranges. places-to-sql.cjs reads the saved file, so
// the site never depends on their server.
const fs = require('fs');
const path = require('path');

const OBJMAP = 'https://objmap-oot.zeldamods.org/game_files/maps.json';
const RADAR = 'https://radar-oot.zeldamods.org';
const HEADERS = {'User-Agent': 'ZeldaMaps.com OoT import (github.com/Zelda-Universe/Zelda-Maps-Website)'};

// These rewards grant a bottle (empty or containing milk) in the event scripts,
// but their actors' ui_name labels do not mention the reward.
const BOTTLE_REWARDS = {
  Npc_Hylia_049_Child: 'Minigame_CatchCucco.c:RewardFlow',
  Npc_Hylia_048_BottleShop: 'Npc_Hylia_048_BottleShop.c',
  Npc_Hylia_Talon_Child: 'Minigame_FindOutCucco.c:Finish_Npc_Hylia_Talon_Child_StepStart'
};

// [type, test(object)]: the first that matches.
const TYPES = [
  ['thought', o => /^HrlField_Note_\d+$/.test(o.name)],
  ['bottle', o => /\bbottles?\b/i.test(o.ui_name || '') || !!BOTTLE_REWARDS[o.name]],
  ['gossip', o => /^Gossip Stone\b/.test(o.ui_name || '')],
  ['owl', o => o.ui_name === 'Kaepora Gaebora'],
  // Warp-song pads; Obj_WarpPoint_A_01 is a boss room's blue warp.
  ['warp', o => /^Obj_(\w+_)?WarpPoint_A_0[12]$/.test(o.name) && o.name !== 'Obj_WarpPoint_A_01'],
  ['bean', o => /^Soft soil \(plant Magic Beans/.test(o.ui_name || '')],
  ['scrub', o => o.name === 'Enemy_Scrub_Business'],
  ['cow', o => /\bcow\b/i.test(o.ui_name || '')],
  ['silver', o => /^Silver Rupee \(/.test(o.ui_name || '')],
  ['heart', o => /^Heart Container\b/.test(o.ui_name || '')]
];

const get = async url => {
  const response = await fetch(url, {headers: HEADERS});
  if(!response.ok) throw new Error(response.status + ' ' + url);
  return response.json();
};

// "B1_State00" -> "B1", "1F_Lv2_State01" -> "1F".
const floorOf = layer => layer.id.split('_')[0];

async function main() {
  const areas = (await get(OBJMAP)).areas;
  const objects = [];
  const scannedScenes = [];
  for(const area of areas) {
    for(const map of area.maps) {
      const found = await get(`${RADAR}/objs/${map.map_type}/${map.map_name}?q=*&withMapNames=true&limit=-1`);
      scannedScenes.push(map.map_name);
      for(const o of found) {
        const type = (TYPES.find(([, test]) => test(o)) || [])[0];
        if(!type) continue;
        // Talon also appears asleep at Hyrule Castle, but only his ranch
        // minigame placement awards the bottle.
        if(type === 'bottle' && o.name === 'Npc_Hylia_Talon_Child' && map.map_name !== 'HyruleField_Child') continue;
        // Audit bottles in every scene; keep other object imports restricted
        // to the normal field/dungeon maps, excluding museum/boss-rush copies.
        if(type !== 'bottle' && (!['field','dungeon'].includes(area.kind) || !map.layers.some(l => l.image))) continue;
        const entry = {type, scene: map.map_name, hash: o.hash_id, name: o.name, label: o.ui_name, pos: o.pos};
        if(type === 'bottle' && BOTTLE_REWARDS[o.name]) {
          entry.label += o.name === 'Npc_Hylia_Talon_Child' ? ' (reward: Bottle of Milk)' : ' (reward: Empty Bottle)';
          entry.rewardEvidence = 'https://github.com/MrCheeze/oot-switch2-tools/blob/c9027ee50e7efd36cc3109d5990f170b7f0b4611/event/' + BOTTLE_REWARDS[o.name].split(':')[0];
        }
        if(area.kind === 'dungeon') {
          const layer = map.layers.find(l => l.y && o.pos[1] >= l.y[0] && o.pos[1] < l.y[1]);
          entry.floor = layer ? floorOf(layer) : null;
        }
        if(type === 'scrub') {
          const detail = await get(`${RADAR}/obj/${map.map_type}/${map.map_name}/${o.hash_id}`);
          const dynamic = (detail.data && detail.data.Dynamic) || {};
          entry.sells = [0, 1, 2].map(i => dynamic['ScrubBusiness_ShopItemActorName' + i]).filter(Boolean);
        }
        objects.push(entry);
      }
      process.stdout.write('.');
    }
  }
  fs.writeFileSync(path.join(__dirname, 'scene-data', 'objects.json'), JSON.stringify({
    description: "Placed objects OoT markers are made from, from zeldamods' Owl Object Map (https://objmap-oot.zeldamods.org), saved by fetch-objects.cjs. pos is the game position [x, y, z]; floor is a dungeon object's floor.",
    objects, scannedScenes
  }, null, 1) + '\n');
  const counts = {};
  objects.forEach(o => { counts[o.type] = (counts[o.type] || 0) + 1; });
  console.log('\n' + JSON.stringify(counts));
}
if(require.main === module) main().catch(error => { console.error(error.message); process.exitCode = 1; });
module.exports = {TYPES};
