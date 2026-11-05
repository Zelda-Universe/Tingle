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

  // Admin statistics are computed once per $ttl seconds and shared from a
  // file in the cache folder, not computed per request: the feature graphs
  // scan user_completed_marker (66 million rows), and every click on the
  // admin page used to rerun them. While one request computes, others wait
  // for its result instead of starting their own (a lock file), so a page
  // opened by several people costs one computation.
  function adminCached($key, $ttl, $compute) {
    global $cacheFolder;
    $directory = rtrim($cacheFolder, '/') . '/admin';
    if (!is_dir($directory) && !@mkdir($directory, 0700, true)) return $compute();
    $file = $directory . '/' . preg_replace('/[^A-Za-z0-9_.-]/', '_', $key) . '.json';
    $fresh = function() use ($file, $ttl) {
      if (!is_file($file) || filemtime($file) <= time() - $ttl) return null;
      $data = json_decode((string) file_get_contents($file), true);
      return is_array($data) ? $data : null;
    };
    $data = $fresh();
    if ($data !== null) return $data;
    $lock = @fopen($file . '.lock', 'c');
    if (!$lock) return $compute();
    try {
      flock($lock, LOCK_EX);
      // Another request may have finished computing while this one waited.
      $data = $fresh();
      if ($data === null) {
        $data = $compute();
        if (@file_put_contents($file . '.tmp', json_encode($data), LOCK_EX) !== false) {
          @rename($file . '.tmp', $file);
        }
      }
    } finally {
      flock($lock, LOCK_UN);
      fclose($lock);
    }
    return $data;
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
