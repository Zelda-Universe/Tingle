const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// BotW's missing game data (migrations/20261120130000_botw_missing_data.sql,
// made by dev/assets/botw/missing-data.py from the game's files).
const up=read('migrations/20261120130000_botw_missing_data.sql');
const down=read('migrations/20261120130000_botw_missing_data.down.sql');
const data=JSON.parse(read('dev/assets/botw/missing-data.json'));
const markers=up.match(/^INSERT INTO marker \(.*$/gm);
const inCategory=id=>markers.filter(l=>l.includes(`, NULL, 2, ${id}, COALESCE(`)).length;
const category=id=>up.match(new RegExp(`^INSERT INTO marker_category .* SELECT ${id}, .*$`,'m'))[0];

test("all 152 of the game's quests: 15 main, 42 shrine, 77 side, 18 DLC",()=>{
  const kinds={};
  data.quests.forEach(q=>kinds[q.kind]=(kinds[q.kind]||0)+1);
  expect(kinds).toEqual({main:15,shrine:42,side:77,dlc:18});
  expect(new Set(data.quests.map(q=>q.name)).size).toBe(152);
  // Each starts somewhere: its giver, its trigger or a named place.
  data.quests.forEach(q=>expect(q.pos.length).toBe(3));
  // The site's 54 quest markers are among them, kept by id.
  expect(data.quests.filter(q=>q.existing).length).toBe(54);
  expect(inCategory(2286)+inCategory(2287)+inCategory(2288)+inCategory(1935)).toBe(152-54);
});

test('dragons, shops, DLC and Master Mode, each in their own category',()=>{
  expect(inCategory(2284)).toBe(6);
  expect(inCategory(2285)).toBe(37);
  expect(inCategory(2290)).toBe(118);
  expect(inCategory(2291)).toBe(107);
  expect(inCategory(2292)).toBe(4);
  // The 24 DLC chests are all on the site already: they move to their category.
  expect(data.dlcChests.every(c=>c.existing)).toBe(true);
  expect(data.edits.filter(e=>e.category===2289).length).toBe(24);
  // The Xenoblade Chronicles 2 tie-in's chests are normal equipment chests.
  expect(data.collabChests.length).toBe(3);
});

test('DLC categories look like Shrine of Trials (DLC); Master Mode is a section of its own',()=>{
  [2288,2289].forEach(id=>expect(category(id)).toContain("'#4395f7', 6, 1, 1, 'diamond', '#ffffff'"));
  [2290,2291,2292].forEach(id=>{
    expect(category(id)).toMatch(/, 19, '[^']+\(Master Mode\)', 1, '[^']+', '#a8324a', 6, 1, 1, 'diamond', '#ffffff'/);
    expect(category(id)).toContain("'Master Mode'");
  });
  expect(category(2286)).toContain(", 19, 'Main Quests', 1, ");
});

test('each dragon flies its own path, starting at its marker',()=>{
  const paths=up.match(/^INSERT INTO `path` .*$/gm);
  expect(paths.length).toBe(6);
  paths.forEach(l=>expect(l).toMatch(/'official', 'public', 'editors', NOW\(\), '(?:[^']|'')+Flight Path(?:[^']|'')*', '[a-z-]+', '', 'single', [01], 0, 1, 1, 2284, /));
  expect((up.match(/1 AS `step_order`, 196\d{5} AS `marker_id`/g)||[]).length).toBe(6);
});

test("the site's markers keep their ids and completions: each change is in their history, and only while unchanged",()=>{
  expect(up).not.toMatch(/DELETE /);
  const updates=up.match(/^UPDATE marker SET .*$/gm);
  expect(updates.length).toBe(data.edits.length);
  updates.forEach(l=>expect(l).toMatch(/WHERE id = \d+ AND name = '.*' AND last_updated = '[\d-]+ [\d:]+';$/));
  expect(up.match(/^INSERT INTO marker_revision .*'edit'.*$/gm).length).toBe(updates.length);
  // The typos are gone.
  expect(up).toContain("UPDATE marker SET name = 'The Horseback Hoodlums'");
  expect(up).toContain("UPDATE marker SET name = 'Hestu (3rd Encounter)'");
  expect(up).toContain("UPDATE marker SET name = 'A Royal Recipe'");
});

test('safe to run twice, one statement per line, and the down puts it all back',()=>{
  up.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
  markers.forEach(l=>expect(l).toMatch(/WHERE NOT EXISTS \(SELECT 1 FROM marker WHERE id = 196\d{5}\);$/));
  // No game_data: zmap.js shows a marker's text only without it.
  markers.forEach(l=>expect(l).toMatch(/, '', NULL, 1, NOW\(\) FROM DUAL/));
  expect(down).toContain('DELETE FROM marker WHERE id BETWEEN 19600001 AND ');
  expect(down.match(/^UPDATE marker SET .*$/gm).length).toBe(data.edits.length);
  expect(down).toMatch(/DELETE c FROM marker_category c WHERE c.id IN \(2284, 2285, 2286, 2287, 2288, 2289, 2290, 2291, 2292\) AND NOT EXISTS/);
});

// Master Mode's minor enemies, in a migration of their own
// (migrations/20261120140000_botw_master_mode_lookouts.sql).
test("Master Mode's 152 lookouts and extra minor enemies, each a marker in Enemies (Master Mode)",()=>{
  const lookouts=read('migrations/20261120140000_botw_master_mode_lookouts.sql');
  const lookoutsDown=read('migrations/20261120140000_botw_master_mode_lookouts.down.sql');
  expect(data.masterLookouts.length).toBe(152);
  const rows=lookouts.match(/^INSERT INTO marker \(.*$/gm);
  expect(rows.length).toBe(152);
  rows.forEach(l=>{
    expect(l).toMatch(/SELECT 1960\d{4}, 1901, NULL, 2, 2292, /);
    expect(l).toMatch(/'(Bokoblin|Lizalfos|Moblin)'/);
    expect(l).toMatch(/WHERE NOT EXISTS \(SELECT 1 FROM marker WHERE id = \d+\) AND EXISTS \(SELECT 1 FROM marker_category WHERE id = 2292\);$/);
  });
  expect(lookouts.match(/^INSERT INTO marker_tab .*$/gm).length).toBe(data.masterLookouts.filter(e=>e.lookout).length);
  lookouts.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
  expect(lookoutsDown).toContain('DELETE FROM marker WHERE id BETWEEN 19601001 AND 19601152;');
});

// Every enemy in normal play (migrations/20261120150000_botw_all_enemies.sql).
test('every enemy: common ones in a Common Enemies section, the rest with Rare Enemies & Bosses',()=>{
  const all=read('migrations/20261120150000_botw_all_enemies.sql');
  const allDown=read('migrations/20261120150000_botw_all_enemies.down.sql');
  expect(all).toContain("UPDATE marker_category SET menu_section = 'Rare Enemies & Bosses' WHERE container_id = 19 AND menu_section = 'Enemies & Bosses';");
  expect(allDown).toContain("UPDATE marker_category SET menu_section = 'Enemies & Bosses' WHERE container_id = 19 AND menu_section = 'Rare Enemies & Bosses';");
  ['Bokoblin','Moblin','Lizalfos','Chuchu','Keese','Octorok','Pebblit'].forEach(n=>
    expect(all).toMatch(new RegExp(`SELECT \\d+, 1930, 1, 19, '${n}', 1, 'BotW_Enemies', '#ff422e', 7, 1, 0, NULL, NULL, 'Common Enemies', 44 `)));
  expect(all).toContain("19, 'Yiga Clan', 1, 'BotW_Enemies', '#ff422e', 7, 1, 0, NULL, NULL, 'Rare Enemies & Bosses', 24 ");
  const rows=all.match(/^INSERT INTO marker \(.*$/gm);
  expect(rows.length).toBe(data.enemies.length+data.enemyFills.length);
  expect(data.enemies.length).toBeGreaterThan(3000);
  // Not the One-Hit Obliterator trials' stand-ins, or Master Mode's.
  data.enemies.forEach(e=>expect(e.actor).not.toMatch(/DLC2/));
  expect(new Set(data.enemies.map(e=>e.hash)).size).toBe(data.enemies.length);
  all.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
  expect(allDown).toMatch(/DELETE FROM marker WHERE id BETWEEN 19610001 AND 1961\d{4};/);
});

// Older enemy markers the game's now stand for
// (migrations/20261120160000_botw_merge_duplicate_enemies.sql).
test('duplicate enemy markers are hidden, their completions copied (and listed for the down)',()=>{
  const merge=read('migrations/20261120160000_botw_merge_duplicate_enemies.sql');
  const mergeDown=read('migrations/20261120160000_botw_merge_duplicate_enemies.down.sql');
  const old=[40,49,234,235,368,369,370,254,474];
  old.forEach(id=>{
    expect(merge).toContain(`UPDATE marker SET visible = 0, last_updated = NOW() WHERE id = ${id} AND visible = 1;`);
    expect(merge).toMatch(new RegExp(`SELECT m.id, 15, 'edit', 'Hidden: the same as [^']+', NULL, .* WHERE m.id = ${id} AND m.visible = 1;`));
  });
  // Completions are copied before the marker is hidden, only while it's shown.
  expect(merge.indexOf('INSERT IGNORE INTO user_completed_marker')).toBeLessThan(merge.indexOf('UPDATE marker SET visible = 0'));
  merge.match(/^INSERT IGNORE INTO user_completed_marker .*$/gm).forEach(l=>expect(l).toMatch(/AND EXISTS \(SELECT 1 FROM marker WHERE id = \d+ AND visible = 1\)/));
  expect(merge).not.toMatch(/DELETE /);
  expect(mergeDown).toContain('DELETE u FROM user_completed_marker u JOIN marker_merge_backup b ON b.user_id = u.user_id AND b.marker_id = u.marker_id;');
  expect(mergeDown).toContain(`UPDATE marker SET visible = 1 WHERE id IN (${old.join(', ')}) AND visible = 0;`);
  merge.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
});

// The DLC and Master Mode categories restyled
// (migrations/20261120170000_botw_dlc_master_mode_icons.sql).
test('DLC quests are circles; DLC and Master Mode chests are shapeless; Master Mode platforms and enemies are circles',()=>{
  const icons=read('migrations/20261120170000_botw_dlc_master_mode_icons.sql');
  const iconsDown=read('migrations/20261120170000_botw_dlc_master_mode_icons.down.sql');
  expect(icons).toContain("shape = 'none', color = '#0d2b52', glyph_color = '#4395f7' WHERE id = 2289 AND shape = 'diamond'");
  expect(icons).toContain("shape = 'none', color = '#3a0b16', glyph_color = '#a8324a' WHERE id = 2290 AND shape = 'diamond'");
  [2291,2292].forEach(id=>expect(icons).toContain(`shape = 'circle', color = '#a8324a', glyph_color = '#ffffff' WHERE id = ${id} AND shape = 'diamond'`));
  expect(icons).toContain("shape = 'circle', color = '#4395f7', glyph_color = '#ffffff' WHERE id = 2288 AND shape = 'diamond'");
  expect(iconsDown.match(/^UPDATE marker_category SET shape = 'diamond'/gm).length).toBe(5);
});
