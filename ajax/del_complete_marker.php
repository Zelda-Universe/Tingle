<?php
   $path = DIRNAME(__FILE__);
   include_once("$path/../config.php");

	begin();

	if (!isset($_POST['markerId']) && !isset($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		return;
	}

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
      echo json_encode(array("success"=>true, "msg"=>"Marker ".$_POST['markerId']." has been as not completed!"));
      commit();
   } else {
      echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
		rollback();
   }
?>
