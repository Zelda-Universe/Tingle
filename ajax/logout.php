<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	start_session("zmap");
   session_destroy();

   setcookie('user_id', '', 0);
   setcookie('username', '', 0);
   setcookie('r', '', 0); // Leaving in to cleanup clients over time.

   echo json_encode(array("success"=>true, "msg"=>"Success!"));
?>
