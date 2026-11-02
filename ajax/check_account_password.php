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
  $hash = $db->fetchOne("SELECT password FROM `{$map_prefix}user` WHERE id = ? AND deleted IS NULL", [$userId]);
  echo json_encode(array('success' => true, 'valid' => $hash && password_verify($password, $hash)));
?>
