<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;

  $userId = (int) ($_POST['id'] ?? 0);
  $user = $db->fetchAssociative("SELECT `id`, `username`, `name`, `email`, `level`, `deleted` FROM `{$map_prefix}user` WHERE `id` = ?", [$userId]);
  if (!$user || $user['deleted'] !== null) {
    echo json_encode(array('success' => false, 'msg' => 'That account was not found or has been deleted.'));
    return;
  }

  $username = trim(is_string($_POST['username'] ?? null) ? $_POST['username'] : '');
  $name = trim(is_string($_POST['name'] ?? null) ? $_POST['name'] : '');
  $email = trim(is_string($_POST['email'] ?? null) ? $_POST['email'] : '');
  $level = (int) ($_POST['level'] ?? -1);
  $password = is_string($_POST['password'] ?? null) ? $_POST['password'] : '';

  // The same rules as change_username.php.
  if (!preg_match('/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/D', $username)) {
    echo json_encode(array('success' => false, 'msg' => 'Use 3–45 letters, numbers, periods, underscores, or hyphens. Start with a letter or number.'));
    return;
  }
  if ($name === '' || mb_strlen($name) > 255) {
    echo json_encode(array('success' => false, 'msg' => 'Enter a full name (up to 255 characters).'));
    return;
  }
  if (strlen($email) > 254 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(array('success' => false, 'msg' => 'Enter a valid email address.'));
    return;
  }
  if (!in_array($level, [1, 5, 10], true)) {
    echo json_encode(array('success' => false, 'msg' => 'Choose a role.'));
    return;
  }
  // Admins can't remove their own access by mistake.
  if ($userId === $adminId && $level < ADMIN_LEVEL) {
    echo json_encode(array('success' => false, 'msg' => "You can't remove your own admin role."));
    return;
  }
  if ($password !== '' && (strlen($password) < 8 || strlen($password) > 72)) {
    echo json_encode(array('success' => false, 'msg' => 'A new password must be 8–72 characters.'));
    return;
  }
  if ($db->fetchOne(
    "SELECT `id` FROM `{$map_prefix}user` WHERE (`username` IN (?, ?) OR `email` IN (?, ?)) AND `id` <> ? LIMIT 1",
    [$username, $email, $username, $email, $userId]
  )) {
    echo json_encode(array('success' => false, 'msg' => 'That username or email is already in use.'));
    return;
  }

  $fields = '`username` = ?, `name` = ?, `email` = ?, `level` = ?';
  $params = [$username, $name, $email, $level];
  if ($password !== '') {
    $fields .= ', `password` = ?';
    $params[] = password_hash($password, PASSWORD_DEFAULT, ['cost' => 13]);
  }
  $params[] = $userId;
  $db->executeStatement("UPDATE `{$map_prefix}user` SET {$fields} WHERE `id` = ?", $params);

  // The change log: each changed field as [before, after]. A new password is
  // only noted, never stored.
  $changes = [];
  foreach (['username' => $username, 'name' => $name, 'email' => $email] as $field => $value) {
    if ((string) $user[$field] !== $value) $changes[$field] = [$user[$field], $value];
  }
  if ((int) $user['level'] !== $level) $changes['level'] = [(int) $user['level'], $level];
  if ($password !== '') $changes['password'] = true;
  if ($changes) adminLog($db, $map_prefix, $adminId, $userId, 'update', $changes);

  echo json_encode(array('success' => true, 'msg' => 'Account updated.', 'user' => array(
    'id' => $userId, 'username' => $username, 'name' => $name, 'email' => $email, 'level' => $level
  )));
?>
