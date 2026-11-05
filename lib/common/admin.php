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
    include_once(__DIR__ . '/account_status.php');
    $level = $userId ? $db->fetchOne(
      "SELECT `level` FROM `{$prefix}user` WHERE `id` = ? AND " . accountUsableSql($db, $prefix),
      [$userId]
    ) : false;
    if ($level === false || (int) $level < ADMIN_LEVEL) {
      http_response_code(403);
      echo json_encode(array('success' => false, 'msg' => 'Admins only.'));
      return null;
    }
    return $userId;
  }

  // Admins are equals: none of them can change, disable or ban another
  // admin's account from here. Those changes are made at the database, by
  // the people who run the site. Answers for the caller when it refuses.
  function adminCanManage($adminId, $targetId, $targetLevel) {
    if ((int) $targetId === (int) $adminId || (int) $targetLevel < ADMIN_LEVEL) return true;
    echo json_encode(array('success' => false, 'msg' => "Other admins' accounts can't be changed here."));
    return false;
  }

  // Columns and tables from the admin_accounts migration (last_seen, disabled,
  // admin_log) may not exist yet on older databases.
  function adminHasColumn($db, $prefix, $column) {
    static $found = [];
    // SHOW COLUMNS can't take a placeholder, so only known names go in.
    if (!in_array($column, ['last_seen', 'disabled', 'deleted', 'banned'], true)) return false;
    if (!isset($found[$column])) {
      $found[$column] = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$prefix}user` LIKE '{$column}'");
    }
    return $found[$column];
  }

  function adminHasLog($db, $prefix) {
    static $found = null;
    if ($found === null) $found = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}admin_log'");
    return $found;
  }

  // Records an admin's change to an account. $details is an array, stored as
  // JSON; never include passwords.
  function adminLog($db, $prefix, $adminId, $userId, $action, $details = null) {
    if (!adminHasLog($db, $prefix)) return;
    $db->executeStatement(
      "INSERT INTO `{$prefix}admin_log` (`admin_id`, `user_id`, `action`, `details`, `created`) VALUES (?, ?, ?, ?, NOW())",
      [(int) $adminId, (int) $userId, $action, $details === null ? null : json_encode($details)]
    );
  }
?>
