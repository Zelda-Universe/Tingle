<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	start_session("zmap");
	begin();

	if (!isset($_POST['email'])) {
		echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
		return;
	}

  $email = $mysqli->real_escape_string($_POST['email']);

  $factory = new RandomLib\Factory;
  $generator = $factory->getMediumStrengthGenerator();
  $randomPassword = $generator->generateString(32, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/`~!@#$%^&*()-_=+[{]}\|;:\'",<.>/?');
  $hash = password_hash($randomPassword, PASSWORD_DEFAULT, ['cost' => 13]);

  $query = "SELECT `id` FROM `{$map_prefix}user` WHERE `email` = '$email'";
  $result = $mysqli->query($query);
  $row = $result->fetch_assoc();

  if($row) {
    $query = "UPDATE `{$map_prefix}user` " . " SET `password` = '$hash' WHERE `email` = '$email'";
    //echo $query;
    $result = $mysqli->query($query);

    if ($result) {
      commit();
      # TODO: Remove and put password in email instead!!
      echo json_encode(array("success"=>true, "msg"=>"Password reset."));
  	} else {
      rollback();
      echo json_encode(array("success"=>false, "msg"=>"Password not reset."));
    }
  } else {
    echo json_encode(array("success"=>false, "msg"=>"User with email \"$email\" does not exist."));
  }
?>
