<?php
include_once(dirname(__DIR__).'/lib/common/community_changes.php');
if(!wikiAvailable($db,$map_prefix)) {echo json_encode(['success'=>false,'msg'=>'Run the create_wiki migration to keep history.']);return;}
start_session('zmap');$userId=(int)($_SESSION['user_id'] ?? 0);session_write_close();
$role=$userId?accountRole($db,$map_prefix,$userId):false;
$level=$role?(int)$role[0]:0;
$game=is_string($_GET['game'] ?? null)?$_GET['game']:'';
$cursor=is_string($_GET['before'] ?? null)?$_GET['before']:'';
$filter=is_string($_GET['filter'] ?? null)?$_GET['filter']:'all';
include_once(dirname(__DIR__).'/lib/common/paths.php');
$result=communityChanges($db,$map_prefix,$level>=WIKI_EDITOR_LEVEL,$game,null,$cursor,50,$level>=WIKI_ADMIN_LEVEL,$filter,pathsAllowed($level));
echo json_encode(['success'=>true]+$result);
