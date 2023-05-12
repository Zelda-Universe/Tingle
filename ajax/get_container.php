<?php
  // debug_log("get_container START");

   $path = __DIR__;

   $map = $_GET["game"];
   // debug_log("map: $map");

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
                  , bound_top_pos_x as boundTopX
                  , bound_top_pos_y  as boundTopY
                  , bound_bottom_pos_x as boundBottomX
                  , bound_bottom_pos_y as boundBottomY
                  , cluster_max_zoom as clusterMaxZoom
                  , cluster_grid_size as clusterGridSize
                  , default_zoom as defaultZoom
                  , max_zoom as maxZoom
                  , tile_size as tileSize
                  , icon_width as iconWidth
                  , icon_height as iconHeight
                  , icon_small_width as iconSmallWidth
                  , icon_height as iconSmallHeight
                  , switch_icons_at_zoom as switchIconsAtZoom
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

  // debug_log("get_container END");
?>
