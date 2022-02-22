<?php
   $path = __DIR__;
   include("$path/../config.php");

	start_session("zmap");
  setcookie(session_name(), '', 0);
  unset($_COOKIE[session_name()]);
  session_unset();
  session_destroy();
  session_write_close();

   setcookie('user_id', '', 0);
   setcookie('username', '', 0);
   setcookie('r', '', 0); // Leaving in to cleanup clients over time.

   echo json_encode(array("success"=>true, "msg"=>"Success!"));
?>
