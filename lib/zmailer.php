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
 * is never generated or sent. Plain text, and HTML when its template is there
 * (the plain text template's path, ending .html instead: content/), so mail
 * apps show the HTML and fall back to the text.
 */
function resetPasswordEmailBodies($toName, $resetLink) {
  global $lostPasswordBodyTemplate, $lostPasswordBodyTemplateFilePath, $siteBaseURL;

  $text = str_replace(
    ["{{name}}", "{{resetLink}}"],
    [$toName, $resetLink],
    $lostPasswordBodyTemplate
  );

  $html = null;
  $htmlPath = preg_replace('/\.txt$/i', '', (string) $lostPasswordBodyTemplateFilePath) . '.html';
  if (is_file($htmlPath)) {
    $escape = function ($value) { return htmlspecialchars((string) $value, ENT_QUOTES | ENT_HTML5, 'UTF-8'); };
    // (In one pass: what's filled in is never filled in again.)
    $html = strtr(file_get_contents($htmlPath), [
      "{{name}}" => $escape($toName),
      "{{resetLink}}" => $escape($resetLink),
      "{{siteBaseURL}}" => $escape($siteBaseURL)
    ]);
  }
  return ['text' => $text, 'html' => $html];
}

function createResetPasswordEmail($toAddress, $toName, $resetLink) {
  global $lostPasswordBodyTemplate, $mailReplyToAddress, $mailReplyToName, $lostPasswordSubject;

  if (!isset($lostPasswordBodyTemplate)) {
    error_log("Error: No lost password mail body message template available.");
    return null;
  }

  $bodies = resetPasswordEmailBodies($toName, $resetLink);

  try {
    $email = (new Email())
      ->from(new Address($mailReplyToAddress, $mailReplyToName))
      ->replyTo(new Address($mailReplyToAddress, $mailReplyToName))
      ->to(new Address($toAddress, $toName))
      ->subject($lostPasswordSubject)
      ->text($bodies['text']);
    if ($bodies['html'] !== null) $email->html($bodies['html']);
    return $email;
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
