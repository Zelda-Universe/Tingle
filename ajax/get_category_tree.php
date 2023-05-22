<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");
   
   if (file_exists("$path/ajax/static/categories_tree_" . $_GET["game"] . ".json")) {
	   readfile("$path/ajax/static/categories_tree_" . $_GET["game"] . ".json");
	   return;
   }
   
   $map = $_GET["game"];

   $query = 'select *
               from ' . $map_prefix . 'marker_category
              where parent_id is null
                and container_id = ' . $map . '
                and visible = 1
                and marker_category_type_id <> 3
              order by id
            ';

   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

   $arr_treeview = array();

   while ($row = $result->fetch_array()) {
      $arr_child = array();
      $node['id']   = $row['id'];
      $node['name'] = $row['name'];
      $node['img']  = $row['img'];
      $node['color']= $row['color'];
      $node['checked'] = $row['default_checked'] == 1 ? true : false;
      $node['visible_zoom']= $row['visibleZoom'];

      $query = 'select *
                  from ' . $map_prefix . 'marker_category
                 where parent_id = ' . $row['id'] . '
                   and container_id = ' . $map . '
                   and visible = 1
                   and id in (SELECT mc.id 
                                FROM ' . $map_prefix . 'marker m 
                                   , ' . $map_prefix . 'marker_category mc 
                               where m.marker_category_id = mc.id 
                                 and m.visible = 1 
                                 and mc.visible = 1 
                                 and mc.container_id = ' . $map . '
                               group by mc.id
                              )
                 order by id
               ';

      $result2 = $mysqli->query($query);
      if ($result2) {
         while ($row2 = $result2->fetch_array()) {
            $children['id'] = $row2['id'];
            $children['name'] = $row2['name'];
            $children['img']  = $row2['img'];
            $children['color']  = $row2['color'];
            $children['checked'] = $row2['default_checked'] == 1 ? true : false;
            $children['visible_zoom']= $row2['visibleZoom'];
            array_push($arr_child, $children);
         }
         $node['children'] = $arr_child;
      }
      array_push($arr_treeview, $node);
   }
    echo json_encode($arr_treeview);
?>
