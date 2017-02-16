<?php
	include('../config.php');

   $map = $_GET["game"];
   
	$query = 'select id
				      , parent_id               as parentId
			         , name
			         , default_checked         as checked
			         , img
                  , color
                  , marker_category_type_id as markerCategoryTypeId
               from ' . $map_prefix . 'marker_category mc
              where mc.container_id = ' . $map . '
			       and mc.visible = 1
              order by parent_id desc, id asc;
   ';
   //echo $query;
   $result = @$mysqli->query($query) or die($mysqli->error);
   
   $res = array();
   while($row = $result->fetch_assoc()) {
        $res[] = $row;
   }
   echo json_encode($res);
?>
