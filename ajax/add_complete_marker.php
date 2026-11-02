<?php
  $path = __DIR__;

  if (
        !is_numeric($_POST['userId']   ?? null)
    ||  !is_numeric($_POST['markerId'] ?? null)
  ) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Not logged or session expired!"
    ));
    return;
  }

  start_session("zmap");
  if (empty($_SESSION['user_id']) || $_SESSION['user_id'] != $_POST['userId']) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Not logged or session expired!"
    ));
    return;
  }
  session_write_close();

  $userId   = (int) $_POST['userId'];
  $markerId = (int) $_POST['markerId'];

  begin();

  $db->executeStatement("
    DELETE FROM {$map_prefix}user_completed_marker
    WHERE user_id = ?
      AND marker_id = ?
  ", [$userId, $markerId]);

  $db->executeStatement("
    INSERT INTO `{$map_prefix}user_completed_marker` (
        `user_id`
      , `marker_id`
      , `complete_date`
      , `visible`
    ) VALUES (?, ?, now(), 1)
  ", [$userId, $markerId]);

  commit();

  echo json_encode(array(
    "success" => true,
    "msg"     => "Marker {$markerId} has been completed!"
  ));
?>
