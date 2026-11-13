<?php
   if (!isset($_GET['newMarkerId'])) {
     $path = __DIR__;
   }

   $game = $_GET["game"] ?? '';
   if ($game === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $game)) {
     echo json_encode(array());
     return;
   }
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminOnlyGameDenied($db, $map_prefix, $game)) { echo json_encode(array()); return; }

   $db->executeStatement("SET SESSION group_concat_max_len = 4294967295");

   // Spaces act as wildcards so "lost woods" matches "Lost ... Woods".
   $search = '%' . str_replace(' ', '%', $_GET['q'] ?? '') . '%';

   $sql = "
     select m.id
          , m.marker_category_id         as markerCategoryId
          , m.name                       as title
          , m.x
          , m.y
       from {$map_prefix}marker m
       left outer join (SELECT c.marker_tab_id
                             , c.tab_title
                             , c.tab_text
                             , c.user_id
                             , u2.username
                             , c.marker_id
                          FROM {$map_prefix}marker_tab c
                          LEFT OUTER JOIN {$map_prefix}user u2
                            ON c.user_id = u2.id
                         WHERE c.visible = 1
                       ) t
         on m.id = t.marker_id
          , {$map_prefix}marker_category mc
          , {$map_prefix}submap smp
          , {$map_prefix}map mp
          , {$map_prefix}user u
      where m.marker_category_id = mc.id
        and m.submap_id = smp.id
        and smp.map_id = mp.id
        and mp.container_id = ?
        and m.user_id = u.id
        and m.visible = 1
        and (upper(tab_text) like upper(?) or m.name like upper(?))
   ";
   $params = [$game, $search, $search];

   if (isset($_GET['newMarkerId'])) {
     $sql .= " and m.id = ?";
     $params[] = (int) $_GET['newMarkerId'];
   }
   $sql .= "
      group by m.id
   ";

   $rows = $db->fetchAllAssociative($sql, $params);

   $res = array();
   foreach ($rows as $row) {
     $row["title"] = html_entity_decode($row["title"], ENT_QUOTES, "UTF-8");
     $row["loc"]   = array($row["y"], $row["x"]);
     $res[] = $row;
   }
   echo json_encode($res);
?>
