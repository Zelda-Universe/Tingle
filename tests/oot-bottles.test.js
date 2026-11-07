const fs=require('fs');
const path=require('path');
const {TYPES}=require('../dev/assets/oot/fetch-objects.cjs');
const root=path.resolve(__dirname,'..');
const classify=o=>(TYPES.find(([,test])=>test(o))||[])[0];

test('bottle labels include chests and rewards, not ordinary bottle-content refills',()=>{
  for(const ui_name of ['Bottle','Empty Bottle','Bottle (in chest)','Cucco Lady (reward: Bottle)'])
    expect(classify({name:'Test',ui_name})).toBe('bottle');
  expect(classify({name:'Shop_Bottle_RedPotion',ui_name:'Red Potion'})).not.toBe('bottle');
  expect(classify({name:'Npc_Hylia_049_Child',ui_name:'Cucco Lady'})).toBe('bottle');
  expect(classify({name:'Npc_Hylia_048_BottleShop',ui_name:'Poe Collector'})).toBe('bottle');
  expect(classify({name:'Npc_Hylia_Talon_Child',ui_name:'Talon'})).toBe('bottle');
});

test('every catalogued scene was searched and NPC reward evidence is retained',()=>{
  const data=require('../dev/assets/oot/scene-data/objects.json');
  expect(new Set(data.scannedScenes).size).toBe(80);
  const bottles=data.objects.filter(o=>o.type==='bottle');
  expect(bottles).toHaveLength(5);
  expect(bottles.every(o=>typeof o.hash==='string')).toBe(true);
  expect(bottles.filter(o=>o.rewardEvidence)).toHaveLength(3);
});

test('bottles are additive, use a new ID block, and place the letter on Lake Hylia',()=>{
  const sql=fs.readFileSync(path.join(root,'migrations/20261106170000_oot_bottles.sql'),'utf8');
  expect(sql.match(/INSERT INTO marker \(/g)).toHaveLength(5);
  expect(sql.match(/SELECT 6470100[1-5], 65000[01], NULL, 2, 64006/g)).toHaveLength(5);
  expect(sql).toContain('"region":"LakeHylia"');
  expect(sql).not.toMatch(/\b(?:DELETE|UPDATE|DROP|TRUNCATE)\b/);
  expect(sql).toContain("'Bottles', 1, 'General_Bottle'");
});
