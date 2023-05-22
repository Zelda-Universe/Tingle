<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

   if (file_exists("$path/ajax/static/container_name_" . $_GET["game"] . ".json")) {
	   readfile("$path/ajax/static/container_name_" . $_GET["game"] . ".json");
	   return;
   }
   
   $game = $_GET["game"];
    
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
?>
