<?php
   $path = __DIR__;

	begin();

	if (!isset($_POST['user']) || !isset($_POST['password'])) {
		echo json_encode(array("success"=>false, "msg"=>"Ops, something went wrong..."));
		return;
	}

   $username = $mysqli->real_escape_string($_POST['user']);
   $password = $mysqli->real_escape_string($_POST['password']);
   $passwordUnescaped = $_POST['password'];
   $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

  $query = "
    SELECT
      `id`,
      `username`,
      `password`,
      `level`,
      `seen_version_major` AS v1,
      `seen_version_minor` AS v2,
      `seen_version_patch` AS v3
    FROM
      `{$map_prefix}user`
    WHERE
      `username` = '{$username}'
	  or `email` = '{$username}'
    ;
  ";
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
         $user['seen_version'] = $row['v1'] . '.' . $row['v2'] . '.' . $row['v3'];

         $hash = password_hash($username . $row['password'], PASSWORD_DEFAULT, ['cost' => 13]);

         if (isset($_POST['remember'])) {
            setcookie('user_id', $user['id'], strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie('username', $user['username'], strtotime( '+30 days' ), "/", "", "", TRUE);
         }

         start_session("zmap");

         $_SESSION['username'] = $user['username'];
         $_SESSION['user_id'] = $user['id'];
         $_SESSION['level'] = $user['level'];
         $_SESSION['v1'] = $row['v1'];
         $_SESSION['v2'] = $row['v2'];
         $_SESSION['v3'] = $row['v3'];

         session_write_close();

         $uquery = "update " . $map_prefix . "user set ip = '" . $ip . "', last_login=now() where id = " . $row['id'];
         //echo $uquery;
         $mysqli->query($uquery);
         commit();

         echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));

      } else {
         echo json_encode(array("success"=>false, "msg"=>"Username or password invalid!"));
      }
	} else {
      echo json_encode(array("success"=>false, "msg"=>"Username or password invalid!"));
   }
?>
