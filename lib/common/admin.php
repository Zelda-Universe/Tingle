<?php
  // Admin endpoints (ajax/admin_*.php). Admins are level 10+, the same level
  // that may edit any marker.

  const ADMIN_LEVEL = 10;

  // The signed-in admin's id, or null after answering 403. Checks the
  // database rather than the session, which keeps the level from sign-in.
  function adminRequire($db, $prefix) {
    start_session('zmap');
    $userId = (int) ($_SESSION['user_id'] ?? 0);
    session_write_close();
    $level = $userId ? $db->fetchOne(
      "SELECT `level` FROM `{$prefix}user` WHERE `id` = ? AND `deleted` IS NULL",
      [$userId]
    ) : false;
    if ($level === false || (int) $level < ADMIN_LEVEL) {
      http_response_code(403);
      echo json_encode(array('success' => false, 'msg' => 'Admins only.'));
      return null;
    }
    return $userId;
  }
?>
