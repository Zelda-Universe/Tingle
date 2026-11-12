<?php
include_once(dirname(__DIR__).'/lib/common/likes.php');
if($_SERVER['REQUEST_METHOD']!=='POST') {http_response_code(405);echo json_encode(['success'=>false,'msg'=>'Use POST.']);return;}
// Reject cross-site submissions (including ordinary cross-site HTML forms).
$origin=$_SERVER['HTTP_ORIGIN'] ?? '';
if(($_SERVER['HTTP_SEC_FETCH_SITE'] ?? '')==='cross-site' || ($origin && strcasecmp((string)parse_url($origin,PHP_URL_HOST),preg_replace('/:\d+$/','',$_SERVER['HTTP_HOST'] ?? ''))!==0)) {http_response_code(403);echo json_encode(['success'=>false,'msg'=>'Invalid request origin.']);return;}
$editor=wikiRequireEditor($db,$map_prefix);
if(!$editor) return;
$type=is_string($_POST['type'] ?? null)?$_POST['type']:'';
$id=(int)($_POST['id'] ?? 0);
if(!likeTargetExists($db,$map_prefix,$type,$id,$editor)) {http_response_code(404);echo json_encode(['success'=>false,'msg'=>'That item is not available.']);return;}
if(($_POST['liked'] ?? '')==='1') {
  $added=$db->executeStatement("INSERT IGNORE INTO `{$map_prefix}like` (target_type,target_id,user_id) VALUES (?,?,?)",[$type,$id,$editor['id']]);
  if($added) {
    include_once(dirname(__DIR__).'/lib/common/notifications.php');
    notifyLike($db,$map_prefix,$editor,$type,$id);
  }
}
else $db->executeStatement("DELETE FROM `{$map_prefix}like` WHERE target_type=? AND target_id=? AND user_id=?",[$type,$id,$editor['id']]);
echo json_encode(['success'=>true]+likeState($db,$map_prefix,$type,$id,$editor['id']));
