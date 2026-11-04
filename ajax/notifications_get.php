<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // The Notifications page: newest first, 30 at a time (before= for more).
  if (!notificationsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => true, 'notifications' => [], 'unread' => 0, 'more' => false, 'unavailable' => true));
    return;
  }
  $before = (int) ($_GET['before'] ?? 0);
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? '`a`.`profile_picture`' : 'NULL';
  $rows = $db->fetchAllAssociative("
    SELECT `n`.`id`, `n`.`type`, `n`.`actor_id` AS `actorId`, {$picture} AS `actorPicture`,
           `n`.`page_type` AS `pageType`, `n`.`page_id` AS `pageId`, `n`.`marker_id` AS `markerId`,
           `n`.`comment_id` AS `commentId`, `n`.`revision_id` AS `revisionId`, `n`.`data`,
           `n`.`read_at` IS NOT NULL AS `isRead`, " . wikiAgoSql('`n`.`created`') . " AS `ago`
      FROM `{$map_prefix}notification` `n`
      LEFT JOIN `{$map_prefix}user` `a` ON `a`.`id` = `n`.`actor_id`
     WHERE `n`.`user_id` = ? AND `n`.`in_app` = 1" . ($before ? " AND `n`.`id` < ?" : '') . "
     ORDER BY `n`.`id` DESC
     LIMIT 31
  ", $before ? [$editor['id'], $before] : [$editor['id']]);
  $more = count($rows) > 30;
  $rows = array_slice($rows, 0, 30);
  $notifications = array_map(function($row) {
    $text = notificationRender($row);
    $data = json_decode((string) $row['data'], true) ?: array();
    return array(
      'id' => (int) $row['id'], 'type' => $row['type'], 'title' => $text['title'], 'body' => $text['body'],
      'url' => $text['url'], 'isRead' => (bool) $row['isRead'], 'ago' => (int) $row['ago'],
      'actorId' => $row['actorId'] === null ? null : (int) $row['actorId'], 'actorPicture' => $row['actorPicture'],
      'pageType' => $row['pageType'], 'pageId' => $row['pageId'] === null ? null : (int) $row['pageId'],
      'markerId' => $row['markerId'] === null ? null : (int) $row['markerId'],
      'commentId' => $row['commentId'] === null ? null : (int) $row['commentId'],
      'revisionId' => $row['revisionId'] === null ? null : (int) $row['revisionId'],
      'game' => $data['game'] ?? null, 'pageTitle' => $data['pageTitle'] ?? ($data['markerTitle'] ?? null)
    );
  }, $rows);
  echo json_encode(array(
    'success' => true, 'notifications' => $notifications, 'more' => $more,
    'unread' => notificationUnreadCount($db, $map_prefix, $editor['id'])
  ));
?>
