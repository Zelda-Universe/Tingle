<?php
  start_session('zmap');
  if (empty($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false));
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  session_write_close();
  $password = is_string($_POST['currentpassword'] ?? null) ? $_POST['currentpassword'] : '';
  // Older accounts were hashed from a mysqli-escaped copy of the password; see
  // login.php.
  $passwordLegacyEscaped = strtr($password, [
    "\\"   => "\\\\",
    "'"    => "\\'",
    "\""   => "\\\"",
    "\n"   => "\\n",
    "\r"   => "\\r",
    "\0"   => "\\0",
    "\x1a" => "\\Z",
  ]);
  $hasDeletedColumn = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'deleted'");
  $hash = $db->fetchOne(
    "SELECT password FROM `{$map_prefix}user` WHERE id = ?" . ($hasDeletedColumn ? " AND deleted IS NULL" : ""),
    [$userId]
  );
  $valid = $hash && (
    password_verify($password, $hash) || password_verify($passwordLegacyEscaped, $hash)
  );
  echo json_encode(array('success' => true, 'valid' => $valid));
?>
