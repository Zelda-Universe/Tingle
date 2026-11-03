<?php
  // debug_log("get_container START");

  $path = __DIR__;

  $map = $_GET["game"] ?? '';
  if ($map === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $map)) {
    echo json_encode(array());
    return;
  }
  // debug_log("map: $map");

  if (file_exists("$path/static/container_{$map}.json")) {
    readfile("$path/static/container_{$map}.json");
    return;
  }

  $res = $db->fetchAllAssociative("
    SELECT id
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
      , scaleP  as scaleP
      , scaleN  as scaleN
      , offsetX as offsetX
      , offsetY as offsetY
      , visible as visible
    FROM {$map_prefix}container c
    WHERE (
      c.id = ?
      OR c.short_name = ?
    )
    AND c.enabled = 1
  ", [$map, $map]);

  echo json_encode($res);

  // debug_log("get_container END");
?>
