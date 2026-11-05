<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/account_status.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;

  // Bans or unbans an account. A banned account can't sign in, its sessions
  // end (account_status.php), and its email can't sign up again. Optionally
  // hides the markers it added; the change log keeps their ids. Unbanning
  // lifts the ban and the email block but leaves hidden markers hidden.
  if (!adminHasColumn($db, $map_prefix, 'banned')) {
    echo json_encode(array('success' => false, 'msg' => 'Run the admin_accounts migration to ban accounts.'));
    return;
  }
  $userId = (int) ($_POST['id'] ?? 0);
  $ban = ($_POST['banned'] ?? '') === '1';
  $reason = trim(is_string($_POST['reason'] ?? null) ? $_POST['reason'] : '');
  $hideMarkers = ($_POST['hideMarkers'] ?? '') === '1';

  $user = $db->fetchAssociative(
    "SELECT `id`, `email`, `level`, `deleted`, `banned` FROM `{$map_prefix}user` WHERE `id` = ?",
    [$userId]
  );
  if (!$user || $user['deleted'] !== null) {
    echo json_encode(array('success' => false, 'msg' => 'That account was not found or has been deleted.'));
    return;
  }
  if ($ban && $userId === $adminId) {
    echo json_encode(array('success' => false, 'msg' => "You can't ban your own account."));
    return;
  }
  if (!adminCanManage($adminId, $userId, $user['level'])) return;
  if (($user['banned'] !== null) === $ban) {
    echo json_encode(array('success' => true, 'msg' => $ban ? 'Account already banned.' : 'Account isn\'t banned.'));
    return;
  }
  if ($ban && ($reason === '' || mb_strlen($reason) > 500)) {
    echo json_encode(array('success' => false, 'msg' => 'Enter a reason for the ban (up to 500 characters).'));
    return;
  }

  $hasBannedEmails = (bool) $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}banned_email'");
  begin();
  if ($ban) {
    $db->executeStatement(
      "UPDATE `{$map_prefix}user` SET `banned` = NOW(), `ban_reason` = ? WHERE `id` = ?",
      [$reason, $userId]
    );
    if ($hasBannedEmails) {
      $db->executeStatement(
        "INSERT IGNORE INTO `{$map_prefix}banned_email` (`email`, `user_id`, `created`) VALUES (?, ?, NOW())",
        [emailBanKey($user['email']), $userId]
      );
    }
    $hidden = [];
    if ($hideMarkers) {
      $hidden = array_map('intval', $db->fetchFirstColumn(
        "SELECT `id` FROM `{$map_prefix}marker` WHERE `user_id` = ? AND `visible` = 1",
        [$userId]
      ));
      if ($hidden) {
        $db->executeStatement(
          "UPDATE `{$map_prefix}marker` SET `visible` = 0 WHERE `user_id` = ? AND `visible` = 1",
          [$userId]
        );
      }
    }
    $details = ['reason' => $reason];
    if ($hideMarkers) $details['hiddenMarkers'] = $hidden;
    adminLog($db, $map_prefix, $adminId, $userId, 'ban', $details);
    // Signed out of every device now, not on their next request.
    include_once(dirname(__DIR__) . '/lib/common/auth_token.php');
    authRevokeUser($db, $map_prefix, $userId);
  } else {
    $db->executeStatement(
      "UPDATE `{$map_prefix}user` SET `banned` = NULL, `ban_reason` = NULL WHERE `id` = ?",
      [$userId]
    );
    if ($hasBannedEmails) {
      $db->executeStatement("DELETE FROM `{$map_prefix}banned_email` WHERE `user_id` = ?", [$userId]);
    }
    adminLog($db, $map_prefix, $adminId, $userId, 'unban');
  }
  commit();

  echo json_encode(array(
    'success' => true,
    'msg' => $ban
      ? 'Account banned.' . (!empty($hidden) ? ' ' . count($hidden) . (count($hidden) === 1 ? ' marker' : ' markers') . ' hidden.' : '')
      : 'Account unbanned.'
  ));
?>
