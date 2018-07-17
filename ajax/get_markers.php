<?php
   if (!isset($_GET['newMarkerId'])) {
     $path = DIRNAME(__FILE__);
   	 include_once("$path/../config.php");
   }
   /*
	session_start("zmap");
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
   $visible = "1";
   if (isset($_GET['all']) || (strpos($_SERVER["HTTP_REFERER"], 'grid.html') !== false)) {
      $visible = "0,1";
   }
   $last_update = $temp = '1800-01-01 00:00:00';
	$query = "SET SESSION group_concat_max_len = 4294967295";
	$result = @$mysqli->query($query);

   $query = 'select m.id
                  , mp.id                        as mapId
                  , m.submap_id                  as submapId
                  , m.overlay_id                 as overlayId
                  , m.marker_category_id         as markerCategoryId
                  , mc.marker_category_type_id   as markerCategoryTypeId
                  , m.user_id                    as userId
                  , u.username                   as userName
                  , m.name
                  , m.description
                  , m.x
                  , m.y
                  , m.jump_marker_id             as jumpMakerId
				      , GROUP_CONCAT(coalesce(t.marker_tab_id,\'\') ORDER BY t.marker_tab_id asc SEPARATOR \'<|>\') as tabId
                  , GROUP_CONCAT(coalesce(t.tab_title,\'\') ORDER BY t.marker_tab_id asc SEPARATOR \'<|>\')     as tabTitle
                  , GROUP_CONCAT(coalesce(t.tab_text, \'\') ORDER BY t.marker_tab_id asc SEPARATOR \'<|>\')     as tabText
				      , GROUP_CONCAT(coalesce(t.user_id, \'\') ORDER BY t.marker_tab_id asc SEPARATOR \'<|>\')      as tabUserId
				      , GROUP_CONCAT(coalesce(t.username, \'\') ORDER BY t.marker_tab_id asc SEPARATOR \'<|>\')     as tabUserName
				      , m.global                     as globalMarker
				      , m.visible
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
                and m.visible in (' . $visible . ')
                and mc.visible = 1
                ';
				    /*and ((m.visible = 1 and m.last_updated > \'' . $last_update . '\')
				         OR  (m.visible = 0 and \'' . $last_update . '\' != \'1800-01-01 00:00:00\' and m.last_updated > \'' . $last_update . '\'))
              /*and m.last_updated > \'' . $last_update . '\'*/

   if (isset($_GET['newMarkerId'])) {
      $query .= 'and m.id = ' . $_GET['newMarkerId'];
   }
   $query .= '
              group by m.id
              order by m.id desc;
    ';
	//echo $query . "\n";
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

	$res = array();
	while ($row = $result->fetch_assoc()) {
		$row["tabTitle"] = html_entity_decode($row["tabTitle"], ENT_QUOTES, "UTF-8");
		$row["tabText"] = html_entity_decode($row["tabText"], ENT_QUOTES, "UTF-8");
		$row["name"] = html_entity_decode($row["name"], ENT_QUOTES, "UTF-8");
		$row["description"] = html_entity_decode($row["description"], ENT_QUOTES, "UTF-8");
		$res[] = $row;
	}
   echo json_encode($res);

	$_SESSION["last_updated"] = $temp;
  session_write_close();
?>
