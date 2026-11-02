<?php
   $path = __DIR__;

   start_session("zmap");

   if (!isset($_POST['userId']) || !isset($_POST['version'])) {
     echo json_encode(array("success"=>false, "msg"=>"Ops, something went wrong..."));
     return;
   }
   if (empty($_SESSION['user_id']) || $_SESSION['user_id'] != $_POST['userId']) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }

   $userId  = (int) $_SESSION['user_id'];
   $version = array_map('intval', explode(".", (string) $_POST['version'], 3)) + [0, 0, 0];

   $db->executeStatement("
     UPDATE `{$map_prefix}user`
        SET `seen_version_major` = ?
          , `seen_version_minor` = ?
          , `seen_version_patch` = ?
      WHERE `id` = ?
   ", [$version[0], $version[1], $version[2], $userId]);

   $_SESSION['v1'] = $version[0];
   $_SESSION['v2'] = $version[1];
   $_SESSION['v3'] = $version[2];
   $_SESSION['seen_latest_changelog'] = true;

   echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$userId));
?>
