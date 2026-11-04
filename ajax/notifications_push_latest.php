<?php
  // For the service worker, when a push arrives: the newest unread
  // notifications from the last few minutes. Each is shown with its id as a
  // tag, so ones shown before are replaced rather than repeated.
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  start_session('zmap');
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  $level = (int) ($_SESSION['level'] ?? 0);
  session_write_close();
  if (!$userId || $level < WIKI_EDITOR_LEVEL || !notificationsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => true, 'notifications' => [], 'unread' => 0));
    return;
  }
  global $siteBaseURL;
  $rows = $db->fetchAllAssociative("
    SELECT * FROM `{$map_prefix}notification`
     WHERE `user_id` = ? AND `in_app` = 1 AND `read_at` IS NULL AND `created` > NOW() - INTERVAL 10 MINUTE
     ORDER BY `id` DESC LIMIT 3
  ", [$userId]);
  $notifications = array_map(function($row) {
    $text = notificationRender($row);
    return array('id' => (int) $row['id'], 'title' => $text['title'], 'body' => $text['body'], 'url' => $text['url']);
  }, $rows);
  echo json_encode(array(
    'success' => true, 'notifications' => $notifications,
    'unread' => notificationUnreadCount($db, $map_prefix, $userId)
  ));
?>
