<?php
   $path = __DIR__;

   if (!is_numeric($_POST['userId'] ?? null)) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }

   start_session("zmap");
   if (empty($_SESSION['user_id']) || $_SESSION['user_id'] != $_POST['userId']) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }
   session_write_close();

   $userId     = (int) $_POST['userId'];
   $markerList = array_values(array_filter(
     array_map('intval', (array) json_decode($_POST['markerList'] ?? '', true)),
     function ($id) { return $id > 0; }
   ));

   if (count($markerList) === 0) {
     echo json_encode(array("success"=>true, "msg"=>"No markers to mark as complete!"));
     return;
   }

   begin();

   // One multi-row INSERT per chunk; a marker already completed is left alone.
   foreach (array_chunk($markerList, 200) as $chunk) {
     $placeholders = implode(', ', array_fill(0, count($chunk), '(?, ?, now(), 1)'));
     $params = [];
     foreach ($chunk as $markerId) {
       $params[] = $userId;
       $params[] = $markerId;
     }

     $db->executeStatement("
       INSERT INTO {$map_prefix}user_completed_marker (
           user_id
         , marker_id
         , complete_date
         , visible
       ) VALUES {$placeholders}
       ON DUPLICATE KEY UPDATE user_id = user_id
     ", $params);
   }

   commit();

   echo json_encode(array("success"=>true, "msg"=>"Markers in the list were marked as completed!"));
?>
