<?php
  $path = __DIR__;

  start_session("zmap");

  if (empty($_SESSION['user_id'])) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Please log in first."
    ));
    return;
  }

  $password = (string) ($_POST['currentpassword'] ?? '');
  if ($password === '') {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Enter your current password."
    ));
    return;
  }

  $userId = (int) $_SESSION['user_id'];

  $currentHash = $db->fetchOne("
    SELECT `password`
      FROM `{$map_prefix}user`
     WHERE `id` = ?
  ", [$userId]);

  // Older accounts were hashed from a mysqli-escaped copy of the password; see
  // login.php.
  $passwordLegacyEscaped = strtr($password, [
    "\\"   => "\\\\",
    "'"    => "\\'",
    "\""   => "\\\"",
    "\n"   => "\\n",
    "\r"   => "\\r",
    "\0"   => "\\0",
    "\x1a" => "\\Z",
  ]);

  if (
        $currentHash === false
    ||  !(
             password_verify($password,              $currentHash)
         ||  password_verify($passwordLegacyEscaped, $currentHash)
        )
  ) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Current password is not correct."
    ));
    return;
  }

  // Columns and tables added by later migrations may be missing on older
  // databases.
  $hasProfileColumn  = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'");
  $hasDeletedColumn  = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'deleted'");
  $hasBookmarksTable = (bool) $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}user_bookmark'");

  $profilePicture = $hasProfileColumn
    ? $db->fetchOne("SELECT `profile_picture` FROM `{$map_prefix}user` WHERE `id` = ?", [$userId])
    : null;

  // Anonymize the account: personal details are wiped and the username and
  // email freed for reuse. Markers and tabs the user contributed stay on the
  // map, credited to a deleted user.
  $placeholder = "<deleted-{$userId}>";

  begin();

  $db->executeStatement("
    DELETE FROM `{$map_prefix}user_completed_marker`
     WHERE `user_id` = ?
  ", [$userId]);

  if ($hasBookmarksTable) {
    $db->executeStatement("
      DELETE FROM `{$map_prefix}user_bookmark`
       WHERE `user_id` = ?
    ", [$userId]);
  }

  $db->executeStatement("
    UPDATE `{$map_prefix}user`
       SET `username` = ?
         , `password` = '<deleted>'
         , `name`     = '<deleted>'
         , `email`    = ?
         , `ip`       = '<deleted>'
         " . ($hasProfileColumn ? ", `profile_picture` = NULL" : "") . "
         " . ($hasDeletedColumn ? ", `deleted` = now()"       : "") . "
     WHERE `id` = ?
  ", [$placeholder, $placeholder, $userId]);

  commit();

  if ($profilePicture && preg_match('#^uploads/profile-pictures/[A-Za-z0-9._-]+$#', $profilePicture)) {
    $profilePath = dirname(__DIR__) . '/' . $profilePicture;
    if (is_file($profilePath)) {
      @unlink($profilePath);
    }
  }
  $profileFiles = glob(dirname(__DIR__) . '/uploads/profile-pictures/' . $userId . '-*.webp');
  if ($profileFiles) {
    foreach ($profileFiles as $profileFile) {
      if (is_file($profileFile)) {
        @unlink($profileFile);
      }
    }
  }

  // End the session the same way logout.php does, on every device.
  include_once(dirname(__DIR__) . '/lib/common/auth_token.php');
  authRevokeUser($db, $map_prefix, $userId);
  authSetCookie('', time() - 3600);
  setcookie(session_name(), '', [
    'expires'  => time() - 3600,
    'path'     => '/',
    'secure'   => session_cookie_is_secure(),
    'httponly' => true,
    'samesite' => 'Lax'
  ]);
  unset($_COOKIE[session_name()]);
  session_unset();
  session_destroy();
  session_write_close();

  setcookie('user_id' , '', time() - 3600, '/');
  setcookie('username', '', time() - 3600, '/');

  echo json_encode(array(
    "success" => true,
    "msg"     => "Account deleted."
  ));
?>
