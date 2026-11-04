<?php
  // Account activity: one user_activity row per account per day it signs in
  // or visits while signed in (the admin page's active-user numbers), and the
  // account's last_seen time (the admin user list).

  function activityRecord($db, $prefix, $userId) {
    try {
      $db->executeStatement(
        "INSERT IGNORE INTO `{$prefix}user_activity` (`user_id`, `day`) VALUES (?, CURDATE())",
        [(int) $userId]
      );
    } catch (\Throwable $e) {
      // Before the user_activity migration has run.
    }
    try {
      // At most every five minutes, so a visit doesn't always write.
      $db->executeStatement(
        "UPDATE `{$prefix}user` SET `last_seen` = NOW()
          WHERE `id` = ? AND (`last_seen` IS NULL OR `last_seen` < NOW() - INTERVAL 5 MINUTE)",
        [(int) $userId]
      );
    } catch (\Throwable $e) {
      // Before the admin_accounts migration has run.
    }
  }
?>
