<?php
  // Resolves a report (Admin > Reports): action=undo puts the marker back as
  // it was before the edit (saved as a new revision), warn gives its editor a
  // strike (three at most) and tells them, dismiss closes the report, banned
  // closes it once Ban has gone through (admin_set_ban.php). The other open
  // reports of the same edit are closed with it.
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $action = (string) ($_POST['action'] ?? '');
  if (!in_array($action, ['undo', 'warn', 'dismiss', 'banned'], true)) return $fail('Undo, warn, ban or dismiss?');
  $report = $db->fetchAssociative("
    SELECT `rp`.`id`, `rp`.`status`, `rp`.`reason`, `rv`.`id` AS `revisionId`, `rv`.`marker_id` AS `markerId`, `rv`.`user_id` AS `editorId`
      FROM `{$map_prefix}edit_report` `rp`
      JOIN `{$map_prefix}marker_revision` `rv` ON `rv`.`id` = `rp`.`revision_id`
     WHERE `rp`.`id` = ?
  ", [(int) ($_POST['id'] ?? 0)]);
  if (!$report) return $fail('That report was not found.');
  if ($report['status'] !== 'open') return $fail('That report has already been dealt with.');
  $markerId = (int) $report['markerId'];
  $editorId = (int) $report['editorId'];
  $note = trim(is_string($_POST['note'] ?? null) ? $_POST['note'] : '');
  $result = array('success' => true);

  if ($action === 'undo') {
    // The version before the reported edit; an added marker is hidden.
    $previous = $db->fetchAssociative(
      "SELECT `id`, `data` FROM `{$map_prefix}marker_revision` WHERE `marker_id` = ? AND `id` < ? ORDER BY `id` DESC LIMIT 1",
      [$markerId, (int) $report['revisionId']]
    );
    begin();
    if ($previous) {
      wikiApplySnapshot($db, $map_prefix, $markerId, json_decode($previous['data'], true), $adminId);
      $newId = wikiRecordRevision($db, $map_prefix, $markerId, $adminId, 'revert',
        'Undid reported edit [[rev:' . (int) $report['revisionId'] . ']]', (int) $previous['id']);
    } else {
      $db->executeStatement("UPDATE `{$map_prefix}marker` SET `visible` = 0 WHERE `id` = ?", [$markerId]);
      $newId = wikiRecordRevision($db, $map_prefix, $markerId, $adminId, 'delete',
        'Removed reported marker [[rev:' . (int) $report['revisionId'] . ']]');
    }
    commit();
    notifyMarkerChange($db, $map_prefix, $adminId, $markerId, $newId, $previous ? 'revert' : 'delete');
    $result['msg'] = $previous ? 'The edit was undone.' : 'The marker it added was removed.';
  } elseif ($action === 'warn') {
    $warnings = (int) $db->fetchOne("SELECT `warnings` FROM `{$map_prefix}user` WHERE `id` = ?", [$editorId]);
    if ($warnings >= 3) return $fail('They already have three strikes. Ban them instead.');
    $level = (int) $db->fetchOne("SELECT `level` FROM `{$map_prefix}user` WHERE `id` = ?", [$editorId]);
    if (!adminCanManage($adminId, $editorId, $level)) return;
    $db->executeStatement("UPDATE `{$map_prefix}user` SET `warnings` = `warnings` + 1 WHERE `id` = ?", [$editorId]);
    $strikes = $warnings + 1;
    adminLog($db, $map_prefix, $adminId, $editorId, 'warn', array('strikes' => $strikes, 'reportId' => (int) $report['id'], 'note' => $note));
    $marker = notificationMarkerInfo($db, $map_prefix, $markerId);
    notificationDeliver($db, $map_prefix, $adminId, array($editorId => array('warning')),
      array('pageType' => 'marker', 'pageId' => $markerId, 'markerId' => $markerId, 'revisionId' => (int) $report['revisionId']),
      array('actor' => 'An admin', 'markerTitle' => $marker ? $marker['title'] : 'a marker', 'game' => $marker ? $marker['game'] : null,
        'strikes' => $strikes, 'excerpt' => notificationExcerpt($note !== '' ? $note : $report['reason']))
    );
    $result['msg'] = 'Warned: strike ' . $strikes . ' of 3.';
    $result['warnings'] = $strikes;
  } else {
    $result['msg'] = $action === 'banned' ? 'The report is closed.' : 'Report dismissed.';
  }

  $resolution = array('undo' => 'undone', 'warn' => 'warned', 'dismiss' => 'dismissed', 'banned' => 'banned')[$action];
  $db->executeStatement(
    "UPDATE `{$map_prefix}edit_report` SET `status` = 'resolved', `resolution` = ?, `resolved_by` = ?, `resolved` = NOW()
      WHERE `revision_id` = ? AND `status` = 'open'",
    [$resolution, $adminId, (int) $report['revisionId']]
  );
  echo json_encode($result);
?>
