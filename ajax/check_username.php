<?php
  start_session('zmap');
  // Registration also needs availability checks before an account exists.
  $userId = (int) ($_SESSION['user_id'] ?? 0);
  session_write_close();
  $username = is_string($_GET['username'] ?? null) ? trim($_GET['username']) : '';
  $valid = (bool) preg_match('/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/D', $username);
  $available = false;
  if ($valid) {
    $available = !$db->fetchOne("SELECT id FROM `{$map_prefix}user` WHERE (username = ? OR email = ?) AND id <> ? LIMIT 1", [$username, $username, $userId]);
  }
  echo json_encode(array('success' => true, 'valid' => $valid, 'available' => $available));
?>
