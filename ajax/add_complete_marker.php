<?php
  $path = __DIR__;

	begin();

  if (
        !is_numeric($_POST['userId'])
    ||  !is_numeric($_POST['markerId'])
  ) {
		echo json_encode(array(
      "success" => false,
      "msg" => "Not logged or session expired!"
    ));
		return;
	}

  start_session("zmap");
	if ($_SESSION['user_id'] != $_POST['userId']) {
		echo json_encode(array(
      "success" => false,
      "msg" => "Not logged or session expired!"
    ));
		return;
	}
  session_write_close();
     $userId   = (int) $_POST['userId'];
     $markerId = (int) $_POST['markerId'];

  $query = "
    DELETE FROM {$map_prefix}user_completed_marker
    WHERE user_id = '{$userId}'
    AND marker_id = '{$markerId}'
  ";

  $result = @$mysqli->query($query);

  $query = "
    INSERT INTO `{$map_prefix}user_completed_marker` (
        `user_id`
      , `marker_id`
      , `complete_date`
      , `visible`
    ) VALUES (
        '{$userId}'
      , '{$markerId}'
      , now()
      , '1'
    );"
   ;

   $result = @$mysqli->query($query);
   if ($result) {
      echo json_encode(array(
        "success" => true,
        "msg"     => "Marker {$markerId} has been completed!"
      ));
   } else {
      echo json_encode(array(
        "success" => false,
        "msg"     => $mysqli->error
      ));

      rollback();
   }

   commit();
?>
