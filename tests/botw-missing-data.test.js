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
