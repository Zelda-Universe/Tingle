<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	begin();

	if (!isset($_POST['user']) || !isset($_POST['password']) || !isset($_POST['name']) || !isset($_POST['email'])) {
		echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
		return;
	}

   $username = $mysqli->real_escape_string($_POST['user']);
   $passwordUnescaped = $_POST['password'];
   $name = $mysqli->real_escape_string($_POST['name']);
   $email = $mysqli->real_escape_string($_POST['email']);
   $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));
   $hash = password_hash($passwordUnescaped, PASSWORD_DEFAULT, ['cost' => 13]);
   $query = "INSERT INTO " . $map_prefix . "user " . " (username, password, name, email, created, ip, last_login, level, visible) VALUES" .
            "('" . $username . "', '" . $hash . "', '" . $name . "', '" . $email . "', now(), '" . $ip . "', now(), 1, 1)"
            ;
   //echo $query;
	$result = $mysqli->query($query);

   if ($result) {
      commit();
      echo json_encode(array("success"=>true, "msg"=>"Success! User created!"));
	} else {
      rollback();
      echo json_encode(array("success"=>false, "msg"=>"User already exists!"));
   }
?>
