<?php
   if (!isset($_GET['newMarkerId'])) {
     $path = DIRNAME(__FILE__);
     include('$path/../config.php');
   }
   /*
	session_start("map");
   $query = 'select max(last_updated) as last_updated
               from ' . $map_prefix . 'marker m
			         , ' . $map_prefix . 'map mp
              where m.map_id = mp.id
				    and mp.container_id = ' . $_GET["game"] . '
				    and m.last_updated > \'' . $_SESSION["last_updated"] . '\';
    ';
	
   $result = @$mysqli->query($query) or die(mysql_error());
	
	$row = $mysqli->fetch_array($result, MYSQL_ASSOC);
	
	if ($row['last_updated'] != $_SESSION["last_updated"]
			&& $row['last_updated'] != "") {
		$temp = $row['last_updated'];
	} else {
		exit("[]");
	}	
   $_SESSION["last_updated"] 
	*/
   $last_update = $temp = '1800-01-01 00:00:00';
	$query = "SET SESSION group_concat_max_len = 4294967295";
	$result = @$mysqli->query($query);
   
   $search =  str_replace(' ', '%', $_GET['q']);
	
   $query = 'select m.id
                  , m.marker_category_id         as markerCategoryId
                  , m.name                       as title
                  , m.x
                  , m.y
				   from ' . $map_prefix . 'marker m
               left outer join (SELECT c.marker_tab_id
				                         , c.tab_title
									          , c.tab_text
									          , c.user_id
								         	 , u2.username
								         	 , c.marker_id
								          FROM ' . $map_prefix . 'marker_tab c
								          LEFT OUTER JOIN ' . $map_prefix . 'user u2
								            ON c.user_id = u2.id 
                                 WHERE c.visible = 1
				      ) t
                 on m.id = t.marker_id
                  , ' . $map_prefix . 'marker_category mc
				      , ' . $map_prefix . 'submap smp
                  , ' . $map_prefix . 'map mp
				      , ' . $map_prefix . 'user u   
              where m.marker_category_id = mc.id
				    and m.submap_id = smp.id
                and smp.map_id = mp.id
				    and mp.container_id = ' . $_GET["game"] . '
				    and m.user_id = u.id
                and m.visible = 1
                
                and (upper(tab_text) like upper(\'%' . $search . '%\') or m.name like upper(\'%' . $search . '%\'))
                ';
				    /*and ((m.visible = 1 and m.last_updated > \'' . $last_update . '\')
				         OR  (m.visible = 0 and \'' . $last_update . '\' != \'1800-01-01 00:00:00\' and m.last_updated > \'' . $last_update . '\'))
              /*and m.last_updated > \'' . $last_update . '\'*/
               
   if (isset($_GET['newMarkerId'])) {
      $query .= 'and m.id = ' . $_GET['newMarkerId'];
   }
   $query .= '
              group by m.id;
    ';
	//echo $query . "\n";
   $result = @$mysqli->query($query) or die($mysqli->error);

	$res = array();
	while ($row = $result->fetch_assoc()) {
		$row["title"] = html_entity_decode($row["title"], ENT_QUOTES, "UTF-8");
      $row["loc"] = array($row["y"],$row["x"]);
      //$row["loc"]['id'] = $row["id"];
		$res[] = $row;
	}
   echo json_encode($res);
	
	$_SESSION["last_updated"] = $temp;
?>
