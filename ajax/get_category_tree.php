<?php
   include('../config.php');

   $map = $_GET["game"];

   $query = 'select *
               from ' . $map_prefix . 'marker_category
              where parent_id is null
                and container_id = ' . $map . '
                and visible = 1
              order by id
            ';

   $result = @mysql_query($query) or die(mysql_error());

   $arr_treeview = array();
   
   while ($row = mysql_fetch_array($result)) {
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

      $result2 = mysql_query($query);
      if ($result2) {
         while ($row2 = mysql_fetch_array($result2)) {
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
