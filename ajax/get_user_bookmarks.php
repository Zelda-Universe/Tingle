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
       AND (ub.marker_id IS NOT NULL OR ub.map_id IS NOT NULL)
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
  // Bookmarked paths (lib/common/paths.php), first: those the account may
  // still see, with what a path card shows. Only once the column's there
  // (the path_bookmarks migration), and while paths are only for those
  // allowed them.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  $level = $account ? $account[1] : 0;
  if (pathsAllowed($level) && $db->fetchOne("SHOW COLUMNS FROM {$map_prefix}user_bookmark LIKE 'path_id'")) {
    $paths = $db->fetchAllAssociative("
      SELECT ub.id, p.id AS pathId, p.slug, p.name, p.color, p.kind, p.loops, p.smooth, p.scope,
             (SELECT COUNT(*) FROM {$map_prefix}path_step s WHERE s.path_id = p.id) AS steps
        FROM {$map_prefix}user_bookmark ub
        JOIN {$map_prefix}path p ON p.id = ub.path_id
        JOIN {$map_prefix}container c ON c.id = p.container_id
       WHERE ub.user_id = ? AND (c.id = ? OR c.short_name = ?) AND p.visible = 1
         AND (p.user_id = ? OR " . pathOpenSql() . " OR (p.scope = 'official' AND ? >= " . PATHS_ADMIN_LEVEL . "))
       ORDER BY ub.created DESC, ub.id DESC
    ", [$userId, $game, $game, $userId, $level]);
    $thumbs = pathThumbs($db, $map_prefix, array_column($paths, 'pathId'));
    $pathRows = array();
    foreach ($paths as $p) {
      $pathRows[] = array('id' => (int) $p['id'], 'pathId' => (int) $p['pathId'], 'markerId' => null, 'slug' => $p['slug'], 'name' => $p['name'],
        'color' => $p['color'], 'kind' => $p['kind'], 'loops' => (bool) $p['loops'], 'smooth' => (bool) $p['smooth'], 'scope' => $p['scope'],
        'steps' => (int) $p['steps'], 'thumb' => $thumbs[(int) $p['pathId']]);
    }
    $res = array_merge($pathRows, $res);
  }
  echo json_encode($res);
?>
