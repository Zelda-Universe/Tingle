<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // One revision, with the one before it to compare against, for its page
  // and for [[rev:123]] links.
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to keep marker history.'));
    return;
  }
  $select = "
    SELECT `r`.`id`, `r`.`marker_id` AS `markerId`, `r`.`action`, `r`.`summary`,
           `r`.`reverts_revision_id` AS `revertsId`, `r`.`user_id` AS `userId`, `u`.`username`,
           `r`.`created`, " . wikiAgoSql('`r`.`created`') . " AS `ago`, `r`.`data`
      FROM `{$map_prefix}marker_revision` `r`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `r`.`user_id`
  ";
  $tidy = function($revision) {
    if (!$revision) return null;
    foreach (['id', 'markerId', 'revertsId', 'userId', 'ago'] as $key) {
      $revision[$key] = $revision[$key] === null ? null : (int) $revision[$key];
    }
    $revision['data'] = json_decode($revision['data'], true);
    return $revision;
  };
  $revision = $tidy($db->fetchAssociative($select . " WHERE `r`.`id` = ?", [(int) ($_GET['id'] ?? 0)]));
  if (!$revision) {
    echo json_encode(array('success' => false, 'msg' => 'That revision was not found.'));
    return;
  }
  $previous = $tidy($db->fetchAssociative(
    $select . " WHERE `r`.`marker_id` = ? AND `r`.`id` < ? ORDER BY `r`.`id` DESC LIMIT 1",
    [$revision['markerId'], $revision['id']]
  ));
  $latestId = (int) $db->fetchOne(
    "SELECT MAX(`id`) FROM `{$map_prefix}marker_revision` WHERE `marker_id` = ?",
    [$revision['markerId']]
  );
  $owner = $db->fetchOne("SELECT `user_id` FROM `{$map_prefix}marker` WHERE `id` = ?", [$revision['markerId']]);
  $game = $db->fetchOne("SELECT " . wikiMarkerGamesSql($map_prefix, '?'), [$revision['markerId']]);

  echo json_encode(array(
    'success' => true,
    'revision' => $revision,
    'previous' => $previous,
    'isCurrent' => $revision['id'] === $latestId,
    'canRevert' => $owner !== false && wikiCanEditMarker($editor, $owner),
    'game' => $game ?: null
  ));
?>
