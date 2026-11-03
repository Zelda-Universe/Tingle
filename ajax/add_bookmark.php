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

  $markerId = $_POST['markerId'] ?? null;

  if (is_numeric($markerId)) {
    $markerId = (int) $markerId;
    $existing = $db->fetchOne("
      SELECT id
        FROM {$map_prefix}user_bookmark
       WHERE user_id = ?
         AND marker_id = ?
    ", [$userId, $markerId]);
    if ($existing) {
      echo json_encode(array("success" => true, "id" => (int) $existing));
      return;
    }

    $db->executeStatement("
      INSERT INTO `{$map_prefix}user_bookmark` (
          `user_id`
        , `marker_id`
        , `created`
      ) VALUES (?, ?, now())
    ", [$userId, $markerId]);
  } else {
    if (
          !is_numeric($_POST['mapId']    ?? null)
      ||  !is_numeric($_POST['submapId'] ?? null)
      ||  !is_numeric($_POST['x']        ?? null)
      ||  !is_numeric($_POST['y']        ?? null)
    ) {
      echo json_encode(array("success" => false, "msg" => "Nothing to bookmark."));
      return;
    }

    $db->executeStatement("
      INSERT INTO `{$map_prefix}user_bookmark` (
          `user_id`
        , `map_id`
        , `submap_id`
        , `x`
        , `y`
        , `created`
      ) VALUES (?, ?, ?, ?, ?, now())
    ", [
      $userId,
      (int) $_POST['mapId'],
      (int) $_POST['submapId'],
      round((float) $_POST['x'], 4),
      round((float) $_POST['y'], 4)
    ]);
  }

  echo json_encode(array(
    "success" => true,
    "id"      => (int) $db->lastInsertId()
  ));
?>
