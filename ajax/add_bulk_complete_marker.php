<?php
   $path = DIRNAME(__FILE__);
   include_once("$path/../config.php");

	begin();

   if (!is_numeric($_POST['userId']))
   {
		echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
		return;
	}

   start_session("zmap");
	if ($_SESSION['user_id'] != $_POST['userId']) {
		echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
		return;
	}
   session_write_close();

   $markerList = json_decode($_POST['markerList'], true);

   if (count($markerList) > 0) {
      $query = "insert into " . $map_prefix . "user_completed_marker (
                         user_id
                       , marker_id
                       , complete_date
                       , visible
                ) values ";   
                
      // @TODO: Move to a Config in the DB?
      $commitEvery = 10;
      
      for ($i = 0; $i < count($markerList); $i++) {
         $query = $query . "(" .$_POST['userId'] . ", " . $markerList[$i] . ", now(), 1)";
         if ($i == count($markerList) - 1) {
            break;
         } else if (($i + 1) % $commitEvery != 0) {
            $query = $query . ",";
         } else {
            $query = $query . " ON DUPLICATE KEY UPDATE user_id=user_id;";
            
            $result = @$mysqli->query($query); // or die(mysql_error());
            if ($result) {
               
            } else {
               echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
               rollback();
               exit(0);
            }
            
            if ($i != count($markerList) - 1) {
               $query = "insert into " . $map_prefix . "user_completed_marker (
                                  user_id
                                , marker_id
                                , complete_date
                                , visible
                         ) values ";   
            }
         }
      }
      $query = $query . " ON DUPLICATE KEY UPDATE user_id=user_id";

      $result = @$mysqli->query($query); // or die(mysql_error());
      if ($result) {
         //echo json_encode(array("success"=>false));
         echo json_encode(array("success"=>true, "msg"=>"Markers in the list were marked as completed!"));
      } else {
         echo json_encode(array("success"=>false, "msg"=>$mysqli->error()));
         rollback();
      }
      commit();
   } else {
      echo json_encode(array("success"=>true, "msg"=>"No markers to mark as complete!"));
   }
?>
