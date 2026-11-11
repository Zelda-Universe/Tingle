<?php
include_once(dirname(__DIR__).'/lib/common/settings_history.php');
$editor=wikiRequireEditor($db,$map_prefix);if($editor===null) return;
$revision=$db->fetchAssociative("SELECT r.*,r.user_id AS userId,u.username,".wikiAgoSql('r.created')." AS ago FROM `{$map_prefix}map_revision` r LEFT JOIN `{$map_prefix}user` u ON u.id=r.user_id WHERE r.id=?",[(int)($_GET['id'] ?? 0)]);
if(!$revision || !in_array($revision['kind'],settingsHistoryKinds(),true)) {echo json_encode(['success'=>false,'msg'=>'That revision was not found.']);return;}
$current=settingsHistoryState($db,$map_prefix,$revision);
$revision['data']=json_decode($revision['data'],true) ?: [];
$revision['action']=$revision['data']['action'] ?? 'edit';
$latest=(int)$db->fetchOne("SELECT MAX(id) FROM `{$map_prefix}map_revision` WHERE container_id=? AND kind=? AND target_id=?",[$revision['container_id'],$revision['kind'],$revision['target_id']]);
$revision['id']=(int)$revision['id'];
echo json_encode(['success'=>true,'revision'=>$revision,'game'=>$db->fetchOne("SELECT short_name FROM `{$map_prefix}container` WHERE id=?",[$revision['container_id']]),'isCurrent'=>$latest===$revision['id'],'canRevert'=>!$editor['beta'] && (bool)$current && $latest!==$revision['id']]);
