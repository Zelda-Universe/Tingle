<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

   $map = $_GET["game"];
    
   $query = "select c.id
                  , c.short_name as shortName
                  , c.name
                  , c.icon
               from " . $map_prefix . "container c
              where c.visible = 1
             order by c.id
   ;";
   //echo $query;
    
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}
   
   $res = array();
   
   while ($row = $result->fetch_assoc()) {
      array_push($res, $row);
   }
   echo json_encode($res);
?>