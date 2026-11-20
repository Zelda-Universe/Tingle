const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// BotW's Korok races as paths, as TotK's (migrations/20261120120000_botw_korok_races.sql,
// made by dev/assets/botw/korok-races.cjs from zeldamods' radar).
const up=read('migrations/20261120120000_botw_korok_races.sql');
const down=read('migrations/20261120120000_botw_korok_races.down.sql');
const {races}=JSON.parse(read('dev/assets/botw/korok-races.json'));

test('51 races, each a different Korok Seed marker',()=>{
  expect(races.length).toBe(51);
  expect(new Set(races.map(r=>r.markerId)).size).toBe(51);
});

test('each race is an official unlisted one-check path: a shown start pin, then its korok, as Jess\'s, with its history',()=>{
  const inserts=up.match(/^INSERT INTO `path` .*$/gm);
  expect(inserts.length).toBe(51);
  inserts.forEach(l=>{
    expect(l).toMatch(/SELECT 19, 15, 'official', 'unlisted', 'editors', NOW\(\), 'Korok Race', 'korok-race-\d+', '', 'single', 0, 0, 0, 1, 1916, '#3cbc75'/);
    expect(l).toMatch(/AND EXISTS \(SELECT 1 FROM `marker` WHERE id = \d+ AND marker_category_id = 1916 AND submap_id = 1901\);$/);
  });
  expect((up.match(/NULL AS `marker_id`, 1901 AS `submap_id`, [-\d.]+ AS `x`, [-\d.]+ AS `y`, 'Korok Race: Start' AS `name`, NULL AS `note`, 1 AS `shown`/g) || []).length).toBe(51);
  races.forEach(r=>expect(up).toContain(`2 AS \`step_order\`, ${r.markerId} AS \`marker_id\``));
  expect(up.match(/^INSERT INTO `path_revision` .*'create'.*$/gm).length).toBe(51);
});

test('safe to run twice, one statement per line, and the down removes only these',()=>{
  up.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
  expect(up.match(/WHERE NOT EXISTS \(SELECT 1 FROM `path` WHERE container_id = 19 AND slug = /g).length).toBe(51);
  races.forEach(r=>expect(down).toContain(`'korok-race-${r.markerId}'`));
  down.split('\n').filter(l=>l.startsWith('DELETE')).forEach(l=>expect(l).toMatch(/container_id = 19 AND p?\.?user_id = 15 AND p?\.?slug IN \(/));
});
