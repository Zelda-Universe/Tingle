<?php
  $path = __DIR__;

  if (empty($mailEnabled)) {
    echo json_encode(array("success"=>false, "msg"=>"Password reset is temporarily unavailable."));
    return;
  }

  // Whatever happens below, the caller gets this answer, so the response
  // never reveals whether an address is registered.
  $neutralResponse = array(
    "success" => true,
    "msg"     => "If that email address is registered, a password reset link has been sent to it."
  );

  $email = trim((string) ($_POST['email'] ?? ''));
  if ($email === '' || strlen($email) > 254 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode($neutralResponse);
    return;
  }

  $user = $db->fetchAssociative("
    SELECT `id`, `name`, `email`
      FROM `{$map_prefix}user`
     WHERE `email` = ?
       AND `deleted` IS NULL
       AND `password` <> '<deleted>'
  ", [$email]);

  if (!$user) {
    echo json_encode($neutralResponse);
    return;
  }

  $userId = (int) $user['id'];

  // One live link per account, and no more than one e-mail every two minutes,
  // so the endpoint can't be used to flood someone's inbox.
  $recent = $db->fetchOne("
    SELECT COUNT(*)
      FROM `{$map_prefix}password_reset`
     WHERE `user_id` = ?
       AND `used` IS NULL
       AND `created` > DATE_SUB(NOW(), INTERVAL 2 MINUTE)
  ", [$userId]);
  if ((int) $recent > 0) {
    echo json_encode($neutralResponse);
    return;
  }

  // The token travels in the link; only its hash is stored, so a copy of the
  // table is useless without the e-mail.
  $token     = bin2hex(random_bytes(32));
  $tokenHash = hash('sha256', $token);
  $ip        = preg_replace('#[^0-9a-fA-F.:]#', '', (string) getenv('REMOTE_ADDR'));

  begin();
  $db->executeStatement("
    UPDATE `{$map_prefix}password_reset`
       SET `used` = NOW()
     WHERE `user_id` = ?
       AND `used` IS NULL
  ", [$userId]);
  $db->executeStatement("
    INSERT INTO `{$map_prefix}password_reset` (
        `user_id`
      , `token_hash`
      , `expires`
      , `created`
      , `ip`
    ) VALUES (?, ?, DATE_ADD(NOW(), INTERVAL ? SECOND), NOW(), ?)
  ", [$userId, $tokenHash, (int) $lostPasswordTokenLifetime, $ip]);
  commit();

  $resetLink = $siteBaseURL . '/?reset=' . $token;

  include_once("$path/../lib/zmailer.php");
  $sent = sendMail(createResetPasswordEmail($user['email'], $user['name'], $resetLink));
  if (!$sent) {
    // The user still gets the neutral answer; the operator gets the log line.
    error_log("lost_password: reset e-mail for user {$userId} could not be sent");
  }

  echo json_encode($neutralResponse);
?>
