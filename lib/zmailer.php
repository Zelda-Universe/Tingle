<?php
# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mime\Address;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mime\Exception\RfcComplianceException;

$path = __DIR__;
include_once("$path/../config.php");

/**
 * SMTP transport from the [MAIL] settings. smtps:// is implicit TLS, which is
 * what port 465 expects (Gmail among others).
 */
function prepareMailTransport() {
  global $mailServer, $mailPort, $mailUsername, $mailPassword;

  $dsn = sprintf(
    'smtps://%s:%s@%s:%d',
    rawurlencode($mailUsername),
    rawurlencode($mailPassword),
    $mailServer,
    (int) $mailPort
  );

  return Transport::fromDsn($dsn);
}

/**
 * The password-reset e-mail. The template carries a link; the password itself
 * is never generated or sent.
 */
function createResetPasswordEmail($toAddress, $toName, $resetLink) {
  global $lostPasswordBodyTemplate, $mailReplyToAddress, $mailReplyToName, $lostPasswordSubject;

  if (!isset($lostPasswordBodyTemplate)) {
    error_log("Error: No lost password mail body message template available.");
    return null;
  }

  $body = str_replace(
    ["{{name}}", "{{resetLink}}"],
    [$toName, $resetLink],
    $lostPasswordBodyTemplate
  );

  try {
    return (new Email())
      ->from(new Address($mailReplyToAddress, $mailReplyToName))
      ->replyTo(new Address($mailReplyToAddress, $mailReplyToName))
      ->to(new Address($toAddress, $toName))
      ->subject($lostPasswordSubject)
      ->text($body);
  } catch (RfcComplianceException $e) {
    // A stored address that isn't RFC-valid (old data). Nothing to send.
    error_log('zmailer: ' . $e->getMessage());
    return null;
  }
}

/**
 * Send a message. Returns true on success; failures are logged, never shown.
 */
function sendMail($message) {
  if ($message === null) {
    return false;
  }

  try {
    (new Mailer(prepareMailTransport()))->send($message);
    return true;
  } catch (TransportExceptionInterface $e) {
    error_log('zmailer: ' . get_class($e) . ': ' . $e->getMessage());
    return false;
  }
}
?>
