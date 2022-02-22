<?php
   if (!isset($_GET['newMarkerId'])) {
     $path = __DIR__;
   	 include_once("$path/../config.php");
   }

   $query = 'select m.id markerId
				   from ' . $map_prefix . 'marker m
                  , ' . $map_prefix . 'marker_category mc
				      , ' . $map_prefix . 'submap smp
                  , ' . $map_prefix . 'map mp   
                  , ' . $map_prefix . 'user_completed_marker ucm  
              where m.marker_category_id = mc.id
				    and m.submap_id = smp.id
                and smp.map_id = mp.id
				    and mp.container_id = ' . $_GET["game"] . '
                and m.visible = 1
                and mc.visible = 1
                and ucm.marker_id = m.id
                and ucm.user_id = ' . $_GET["userId"] .'
                ';

   //echo $query . "\n";
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

	$res = array();
	while ($row = $result->fetch_assoc()) {
		$row["markerId"] = html_entity_decode($row["markerId"], ENT_QUOTES, "UTF-8");
		$res[] = $row;
	}
   echo json_encode($res);

?>
