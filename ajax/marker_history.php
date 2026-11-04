<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // A marker's revisions, newest first, for its History page.
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to keep marker history.'));
    return;
  }
  $markerId = (int) ($_GET['markerId'] ?? 0);
  $marker = $db->fetchAssociative("SELECT `id`, `user_id`, `name` FROM `{$map_prefix}marker` WHERE `id` = ?", [$markerId]);
  if (!$marker) {
    echo json_encode(array('success' => false, 'msg' => 'That marker was not found.'));
    return;
  }
  $revisions = $db->fetchAllAssociative("
    SELECT `r`.`id`, `r`.`action`, `r`.`summary`, `r`.`reverts_revision_id` AS `revertsId`,
           `r`.`user_id` AS `userId`, `u`.`username`, `r`.`created`,
           " . wikiAgoSql('`r`.`created`') . " AS `ago`, CHAR_LENGTH(`r`.`data`) AS `size`
      FROM `{$map_prefix}marker_revision` `r`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `r`.`user_id`
     WHERE `r`.`marker_id` = ?
     ORDER BY `r`.`id` DESC
     LIMIT 200
  ", [$markerId]);
  foreach ($revisions as &$revision) {
    foreach (['id', 'revertsId', 'userId', 'ago', 'size'] as $key) {
      $revision[$key] = $revision[$key] === null ? null : (int) $revision[$key];
    }
  }
  unset($revision);

  echo json_encode(array(
    'success' => true,
    'marker' => array(
      'id' => (int) $marker['id'],
      'title' => wikiDecode($marker['name']),
      'game' => $db->fetchOne("SELECT " . wikiMarkerGamesSql($map_prefix, '?'), [$markerId]) ?: null
    ),
    'canRevert' => wikiCanEditMarker($editor, $marker['user_id']),
    'revisions' => $revisions
  ));
?>
