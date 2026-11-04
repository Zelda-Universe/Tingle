<?php
  $path = __DIR__;

  start_session("zmap");

  if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']) || !isset($_SESSION['level'])) {
    session_destroy();
    echo json_encode(array("success"=>false, "msg"=>"Session - Not Logged!"));
    return;
  }

  // Sessions can outlive the account (e.g. "Remember me" on another device
  // after the account was deleted), so confirm it still exists.
  // The same goes for accounts an admin has disabled or banned since.
  include_once(dirname(__DIR__) . '/lib/common/account_status.php');
  $accountActive = accountIsUsable($db, $map_prefix, $_SESSION['user_id']);
  if (!$accountActive) {
    session_unset();
    session_destroy();
    echo json_encode(array("success"=>false, "msg"=>"Session - Not Logged!"));
    return;
  }

  $latestVersion = $db->fetchOne("
    SELECT CONCAT(
      `version_major`, '.',
      `version_minor`, '.',
      `version_patch`
    ) AS `version`
    FROM `{$map_prefix}changelog`
    ORDER BY
      `version_major` DESC,
      `version_minor` DESC,
      `version_patch` DESC
    LIMIT 1
  ");
  if ($latestVersion === false) {
    $latestVersion = '0.0.0';
  }

  $seenVersion = $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
  if ($latestVersion > $seenVersion) {
    $user['seen_version'] = '0.0.0';
    $_SESSION['v1'] = 0;
    $_SESSION['v2'] = 0;
    $_SESSION['v3'] = 0;
  } else {
    $user['seen_version'] = $seenVersion;
  }

  $user['id']       = $_SESSION['user_id'];
  $user['username'] = $_SESSION['username'];
  $user['level']    = $_SESSION['level'];
  $details = $db->fetchAssociative("SELECT email, name FROM `{$map_prefix}user` WHERE id = ?", [(int) $user['id']]);
  $user['email'] = $details ? $details['email'] : null;
  $user['name']  = $details ? $details['name']  : null;
  include_once(dirname(__DIR__) . '/lib/common/user_settings.php');
  $user['settings'] = userSettingsLoad($db, $map_prefix, $user['id']);

  $user['profilePicture'] = null;
  $hasProfileColumn = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'");
  if ($hasProfileColumn) {
    $profilePicture = $db->fetchOne("
      SELECT `profile_picture`
        FROM `{$map_prefix}user`
       WHERE `id` = ?
       LIMIT 1
    ", [(int) $user['id']]);
    if ($profilePicture) {
      $user['profilePicture'] = $profilePicture;
    }
  }
  if (!$user['profilePicture']) {
    $profileFiles = glob(
      dirname(__DIR__) . '/uploads/profile-pictures/' . (int) $user['id'] . '-*.webp'
    );
    if ($profileFiles) {
      usort($profileFiles, function($a, $b) {
        return filemtime($b) <=> filemtime($a);
      });
      $user['profilePicture'] = 'uploads/profile-pictures/' . basename($profileFiles[0]);
    }
  }
  session_write_close();

  $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

  $db->executeStatement("
    UPDATE {$map_prefix}user
       SET ip = ?
         , last_login = now()
     WHERE id = ?
  ", [$ip, (int) $user['id']]);

  include_once(dirname(__DIR__) . '/lib/common/activity.php');
  activityRecord($db, $map_prefix, $user['id']);

  echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));
?>
