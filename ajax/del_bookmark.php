<?php
  $path = __DIR__;

  start_session("zmap");
  if (empty($_SESSION['user_id'])) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Not logged or session expired!"
    ));
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  session_write_close();

  if (!is_numeric($_POST['bookmarkId'] ?? null)) {
    echo json_encode(array("success" => false, "msg" => "No bookmark given."));
    return;
  }

  $db->executeStatement("
    DELETE FROM {$map_prefix}user_bookmark
     WHERE id = ?
       AND user_id = ?
  ", [(int) $_POST['bookmarkId'], $userId]);

  echo json_encode(array("success" => true));
?>
