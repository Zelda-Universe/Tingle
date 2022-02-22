<?php
   $path = __DIR__;
   include("$path/../config.php");

	begin();

	if (!isset($_POST['email'])) {
		echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
		return;
	}

  $email = $mysqli->real_escape_string($_POST['email']);

  $factory = new RandomLib\Factory;
  $generator = $factory->getGenerator($lostPasswordRandomGeneratorStrengthConstant);
  $randomPassword = $generator->generateString(32, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/`~!@#$%^&*()-_=+[{]}\|;:\'",<.>/?');
  $hash = password_hash($randomPassword, PASSWORD_DEFAULT, ['cost' => 13]);

  $querySelectUser = "SELECT `id`, `name` FROM `{$map_prefix}user` WHERE `email` = '$email'";
  $resultSelectUser = $mysqli->query($querySelectUser);
  $rowSelectUser = $resultSelectUser->fetch_assoc();

  if($rowSelectUser) {
    $query = "UPDATE `{$map_prefix}user` SET `password` = '$hash' WHERE `email` = '$email'";
    $result = $mysqli->query($query);

    if ($result) {
      $commitResult = commit();

      if($commitResult) {
        if($mailEnabled) {
          include_once("$path/lib/zmailer.php");
          $mailResult = sendMail(createResetPasswordEmail($email, $rowSelectUser['name'], $randomPassword));
          if($mailResult) {
            echo json_encode(array("success"=>true, "msg"=>"Password reset. Email sent."));
          } else {
            echo json_encode(array("success"=>false, "msg"=>"Password reset. Email not sent."));
          }
        } else {
          error_log("Reset password to: $randomPassword");
          echo json_encode(array("success"=>true, "msg"=>"Password reset. Mail disabled."));
        }
      } else {
        echo json_encode(array("success"=>false, "msg"=>"Password not reset. Database error."));
      }
  	} else {
      rollback();
      echo json_encode(array("success"=>false, "msg"=>"Password not reset."));
    }
  } else {
    echo json_encode(array("success"=>false, "msg"=>"User with email \"$email\" does not exist."));
  }
?>
