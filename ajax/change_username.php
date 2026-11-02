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
  $emailCheck = $mysqli->prepare("SELECT id FROM `{$map_prefix}user` WHERE (email = ? OR username = ?) AND id <> ? LIMIT 1");
  $emailCheck->bind_param('ssi', $email, $email, $userId);
  $emailCheck->execute();
  $emailCheck->store_result();
  if ($emailCheck->num_rows > 0) {
    echo json_encode(array('success' => false, 'msg' => 'That email address is already in use.'));
    return;
  }
  $currentPassword = is_string($_POST['currentpassword'] ?? null) ? $_POST['currentpassword'] : '';
  $newPassword = is_string($_POST['newpassword'] ?? null) ? $_POST['newpassword'] : '';
  $changePassword = $currentPassword !== '' || $newPassword !== '';
  $account = $mysqli->prepare("SELECT password FROM `{$map_prefix}user` WHERE id = ? AND deleted IS NULL");
  $account->bind_param('i', $userId);
  $account->execute();
  $account->bind_result($storedPassword);
  $foundAccount = $account->fetch();
  $account->close();
  if (!$foundAccount) {
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
  $check = $mysqli->prepare("SELECT id FROM `{$map_prefix}user` WHERE (username = ? OR email = ?) AND id <> ? LIMIT 1");
  $check->bind_param('ssi', $username, $username, $userId);
  $check->execute();
  $check->store_result();
  if ($check->num_rows > 0) {
    echo json_encode(array('success' => false, 'msg' => 'That username is already in use.'));
    return;
  }
  try {
    if ($changePassword) {
      $passwordHash = password_hash($newPassword, PASSWORD_DEFAULT, array('cost' => 13));
      $update = $mysqli->prepare("UPDATE `{$map_prefix}user` SET username = ?, email = ?, password = ? WHERE id = ? AND deleted IS NULL");
      $update->bind_param('sssi', $username, $email, $passwordHash, $userId);
    } else {
      $update = $mysqli->prepare("UPDATE `{$map_prefix}user` SET username = ?, email = ? WHERE id = ? AND deleted IS NULL");
      $update->bind_param('ssi', $username, $email, $userId);
    }
    $update->execute();
  } catch (mysqli_sql_exception $error) {
    if ((int) $error->getCode() !== 1062) throw $error;
    echo json_encode(array('success' => false, 'msg' => 'That username is already in use.'));
    return;
  }
  $_SESSION['username'] = $username;
  session_write_close();
  echo json_encode(array('success' => true, 'username' => $username, 'email' => $email, 'msg' => 'Account information updated successfully!'));
?>
