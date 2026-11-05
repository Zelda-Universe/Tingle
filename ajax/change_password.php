<?php
   $path = __DIR__;

   if (!isset($_POST['currentpassword']) || !isset($_POST['newpassword'])) {
     echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
     return;
   }

   start_session("zmap");
   if (empty($_SESSION['user_id'])) {
     echo json_encode(array("success"=>false, "msg"=>"Not logged or session expired!"));
     return;
   }
   $userId = (int) $_SESSION['user_id'];
   session_write_close();

   $currentHash = $db->fetchOne("
     SELECT `password`
       FROM `{$map_prefix}user`
      WHERE `id` = ?
   ", [$userId]);

   if ($currentHash === false) {
     echo json_encode(array("success"=>false, "msg"=>"User not found! O_o"));
     return;
   }

   if (!password_verify((string) $_POST['currentpassword'], $currentHash)) {
     echo json_encode(array("success"=>false, "msg"=>"Current password is not correct."));
     return;
   }

   $hash = password_hash((string) $_POST['newpassword'], PASSWORD_DEFAULT, ['cost' => 13]);

   $db->executeStatement("
     UPDATE `{$map_prefix}user`
        SET `password` = ?
      WHERE `id` = ?
   ", [$hash, $userId]);

   // Other devices signed in with the old password are signed out.
   include_once(dirname(__DIR__) . '/lib/common/auth_token.php');
   authRevokeOtherDevices($db, $map_prefix, $userId);

   echo json_encode(array("success"=>true, "msg"=>"Password changed."));
?>
