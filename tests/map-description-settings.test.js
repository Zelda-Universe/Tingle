const fs=require('fs');
test('individual map settings show SEO description without a display description',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  const form=source.slice(source.indexOf('ZMap.prototype._openMapSettingsMap ='),source.indexOf('ZMap.prototype._openMapSettingsCategory ='));
  expect(form).not.toContain("name=description");
  expect(form).not.toContain("_mapSettingsField('Map Description'");
  expect(form).toContain("_mapSettingsField('SEO Description'");
  expect(form).toContain("attr('placeholder',map.defaultSeoDescription");
  expect(form).toContain('_editorSaveHTML(true)');
  expect(form).toContain('_editorSaveState(form,dirty,valid,busy)');
  const endpoint=fs.readFileSync('ajax/map_settings_save.php','utf8');
  expect(endpoint).toContain("'description' => 'description', 'seo_description' => 'seo_description'");
});
test('top-level game editor only exposes SEO content and uses the shared default',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain('map-settings-game-seo');
  expect(source).toContain("(seoOnly ? ['seo_description'] : ['name','seo_description'])");
  expect(source).toContain("kind: seoOnly ? 'game' : 'map'");
  expect(fs.readFileSync('index.php','utf8')).toContain('defaultGameSeoDescription($gameId)');
  expect(fs.readFileSync('ajax/map_settings.php','utf8')).toContain("defaultGameSeoDescription($game['short_name'])");
});
test('map ordering shares accessible category handles and validates the entire map set',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain('_mapSettingsSortable(mapRoot,update)');
  expect(source).toContain("_wikiPost('map_settings_layout'");
  const endpoint=fs.readFileSync('ajax/map_settings_layout.php','utf8');
  expect(endpoint).toMatch(/mapSettingsRequire\(\$db,\s*\$map_prefix\)/);
  expect(endpoint).toContain('if($expected!==$actual)');
  expect(endpoint).toContain('FOR UPDATE');
  expect(endpoint).toContain("'map_order',0,$summary");
});
test('main settings use one shared sticky save form with a marker-style summary',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  const main=source.slice(source.indexOf('ZMap.prototype._renderMapSettings ='),source.indexOf('ZMap.prototype._confirmLeaveMapSettings ='));
  expect((main.match(/_gameSettingsSavebarHTML\(\)/g) || []).length).toBe(1);
  expect(source).toContain('What did you change? (optional)');
  expect(main).not.toContain('_renderMapSettingsHistory(');
  expect(main).toContain("summary:savebar.find('[name=summary]').val()");
});
test('game settings expose a validated game name and omit section counts',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain("reopen.label = 'Game Settings'");
  expect(source).toContain("gameForm.find('[name=name]').val(data.game.name)");
  const section=source.slice(source.indexOf('ZMap.prototype._mapSettingsSectionNode ='),source.indexOf('ZMap.prototype._renameMapSettingsSection ='));
  expect(section).not.toContain('<span class="map-settings-extra">');
  const endpoint=fs.readFileSync('ajax/map_settings_layout.php','utf8');
  expect(endpoint).toContain("strip_tags($name)!==$name");
  expect(endpoint).toContain('$gameBefore[$field]=$oldGame[$field]');
});
test('game field changes share one revision and discard remains hidden',()=>{
  const endpoint=fs.readFileSync('ajax/map_settings_layout.php','utf8');
  expect((endpoint.match(/'game',\$containerId,\$summary/g) || []).length).toBe(1);
  expect(endpoint).toContain("'before'=>$gameBefore,'after'=>$gameAfter");
  expect(endpoint).toContain('if(!$hasLayout) $layout=$before;');
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain("savebar.find('.map-settings-discard').prop('hidden', true)");
});
