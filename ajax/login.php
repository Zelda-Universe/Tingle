<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	start_session("zmap");
	begin();

	if (!isset($_POST['user']) || !isset($_POST['password'])) {
		echo json_encode(array("success"=>false, "msg"=>"Ops, something went wrong..."));
		return;
	}

   $username = $mysqli->real_escape_string($_POST['user']);
   $password = $mysqli->real_escape_string($_POST['password']);
   $passwordUnescaped = $_POST['password'];
   $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));


   $query = "select id, username, password, level from " . $map_prefix . "user " .
            " where username = '" . $username . "'"
            ;
	$result = $mysqli->query($query);

   if ($result) {
      $row = $result->fetch_assoc();
      if (isset($row['password'])
          && (
                 password_verify($password, $row['password'])
              || password_verify($passwordUnescaped, $row['password'])
             )
         ) {
         $user['id'] = $row['id'];
         $user['username'] = $row['username'];
         $user['level'] = $row['level'];

         $hash = password_hash($username . $row['password'], PASSWORD_DEFAULT, ['cost' => 13]);

         if (isset($_POST['remember'])) {
            setcookie('user_id', $user['id'], strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie('username', $user['username'], strtotime( '+30 days' ), "/", "", "", TRUE);
         }

         $_SESSION['username'] = $user['username'];
         $_SESSION['user_id'] = $user['id'];
         $_SESSION['level'] = $user['level'];

         $uquery = "update " . $map_prefix . "user set ip = '" . $ip . "', last_login=now() where id = " . $row['id'];
         //echo $uquery;
         $mysqli->query($uquery);
         commit();

         echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));

      } else {
         echo json_encode(array("success"=>false, "msg"=>"User or password invalid!"));
      }
	} else {
      echo json_encode(array("success"=>false, "msg"=>"User or password invalid!"));
   }
?>
