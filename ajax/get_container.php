<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");
   
   $map = $_GET["game"];
    
   $query = 'select id
                  , name
                  , short_name as shortName
                  , icon       as icon
                  , marker_url as markerURL
                  , marker_ext as markerExt
                  , background_color as bgColor
                  , show_map_control as showMapControl
                  , show_zoom_control as showZoomControl
                  , default_pos_x as centerX
                  , default_pos_y as centerY
                  , cluster_max_zoom as clusterMaxZoom
                  , cluster_grid_size as clusterGridSize
                  , default_zoom as defaultZoom
                  , max_zoom as maxZoom
                  , tile_size as tileSize
                  , icon_width as iconWidth
                  , icon_height as iconHeight
               from ' . $map_prefix . 'container c
              where (c.id = \'' . $map . '\'
                     or c.short_name = \'' . $map . '\')
                and c.visible = 1;
   ';
   //echo $query;
   $result = @$mysqli->query($query);

   if(!$result) {
      print($mysqli->error);
      return;
   }
   
   $res = array();
   while($row = $result->fetch_assoc()) {
        $res[] = $row;
   }
   echo json_encode($res);
?>
