<?php
   $path = DIRNAME(__FILE__);
   include('$path/../config.php');
	
	start_session("zmap");
   session_destroy();
   
   setcookie('user_id', '', time() - 1*24*60*60);
   setcookie('username', '', time() - 1*24*60*60);
   setcookie('r', '', time() - 1*24*60*60);
   
   echo json_encode(array("success"=>true, "msg"=>"Success!"));
?>