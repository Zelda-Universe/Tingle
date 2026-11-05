<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // Matching username, name, email or exact id, narrowed by role, status
  // and where they signed up, in the chosen order (newest first by default).
  $query = trim(is_string($_GET['q'] ?? null) ? $_GET['q'] : '');
  $offset = max(0, (int) ($_GET['offset'] ?? 0));
  $limit = 50;

  // Before the admin_accounts migration, last seen is the last sign-in.
  $lastSeen = adminHasColumn($db, $map_prefix, 'last_seen') ? 'COALESCE(`last_seen`, `last_login`)' : '`last_login`';
  $disabled = adminHasColumn($db, $map_prefix, 'disabled') ? '`disabled`' : 'NULL';
  $banned = adminHasColumn($db, $map_prefix, 'banned') ? '`banned`' : 'NULL';
  $hasSource = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'signup_source'");

  $conditions = [];
  $params = [];
  if ($query !== '') {
    $like = '%' . addcslashes($query, '%_\\') . '%';
    $conditions[] = '(`username` LIKE ? OR `name` LIKE ? OR `email` LIKE ? OR `id` = ?)';
    array_push($params, $like, $like, $like, ctype_digit($query) ? (int) $query : 0);
  }
  $roles = ['admin' => '`level` >= 10', 'contributor' => '`level` >= 5 AND `level` < 10', 'user' => '`level` < 5'];
  $role = (string) ($_GET['role'] ?? '');
  if (isset($roles[$role])) $conditions[] = $roles[$role];
  $statuses = [
    'active'   => "`deleted` IS NULL AND {$disabled} IS NULL AND {$banned} IS NULL",
    'disabled' => "`deleted` IS NULL AND {$disabled} IS NOT NULL",
    'banned'   => "`deleted` IS NULL AND {$banned} IS NOT NULL",
    'deleted'  => '`deleted` IS NOT NULL'
  ];
  $status = (string) ($_GET['status'] ?? '');
  if (isset($statuses[$status])) $conditions[] = $statuses[$status];
  $source = (string) ($_GET['source'] ?? '');
  if ($hasSource && in_array($source, ['bookmark', 'complete', 'account'], true)) {
    $conditions[] = '`signup_source` = ?';
    $params[] = $source;
  } elseif ($hasSource && $source === 'unknown') {
    $conditions[] = '`signup_source` IS NULL';
  }
  $where = $conditions ? implode(' AND ', $conditions) : '1 = 1';
  $orders = [
    'newest' => '`id` DESC',
    'oldest' => '`id` ASC',
    'seen'   => "{$lastSeen} IS NULL, {$lastSeen} DESC, `id` DESC",
    // Deleted accounts have placeholder names; they go last.
    'name'   => '`deleted` IS NOT NULL, `username` ASC, `id` ASC'
  ];
  $order = $orders[(string) ($_GET['sort'] ?? '')] ?? $orders['newest'];
  $sourceSelect = $hasSource ? '`signup_source`' : 'NULL';

  $total = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE {$where}", $params);
  // Ages in seconds come from the database's clock, which wrote the times,
  // so "2 hours ago" is right whatever the viewer's or PHP's time zone.
  $users = $db->fetchAllAssociative("
    SELECT `id`, `username`, `name`, `email`, `level`, `created`, `deleted`,
           {$lastSeen} AS `lastSeen`, {$disabled} AS `disabled`, {$banned} AS `banned`,
           {$sourceSelect} AS `signupSource`,
           TIMESTAMPDIFF(SECOND, `created`, NOW()) AS `createdAgo`,
           TIMESTAMPDIFF(SECOND, {$lastSeen}, NOW()) AS `lastSeenAgo`,
           TIMESTAMPDIFF(SECOND, `deleted`, NOW()) AS `deletedAgo`,
           TIMESTAMPDIFF(SECOND, {$disabled}, NOW()) AS `disabledAgo`,
           TIMESTAMPDIFF(SECOND, {$banned}, NOW()) AS `bannedAgo`
      FROM `{$map_prefix}user`
     WHERE {$where}
     ORDER BY {$order}
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
