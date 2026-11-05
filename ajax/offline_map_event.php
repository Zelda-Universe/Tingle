<?php
  // The Offline Maps page reports what happened to a download: started,
  // downloaded, updated, failed or removed. For Admin's Offline Maps stats.
  start_session('zmap');
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  session_write_close();
  if (!$userId) {
    echo json_encode(array('success' => false, 'msg' => 'Please log in.'));
    return;
  }
  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}offline_map_event'")) {
    echo json_encode(array('success' => true, 'saved' => false));
    return;
  }
  $event = (string) ($_POST['event'] ?? '');
  if (!in_array($event, ['started', 'downloaded', 'updated', 'failed', 'removed'], true)) {
    echo json_encode(array('success' => false, 'msg' => 'Unknown event.'));
    return;
  }
  // ajax.php keeps game to letters, numbers, - and _: an id or short name.
  $game = (string) ($_POST['game'] ?? '');
  $containerId = $db->fetchOne(
    "SELECT `id` FROM `{$map_prefix}container` WHERE `id` = ? OR `short_name` = ? LIMIT 1",
    [ctype_digit($game) ? (int) $game : 0, $game]
  );
  if ($containerId === false) {
    echo json_encode(array('success' => false, 'msg' => 'Unknown game.'));
    return;
  }
  // Generous, but one person can't fill the table.
  $recent = (int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}offline_map_event` WHERE `user_id` = ? AND `created` > NOW() - INTERVAL 1 HOUR",
    [$userId]
  );
  if ($recent >= 200) {
    echo json_encode(array('success' => true, 'saved' => false));
    return;
  }
  $bytes = isset($_POST['bytes']) && ctype_digit((string) $_POST['bytes']) ? min((int) $_POST['bytes'], PHP_INT_MAX) : null;
  $db->executeStatement(
    "INSERT INTO `{$map_prefix}offline_map_event` (`user_id`, `container_id`, `event`, `bytes`, `created`) VALUES (?, ?, ?, ?, NOW())",
    [$userId, (int) $containerId, $event, $bytes]
  );
  echo json_encode(array('success' => true, 'saved' => true));
?>
