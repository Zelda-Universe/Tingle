<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

   $map = $_GET["game"];

   $query = 'select *
               from ' . $map_prefix . 'marker_category
              where parent_id is null
                and container_id = ' . $map . '
                and visible = 1
              order by id
            ';

   $result = @$mysqli->query($query) or die($mysqli->error);

   $arr_treeview = array();
   
   while ($row = $result->fetch_array()) {
      $arr_child = array();
      $node['id']   = $row['id'];
      $node['name'] = $row['name'];
      $node['img']  = $row['img'];
      $node['color']= $row['color'];

      $query = 'select *
                  from ' . $map_prefix . 'marker_category
                 where parent_id = ' . $row['id'] . '
                   and container_id = ' . $map . '
                   and visible = 1
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
            array_push($arr_child, $children);
         }
         $node['children'] = $arr_child;
      }
      array_push($arr_treeview, $node);
   }
    echo json_encode($arr_treeview);
?>
