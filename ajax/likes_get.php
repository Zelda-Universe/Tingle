<?php
include_once(dirname(__DIR__).'/lib/common/likes.php');
$editor=wikiRequireEditor($db,$map_prefix);
if(!$editor) return;
$targets=json_decode(is_string($_GET['targets'] ?? null)?$_GET['targets']:'',true);
if(!is_array($targets) || count($targets)>100) {http_response_code(400);echo json_encode(['success'=>false,'msg'=>'Invalid targets.']);return;}
$states=[];
foreach($targets as $key) {
  if(!is_string($key) || !preg_match('/^(comment|revision|settings):([1-9][0-9]{0,9})$/',$key,$match)) continue;
  if(likeTargetExists($db,$map_prefix,$match[1],(int)$match[2],$editor)) $states[$key]=likeState($db,$map_prefix,$match[1],(int)$match[2],$editor['id']);
}
echo json_encode(['success'=>true,'states'=>$states]);
