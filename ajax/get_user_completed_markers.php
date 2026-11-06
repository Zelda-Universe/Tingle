<?php
   $game   = $_GET["game"]   ?? '';
   $userId = (int) ($_GET["userId"] ?? 0);

   // Only the signed-in user's own progress.
   start_session("zmap");
   if (empty($_SESSION['user_id']) || (int) $_SESSION['user_id'] !== $userId) {
     session_write_close();
     echo json_encode(array());
     return;
   }
   session_write_close();

   include_once(dirname(__DIR__) . '/lib/common/oot_pack.php');
   if (ootPackIsGame($game)) {
     // OoT's markers come from data/OoT, not the marker table.
     $ids = ootPackMarkerIds();
     $rows = $ids ? $db->fetchAllAssociative("
        select ucm.marker_id markerId
          from {$map_prefix}user_completed_marker ucm
         where ucm.user_id = ?
           and ucm.marker_id in (" . implode(',', array_fill(0, count($ids), '?')) . ")
     ", array_merge([$userId], $ids)) : [];
   } else {
     $rows = $db->fetchAllAssociative("
        select m.id markerId
          from {$map_prefix}marker m
             , {$map_prefix}marker_category mc
             , {$map_prefix}submap smp
             , {$map_prefix}map mp
             , {$map_prefix}user_completed_marker ucm
         where m.marker_category_id = mc.id
           and m.submap_id = smp.id
           and smp.map_id = mp.id
           and mp.container_id = ?
           and m.visible = 1
           and mc.visible = 1
           and ucm.marker_id = m.id
           and ucm.user_id = ?
     ", [$game, $userId]);
   }

   $res = array();
   foreach ($rows as $row) {
     $row["markerId"] = html_entity_decode($row["markerId"], ENT_QUOTES, "UTF-8");
     $res[] = $row;
   }
   echo json_encode($res);
?>
