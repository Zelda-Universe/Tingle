<?php
   $path = __DIR__;

   if (!is_numeric($_POST['markerId'] ?? null)) {
     echo json_encode(array("success"=>false, "msg"=>"Not Logged!"));
     return;
   }

   start_session("zmap");
   if (empty($_SESSION['user_id']) || !isset($_SESSION['level'])) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }
   $sessionUserId = (int) $_SESSION['user_id'];
   $sessionLevel  = (int) $_SESSION['level'];
   session_write_close();

   $markerId = (int) $_POST['markerId'];

   // Authorisation is decided by who owns the marker in the database, not by
   // the userId the client sends. Level 10+ may delete any marker; level 5-9
   // only their own.
   $ownerId = $db->fetchOne("
     SELECT user_id
       FROM {$map_prefix}marker
      WHERE id = ?
   ", [$markerId]);

   if ($ownerId === false) {
     echo json_encode(array("success"=>false, "msg"=>"Marker not found!"));
     return;
   }

   if (
         $sessionLevel < 5
     ||  ($sessionLevel < 10 && (int) $ownerId !== $sessionUserId)
   ) {
     echo json_encode(array("success"=>false, "msg"=>"You can't delete this marker!"));
     return;
   }

   $db->executeStatement("
     UPDATE {$map_prefix}marker
        SET visible = 0
      WHERE id = ?
   ", [$markerId]);

   echo json_encode(array("success"=>true, "msg"=>"Marker deleted!"));
?>
