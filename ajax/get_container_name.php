<?php
  // debug_log("get_container_name START");

   $path = __DIR__;

   $game = $_GET["game"];
   // debug_log("game: $game");

   $query = "select name
               from " . $map_prefix . "container c
              where (c.id = '" . $game . "'
                     or c.short_name = '" . $game . "')
                and c.visible = 1;
    ";
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

   $row = $result->fetch_array();
   echo json_encode(array("success"=>true,"name"=>$row['name']));

  // debug_log("get_container_name END");
?>
