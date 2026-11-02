<?php
  $path = __DIR__;

  start_session("zmap");

  if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']) || !isset($_SESSION['level'])) {
    session_destroy();
    echo json_encode(array("success"=>false, "msg"=>"Session - Not Logged!"));
    return;
  }

  $latestVersion = $db->fetchOne("
    SELECT CONCAT(
      `version_major`, '.',
      `version_minor`, '.',
      `version_patch`
    ) AS `version`
    FROM `{$map_prefix}changelog`
    ORDER BY
      `version_major` DESC,
      `version_minor` DESC,
      `version_patch` DESC
    LIMIT 1
  ");
  if ($latestVersion === false) {
    $latestVersion = '0.0.0';
  }

  $seenVersion = $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
  if ($latestVersion > $seenVersion) {
    $user['seen_version'] = '0.0.0';
    $_SESSION['v1'] = 0;
    $_SESSION['v2'] = 0;
    $_SESSION['v3'] = 0;
  } else {
    $user['seen_version'] = $seenVersion;
  }

  $user['id']       = $_SESSION['user_id'];
  $user['username'] = $_SESSION['username'];
  $user['level']    = $_SESSION['level'];
  session_write_close();

  $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

  $db->executeStatement("
    UPDATE {$map_prefix}user
       SET ip = ?
         , last_login = now()
     WHERE id = ?
  ", [$ip, (int) $user['id']]);

  echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));
?>
