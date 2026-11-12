const fs=require('fs');
const vm=require('vm');
const path=require('path');
test('dialog centering overrides the TinyMCE mobile top-alignment selector',()=>{
  const css=fs.readFileSync(path.join(__dirname,'../styles/zmain.css'),'utf8');
  expect(/body:not\(\.tox-force-desktop\) \.tox \.tox-dialog\s*\{[^}]*align-self:\s*center/.test(css)).toBe(true);
});
test('new media dialogs start on Upload without changing existing-media dialogs',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');
  const start=source.indexOf("    editor.on('init',function() {");
  const end=source.indexOf('    var positionEditorDialogs=',start);
  const open=jest.fn();
  let initialize;
  const editor={selection:{getNode:()=>({nodeName:'P'})},on:(event,callback)=>{initialize=callback;}};
  vm.runInNewContext(source.slice(start,end),{editor});
  // TinyMCE does not expose windowManager during setup.
  editor.windowManager={open};
  initialize();
  const config={body:{type:'tabpanel',tabs:[{name:'general'},{name:'upload'}]}};
  editor.windowManager.open(config);
  expect(open.mock.calls[0][0].body.tabs.map(tab=>tab.name)).toEqual(['upload','general']);
  expect(config.body.tabs[0].name).toBe('general');
  editor.selection.getNode=()=>({nodeName:'IMG'});
  editor.windowManager.open(config);
  expect(open.mock.calls[1][0]).toBe(config);
});
