<?php
  $path = __DIR__;

  $invalidResponse = array(
    "success" => false,
    "msg"     => "This password reset link is invalid or has expired. Please request a new one."
  );

  $token = (string) ($_REQUEST['token'] ?? '');
  if (!preg_match('/^[0-9a-f]{64}$/', $token)) {
    echo json_encode($invalidResponse);
    return;
  }
  $tokenHash = hash('sha256', $token);

  $reset = $db->fetchAssociative("
    SELECT pr.`id`, pr.`user_id`
      FROM `{$map_prefix}password_reset` pr
      JOIN `{$map_prefix}user` u ON u.`id` = pr.`user_id`
     WHERE pr.`token_hash` = ?
       AND pr.`used` IS NULL
       AND pr.`expires` > NOW()
       AND u.`deleted` IS NULL
       AND u.`password` <> '<deleted>'
  ", [$tokenHash]);

  if (!$reset) {
    echo json_encode($invalidResponse);
    return;
  }

  // GET with check=1 lets the page confirm the link before showing the form.
  if ($_SERVER['REQUEST_METHOD'] !== 'POST' || isset($_GET['check'])) {
    echo json_encode(array("success" => true, "valid" => true));
    return;
  }

  $password = (string) ($_POST['password'] ?? '');
  if (strlen($password) < 8) {
    echo json_encode(array("success" => false, "field" => "password", "msg" => "Use a password of at least 8 characters."));
    return;
  }
  if (strlen($password) > 72) {
    echo json_encode(array("success" => false, "field" => "password", "msg" => "The password must be at most 72 bytes."));
    return;
  }

  $hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);

  begin();
  $db->executeStatement("
    UPDATE `{$map_prefix}user`
       SET `password` = ?
     WHERE `id` = ?
  ", [$hash, (int) $reset['user_id']]);
  // Consume this link and retire any others the account still has.
  $db->executeStatement("
    UPDATE `{$map_prefix}password_reset`
       SET `used` = NOW()
     WHERE `user_id` = ?
       AND `used` IS NULL
  ", [(int) $reset['user_id']]);
  // Whoever held the old password is signed out everywhere.
  include_once(dirname(__DIR__) . '/lib/common/auth_token.php');
  authRevokeUser($db, $map_prefix, (int) $reset['user_id']);
  commit();

  echo json_encode(array("success" => true, "msg" => "Your password has been changed. You can now log in."));
?>
