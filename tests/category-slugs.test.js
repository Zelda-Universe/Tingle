const fs=require('fs');
const vm=require('vm');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

test('custom category slugs override names and blank slugs keep automatic URLs',()=>{
  const context={ZMap:function(){}};
  vm.runInNewContext(read('scripts/services/CategoryPage.js'),context);
  const map=new context.ZMap();
  expect(map.categoryURLKey({name:'A New Title',slug:'stable-link'})).toBe('stable-link');
  expect(map.categoryURLKey({name:'Items & Equipment',slug:''})).toBe('items-and-equipment');
});

test('category slug is saved, returned, and tracked independently',()=>{
  expect(read('ajax/map_settings_save.php')).toContain("'slug'=>'slug'");
  expect(read('lib/common/settings_history.php')).toContain("'slug'=>'slug'");
  expect(read('lib/common/seo.php')).toContain("$row['slug'] : seoSlug($name)");
  expect(read('scripts/zmapsettings.js')).toContain("slug: form.find('[name=slug]').val().trim()");
});

test('rich text keyboard focus participates in drawer viewport protection',()=>{
  expect(read('scripts/zmap.js')).toContain("editor.on('focus', function()");
  expect(read('scripts/zmap.js')).toContain('control._keyboardDrawerViewport={height:control._viewportHeight()');
  expect(read('scripts/controls/ZLayers.js')).toContain("active.tagName==='IFRAME' && active.closest('.tox-tinymce')");
});
