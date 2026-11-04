<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // The markers someone follows, newest first.
  if (!notificationsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_notifications migration to follow markers.'));
    return;
  }
  $rows = $db->fetchAllAssociative("
    SELECT `f`.`page_id` AS `markerId`, `m`.`name` AS `title`, `m`.`visible`,
           " . wikiMarkerGamesSql($map_prefix, '`f`.`page_id`') . " AS `game`,
           " . wikiAgoSql('`f`.`created`') . " AS `ago`
      FROM `{$map_prefix}talk_follow` `f`
      LEFT JOIN `{$map_prefix}marker` `m` ON `m`.`id` = `f`.`page_id`
     WHERE `f`.`user_id` = ? AND `f`.`page_type` = 'marker'
     ORDER BY `f`.`created` DESC
     LIMIT 1000
  ", [$editor['id']]);
  $games = array();
  foreach ($db->fetchAllAssociative("SELECT `short_name`, `name` FROM `{$map_prefix}container`") as $game) {
    $games[$game['short_name']] = $game['name'];
  }
  $markers = array_map(function($row) use ($games) {
    return array(
      'markerId' => (int) $row['markerId'], 'title' => $row['title'] === null ? null : wikiDecode($row['title']),
      'visible' => (bool) $row['visible'], 'game' => $row['game'], 'gameName' => $games[$row['game']] ?? $row['game'],
      'ago' => (int) $row['ago']
    );
  }, $rows);
  echo json_encode(array(
    'success' => true, 'markers' => $markers,
    'paused' => notificationUserOptions($db, $map_prefix, $editor['id'])['followsPaused']
  ));
?>
