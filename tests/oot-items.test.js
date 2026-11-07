const fs=require('fs'),path=require('path');
const {categories,chestCategory}=require('../dev/assets/oot/item-categories.cjs');
const root=path.resolve(__dirname,'..');
test.each([
  ['Kokiri Sword',64022],['Fairy Bow',64022],['Deku Shield',64023],['Mirror Shield',64023],
  ['Iron Boots',64024],['Hookshot',64024],['Lenses of Truth',64024],['Golden Gauntlets',64024],
  ['Dungeon Map',64025],['Compass',64026],['Small Key',64027],['Boss Key',64028],
  ['10 Arrows',64021],['Red Rupee',64021],['Business Scrub Seed',64021]
])('chest contents %s use the right category',(name,category)=>expect(chestCategory(name)).toBe(category));
test('item sources are actual chests, shop stock or verified rewards, not scenery/enemy equipment',()=>{
  const {sources,unresolved}=require('../dev/assets/oot/scene-data/item-sources.json');
  expect(unresolved).toEqual([]);
  expect(new Set(sources.map(s=>s.key)).size).toBe(sources.length);
  expect(sources.every(s=>s.records.length&&s.records.every(r=>r.position.every(Number.isFinite)))).toBe(true);
  for(const item of ['Kokiri Sword','Hookshot','Golden Gauntlets','Ice Arrow','Master Sword','Fire Arrows','Light Arrows','Goron’s Bracelet','Biggoron’s Sword','Stone of Agony','Deku Seed Bag Upgrade'])
    expect(sources.some(s=>s.item===item)).toBe(true);
  expect(sources.filter(s=>s.kind==='stock').every(s=>/^Shop_(Armor_|Weapon_Shield_|Mask_)/.test(s.object))).toBe(true);
  expect(sources.filter(s=>s.kind==='reward').every(s=>s.event&&s.itemCode)).toBe(true);
  expect(sources.find(s=>s.item==='Master Sword').records[0].scene).toBe('Market_Child');
});
test('item migration preserves old IDs, protects category changes and documents off-map references',()=>{
  const sql=fs.readFileSync(path.join(root,'migrations/20261106190000_oot_items.sql'),'utf8');
  expect(sql).not.toMatch(/\b(?:DELETE|DROP|TRUNCATE)\b/);
  const updates=sql.split('\n').filter(l=>l.startsWith('UPDATE marker SET'));
  expect(updates).toHaveLength(67);
  expect(updates.every(l=>/^UPDATE marker SET marker_category_id=\d+, last_updated=NOW\(\) WHERE id=\d+ AND marker_category_id=64021;$/.test(l))).toBe(true);
  const ids=[...sql.matchAll(/SELECT (6470[45]\d{3}), \d+, NULL, 2,/g)].map(m=>m[1]);
  expect(ids).toHaveLength(100);
  expect(new Set(ids).size).toBe(100);
  expect(sql).toContain('Dampé');
  expect(sql).toContain('does not yet have map artwork');
  expect(new Set(categories.map(c=>c[0])).size).toBe(categories.length);
  const report=require('../dev/assets/oot/scene-data/item-import-report.json');
  expect(report.skipped.every(s=>s.scenes.every(s=>['GerudoTrainingGround','InsideGanonCastle','Graveyard_Adult'].includes(s)))).toBe(true);
});
