<?php
   $path = DIRNAME(__FILE__);
   include('$path/../config.php');
	
	session_start("zmap");
	begin();
	
	if (!isset($_POST['user']) || !isset($_POST['password']) || !isset($_POST['name']) || !isset($_POST['email'])) {
		echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
		exit();		
	}
   
   $username = $mysqli->real_escape_string($_POST['user']);
   $password = $mysqli->real_escape_string($_POST['password']);
   $name = $mysqli->real_escape_string($_POST['name']);
   $email = $mysqli->real_escape_string($_POST['email']);
   $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));
   $hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
   
   $query = "INSERT INTO " . $map_prefix . "user " . " (username, password, name, email, created, ip, last_login, level, visible) VALUES" .
            "('" . $username . "', '" . $hash . "', '" . $name . "', '" . $email . "', now(), '" . $ip . "', now(), 5, 1)"
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