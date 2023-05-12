<?php
# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

$path = __DIR__;
include_once("$path/../config.php");

function prepareMailTransport() {
  global $mailServer, $mailPort, $mailUsername, $mailPassword;

  // Debug
  // error_log("Creating mail transport with the following parameters:\n" .
  //   "mailServer: $mailServer\n" .
  //   "mailPort: $mailPort\n" .
  //   "mailUsername: $mailUsername\n" .
  //   "mailPassword: $mailPassword\n" .
  //   "ssl"
  // );

  return (new Swift_SmtpTransport($mailServer, $mailPort, 'ssl'))
    ->setUsername($mailUsername)
    ->setPassword($mailPassword)
  ;
}

function createResetPasswordEmail($toAddress, $toName, $newPassword) {
  global $lostPasswordBodyTemplate, $mailReplyToAddress, $mailReplyToName, $lostPasswordSubject;
  $body = "";
  if(isset($lostPasswordBodyTemplate)) {
    $body = $lostPasswordBodyTemplate;
    $body = str_replace("{{name}}", $toName, $body);
    $body = str_replace("{{newPassword}}", $newPassword, $body);
  } else {
    error_log("Error: No lost password mail body message template available; exiting...");
    exit;
  }

  // Debug
  // error_log("Generating reset password email with the following parameters:\n" .
  //   "reply-to: $mailReplyToAddress\n" .
  //   "to: $toName <$toAddress>\n" .
  //   "subject: $lostPasswordSubject\n" .
  //   "body: $body"
  // );

  return (new Swift_Message($lostPasswordSubject))
    ->setFrom([$mailReplyToAddress => $mailReplyToName])
    ->setTo([$toAddress => $toName])
    ->setBody($body)
  ;
}

function sendMail($message) {
  global $mailer;
  return ($mailer->send($message));
}

$mailer = new Swift_Mailer(prepareMailTransport());
?>
