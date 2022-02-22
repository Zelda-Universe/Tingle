<?php
   $path = __DIR__;
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

  start_session("zmap");
   if ($_SESSION['level'] < 5
      || ($_SESSION['level'] < 10 && ($_SESSION['user_id'] != $_POST['userId'])) // @TODO: Improve this to get actual marker user, since he can change the POST data
   ) {
      echo json_encode(array("success"=>false, "msg"=>"You can't delete this marker!"));
		return;
	}
  session_write_close();

    //----------------------------------------------------------//
    $query = "update " . $map_prefix . "marker set visible = 0 where id = " . $_POST['markerId'] . "";
	//echo $query;
   $result = @$mysqli->query($query); // or die(mysql_error());
   $num = $mysqli->affected_rows;

   if ($result) {
		echo json_encode(array("success"=>true, "msg"=>"Marker deleted!"));
      commit();
   } else {
      echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
		rollback();
   }
?>
