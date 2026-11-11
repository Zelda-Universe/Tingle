const fs=require('fs'),{execFileSync}=require('child_process'),path=require('path');
test('page title is independent, persisted and history tracked',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain("_mapSettingsField('Name (Page Title)'");
  expect(source).toContain("page_title:gameForm.find('[name=page_title]').val()");
  expect(fs.readFileSync('ajax/map_settings_layout.php','utf8')).toContain("['name'=>$name,'page_title'=>$pageTitle,'seo_description'=>$seo]");
  expect(fs.readFileSync('index.php','utf8')).toContain("$gameSettings['page_title'] ?: $gameSettings['name']");
  const php=`require ${JSON.stringify(path.resolve('lib/common/settings_history.php'))}; echo json_encode(settingsHistoryColumns('game'));`;
  expect(JSON.parse(execFileSync('php',['-r',php],{encoding:'utf8'})).page_title).toBe('page_title');
});
test('blank page titles inherit Name and OoT has an explicit stored override',()=>{
  const php=`require ${JSON.stringify(path.resolve('lib/common/game_metadata.php'))};echo defaultGamePageTitle('OoTR','Display Name');`;
  expect(execFileSync('php',['-r',php],{encoding:'utf8'})).toBe('Display Name');
  expect(fs.readFileSync('scripts/zmapsettings.js','utf8')).toContain('Leave blank to keep the same as Name');
  expect(fs.readFileSync('migrations/20261111070000_explicit_oot_page_title.sql','utf8')).toContain("page_title='Ocarina of Time Remake'");
});
test('reordering animates positions and honors reduced motion',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain('animatePositions(before)');
  expect(source).toContain('animatePositions(positions)');
  expect(source).toContain('(prefers-reduced-motion: reduce)');
  expect(source).toContain('duration:180');
});
