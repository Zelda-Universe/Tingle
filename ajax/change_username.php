<?php
  start_session('zmap');
  if (empty($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false, 'msg' => 'Please log in first.'));
    return;
  }
  $username = isset($_POST['username']) && is_string($_POST['username'])
    ? trim($_POST['username']) : '';
  if (!preg_match('/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/D', $username)) {
    echo json_encode(array('success' => false, 'msg' => 'Use 3–45 letters, numbers, periods, underscores, or hyphens. Start with a letter or number.'));
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  $email = is_string($_POST['email'] ?? null) ? trim($_POST['email']) : '';
  if (strlen($email) > 254 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(array('success' => false, 'msg' => 'Enter a valid email address.'));
    return;
  }
  if ($db->fetchOne("SELECT id FROM `{$map_prefix}user` WHERE (email = ? OR username = ?) AND id <> ? LIMIT 1", [$email, $email, $userId])) {
    echo json_encode(array('success' => false, 'msg' => 'That email address is already in use.'));
    return;
  }
  $name = is_string($_POST['name'] ?? null) ? trim($_POST['name']) : '';
  if ($name === '' || mb_strlen($name) > 255) {
    echo json_encode(array('success' => false, 'msg' => 'Enter your full name (up to 255 characters).'));
    return;
  }
  $currentPassword = is_string($_POST['currentpassword'] ?? null) ? $_POST['currentpassword'] : '';
  $newPassword = is_string($_POST['newpassword'] ?? null) ? $_POST['newpassword'] : '';
  $changePassword = $currentPassword !== '' || $newPassword !== '';
  $storedPassword = $db->fetchOne("SELECT password FROM `{$map_prefix}user` WHERE id = ? AND deleted IS NULL", [$userId]);
  if (!$storedPassword) {
    echo json_encode(array('success' => false, 'msg' => 'Account not found.'));
    return;
  }
  if ($changePassword && ($newPassword === '' || !password_verify($currentPassword, $storedPassword))) {
    echo json_encode(array('success' => false, 'field' => 'password', 'msg' => 'Enter your correct current password and a new password.'));
    return;
  }
  if ($changePassword && strlen($newPassword) > 72) {
    echo json_encode(array('success' => false, 'field' => 'password', 'msg' => 'The new password must be at most 72 bytes.'));
    return;
  }
  if ($db->fetchOne("SELECT id FROM `{$map_prefix}user` WHERE (username = ? OR email = ?) AND id <> ? LIMIT 1", [$username, $username, $userId])) {
    echo json_encode(array('success' => false, 'msg' => 'That username is already in use.'));
    return;
  }
  try {
    if ($changePassword) {
      $passwordHash = password_hash($newPassword, PASSWORD_DEFAULT, array('cost' => 13));
      $db->executeStatement("UPDATE `{$map_prefix}user` SET username = ?, name = ?, email = ?, password = ? WHERE id = ? AND deleted IS NULL", [$username, $name, $email, $passwordHash, $userId]);
    } else {
      $db->executeStatement("UPDATE `{$map_prefix}user` SET username = ?, name = ?, email = ? WHERE id = ? AND deleted IS NULL", [$username, $name, $email, $userId]);
    }
  } catch (\Doctrine\DBAL\Exception\UniqueConstraintViolationException $error) {
    echo json_encode(array('success' => false, 'msg' => 'That username or email is already in use.'));
    return;
  }
  $_SESSION['username'] = $username;
  session_write_close();
  echo json_encode(array('success' => true, 'username' => $username, 'name' => $name, 'email' => $email, 'msg' => 'Account information updated successfully!'));
?>
