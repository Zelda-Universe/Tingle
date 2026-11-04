<?php
  // Daily account activity for the admin page's active-user numbers: one
  // row per account per day it signs in or visits while signed in.

  function activityRecord($db, $prefix, $userId) {
    try {
      $db->executeStatement(
        "INSERT IGNORE INTO `{$prefix}user_activity` (`user_id`, `day`) VALUES (?, CURDATE())",
        [(int) $userId]
      );
    } catch (\Throwable $e) {
      // Before the user_activity migration has run.
    }
  }
?>
