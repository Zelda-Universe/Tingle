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

  $total = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE {$where}", $params);
  $users = $db->fetchAllAssociative("
    SELECT `id`, `username`, `name`, `email`, `level`, `created`, `last_login` AS `lastLogin`, `deleted`
      FROM `{$map_prefix}user`
     WHERE {$where}
     ORDER BY `id` DESC
     LIMIT {$limit} OFFSET {$offset}
  ", $params);

  echo json_encode(array('success' => true, 'total' => $total, 'offset' => $offset, 'users' => $users));
?>
