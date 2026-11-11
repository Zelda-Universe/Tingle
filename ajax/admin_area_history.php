<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  if (adminRequire($db, $map_prefix) === null) return;
  $kind=$_GET['kind'] ?? '';
  $id=(int) ($_GET['id'] ?? 0);
  if (!in_array($kind,['map','region','marker'],true) || $id < 1) {
    echo json_encode(['success'=>false,'msg'=>'That area was not found.']);return;
  }
  $rows=$db->fetchAllAssociative("SELECT r.id,r.summary,r.user_id AS userId,u.username,".wikiAgoSql('r.created')." AS ago,r.data FROM `{$map_prefix}map_revision` r LEFT JOIN `{$map_prefix}user` u ON u.id=r.user_id WHERE r.kind=? AND r.target_id=? ORDER BY r.id DESC LIMIT 200",[$kind,$id]);
  foreach ($rows as &$row) {
    foreach (['id','userId','ago'] as $key) $row[$key]=$row[$key]===null?null:(int)$row[$key];
    $row['action']='edit';
    $row['data']=json_decode($row['data'],true) ?: [];
  }
  unset($row);
  echo json_encode(['success'=>true,'revisions'=>$rows]);
?>
