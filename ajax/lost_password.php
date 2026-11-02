<?php
  $path = __DIR__;

  // Protects against a bug where the password reset will still run without emailing user
  if (empty($mailEnabled)) {
    echo json_encode(array("success"=>false, "msg"=>"Password reset is temporarily unavailable."));
    return;
  }

  if (!isset($_POST['email'])) {
    echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
    return;
  }

  $email = (string) $_POST['email'];

  $factory = new RandomLib\Factory;
  $generator = $factory->getGenerator($lostPasswordRandomGeneratorStrengthConstant);
  $randomPassword = $generator->generateString(32, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/`~!@#$%^&*()-_=+[{]}\|;:\'",<.>/?');
  $hash = password_hash($randomPassword, PASSWORD_DEFAULT, ['cost' => 13]);

  $rowSelectUser = $db->fetchAssociative("
    SELECT `id`, `name`
      FROM `{$map_prefix}user`
     WHERE `email` = ?
  ", [$email]);

  if (!$rowSelectUser) {
    echo json_encode(array("success"=>false, "msg"=>"User with email \"$email\" does not exist."));
    return;
  }

  begin();
  $db->executeStatement("
    UPDATE `{$map_prefix}user`
       SET `password` = ?
     WHERE `email` = ?
  ", [$hash, $email]);
  commit();

  include_once("$path/../lib/zmailer.php");
  $mailResult = sendMail(createResetPasswordEmail($email, $rowSelectUser['name'], $randomPassword));
  if ($mailResult) {
    echo json_encode(array("success"=>true, "msg"=>"Password reset. Email sent."));
  } else {
    echo json_encode(array("success"=>false, "msg"=>"Password reset. Email not sent."));
  }
?>
