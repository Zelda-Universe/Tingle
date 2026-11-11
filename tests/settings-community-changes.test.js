const fs=require('fs'),path=require('path'),{execFileSync}=require('child_process');
test('settings and marker edits share a chronological feed and collision-safe cursor',()=>{
  const helper=path.resolve('lib/common/community_changes.php');
  const php=`require ${JSON.stringify(helper)};
    $db=new class {public $sql; public $params;
      function fetchOne($sql){return 1;}
      function fetchAllAssociative($sql,$params){$this->sql=$sql;$this->params=$params;return [['id'=>'8','markerId'=>null,'action'=>'edit','summary'=>'','userId'=>'2','username'=>'Editor','ago'=>'1','markerTitle'=>'Game Settings','game'=>'OoTR','gameName'=>'Ocarina of Time','sortTime'=>'2026-11-11 01:00:00','revisionType'=>'settings']];}
    };
    $first=communityChanges($db,'',false,'',null,'',50,true);$cursor=$first['changes'][0]['cursor'];
    communityChanges($db,'',false,'OoTR',2,$cursor,50,true);
    echo json_encode(['first'=>$first,'sql'=>$db->sql,'params'=>$db->params]);`;
  const result=JSON.parse(execFileSync('php',['-r',php],{encoding:'utf8'}));
  expect(result.first.changes[0].revisionType).toBe('settings');
  expect(result.sql).toContain('UNION ALL');
  expect(result.sql).toContain('AND m.visible=1');
  expect(result.sql).toContain('(sortTime,revisionType,id)<(?,?,?)');
  expect(result.params).toEqual(['OoTR',2,'2026-11-11 01:00:00','settings',8]);
});
test('settings revisions are excluded by default and endpoints require an admin viewer',()=>{
  const helper=fs.readFileSync('lib/common/community_changes.php','utf8');
  expect(helper).toContain('$includeSettings=false');
  expect(helper).toContain('$settings=$includeSettings &&');
  expect(fs.readFileSync('ajax/recent_changes.php','utf8')).toContain('$level>=WIKI_ADMIN_LEVEL');
  expect(fs.readFileSync('ajax/user_profile.php','utf8')).toContain("'',30,$viewerLevel>=WIKI_ADMIN_LEVEL");
});
test('All Revisions preserves the originating revision as the history parent',()=>{
  const source=fs.readFileSync('scripts/zmapsettings.js','utf8');
  expect(source).toContain('_openMapSettingsHistory(reopen,result.game)');
  expect(source).toContain('_openMapSettingsHistory(back,game)');
  expect(source).toContain('_renderMapSettingsHistory(list,data,reopen)');
});
test('profiles include settings edits and revision shortcuts have a separate namespace',()=>{
  expect(fs.readFileSync('ajax/user_profile.php','utf8')).toContain('communityChanges(');
  const wiki=fs.readFileSync('scripts/zwiki.js','utf8');
  expect(wiki).toContain('rev|settingsrev|marker|user');
  expect(wiki).toContain('data-settings-rev');
  expect(fs.readFileSync('scripts/zmapsettings.js','utf8')).toContain('[[settingsrev:');
});
