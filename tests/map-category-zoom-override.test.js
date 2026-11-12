const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync('scripts/zmap.js','utf8');
const start = source.indexOf('ZMap.prototype._shouldShowMarker =');
const end = source.indexOf('ZMap.prototype._labelTierShown',start);
const scope = {ZMap:function(){},verbose:false,mapBounds:{contains:()=>true}};
vm.runInNewContext(source.slice(start,end),scope);

function fixture(always) {
  const category={checked:true,visible_zoom:8,_respectZoomThreshold:true};
  return {categories:{1:category},mapOptions:{showPoiLabels:true,showCompleted:true,categorySelectionMethod:'focus'},
    mapControl:{currentMapLayer:{alwaysShowCategories:always},_categoryMenu:{modeAutomatic:true}},_getDisplayZoom:()=>1};
}
const marker={categoryId:1,categoryTypeId:1,visible:true,getLatLng:()=>({lat:0,lng:0})};

test('per-map override bypasses zoom thresholds, not category visibility or completion filters',()=>{
  const map=fixture(true),show=scope.ZMap.prototype._shouldShowMarker;
  expect(show.call(map,marker)).toBe(true);
  map.categories[1].checked=false;
  expect(show.call(map,marker)).toBe(false);
  map.categories[1].checked=true;
  map.mapOptions.showCompleted=false;
  expect(show.call(map,{...marker,complete:true})).toBe(false);
  expect(show.call(map,{...marker,visible:false})).toBe(false);
});

test('maps without the override retain their category zoom thresholds',()=>{
  expect(scope.ZMap.prototype._shouldShowMarker.call(fixture(false),marker)).toBe(false);
});

test('setting is editable, persisted, and included in revision history',()=>{
  for(const file of ['ajax/get_map.php','ajax/map_settings.php','ajax/map_settings_save.php','lib/common/settings_history.php','scripts/zmapsettings.js']) {
    expect(fs.readFileSync(file,'utf8')).toContain('always_show_categories');
  }
  const migration=fs.readFileSync('migrations/20261112040000_map_category_zoom_override.sql','utf8');
  expect(migration).toContain("WHERE `kind`='dungeon'");
  expect(migration).not.toMatch(/UPDATE\s+`?marker\b/i);
});
