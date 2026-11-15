<?php
include_once(__DIR__.'/wiki.php');

// A revision's namespace is part of its identity: settings IDs overlap marker IDs.
function likeTargetExists($db,$prefix,$type,$id,$editor) {
  if($id<1) return false;
  if($type==='comment') {
    $comment=$db->fetchAssociative("SELECT page_type,page_id FROM `{$prefix}talk_comment` WHERE id=? AND deleted IS NULL",[$id]);
    if($comment && $comment['page_type']==='path') {include_once(__DIR__.'/paths.php');return (bool)pathReadableBy($db,$prefix,$comment['page_id'],$editor);}
    return $comment && ($comment['page_type']==='marker' ? wikiReadableMarker($db,$prefix,$comment['page_id']) : wikiTalkPageExists($db,$prefix,'user',$comment['page_id']));
  }
  if($type==='revision') return (bool)$db->fetchOne("SELECT 1 FROM `{$prefix}marker_revision` r JOIN `{$prefix}marker` m ON m.id=r.marker_id JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id JOIN `{$prefix}container` c ON c.id=mc.container_id WHERE r.id=? AND c.visible=1",[$id]);
  if($type==='settings' && (int)$editor['level']>=WIKI_ADMIN_LEVEL) return (bool)$db->fetchOne("SELECT 1 FROM `{$prefix}map_revision` WHERE id=? AND kind IN ('game','map','category','layout','map_order')",[$id]);
  // A user's path, published and open to others (paths.php), while paths
  // are only for those allowed them.
  if($type==='path') {
    include_once(__DIR__.'/paths.php');
    if(!pathsAllowed($editor['level'])) return false;
    return (bool)$db->fetchOne("SELECT 1 FROM `{$prefix}path` p JOIN `{$prefix}container` c ON c.id=p.container_id WHERE p.id=? AND p.scope='user' AND p.visible=1 AND c.enabled=1 AND ".pathOpenSql(),[$id]);
  }
  // A save in a path's history, for those who may see the path.
  if($type==='pathrev') {
    include_once(__DIR__.'/paths.php');
    $pathId=$db->fetchOne("SELECT path_id FROM `{$prefix}path_revision` WHERE id=?",[$id]);
    return $pathId!==false && (bool)pathReadableBy($db,$prefix,$pathId,$editor);
  }
  return false;
}
function likeState($db,$prefix,$type,$id,$userId) {
  $row=$db->fetchAssociative("SELECT COUNT(*) AS total,COALESCE(MAX(user_id=?),0) AS liked FROM `{$prefix}like` WHERE target_type=? AND target_id=?",[$userId,$type,$id]);
  return ['count'=>(int)$row['total'],'liked'=>(bool)$row['liked']];
}
