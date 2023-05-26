<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	start_session("zmap");
	begin();

	if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']) || !isset($_SESSION['level'])) {
		session_destroy();
		echo json_encode(array("success"=>false, "msg"=>"Session - Not Logged!"));
		return;
	};

   if (!isset($_COOKIE['user_id']) || !isset($_COOKIE['username'])) {
		echo json_encode(array("success"=>false, "msg"=>"Cookie - Not Logged!"));
		return;
   }


   if ($_SESSION['user_id'] == $_COOKIE['user_id']
         && $_SESSION['username'] == $_COOKIE['username'])
   {
         $query = "
            select max(concat(`version_major`, '.', `version_minor`, '.', `version_patch`)) latestversion
              from `changelog`
         ";
         //echo $query;

         $result = @$mysqli->query($query);

         if(!$result) {
           print($mysqli->error);
           return;
         }

         $lastestVersion = '0.0.0';
         while($row = $result->fetch_assoc()) {
            $lastestVersion = $row['LATESTVERSION'];
         }
//         echo $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
         if ($lastestVersion > $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3']) {
            $user['seen_version'] = '0.0.0';
            $_SESSION['v1'] = 0;
            $_SESSION['v2'] = 0;
            $_SESSION['v3'] = 0;
         } else {
            $user['seen_version'] = $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
         }
         
         $user['id'] = $_SESSION['user_id'];
         $user['username'] = $_SESSION['username'];
         $user['level'] = $_SESSION['level'];
         session_write_close();
         $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

         $uquery = "update " . $map_prefix . "user set ip = '" . $ip . "', last_login=now() where id = " . $user['id'];
         //echo $uquery;
         $mysqli->query($uquery);
         commit();

         echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));
	} else {
      echo json_encode(array("success"=>false, "msg"=>"Oops, something went wrong..."));
   }
?>