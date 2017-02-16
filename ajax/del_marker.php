<?php
	include('../config.php');
	
	session_start("zmap");
	begin();
	
	if (!isset($_POST['markerId']) && !isset($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		exit();
	}

	if (!is_numeric($_POST['markerId']) && !is_numeric($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		exit();
	}
   
   if ($_SESSION['user_id'] != $_POST['userId']) {
      echo json_encode(array("success"=>false, "msg"=>"You can't delete a marker that is not yours!" . $_SESSION['user_id'] . " - " . $_POST['userId']));
		exit();	
	}
   
    //----------------------------------------------------------//
    $query = "update " . $map_prefix . "marker set visible = 0 where id = " . $_POST['markerId'] . "";
	//echo $query;
   $result = @mysql_query($query); // or die(mysql_error());
   $num = mysql_affected_rows();
   
   if ($result) {
		echo json_encode(array("success"=>true, "msg"=>"Marker deleted!"));
      commit();
   } else {
      echo json_encode(array("success"=>false, "msg"=>mysql_error()));
		rollback();
   }
?>