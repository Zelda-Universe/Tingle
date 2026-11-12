/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
const context={ZMap:function(){},$};
vm.runInNewContext(fs.readFileSync('scripts/zwiki.js','utf8'),context);
test('logged-out visitors see Edit, History and Talk, but never Delete',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{getUser:()=>null,_isWikiEditor:()=>false,_canEditMarker:()=>false});
  const tools=$(map._markerEditorToolsHTML({id:123}));
  expect(tools.find('[data-editor-action]').map((i,e)=>e.getAttribute('data-editor-action')).get()).toContain('edit');
  expect(tools.find('[data-editor-action="history"]')).toHaveLength(1);
  expect(tools.find('[data-editor-action="talk"]')).toHaveLength(1);
  expect(tools.find('[data-editor-action="delete"]')).toHaveLength(0);
  expect(tools.find('.marker-editor-meta')).toHaveLength(0);
});
test('marker identity and original creator are only shown to admins',()=>{
  for(const level of [1,5,10]) {
    const map=Object.assign(Object.create(context.ZMap.prototype),{getUser:()=>({level}),_isWikiEditor:()=>level>=5,_canEditMarker:()=>false,_wikiUserLink:()=>'<a>Creator</a>'});
    const tools=$(map._markerEditorToolsHTML({id:123,userId:2,userName:'Creator'}));
    expect(tools.find('.marker-editor-meta')).toHaveLength(level===10?1:0);
  }
});
test('non-beta Edit clicks show the beta modal rather than invoking the edit handler',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{_isWikiEditor:()=>false,_showEditingBetaAlert:jest.fn(),_wireWikiLinks:jest.fn()});
  const root=$('<div><button data-editor-action="edit">Edit</button></div>');
  const handler=jest.fn();map._wireEditorTools(root,handler);
  root.find('button').trigger('click');
  expect(map._showEditingBetaAlert).toHaveBeenCalledTimes(1);
  expect(handler).not.toHaveBeenCalled();
});
test('read endpoints allow public viewers while all write endpoints retain editor authorization',()=>{
  for(const file of ['talk_get','marker_history','marker_revision','likes_get']) expect(fs.readFileSync('ajax/'+file+'.php','utf8')).toContain('wikiReadViewer(');
  for(const file of ['talk_post','likes_set','marker_revert']) expect(fs.readFileSync('ajax/'+file+'.php','utf8')).toContain('wikiRequireEditor(');
});
