<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/map_settings.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;
  $fail = function($message) { echo json_encode(['success'=>false,'msg'=>$message]); };
  $kind = $_POST['kind'] ?? '';
  $id = (int) ($_POST['id'] ?? 0);
  $name = is_string($_POST['name'] ?? null) ? trim($_POST['name']) : '';
  $description = isset($_POST['description']) && is_string($_POST['description']) ? trim($_POST['description']) : null;
  if ($description !== null && (mb_strlen($description) > 5000 || strip_tags($description) !== $description)) return $fail('Descriptions must be plain text, up to 5,000 characters.');
  $summary = is_string($_POST['summary'] ?? null) ? trim($_POST['summary']) : '';
  if (mb_strlen($summary) > 255) return $fail('Keep the summary under 255 characters.');
  if ($name === '' || mb_strlen($name) > 45 || strip_tags($name) !== $name) return $fail('Enter a name of 1 to 45 characters, without HTML.');
  if (!in_array($kind, ['map','region','marker'], true)) return $fail('That area was not found.');
  if ($kind === 'map') {
    $row=$db->fetchAssociative("SELECT id, container_id, name,description FROM `{$map_prefix}map` WHERE id=?",[$id]);
  } elseif ($kind === 'region') {
    $row=$db->fetchAssociative("SELECT r.id,r.name,r.description,r.short_name,r.label_marker_id,r.submap_id,m.container_id FROM `{$map_prefix}map_region` r JOIN `{$map_prefix}submap` s ON s.id=r.submap_id JOIN `{$map_prefix}map` m ON m.id=s.map_id WHERE r.id=?",[$id]);
  } else {
    $row=$db->fetchAssociative("SELECT p.id,p.name,p.description,p.submap_id,m.container_id FROM `{$map_prefix}marker` p JOIN `{$map_prefix}marker_category` c ON c.id=p.marker_category_id JOIN `{$map_prefix}submap` s ON s.id=p.submap_id JOIN `{$map_prefix}map` m ON m.id=s.map_id WHERE p.id=? AND c.marker_category_type_id=3",[$id]);
  }
  if (!$row) return $fail('That area was not found.');
  $beforeDescription=(string)($row['description'] ?? '');
  $description=$description ?? $beforeDescription;
  if ($name === html_entity_decode($row['name'], ENT_QUOTES | ENT_HTML5, 'UTF-8') && $description === $beforeDescription) {
    echo json_encode(['success'=>true,'name'=>$name,'changed'=>false]);
    return;
  }
  begin();
  try {
    if ($kind === 'map') {
      $db->executeStatement("UPDATE `{$map_prefix}map` SET name=?,description=? WHERE id=?",[$name,$description,$id]);
    } else {
      $old=html_entity_decode($row['name'], ENT_QUOTES | ENT_HTML5, 'UTF-8');
      $encoded=htmlentities($name, ENT_QUOTES, 'UTF-8');
      // Never resolve an editable association by its display name.
      $labelId=$kind === 'marker' ? $id : ($row['label_marker_id'] ?? null);
      $labels=$labelId ? [['id'=>$labelId]] : [];
      foreach ($labels as $label) {
        wikiEnsureBaseline($db,$map_prefix,$label['id']);
        $db->executeStatement("UPDATE `{$map_prefix}marker` SET name=?,description=?,last_updated=NOW() WHERE id=?",[$encoded,$description,$label['id']]);
        wikiRecordRevision($db,$map_prefix,$label['id'],$adminId,'edit',$summary);
      }
      if ($kind === 'region') {
        $db->executeStatement("UPDATE `{$map_prefix}map_region` SET connection_key=COALESCE(connection_key,name),name=?,short_name=?,description=? WHERE id=?",[$name,$name,$description,$id]);
      } else {
        $db->executeStatement("UPDATE `{$map_prefix}map_region` SET connection_key=COALESCE(connection_key,name),name=?,short_name=?,description=? WHERE label_marker_id=?",[$name,$name,$description,$id]);
      }
      // Imported OoT markers use the area name as their location key.
      $db->executeStatement("UPDATE `{$map_prefix}marker` SET game_data=JSON_SET(game_data,'$.areaName',?) WHERE submap_id=? AND JSON_VALID(game_data) AND JSON_UNQUOTE(JSON_EXTRACT(game_data,'$.areaName'))=?",[$name,$row['submap_id'],$old]);
    }
    mapSettingsRecord($db,$map_prefix,$row['container_id'],$adminId,$kind,$id,$summary,['name'=>$name,'before'=>['name'=>$row['name'],'description'=>$beforeDescription],'after'=>['name'=>$name,'description'=>$description]]);
    commit();
    echo json_encode(['success'=>true,'name'=>$name]);
  } catch (Throwable $e) { rollback(); throw $e; }
?>
