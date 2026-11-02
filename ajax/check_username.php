<?php
  start_session('zmap');
  if (empty($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false));
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  session_write_close();
  $username = is_string($_GET['username'] ?? null) ? trim($_GET['username']) : '';
  $valid = (bool) preg_match('/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/D', $username);
  $available = false;
  if ($valid) {
    $check = $mysqli->prepare("SELECT id FROM `{$map_prefix}user` WHERE (username = ? OR email = ?) AND id <> ? LIMIT 1");
    $check->bind_param('ssi', $username, $username, $userId);
    $check->execute();
    $check->store_result();
    $available = $check->num_rows === 0;
  }
  echo json_encode(array('success' => true, 'valid' => $valid, 'available' => $available));
?>
