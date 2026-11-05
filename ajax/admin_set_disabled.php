<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;

  // Disables or re-enables an account. A disabled account can't sign in and
  // its sessions end (login.php, get_user_info.php); nothing is wiped.
  if (!adminHasColumn($db, $map_prefix, 'disabled')) {
    echo json_encode(array('success' => false, 'msg' => 'Run the admin_accounts migration to disable accounts.'));
    return;
  }
  $userId = (int) ($_POST['id'] ?? 0);
  $disable = ($_POST['disabled'] ?? '') === '1';
  $user = $db->fetchAssociative("SELECT `id`, `level`, `deleted`, `disabled` FROM `{$map_prefix}user` WHERE `id` = ?", [$userId]);
  if (!$user || $user['deleted'] !== null) {
    echo json_encode(array('success' => false, 'msg' => 'That account was not found or has been deleted.'));
    return;
  }
  if ($disable && $userId === $adminId) {
    echo json_encode(array('success' => false, 'msg' => "You can't disable your own account."));
    return;
  }
  if (!adminCanManage($adminId, $userId, $user['level'])) return;
  if (($user['disabled'] !== null) === $disable) {
    echo json_encode(array('success' => true, 'msg' => $disable ? 'Account already disabled.' : 'Account already enabled.', 'disabled' => $user['disabled']));
    return;
  }

  $db->executeStatement("UPDATE `{$map_prefix}user` SET `disabled` = " . ($disable ? 'NOW()' : 'NULL') . " WHERE `id` = ?", [$userId]);
  adminLog($db, $map_prefix, $adminId, $userId, $disable ? 'disable' : 'enable');
  if ($disable) {
    // Signed out of every device now, not on their next request.
    include_once(dirname(__DIR__) . '/lib/common/auth_token.php');
    authRevokeUser($db, $map_prefix, $userId);
  }

  echo json_encode(array(
    'success' => true,
    'msg' => $disable ? 'Account disabled.' : 'Account enabled.',
    'disabled' => $disable ? $db->fetchOne("SELECT `disabled` FROM `{$map_prefix}user` WHERE `id` = ?", [$userId]) : null
  ));
?>
