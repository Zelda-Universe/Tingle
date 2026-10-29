<?php
   $path = __DIR__;

	begin();

	if (!isset($_POST['markerId']) || !isset($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		return;
	}
   start_session("zmap");
   if (empty($_SESSION['user_id']) || $_SESSION['user_id'] != $_POST['userId']) {
      echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
      return;
   }
   session_write_close();

	if (!is_numeric($_POST['markerId']) && !is_numeric($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		return;
	}

   //----------------------------------------------------------//
   $query = "delete from " . $map_prefix . "user_completed_marker " .
            " where user_id = " . $_POST['userId'] .
            "   and marker_id = " . $_POST['markerId'];

	//echo $query;
   $result = @$mysqli->query($query); // or die(mysql_error());

   if ($result) {
		//echo json_encode(array("success"=>false));
      echo json_encode(array("success"=>true, "msg"=>"Marker ".$_POST['markerId']." has no longer been marked as completed!"));
      commit();
   } else {
      echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
		rollback();
   }
?>
