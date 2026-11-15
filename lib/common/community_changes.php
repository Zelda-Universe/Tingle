<?php
include_once(__DIR__.'/wiki.php');
// $includePaths: paths' saves too (lib/common/paths.php), for those allowed
// paths: official paths' and published users' paths that aren't private.
function communityChanges($db,$prefix,$editor,$game='',$userId=null,$cursor='',$limit=50,$includeSettings=false,$filter='all',$includePaths=false) {
  $settings=$includeSettings && (bool)$db->fetchOne("SHOW TABLES LIKE '{$prefix}map_revision'");
  $picture=wikiHasUserColumn($db,$prefix,'profile_picture') ? 'u.profile_picture' : 'NULL';
  $emptyTalk=",NULL AS pageType,NULL AS pageId,NULL AS parentId,NULL AS body,NULL AS parentBody,NULL AS parentUsername";
  $query="SELECT r.id,r.marker_id AS markerId,r.action,r.summary,r.user_id AS userId,u.username,{$picture} AS profilePicture,".wikiAgoSql('r.created')." AS ago,m.name AS markerTitle,c.short_name AS game,c.name AS gameName,r.created AS sortTime,'marker' AS revisionType".$emptyTalk."
    FROM `{$prefix}marker_revision` r JOIN `{$prefix}marker` m ON m.id=r.marker_id
    JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id JOIN `{$prefix}container` c ON c.id=mc.container_id
    LEFT JOIN `{$prefix}user` u ON u.id=r.user_id WHERE r.action<>'import' AND c.visible=1".($editor?'':' AND m.visible=1');
  if($settings) $query.=" UNION ALL SELECT r.id,NULL AS markerId,COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.data,'$.action')),'edit') AS action,r.summary,r.user_id AS userId,u.username,{$picture} AS profilePicture,".wikiAgoSql('r.created')." AS ago,
    CASE WHEN r.kind IN ('game','layout','map_order') THEN 'Game Settings' ELSE COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.data,'$.name')),'Settings') END AS markerTitle,
    c.short_name AS game,c.name AS gameName,r.created AS sortTime,'settings' AS revisionType".$emptyTalk."
    FROM `{$prefix}map_revision` r JOIN `{$prefix}container` c ON c.id=r.container_id LEFT JOIN `{$prefix}user` u ON u.id=r.user_id
    WHERE c.visible=1 AND r.kind IN ('game','map','category','layout','map_order')";
  // $includePaths: true (staff, or users' paths open), 'official', or false.
  if($includePaths && $db->fetchOne("SHOW TABLES LIKE '{$prefix}path_revision'")) {
    include_once(__DIR__.'/paths.php');
    // (The path's slug rides in body, its id in pageId: the row opens it.)
    $query.=" UNION ALL SELECT r.id,NULL AS markerId,r.action,r.summary,r.user_id AS userId,u.username,{$picture} AS profilePicture,".wikiAgoSql('r.created')." AS ago,
      p.name AS markerTitle,c.short_name AS game,c.name AS gameName,r.created AS sortTime,'path' AS revisionType,
      'path' AS pageType,p.id AS pageId,NULL AS parentId,p.slug AS body,NULL AS parentBody,NULL AS parentUsername
      FROM `{$prefix}path_revision` r JOIN `{$prefix}path` p ON p.id=r.path_id JOIN `{$prefix}container` c ON c.id=p.container_id
      LEFT JOIN `{$prefix}user` u ON u.id=r.user_id
      WHERE p.visible=1 AND c.enabled=1 AND ".pathOpenSql('p').
      // (Not an unlisted official path's: on the map, kept out of lists and
      // feeds, a Korok pair among hundreds.)
      " AND NOT (p.scope='official' AND p.visibility='unlisted')".
      // ('official': everyone's view once paths are out, before users' own
      // are: official paths' edits, in public games only. paths.php.)
      ($includePaths==='official' ? " AND p.scope='official' AND c.visible=1" : '');
  }
  // Talk is publicly readable, including its activity. Deleted comment text
  // and comments on non-public games are never included. A path's Talk
  // comes with its path's edits ($includePaths): the same paths.
  $pathTalk='0';$pathTitle='NULL';$pathGame='NULL';$pathGameName='NULL';$pathJoin='';
  if($includePaths && $db->fetchOne("SHOW TABLES LIKE '{$prefix}path'")) {
    include_once(__DIR__.'/paths.php');
    $pathJoin="LEFT JOIN `{$prefix}path` pp ON t.page_type='path' AND pp.id=t.page_id LEFT JOIN `{$prefix}container` pc ON pc.id=pp.container_id";
    $pathTalk="pp.id IS NOT NULL AND pp.visible=1 AND pc.enabled=1 AND ".pathOpenSql('pp').
      ($includePaths==='official' ? " AND pp.scope='official' AND pc.visible=1" : '');
    $pathTitle='pp.name';$pathGame='pc.short_name';$pathGameName='pc.name';
  }
  $query.=" UNION ALL SELECT t.id,IF(t.page_type='marker',t.page_id,NULL) AS markerId,IF(t.parent_id IS NULL,'comment','reply') AS action,NULL AS summary,t.user_id AS userId,u.username,{$picture} AS profilePicture,".wikiAgoSql('t.created')." AS ago,
    CASE t.page_type WHEN 'marker' THEN m.name WHEN 'path' THEN {$pathTitle} ELSE CONCAT(tu.username,'’s Talk') END AS markerTitle,
    COALESCE(c.short_name,{$pathGame},'') AS game,COALESCE(c.name,{$pathGameName},'') AS gameName,t.created AS sortTime,'talk' AS revisionType,
    t.page_type AS pageType,t.page_id AS pageId,t.parent_id AS parentId,t.body,IF(p.deleted IS NULL,p.body,NULL) AS parentBody,pu.username AS parentUsername
    FROM `{$prefix}talk_comment` t LEFT JOIN `{$prefix}user` u ON u.id=t.user_id
    LEFT JOIN `{$prefix}marker` m ON t.page_type='marker' AND m.id=t.page_id
    LEFT JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id LEFT JOIN `{$prefix}container` c ON c.id=mc.container_id
    LEFT JOIN `{$prefix}user` tu ON t.page_type='user' AND tu.id=t.page_id {$pathJoin}
    LEFT JOIN `{$prefix}talk_comment` p ON p.id=t.parent_id AND p.page_type=t.page_type AND p.page_id=t.page_id
    LEFT JOIN `{$prefix}user` pu ON pu.id=p.user_id
    WHERE t.deleted IS NULL AND ((t.page_type='marker' AND m.id IS NOT NULL AND c.visible=1) OR (t.page_type='user' AND tu.id IS NOT NULL AND tu.deleted IS NULL)
      OR (t.page_type='path' AND {$pathTalk}))";
  $where=[];$params=[];
  if($game!=='') {$where[]='game=?';$params[]=$game;}
  if($userId!==null) {$where[]='userId=?';$params[]=(int)$userId;}
  if($filter==='talk') $where[]="revisionType='talk'";
  elseif($filter==='edits') $where[]="revisionType<>'talk'";
  if($cursor!=='') {
    $decoded=json_decode(base64_decode($cursor,true) ?: '',true);
    if(is_array($decoded) && count($decoded)===3 && is_string($decoded[0]) && preg_match('/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}(\.\d+)?$/',$decoded[0]) && in_array($decoded[1],['marker','settings','talk','path'],true) && is_int($decoded[2])) {
      $where[]='(sortTime,revisionType,id)<(?,?,?)';array_push($params,...$decoded);
    } elseif(ctype_digit((string)$cursor)) {$where[]='id<?';$params[]=(int)$cursor;}
  }
  $rows=$db->fetchAllAssociative('SELECT * FROM ('.$query.') changes'.($where?' WHERE '.implode(' AND ',$where):'').' ORDER BY sortTime DESC,revisionType DESC,id DESC LIMIT '.(int)($limit+1),$params);
  $more=count($rows)>$limit;$rows=array_slice($rows,0,$limit);
  $markerIds=array_values(array_unique(array_filter(array_map(function($row) {return (int)($row['markerId'] ?? 0);},$rows))));
  $unavailable=[];
  if($markerIds) foreach($db->fetchAllAssociative("SELECT id FROM `{$prefix}marker` WHERE visible=0 AND id IN (".implode(',',$markerIds).")") as $marker) $unavailable[(int)$marker['id']]=true;
  foreach($rows as &$row) {
    $row['markerDeleted']=isset($unavailable[(int)($row['markerId'] ?? 0)]);
    foreach(['id','markerId','userId','ago'] as $key) $row[$key]=$row[$key]===null?null:(int)$row[$key];
    foreach(['pageId','parentId'] as $key) if(isset($row[$key])) $row[$key]=(int)$row[$key];
    $row['markerTitle']=wikiDecode($row['markerTitle']);
    $row['cursor']=base64_encode(json_encode([$row['sortTime'],$row['revisionType'],$row['id']]));
    unset($row['sortTime']);
  }
  unset($row);
  return ['changes'=>$rows,'more'=>$more];
}
