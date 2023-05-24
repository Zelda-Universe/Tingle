<?php
   $path = __DIR__;

   if (file_exists("$path/ajax/static/categories_" . $_GET["game"] . ".json")) {
	   readfile("$path/ajax/static/categories_" . $_GET["game"] . ".json");
	   return;
   }

   $map = $_GET["game"];

	$query = 'select id
				      , parent_id               as parentId
			         , name
			         , default_checked         as checked
			         , img
                  , color
                  , marker_category_type_id as markerCategoryTypeId
                  , visible_zoom            as visibleZoom
               from ' . $map_prefix . 'marker_category mc
              where mc.container_id = ' . $map . '
			       and mc.visible = 1
              order by parent_id desc, id asc;
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
