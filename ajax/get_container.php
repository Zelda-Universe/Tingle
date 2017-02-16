<?php
	include('../config.php');
	
	$map = $_GET["game"];
    
   $query = 'select id
                  , marker_url as markerURL
				      , marker_ext as markerExt
				      , background_color as bgColor
				      , show_map_control as showMapControl
				      , show_zoom_control as showZoomControl
				      , default_pos_x as centerX
				      , default_pos_y as centerY
				      , cluster_max_zoom as clusterMaxZoom
				      , cluster_grid_size as clusterGridSize
                  , max_zoom as maxZoom
				      , tile_size as tileSize
               from ' . $map_prefix . 'container c
              where (c.id = \'' . $map . '\'
                     or c.short_name = \'' . $map . '\')
				    and c.visible = 1;
   ';
	//echo $query;
   $result = @$mysqli->query($query) or die($mysqli->error);
   
   $res = array();
   while($row = $result->fetch_assoc()) {
        $res[] = $row;
   }
   echo json_encode($res);
?>
