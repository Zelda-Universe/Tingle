/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
function setup() {
  document.head.innerHTML='<script src="http://localhost/res.php?type=javascript&v=test-version"></script>';
  const context={ZMap:function(){},$,window,document,URL,toastr:{error:jest.fn()}};
  vm.runInNewContext(fs.readFileSync('scripts/services/FeatureLoader.js','utf8'),context);
  let content='category',mapId=1;
  const zmap=new context.ZMap();zmap.mapControl={getContentType:()=>content,getCurrentMap:()=>({mapId,subMapId:1})};window.zMap=zmap;
  return {context,zmap,navigate:type=>{content=type;},switchMap:()=>{mapId=2;},script:()=>document.querySelector('script[src*="MarkerEditor"]')};
}
afterEach(()=>{delete window.zMap;document.head.innerHTML='';});
test('secondary tool code is absent from the startup manifest but included in asset versioning',()=>{
  const main=fs.readFileSync('javascript.txt','utf8');
  expect(main).not.toContain('scripts/zmapsettings.js');
  expect(main).not.toContain('scripts/features/MarkerEditor.js');
  expect(main).toContain('scripts/services/SettingsFields.js');
  expect(fs.readFileSync('lib/common/assets.php','utf8')).toContain("'lazyjs.txt'");
});
test('opening a tool loads once, preserves arguments and only handles the latest request',()=>{
  const {context,zmap,script}=setup(),run=jest.fn();
  zmap._createMarkerForm('first');zmap._createMarkerForm('second');
  expect(document.querySelectorAll('script[src*="MarkerEditor"]')).toHaveLength(1);
  expect(script().src).toContain('?v=test-version');
  context.ZMap.prototype._createMarkerForm=run;script().onload();
  expect(run).toHaveBeenCalledTimes(1);expect(run).toHaveBeenCalledWith('second');
  expect(run.mock.instances[0]).toBe(zmap);
});
test.each(['navigate','switch','map'])('finishing a download after %s does not reopen an old page',kind=>{
  const {context,zmap,script,navigate,switchMap}=setup(),run=jest.fn();
  zmap._createMarkerForm({id:1});
  if(kind==='navigate') navigate('account'); else if(kind==='map') switchMap(); else window.zMap={};
  context.ZMap.prototype._createMarkerForm=run;script().onload();
  expect(run).not.toHaveBeenCalled();
});
test('failed downloads can be retried',()=>{
  const {context,zmap,script}=setup();zmap._createMarkerForm();script().onerror();
  expect(script()).toBeNull();expect(context.toastr.error).toHaveBeenCalled();
  zmap._createMarkerForm();expect(script()).not.toBeNull();
});
test('a response without the expected code fails cleanly and permits retry',()=>{
  const {context,zmap,script}=setup();zmap._createMarkerForm();script().onload();
  expect(script()).toBeNull();expect(context.toastr.error).toHaveBeenCalled();
  zmap._createMarkerForm();expect(script()).not.toBeNull();
});
test('shared settings helpers are available without downloading Game Settings',()=>{
  const context={ZMap:function(){},$};
  vm.runInNewContext(fs.readFileSync('scripts/services/SettingsFields.js','utf8'),context);
  const zmap=new context.ZMap();zmap.getUser=()=>({level:15});zmap.WIKI_EDITOR_LEVEL=5;
  expect(zmap._canUseMapSettings()).toBe(true);
  zmap._editorFieldHTML=jest.fn(()=>'<field>');
  expect(zmap._mapSettingsField('Name','fa-heading','<input>')).toBe('<field>');
  expect(zmap._editorFieldHTML).toHaveBeenCalledWith('fa-heading','<input>','Name');
});
