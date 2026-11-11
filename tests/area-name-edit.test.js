const fs=require('fs');
const vm=require('vm');
const path=require('path');
const source=fs.readFileSync(path.join(__dirname,'../scripts/services/AreaSearch.js'),'utf8');

test.each([null,{level:5},{level:10}])('area Edit is restricted to admins: %j',viewer=>{
  const created=[];
  function element(html) {
    const node={find:()=>element(''),text:()=>node,toggle:()=>node,insertAfter:()=>node,
      append:()=>node,on:()=>node,contents:()=>[]};
    if(html) created.push(html);
    return node;
  }
  const context={ZMap:function(){},$:element,document:{title:''},isOcarina:()=>false};
  vm.runInNewContext(source,context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    getUser:()=>viewer,mapOptions:{name:'Test'},_getAreaMarkers:()=>[],_categoryListOrder:()=>({}),updateRegionBorders:()=>{},
    _markerEditorToolsHTML:()=>'<section class="area-admin-actions"></section>',_wireEditorTools:()=>{},
    mapControl:{currentMapLayer:{},setContent:()=>{},_contents:{querySelector:()=>null}}
  });
  map._showAreaPage({id:1,name:'Test Area'},null);
  expect(created.some(html=>html.includes('area-admin-actions'))).toBe(!!viewer && viewer.level>=10);
});

test('rename endpoint enforces server-side admin authorization',()=>{
  const endpoint=fs.readFileSync(path.join(__dirname,'../ajax/admin_area_name.php'),'utf8');
  expect(endpoint.indexOf('adminRequire(')).toBeLessThan(endpoint.indexOf('begin();'));
  expect(endpoint).toContain('if ($adminId === null) return;');
  expect(endpoint).toContain('mapSettingsRecord($db,$map_prefix,$row[\'container_id\'],$adminId');
  expect(endpoint).toContain('wikiEnsureBaseline(');
  expect(endpoint).toContain('wikiRecordRevision(');
  expect(endpoint.indexOf("'changed'=>false")).toBeLessThan(endpoint.indexOf('begin();'));
});

test('area revisions preserve an empty user summary without invented text',()=>{
  const endpoint=fs.readFileSync(path.join(__dirname,'../ajax/admin_area_name.php'),'utf8');
  expect(endpoint).not.toContain('Updated area');
  expect(endpoint).toContain("wikiRecordRevision($db,$map_prefix,$label['id'],$adminId,'edit',$summary)");
  expect(endpoint).toContain('$adminId,$kind,$id,$summary,');
});

test('name editor uses standard controls and only enables valid changed names',()=>{
  const editor=source.slice(source.indexOf('ZMap.prototype._editAreaName ='),source.indexOf('ZMap.prototype.updateAreaCompletionCounts'));
  expect(editor).toContain("this._mapSettingsField('Name'");
  expect(editor).toContain('map-settings-form area-name-edit-form');
  expect(editor).toContain("this._mapSettingsField('Summary'");
  expect(editor).toContain('password-validation-icon');
  expect(editor).toContain('role="status"');
  expect(editor).toContain('this._editorSaveHTML(true)');
  expect(editor).toContain('zmap._editorNameError(value,45,false)');
  expect(editor).toContain('zmap._editorSaveState(form,dirty,!error,busy)');
  expect(editor).toContain("this._mapSettingsField('Description','fa-align-left'");
  expect(editor).toContain("form.find('[name=description]').val().trim()!==originalDescription");
});

test('region history shares marker history markup and row rendering',()=>{
  const start=source.indexOf('ZMap.prototype._openAreaHistory =');
  const history=source.slice(start,source.indexOf('ZMap.prototype._editAreaName =',start));
  expect(history).toContain('id="marker_history" class="wiki-page"');
  expect(history).toContain('class="wiki-revisions"');
  expect(history).toContain('_wikiRevisionRow(revision,{current:index===0})');
  expect(history).toContain('_wikiDiffHTML(');
  expect(history).toContain('_wikiHistoryEmptyHTML()');
  const endpoint=fs.readFileSync(path.join(__dirname,'../ajax/admin_area_history.php'),'utf8');
  expect(endpoint).toContain('adminRequire($db, $map_prefix)');
  expect(endpoint).toContain('map_revision');
});
