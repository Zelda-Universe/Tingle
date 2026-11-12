const fs=require('fs'),path=require('path'),{execFileSync}=require('child_process');
test('settings history excludes regions and shares revision rows and field diffs',()=>{
  const api=fs.readFileSync('ajax/map_settings.php','utf8');
  expect(api).toContain("r.kind IN ('game','map','category','layout','map_order')");
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain('_wikiRevisionRow(Object.assign({},entry');
  expect(source).toContain('_wikiFieldDiffHTML(fields');
  expect(source).toContain("_wikiPost('map_settings_revert'");
  const page=source.slice(source.indexOf('ZMap.prototype._openMapSettings ='),source.indexOf('ZMap.prototype._mapSettingsRecords ='));
  expect(page).not.toContain('wiki-subtitle');
});
test('settings snapshots rewind later sparse edits without touching unrelated attributes',()=>{
  const helper=path.resolve('lib/common/settings_history.php');
  const php=`require ${JSON.stringify(helper)};
    $db=new class {function fetchAllAssociative($sql,$params) {return [
      ['data'=>json_encode(['before'=>['seo_description'=>'old seo']])],
      ['data'=>json_encode(['before'=>['name'=>'Original']])]
    ];}};
    echo json_encode(settingsHistorySnapshot($db,'',['id'=>4,'container_id'=>64,'kind'=>'game','target_id'=>64],['name'=>'Renamed','seo_description'=>'new seo']));`;
  expect(JSON.parse(execFileSync('php',['-r',php],{encoding:'utf8'}))).toEqual({name:'Original',seo_description:'old seo'});
});
test('restores only apply whitelisted editable fields and create a reversible revision',()=>{
  const api=fs.readFileSync('ajax/map_settings_revert.php','utf8');
  expect(api).toContain('mapSettingsRequire($db,$map_prefix)');
  expect(api).toContain('FOR UPDATE');
  expect(api).toContain('settingsHistoryColumns($kind)');
  expect(api).toContain("'action'=>'revert'");
  const php=`require ${JSON.stringify(path.resolve('lib/common/settings_history.php'))};echo json_encode(settingsHistoryColumns('map'));`;
  expect(JSON.parse(execFileSync('php',['-r',php],{encoding:'utf8'}))).toEqual({name:'name',description:'description',seo_description:'seo_description',always_show_categories:'always_show_categories'});
});
