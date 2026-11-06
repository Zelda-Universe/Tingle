<?php
   $path = __DIR__;

   if (
         !is_numeric($_POST['userId'] ?? null)
     ||  !is_numeric($_POST['gameId'] ?? null)
   ) {
     echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
     return;
   }

   start_session("zmap");
   if (empty($_SESSION['user_id']) || $_SESSION['user_id'] != $_POST['userId']) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }
   session_write_close();

   $userId = (int) $_POST['userId'];
   $gameId = (int) $_POST['gameId'];

   include_once(dirname(__DIR__) . '/lib/common/oot_pack.php');
   if (ootPackIsGame($gameId)) {
     // OoT's markers come from data/OoT, not the marker table.
     $ids = ootPackMarkerIds();
     if ($ids) $db->executeStatement("
       DELETE FROM {$map_prefix}user_completed_marker
       WHERE user_id = ?
         AND marker_id IN (" . implode(',', array_fill(0, count($ids), '?')) . ")
     ", array_merge([$userId], $ids));
   } else $db->executeStatement("
     DELETE FROM {$map_prefix}user_completed_marker
     WHERE user_id = ?
       AND marker_id IN (
         SELECT m.id
           FROM {$map_prefix}marker m
              , {$map_prefix}marker_category mc
          WHERE m.marker_category_id = mc.id
            AND mc.container_id = ?
       )
   ", [$userId, $gameId]);

   echo json_encode(array("success"=>true, "msg"=>"All markers for game {$gameId} have been marked as not completed!"));
?>
