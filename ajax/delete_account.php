<?php
  http_response_code(501);
  echo json_encode(array(
    "success" => false,
    "msg"     => "Feature not implemented."
  ));
  return;

  // ---- Not reachable until the feature is enabled. Kept converted so it is
  // ---- ready when it is; see the review notes.

  $path = __DIR__;

  session_start([ 'name' => 'zmap' ]);

  if (!(
       isset($_SESSION['user_id'        ] )
    && isset(   $_POST['currentpassword'] )
  )) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Must be logged in and provide current account password."
    ));
    return;
  }

  $userId = (int) $_SESSION['user_id'];

  $currentHash = $db->fetchOne("
    SELECT `password`
      FROM `{$map_prefix}user`
     WHERE `id` = ?
  ", [$userId]);

  if ($currentHash === false) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "User not found."
    ));
    return 1;
  }

  if (!password_verify((string) $_POST['currentpassword'], $currentHash)) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Current password is not correct."
    ));
    return 2;
  }

  $profilePicture   = null;
  $hasProfileColumn = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'");
  if ($hasProfileColumn) {
    $profilePicture = $db->fetchOne("
      SELECT `profile_picture`
        FROM `{$map_prefix}user`
       WHERE `id` = ?
       LIMIT 1
    ", [$userId]);
  }
  $sqlClearProfile = $hasProfileColumn ? "`profile_picture` = NULL, " : "";

  if ($softDelete) {
    $db->executeStatement("
      UPDATE `{$map_prefix}user`
         SET {$sqlClearProfile}`deleted` = now()
       WHERE `id` = ?
    ", [$userId]);
  } else {
    $timestamp = time();
    $db->executeStatement("
      UPDATE `{$map_prefix}user`
         SET {$sqlClearProfile}`username` = ?
           , `password` = '<deleted>'
           , `name`     = '<deleted>'
           , `email`    = ?
           , `ip`       = '<deleted>'
           , `deleted`  = now()
       WHERE `id` = ?
    ", ["<deleted-{$timestamp}>", "<deleted-{$timestamp}>", $userId]);
  }

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

  session_unset();
  session_destroy();
  session_write_close();

  echo json_encode(array(
    "success" => true,
    "msg"     => "Account deleted."
  ));
?>
