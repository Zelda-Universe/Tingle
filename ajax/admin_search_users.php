<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // Newest first, matching username, name, email or exact id.
  $query = trim(is_string($_GET['q'] ?? null) ? $_GET['q'] : '');
  $offset = max(0, (int) ($_GET['offset'] ?? 0));
  $limit = 50;

  $where = '1 = 1';
  $params = [];
  if ($query !== '') {
    $like = '%' . addcslashes($query, '%_\\') . '%';
    $where = '(`username` LIKE ? OR `name` LIKE ? OR `email` LIKE ? OR `id` = ?)';
    $params = [$like, $like, $like, ctype_digit($query) ? (int) $query : 0];
  }

  // Before the admin_accounts migration, last seen is the last sign-in.
  $lastSeen = adminHasColumn($db, $map_prefix, 'last_seen') ? 'COALESCE(`last_seen`, `last_login`)' : '`last_login`';
  $disabled = adminHasColumn($db, $map_prefix, 'disabled') ? '`disabled`' : 'NULL';
  $banned = adminHasColumn($db, $map_prefix, 'banned') ? '`banned`' : 'NULL';

  $total = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE {$where}", $params);
  // Ages in seconds come from the database's clock, which wrote the times,
  // so "2 hours ago" is right whatever the viewer's or PHP's time zone.
  $users = $db->fetchAllAssociative("
    SELECT `id`, `username`, `name`, `email`, `level`, `created`, `deleted`,
           {$lastSeen} AS `lastSeen`, {$disabled} AS `disabled`, {$banned} AS `banned`,
           TIMESTAMPDIFF(SECOND, `created`, NOW()) AS `createdAgo`,
           TIMESTAMPDIFF(SECOND, {$lastSeen}, NOW()) AS `lastSeenAgo`,
           TIMESTAMPDIFF(SECOND, `deleted`, NOW()) AS `deletedAgo`,
           TIMESTAMPDIFF(SECOND, {$disabled}, NOW()) AS `disabledAgo`,
           TIMESTAMPDIFF(SECOND, {$banned}, NOW()) AS `bannedAgo`
      FROM `{$map_prefix}user`
     WHERE {$where}
     ORDER BY `id` DESC
     LIMIT {$limit} OFFSET {$offset}
  ", $params);
  foreach ($users as &$user) {
    foreach (['createdAgo', 'lastSeenAgo', 'deletedAgo', 'disabledAgo', 'bannedAgo'] as $key) {
      $user[$key] = $user[$key] === null ? null : (int) $user[$key];
    }
  }
  unset($user);

  echo json_encode(array('success' => true, 'total' => $total, 'offset' => $offset, 'users' => $users));
?>
