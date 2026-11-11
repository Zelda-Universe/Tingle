<?php
include_once(dirname(__DIR__).'/lib/common/settings_history.php');
$editor=mapSettingsRequire($db,$map_prefix);if($editor===null) return;
$fail=function($message) {echo json_encode(['success'=>false,'msg'=>$message]);};
$summary=trim(is_string($_POST['summary'] ?? null)?$_POST['summary']:'');
if(mb_strlen($summary)>255) return $fail('Keep the summary under 255 characters.');
begin();
try {
  $revision=$db->fetchAssociative("SELECT * FROM `{$map_prefix}map_revision` WHERE id=? FOR UPDATE",[(int)($_POST['revisionId'] ?? 0)]);
  if(!$revision || !in_array($revision['kind'],settingsHistoryKinds(),true)) {rollback();return $fail('That revision was not found.');}
  $game=(int)$revision['container_id'];$kind=$revision['kind'];
  $db->fetchOne("SELECT id FROM `{$map_prefix}container` WHERE id=? FOR UPDATE",[$game]);
  $latest=(int)$db->fetchOne("SELECT MAX(id) FROM `{$map_prefix}map_revision` WHERE container_id=? AND kind=? AND target_id=?",[$game,$kind,$revision['target_id']]);
  if($latest===(int)$revision['id']) {rollback();return $fail('That is already the current version.');}
  $before=settingsHistoryState($db,$map_prefix,$revision);
  if(!$before) {rollback();return $fail('That item no longer exists.');}
  $after=settingsHistorySnapshot($db,$map_prefix,$revision,$before);
  if($kind==='layout') {
    $after=mapSettingsCleanLayout($db,$map_prefix,$game,json_encode($after));
    if(is_string($after)) {rollback();return $fail($after);}
    mapSettingsApplyLayout($db,$map_prefix,$game,$after);
  } elseif($kind==='map_order') {
    $a=$before;$b=$after;sort($a);sort($b);
    if($a!==$b) {rollback();return $fail('The maps have changed since this revision.');}
    foreach($after as $order=>$id) $db->executeStatement("UPDATE `{$map_prefix}map` SET map_order=? WHERE id=? AND container_id=?",[$order,$id,$game]);
  } else {
    $table=['game'=>'container','map'=>'map','category'=>'marker_category'][$kind];
    $sets=[];$params=[];
    foreach(settingsHistoryColumns($kind) as $key=>$column) if(array_key_exists($key,$after)) {$sets[]="`$column`=?";$params[]=is_bool($after[$key])?(int)$after[$key]:$after[$key];}
    $params[]=$kind==='game'?$game:$revision['target_id'];
    if($kind!=='game') $params[]=$game;
    $db->executeStatement("UPDATE `{$map_prefix}{$table}` SET ".implode(',',$sets)." WHERE id=?".($kind==='game'?'':' AND container_id=?'),$params);
  }
  $data=json_decode($revision['data'],true) ?: [];
  mapSettingsRecord($db,$map_prefix,$game,$editor['id'],$kind,$revision['target_id'],$summary,['name'=>$data['name'] ?? 'Settings','action'=>'revert','revertsId'=>(int)$revision['id'],'before'=>$before,'after'=>$after]);
  $result=['success'=>true,'kind'=>$kind,'targetId'=>(int)$revision['target_id'],'values'=>$after];
  if($kind==='category') $result['category']=$db->fetchAssociative("SELECT * FROM `{$map_prefix}marker_category` WHERE id=?",[$revision['target_id']]);
  commit();echo json_encode($result);
} catch(Throwable $error) {rollback();throw $error;}
