<?php
   $path = __DIR__;

   if (
         !is_numeric($_POST['userId']   ?? null)
     ||  !is_numeric($_POST['markerId'] ?? null)
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

   $userId   = (int) $_POST['userId'];
   $markerId = (int) $_POST['markerId'];

   $db->executeStatement("
     DELETE FROM {$map_prefix}user_completed_marker
     WHERE user_id = ?
       AND marker_id = ?
   ", [$userId, $markerId]);

   echo json_encode(array("success"=>true, "msg"=>"Marker {$markerId} has no longer been marked as completed!"));
?>
