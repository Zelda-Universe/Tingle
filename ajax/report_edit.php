<?php
  // Reports an edit (a marker revision) as a problem, for an admin to review
  // in Admin > Reports. Anyone signed in can report; each person once per edit
  // while it's open. Admins hear about it (notification edit_report).
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  start_session('zmap');
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  session_write_close();
  if (!$userId || !accountRole($db, $map_prefix, $userId)) {
    echo json_encode(array('success' => false, 'msg' => 'Sign in to report an edit.'));
    return;
  }
  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}edit_report'")) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $revisionId = (int) ($_POST['revisionId'] ?? 0);
  $reason = trim(is_string($_POST['reason'] ?? null) ? $_POST['reason'] : '');
  if ($reason === '' || mb_strlen($reason) > 1000) {
    echo json_encode(array('success' => false, 'msg' => 'Say what\'s wrong with the edit (up to 1,000 characters).'));
    return;
  }
  $revision = $db->fetchAssociative(
    "SELECT `id`, `marker_id`, `user_id` FROM `{$map_prefix}marker_revision` WHERE `id` = ? AND `action` <> 'import'",
    [$revisionId]
  );
  if (!$revision) {
    echo json_encode(array('success' => false, 'msg' => 'That edit was not found.'));
    return;
  }
  if ($db->fetchOne(
    "SELECT 1 FROM `{$map_prefix}edit_report` WHERE `revision_id` = ? AND `reporter_id` = ? AND `status` = 'open'",
    [$revisionId, $userId]
  )) {
    echo json_encode(array('success' => true, 'msg' => 'You\'ve already reported this edit. An admin will take a look.'));
    return;
  }
  // Enough for anyone; not for someone filling the queue.
  if ((int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}edit_report` WHERE `reporter_id` = ? AND `created` > NOW() - INTERVAL 1 HOUR", [$userId]
  ) >= 20) {
    echo json_encode(array('success' => false, 'msg' => 'That\'s a lot of reports at once. Try again later.'));
    return;
  }
  $db->executeStatement(
    "INSERT INTO `{$map_prefix}edit_report` (`revision_id`, `reporter_id`, `reason`, `status`, `created`) VALUES (?, ?, ?, 'open', NOW())",
    [$revisionId, $userId, $reason]
  );
  $reportId = (int) $db->lastInsertId();
  $marker = notificationMarkerInfo($db, $map_prefix, (int) $revision['marker_id']);
  $admins = $db->fetchFirstColumn("SELECT `id` FROM `{$map_prefix}user` WHERE `level` >= ? AND " . accountUsableSql($db, $map_prefix), [WIKI_ADMIN_LEVEL]);
  $candidates = array();
  foreach ($admins as $adminId) $candidates[(int) $adminId] = array('edit_report');
  notificationDeliver($db, $map_prefix, $userId, $candidates,
    array('pageType' => 'marker', 'pageId' => (int) $revision['marker_id'], 'markerId' => (int) $revision['marker_id'], 'revisionId' => $revisionId),
    array(
      'actor' => (string) $db->fetchOne("SELECT `username` FROM `{$map_prefix}user` WHERE `id` = ?", [$userId]),
      'markerTitle' => $marker ? $marker['title'] : 'a marker', 'game' => $marker ? $marker['game'] : null,
      'excerpt' => notificationExcerpt($reason), 'reportId' => $reportId,
      'link' => array('page' => 'admin-reports')
    )
  );
  echo json_encode(array('success' => true, 'msg' => 'Thanks. An admin will take a look.'));
?>
