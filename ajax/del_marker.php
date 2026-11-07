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
   $sessionBeta   = !empty($_SESSION['beta_editor']);
   session_write_close();

   // Deleting isn't part of the community editing beta.
   if ($sessionBeta) {
     echo json_encode(array("success"=>false, "msg"=>"Deleting markers isn't part of the editing beta."));
     return;
   }

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

   include_once(dirname(__DIR__) . '/lib/common/wiki.php');
   wikiEnsureBaseline($db, $map_prefix, $markerId);
   $db->executeStatement("
     UPDATE {$map_prefix}marker
        SET visible = 0
      WHERE id = ?
   ", [$markerId]);
   // A revision too, so the marker can be brought back from its History.
   $revisionId = wikiRecordRevision($db, $map_prefix, $markerId, $sessionUserId, 'delete',
     is_string($_POST['summary'] ?? null) ? $_POST['summary'] : null);
   include_once(dirname(__DIR__) . '/lib/common/notifications.php');
   notifyMarkerChange($db, $map_prefix, $sessionUserId, $markerId, $revisionId, 'delete');

   echo json_encode(array("success"=>true, "msg"=>"Marker deleted!"));
?>
