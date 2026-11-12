const fs=require('fs');
test('category zoom preference uses the existing game thresholds end to end',()=>{
  const api=fs.readFileSync('ajax/map_settings.php','utf8');
  const save=fs.readFileSync('ajax/map_settings_save.php','utf8');
  const ui=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(api).toContain('`visible_zoom`');
  expect(ui).toContain("'Visible Starting At'");
  expect(ui).toContain('name="visible_zoom"');
  expect(ui).toContain('visible_zoom: c.visible_zoom');
  expect(ui).toContain("visible_zoom: form.find('[name=visible_zoom]').val()");
  expect(save).toContain('FILTER_VALIDATE_INT');
  expect(save).toContain("'visible_zoom'=>'visible_zoom'");
  expect(fs.readFileSync('lib/common/settings_history.php','utf8')).toContain("'visible_zoom'=>'visible_zoom'");
});
test('focusing categories still bypasses automatic zoom thresholds',()=>{
  const source=fs.readFileSync('scripts/zmap.js','utf8');
  expect(source).toContain('!markerCategory._respectZoomThreshold');
  expect(source).toContain('!this.mapControl._categoryMenu.modeAutomatic');
});
