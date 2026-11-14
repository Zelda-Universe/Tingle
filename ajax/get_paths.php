<?php
  // A game's paths (scripts/services/Paths.js): its published official ones,
  // the signed-in user's own (drafts too), and the one a link names (?path=,
  // anyone's that's published and not private: a shared route), each with its steps in order. A step is a marker
  // (markerId) or a bare point (submapId, x, y, name): a user's own pin or a
  // hidden waypoint. Single paths come with whether the user has completed
  // them (one check for the whole path).
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $game = $_GET['game'] ?? '';
  if ($game === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $game)) { echo json_encode(array()); return; }
  if (adminOnlyGameDenied($db, $map_prefix, $game)) { echo json_encode(array()); return; }
  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}path'")) { echo json_encode(array()); return; }

  $account = pathAccount($db, $map_prefix);
  [$userId, $level] = $account ?: [0, 0];
  if (!pathsAllowed($level)) { echo json_encode(array()); return; }

  $paths = $db->fetchAllAssociative("
    SELECT p.id, p.user_id AS userId, p.scope, p.visibility, p.edit_access AS editAccess,
           UNIX_TIMESTAMP(p.published_at) AS publishedAt, " . pathPublishedSql() . " AS published,
           (SELECT COUNT(*) FROM `{$map_prefix}like` l WHERE l.target_type = 'path' AND l.target_id = p.id) AS yeahs, p.name, p.slug, p.description, p.kind,
           p.loops, p.numbered, p.smooth, p.always_show AS alwaysShow, p.category_id AS categoryId, p.color, u.username AS userName,
           (SELECT 1 FROM {$map_prefix}user_completed_path c WHERE c.path_id = p.id AND c.user_id = ?) AS complete
      FROM {$map_prefix}path p
      JOIN {$map_prefix}container g ON g.id = p.container_id
      LEFT JOIN {$map_prefix}user u ON u.id = p.user_id
     WHERE (g.id = ? OR g.short_name = ?) AND p.visible = 1
       AND ((p.scope = 'official' AND (" . pathPublishedSql() . " OR ? >= " . PATHS_ADMIN_LEVEL . "))
            OR p.user_id = ? OR (p.slug = ? AND " . pathOpenSql() . "))
     ORDER BY p.scope = 'official' DESC, p.id
  ", [$userId, $game, $game, $level, $userId, (string) ($_GET['path'] ?? '')]);
  if (!$paths) { echo json_encode(array()); return; }

  $ids = array_map(function($p) { return (int) $p['id']; }, $paths);
  // A step whose marker has since been removed from the map (only a user's
  // own path keeps one: lib/common/paths.php) comes with a copy of it, its
  // name, place and contents, so the path still reads as it was built.
  $steps = $db->fetchAllAssociative("
    SELECT s.path_id AS pathId, s.step_order AS stepOrder, s.marker_id AS markerId, s.submap_id AS submapId,
           s.x, s.y, s.name, s.note, s.shown,
           m.visible AS markerVisible, m.name AS markerName, m.submap_id AS markerSubmapId, m.x AS markerX, m.y AS markerY
      FROM {$map_prefix}path_step s LEFT JOIN {$map_prefix}marker m ON m.id = s.marker_id
     WHERE s.path_id IN (" . implode(',', $ids) . ")
     ORDER BY s.path_id, s.step_order
  ");
  $deletedIds = array();
  foreach ($steps as $step) if ($step['markerId'] && (string) $step['markerVisible'] === '0') $deletedIds[] = (int) $step['markerId'];
  $deletedContent = array();
  if ($deletedIds) {
    foreach ($db->fetchAllAssociative("SELECT marker_id, tab_text FROM {$map_prefix}marker_tab WHERE visible = 1 AND marker_id IN (" .
        implode(',', array_unique($deletedIds)) . ") ORDER BY marker_id, tab_order, marker_tab_id") as $tab) {
      $deletedContent[$tab['marker_id']] = ($deletedContent[$tab['marker_id']] ?? '') . html_entity_decode((string) $tab['tab_text'], ENT_QUOTES, 'UTF-8');
    }
  }
  foreach ($steps as &$step) {
    if ($step['markerId'] && (string) $step['markerVisible'] === '0') {
      $step['deleted'] = true;
      $step['markerName'] = html_entity_decode((string) $step['markerName'], ENT_QUOTES, 'UTF-8');
      $step['submapId'] = $step['markerSubmapId'];
      $step['x'] = $step['markerX'];
      $step['y'] = $step['markerY'];
      $step['content'] = $deletedContent[$step['markerId']] ?? '';
    }
    unset($step['markerVisible'], $step['markerSubmapId'], $step['markerX'], $step['markerY']);
    if (empty($step['deleted'])) unset($step['markerName']);
  }
  unset($step);
  $stats = pathCompletionStats($db, $map_prefix, $ids);
  $thumbs = pathThumbs($db, $map_prefix, $ids);
  $byPath = array();
  foreach ($steps as $step) $byPath[$step['pathId']][] = $step;
  foreach ($paths as &$path) {
    $path['steps'] = $byPath[$path['id']] ?? array();
    $path['publishedAt'] = $path['publishedAt'] === null ? null : (int) $path['publishedAt'];
    $path['yeahs'] = (int) $path['yeahs'];
    // People who've done at least one of its checks, and all of them.
    [$path['started'], $path['finished']] = $stats[(int) $path['id']];
    $path['thumb'] = $thumbs[(int) $path['id']];
    foreach (['loops', 'numbered', 'smooth', 'alwaysShow', 'complete', 'published'] as $flag) $path[$flag] = (bool) $path[$flag];
    $path['mine'] = $userId && (int) $path['userId'] === $userId;
    $rule = ['user_id' => $path['userId'], 'edit_access' => $path['editAccess']];
    $path['canEdit'] = $userId && pathCanEdit($rule, $userId, $level);
    $path['canManage'] = $userId && pathCanManage($rule, $userId, $level);
  }
  echo json_encode($paths);
?>
