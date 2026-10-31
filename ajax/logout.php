<?php
	start_session("zmap");
  setcookie(session_name(), '', [
    'expires' => time() - 3600,
    'path' => '/',
    'secure' => session_cookie_is_secure(),
    'httponly' => true,
    'samesite' => 'Lax'
  ]);
  unset($_COOKIE[session_name()]);
  session_unset();
  session_destroy();
  session_write_close();

  setcookie('user_id', '', time() - 3600, '/');
  setcookie('username', '', time() - 3600, '/');
  setcookie('r', '', time() - 3600, '/'); // Leaving in to cleanup clients over time.

  echo json_encode(array("success" => true, "msg" => "Success!"));
?>
