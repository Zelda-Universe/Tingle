<?php
  $path = __DIR__;

  start_session("zmap");
  if (empty($_SESSION['user_id'])) {
    echo json_encode(array());
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  session_write_close();

  $game = $_GET["game"] ?? '';

  // POI bookmarks follow the marker to its map; dropped pins carry their own.
  $rows = $db->fetchAllAssociative("
    SELECT ub.id
         , ub.marker_id
         , COALESCE(smp.map_id, ub.map_id) AS map_id
         , COALESCE(m.submap_id, ub.submap_id) AS submap_id
         , ub.x
         , ub.y
      FROM {$map_prefix}user_bookmark ub
      LEFT JOIN {$map_prefix}marker m
        ON m.id = ub.marker_id
      JOIN {$map_prefix}submap smp
        ON smp.id = COALESCE(m.submap_id, ub.submap_id)
      JOIN {$map_prefix}map mp
        ON mp.id = smp.map_id
     WHERE ub.user_id = ?
       AND mp.container_id = ?
       AND (ub.marker_id IS NULL OR m.visible = 1)
     ORDER BY ub.created DESC, ub.id DESC
  ", [$userId, $game]);

  $res = array();
  foreach ($rows as $row) {
    $res[] = array(
      "id"       => (int) $row["id"],
      "markerId" => $row["marker_id"] === null ? null : (int) $row["marker_id"],
      "mapId"    => (int) $row["map_id"],
      "submapId" => (int) $row["submap_id"],
      "x"        => $row["x"] === null ? null : (float) $row["x"],
      "y"        => $row["y"] === null ? null : (float) $row["y"]
    );
  }
  echo json_encode($res);
?>
