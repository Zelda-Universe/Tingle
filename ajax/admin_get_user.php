<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // One account for the admin account page: its details, how much it's used
  // the site, and the changes admins have made to it.
  $userId = (int) ($_GET['id'] ?? 0);
  $lastSeen = adminHasColumn($db, $map_prefix, 'last_seen') ? 'COALESCE(`last_seen`, `last_login`)' : '`last_login`';
  $disabled = adminHasColumn($db, $map_prefix, 'disabled') ? '`disabled`' : 'NULL';
  $banned = adminHasColumn($db, $map_prefix, 'banned') ? '`banned`' : 'NULL';
  $banReason = adminHasColumn($db, $map_prefix, 'banned') ? '`ban_reason`' : 'NULL';
  $user = $db->fetchAssociative("
    SELECT `id`, `username`, `name`, `email`, `level`, `created`, `deleted`,
           {$lastSeen} AS `lastSeen`, {$disabled} AS `disabled`, {$banned} AS `banned`,
           {$banReason} AS `banReason`,
           TIMESTAMPDIFF(SECOND, `created`, NOW()) AS `createdAgo`,
           TIMESTAMPDIFF(SECOND, {$lastSeen}, NOW()) AS `lastSeenAgo`,
           TIMESTAMPDIFF(SECOND, `deleted`, NOW()) AS `deletedAgo`,
           TIMESTAMPDIFF(SECOND, {$disabled}, NOW()) AS `disabledAgo`,
           TIMESTAMPDIFF(SECOND, {$banned}, NOW()) AS `bannedAgo`
      FROM `{$map_prefix}user`
     WHERE `id` = ?
  ", [$userId]);
  if (!$user) {
    echo json_encode(array('success' => false, 'msg' => 'That account was not found.'));
    return;
  }
  foreach (['createdAgo', 'lastSeenAgo', 'deletedAgo', 'disabledAgo', 'bannedAgo'] as $key) {
    $user[$key] = $user[$key] === null ? null : (int) $user[$key];
  }

  $count = function($table, $where = '`user_id` = ?', $params = null) use ($db, $map_prefix, $userId) {
    if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}{$table}'")) return null;
    return (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}{$table}` WHERE {$where}", $params ?? [$userId]);
  };
  $stats = array(
    'completedMarkers' => $count('user_completed_marker'),
    'bookmarks' => $count('user_bookmark'),
    'activeDays30' => $count('user_activity', '`user_id` = ? AND `day` >= CURDATE() - INTERVAL 29 DAY'),
    // Shown on the map now; a ban can hide them.
    'visibleMarkers' => $count('marker', '`user_id` = ? AND `visible` = 1')
  );

  $log = [];
  if (adminHasLog($db, $map_prefix)) {
    $log = $db->fetchAllAssociative("
      SELECT `log`.`id`, `log`.`action`, `log`.`details`, `log`.`created`,
             TIMESTAMPDIFF(SECOND, `log`.`created`, NOW()) AS `ago`,
             `log`.`admin_id` AS `adminId`, `admin`.`username` AS `adminName`
        FROM `{$map_prefix}admin_log` `log`
        LEFT JOIN `{$map_prefix}user` `admin` ON `admin`.`id` = `log`.`admin_id`
       WHERE `log`.`user_id` = ?
       ORDER BY `log`.`id` DESC
       LIMIT 50
    ", [$userId]);
    foreach ($log as &$entry) {
      $entry['details'] = $entry['details'] === null ? null : json_decode($entry['details'], true);
      $entry['ago'] = (int) $entry['ago'];
    }
    unset($entry);
  }

  echo json_encode(array('success' => true, 'user' => $user, 'stats' => $stats, 'log' => $log, 'logAvailable' => adminHasLog($db, $map_prefix)));
?>
