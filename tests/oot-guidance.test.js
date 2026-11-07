const fs=require('fs'),path=require('path');
const root=path.resolve(__dirname,'..');
test('Fairy Thoughts are note actors, not healing Fairy Spirits',()=>{
  const {TYPES}=require('../dev/assets/oot/fetch-objects.cjs');
  const classify=o=>(TYPES.find(([,test])=>test(o))||[])[0];
  expect(classify({name:'HrlField_Note_00'})).toBe('thought');
  expect(classify({name:'Obj_FairySpirit',ui_name:'Fairy Spirit'})).not.toBe('thought');
});
test('songs are thirteen lessons, not song-use switches or warp pads',()=>{
  const {songs}=require('../dev/assets/oot/scene-data/song-sources.json');
  expect(songs).toHaveLength(13);
  expect(new Set(songs.map(s=>s.id)).size).toBe(13);
  expect(songs.every(s=>s.event&&s.source&&s.position.every(Number.isFinite))).toBe(true);
  expect(songs.find(s=>s.title==="Scarecrow's Song").scene).toBe('LakeHylia_Child');
  expect(songs.find(s=>s.title==='Serenade of Water').scene).toBe('IceCavern');
});
test('guidance migration is additive with isolated stable IDs',()=>{
  const sql=fs.readFileSync(path.join(root,'migrations/20261106180000_oot_guidance.sql'),'utf8');
  expect(sql.match(/INSERT INTO marker \(/g)).toHaveLength(36);
  expect(sql).not.toMatch(/\b(?:DELETE|UPDATE|DROP|TRUNCATE)\b/);
  const ids=[...sql.matchAll(/SELECT (6470[23]\d{3}), \d+, NULL, 2, 6400[78]/g)].map(m=>m[1]);
  expect(ids).toHaveLength(36);
  expect(new Set(ids).size).toBe(36);
  expect(sql).toContain('Royal Family');
  const registry=require('../dev/assets/oot/scene-data/guidance-ids.json');
  const thoughts=Object.entries(registry).filter(([key])=>/^HrlField_Note_\d+$/.test(key)).map(([,id])=>id);
  expect(thoughts).toHaveLength(23);
  expect(new Set(thoughts).size).toBe(23);
});
test('Gossip Quest catalog is distinct from imported Gossip Stones and has no fabricated locations',()=>{
  const {quests}=require('../dev/assets/oot/scene-data/gossip-quests.json');
  expect(quests).toHaveLength(100);
  expect(quests.filter(q=>q.type==='Actor')).toHaveLength(60);
  expect(quests.filter(q=>q.type==='Stone')).toHaveLength(40);
  expect(new Set(quests.map(q=>q.id)).size).toBe(100);
  expect(quests.every(q=>q.position===null&&q.title&&q.hint&&q.solution)).toBe(true);
});
