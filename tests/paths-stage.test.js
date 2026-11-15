const fs=require('fs');
const path=require('path');
const vm=require('vm');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Paths are released a step at a time (lib/common/paths.php PATHS_STAGE):
// 'staff', 'readonly' (everyone sees and uses official paths, staff make
// them), then 'open'.
function helpers(stage,user) {
  const context={ZMap:function(){},window:{zmapPathsStage:stage},$:{},URL};
  const source=read('scripts/services/Paths.js');
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._pathsStage'),source.indexOf('ZMap.prototype.loadPaths')),context);
  const zmap=new context.ZMap();
  zmap.getUser=()=>user;
  return {visible:zmap._pathsVisible(),makeable:zmap._pathsMakeable()};
}

test.each([
  ['staff',null,{visible:false,makeable:false}],
  ['staff',{level:5},{visible:false,makeable:false}],
  ['staff',{level:10},{visible:true,makeable:true}],
  ['readonly',null,{visible:true,makeable:false}],
  ['readonly',{level:5},{visible:true,makeable:false}],
  ['readonly',{level:10},{visible:true,makeable:true}],
  ['open',null,{visible:true,makeable:true}],
])('%s, as %j',(stage,user,expected)=>{
  expect(helpers(stage,user)).toEqual(expected);
});

test('the server decides the same',()=>{
  const lib=read('lib/common/paths.php');
  expect(lib).toMatch(/const PATHS_STAGE = '(staff|readonly|open)';/);
  expect(lib).toContain("return PATHS_STAGE !== 'staff' || (int) $level >= PATHS_ADMIN_LEVEL;");
  expect(lib).toContain("return PATHS_STAGE === 'open' || (int) $level >= PATHS_ADMIN_LEVEL;");
  // Seeing and using: everyone once released. Making: staff (pathsAllowed).
  for(const file of ['ajax/path_history.php','ajax/start_path.php','ajax/toggle_path_pin.php','ajax/get_paths.php'])
    expect(read(file)).toContain('pathsVisible($level)');
  for(const file of ['ajax/save_path.php','ajax/delete_path.php','ajax/revert_path.php','ajax/save_path_pin.php','ajax/community_paths.php'])
    expect(read(file)).toContain('if (!pathsAllowed($level))');
  expect(read('index.php')).toContain('window.zmapPathsStage');
});

test('an embed, never signed in, still loads its paths',()=>{
  expect(read('scripts/zmain.lib.js')).toContain('if(window.zmapEmbed && !window.zmapEmbedPreview) { applyUserInfo({}, false); return; }');
});

test('once out, everyone sees official paths\' history and edits, but only path makers restore',()=>{
  const lib=read('lib/common/paths.php');
  expect(lib).toContain("return pathsAllowed($level) ? true : (pathsVisible($level) ? 'official' : false);");
  expect(read('lib/common/community_changes.php')).toContain("($includePaths==='official' ? \" AND p.scope='official' AND c.visible=1\" : '')");
  expect(read('ajax/recent_changes.php')).toContain('pathsInFeeds($level)');
  expect(read('ajax/user_profile.php')).toContain('pathsInFeeds($viewerLevel)');
  expect(read('ajax/path_history.php')).toContain('$canRevert = $userId && pathsAllowed($level) && pathCanEdit($path, $userId, $level);');
  expect(read('ajax/revert_path.php')).toContain('if (!pathsAllowed($level))');
});

test('path Talk comments show in feeds alongside the same paths\' edits',()=>{
  const feed=read('lib/common/community_changes.php');
  expect(feed).toContain("CASE t.page_type WHEN 'marker' THEN m.name WHEN 'path' THEN {$pathTitle}");
  expect(feed).toContain("($includePaths==='official' ? \" AND pp.scope='official' AND pc.visible=1\" : '')");
  expect(feed).toContain("OR (t.page_type='path' AND {$pathTalk})");
  // A feed's path comment opens the path's Talk at it, in its own game.
  expect(read('scripts/zwiki.js')).toContain("if(type==='path' && this._openPathTalkComment) {this._openPathTalkComment(id,comment,back);return;}");
});
