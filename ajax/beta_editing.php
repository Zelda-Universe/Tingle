<?php
  // Joins or leaves the community editing beta (lib/common/account_status.php):
  // POST action=join or action=leave. Answers with the account's level and
  // whether it now edits through the beta.
  start_session('zmap');
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  session_write_close();
  if (!$userId) {
    echo json_encode(array('success' => false, 'msg' => 'Sign in to join the editing beta.'));
    return;
  }
  if (!accountHasBetaColumn($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the user_add_beta_editor migration first.'));
    return;
  }
  $action = (string) ($_POST['action'] ?? '');
  if ($action !== 'join' && $action !== 'leave') {
    echo json_encode(array('success' => false, 'msg' => 'Join or leave?'));
    return;
  }
  $db->executeStatement(
    "UPDATE `{$map_prefix}user` SET `beta_editor` = " . ($action === 'join' ? 'COALESCE(`beta_editor`, NOW())' : 'NULL') .
    " WHERE `id` = ? AND " . accountUsableSql($db, $map_prefix),
    [$userId]
  );
  $role = accountRole($db, $map_prefix, $userId);
  if (!$role) {
    echo json_encode(array('success' => false, 'msg' => 'That account can no longer be used.'));
    return;
  }
  start_session('zmap');
  $_SESSION['level'] = $role[0];
  $_SESSION['beta_editor'] = $role[1];
  session_write_close();
  echo json_encode(array('success' => true, 'level' => $role[0], 'betaEditor' => $role[1]));
?>
