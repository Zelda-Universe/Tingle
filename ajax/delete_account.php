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

  if ($softDelete) {
    $db->executeStatement("
      UPDATE `{$map_prefix}user`
         SET `deleted` = now()
       WHERE `id` = ?
    ", [$userId]);
  } else {
    $timestamp = time();
    $db->executeStatement("
      UPDATE `{$map_prefix}user`
         SET `username` = ?
           , `password` = '<deleted>'
           , `name`     = '<deleted>'
           , `email`    = ?
           , `ip`       = '<deleted>'
           , `deleted`  = now()
       WHERE `id` = ?
    ", ["<deleted-{$timestamp}>", "<deleted-{$timestamp}>", $userId]);
  }

  session_unset();
  session_destroy();
  session_write_close();

  echo json_encode(array(
    "success" => true,
    "msg"     => "Account deleted."
  ));
?>
