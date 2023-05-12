<?php
   $path = __DIR__;

	begin();

	if (!isset($_POST['gameId']) && !isset($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		return;
	}

	if (!is_numeric($_POST['gameId']) && !is_numeric($_POST['userId'])) {
		echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
		return;
	}

   //----------------------------------------------------------//
   $query = "delete from " . $map_prefix . "user_completed_marker" .
            " where user_id = " . $_POST['userId'] .
            "   and marker_id in (select m.id" .
            "                       from " . $map_prefix . "marker m" .
            "                          , " . $map_prefix . "marker_category mc" .
            "                      where m.marker_category_id = mc.id" .
            "                        and mc.container_id = " . $_POST['gameId'] .
            "                    )"
   ;

	//echo $query;
   $result = @$mysqli->query($query); // or die(mysql_error());

   if ($result) {
		//echo json_encode(array("success"=>false));
      echo json_encode(array("success"=>true, "msg"=>"All markers for game ".$_POST['gameId']." have been marked as not completed!"));
      commit();
   } else {
      echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
		rollback();
   }
?>
