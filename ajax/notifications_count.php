<?php
  // The account button's badge. Quiet for everyone else: no 403.
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  start_session('zmap');
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  $level = (int) ($_SESSION['level'] ?? 0);
  session_write_close();
  if (!$userId || $level < WIKI_EDITOR_LEVEL) {
    echo json_encode(array('success' => true, 'unread' => 0));
    return;
  }
  echo json_encode(array('success' => true, 'unread' => notificationUnreadCount($db, $map_prefix, $userId)));
?>
