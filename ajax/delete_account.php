<?php
  $path = __DIR__;

	begin();

  session_start([ 'name' => 'zmap' ]);

  // debug_log('session_status: ' . session_status()         );
  // debug_log('_SESSION:'."\n"   . print_r($_SESSION, true) );
  // debug_log('_POST:'   ."\n"   . print_r($_POST   , true) );

	if(!(
       isset($_SESSION['user_id'        ] )
    && isset(   $_POST['currentpassword'] )
  )) {
		echo json_encode(array(
      "success" => false,
      "msg"     => "Must be logged in and provide current account password."
    ));
		return;
	} else {
    // debug_log('Logged in and possible current account password provided; continuing...');
  }

  $user_id = $_SESSION['user_id'];

  $query = "
    SELECT `password`
    FROM `{$map_prefix}user`
    WHERE `id` = '$user_id'
  ;";
  $result = $mysqli->query($query);
  $row = $result->fetch_assoc();

  if(!$row) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "User not found."
    ));

    return 1;
  } else {
    // debug_log('User found; continuing...');
  }

  $currentpassword = $_POST['currentpassword'];
  if (
    !isset($row['password'])
    || !password_verify($currentpassword, $row['password'])
  ) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Current password is not correct."
    ));

    return 2;
  } else {
    // debug_log('Current password is correct; continuing...');
  }

  // // For Testing
  // echo json_encode(array(
  //   "success" => true,
  //   "msg"     => "Account fake test deleted."
  // ));
  // return 254;

  if($softDelete) {
    // debug_log('Using soft delete method...');

    $query = "
      UPDATE `{$map_prefix}user`
      SET `deleted` = now()
      WHERE `id` = '$user_id'
    ;";
  } else {
    // debug_log('Using hard delete method...');

    $timestamp = time();
    // debug_log("timestamp: $timestamp");

    $query = "
      UPDATE `{$map_prefix}user`
      SET
        `username`  = '<deleted-$timestamp>',
        `password`  = '<deleted>',
        `name`      = '<deleted>',
        `email`     = '<deleted-$timestamp>',
        `ip`        = '<deleted>',
        `deleted`   = now()
      WHERE `id` = '$user_id'
    ;";
  }
  //echo $query;
  $result = $mysqli->query($query);

  if (!$result) {
    debug_log($mysqli->error);
    rollback();

    echo json_encode(array(
      "success" => false,
      "msg"     => "Account not deleted."
    ));

    return 3;
  } else {
   // debug_log('Account deleted; continuing...');
 }

  commit();

  session_unset();
  session_destroy();
  session_write_close();

  echo json_encode(array(
    "success" => true,
    "msg"     => "Account deleted."
  ));
?>
