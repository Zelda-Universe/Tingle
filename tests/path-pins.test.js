const fs=require('fs');
const vm=require('vm');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

const load=()=>{
  const context={ZMap:function(){},Math};
  vm.runInNewContext(read('scripts/services/Paths.js')+'\n'+read('scripts/services/PathEditor.js'),context);
  return new context.ZMap();
};

test('shown pins are checks of a path, waypoints and single paths aside',()=>{
  const map=load();
  map._pathMarker=()=>null;
  const path={kind:'guide',steps:[
    {submapId:1,x:0,y:0,shown:1,pinKey:'aaaaaa',done:true},
    {submapId:1,x:1,y:1,shown:0,pinKey:'bbbbbb'},
    {submapId:1,x:2,y:2,shown:1,pinKey:'cccccc'}
  ]};
  expect(map._pathCheckPins(path).map(s=>s.pinKey)).toEqual(['aaaaaa','cccccc']);
  expect(map._pathCheckCounts(path)).toEqual({total:2,done:1});
  expect(map._pathCheckPins({kind:'single',steps:path.steps})).toEqual([]);
});

test('pins keep their key and contents through the path editor and its history',()=>{
  const lib=read('lib/common/paths.php');
  expect(read('migrations/20261114110000_path_pins.sql')).toContain('ADD COLUMN IF NOT EXISTS pin_key');
  expect(read('migrations/20261114110000_path_pins.sql')).toContain('CREATE TABLE IF NOT EXISTS path_pin_complete');
  expect(lib).toContain("$step['pinKey']");
  expect(lib).toContain("'pinKey' => (string) $s['pin_key']");
  expect(read('scripts/services/PathEditor.js')).toContain("pinKey: s.pinKey || '', content: s.content || ''");
});

test('a pin is changed only by whoever may edit its path, and completing one starts a user path',()=>{
  expect(read('ajax/save_path_pin.php')).toContain('pathCanEdit($path, $userId, $level)');
  const toggle=read('ajax/toggle_path_pin.php');
  expect(toggle).toContain('pathVisibleTo(');
  expect(toggle).toContain('path_start');
});

test("a pin's description becomes paragraphs, escaped",()=>{
  const map=load();
  map._wikiEscape=s=>String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
  map._renderWikiText=function(t){ return this._wikiEscape(t).replace(/\n/g,'<br>'); };
  expect(map._pathPinContentHTML('One <b>\nline\n\n\nTwo')).toBe('<p>One &lt;b&gt;<br>line</p><p>Two</p>');
});
