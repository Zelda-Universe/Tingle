<?php
include_once(__DIR__.'/wiki.php');
function communityChanges($db,$prefix,$editor,$game='',$userId=null,$cursor='',$limit=50,$includeSettings=false) {
  $settings=$includeSettings && (bool)$db->fetchOne("SHOW TABLES LIKE '{$prefix}map_revision'");
  $query="SELECT r.id,r.marker_id AS markerId,r.action,r.summary,r.user_id AS userId,u.username,".wikiAgoSql('r.created')." AS ago,m.name AS markerTitle,c.short_name AS game,c.name AS gameName,r.created AS sortTime,'marker' AS revisionType
    FROM `{$prefix}marker_revision` r JOIN `{$prefix}marker` m ON m.id=r.marker_id
    JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id JOIN `{$prefix}container` c ON c.id=mc.container_id
    LEFT JOIN `{$prefix}user` u ON u.id=r.user_id WHERE r.action<>'import' AND c.visible=1".($editor?'':' AND m.visible=1');
  if($settings) $query.=" UNION ALL SELECT r.id,NULL AS markerId,COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.data,'$.action')),'edit') AS action,r.summary,r.user_id AS userId,u.username,".wikiAgoSql('r.created')." AS ago,
    CASE WHEN r.kind IN ('game','layout','map_order') THEN 'Game Settings' ELSE COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.data,'$.name')),'Settings') END AS markerTitle,
    c.short_name AS game,c.name AS gameName,r.created AS sortTime,'settings' AS revisionType
    FROM `{$prefix}map_revision` r JOIN `{$prefix}container` c ON c.id=r.container_id LEFT JOIN `{$prefix}user` u ON u.id=r.user_id
    WHERE c.visible=1 AND r.kind IN ('game','map','category','layout','map_order')";
  $where=[];$params=[];
  if($game!=='') {$where[]='game=?';$params[]=$game;}
  if($userId!==null) {$where[]='userId=?';$params[]=(int)$userId;}
  if($cursor!=='') {
    $decoded=json_decode(base64_decode($cursor,true) ?: '',true);
    if(is_array($decoded) && count($decoded)===3 && is_string($decoded[0]) && preg_match('/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}(\.\d+)?$/',$decoded[0]) && in_array($decoded[1],['marker','settings'],true) && is_int($decoded[2])) {
      $where[]='(sortTime,revisionType,id)<(?,?,?)';array_push($params,...$decoded);
    } elseif(ctype_digit((string)$cursor)) {$where[]='id<?';$params[]=(int)$cursor;}
  }
  $rows=$db->fetchAllAssociative('SELECT * FROM ('.$query.') changes'.($where?' WHERE '.implode(' AND ',$where):'').' ORDER BY sortTime DESC,revisionType DESC,id DESC LIMIT '.(int)($limit+1),$params);
  $more=count($rows)>$limit;$rows=array_slice($rows,0,$limit);
  foreach($rows as &$row) {
    foreach(['id','markerId','userId','ago'] as $key) $row[$key]=$row[$key]===null?null:(int)$row[$key];
    $row['markerTitle']=wikiDecode($row['markerTitle']);
    $row['cursor']=base64_encode(json_encode([$row['sortTime'],$row['revisionType'],$row['id']]));
    unset($row['sortTime']);
  }
  unset($row);
  return ['changes'=>$rows,'more'=>$more];
}
