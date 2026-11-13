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
           p.loops, p.numbered, p.category_id AS categoryId, p.color, u.username AS userName,
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
  $steps = $db->fetchAllAssociative("
    SELECT path_id AS pathId, step_order AS stepOrder, marker_id AS markerId, submap_id AS submapId,
           x, y, name, note, shown
      FROM {$map_prefix}path_step
     WHERE path_id IN (" . implode(',', $ids) . ")
     ORDER BY path_id, step_order
  ");
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
    foreach (['loops', 'numbered', 'complete', 'published'] as $flag) $path[$flag] = (bool) $path[$flag];
    $path['mine'] = $userId && (int) $path['userId'] === $userId;
    $rule = ['user_id' => $path['userId'], 'edit_access' => $path['editAccess']];
    $path['canEdit'] = $userId && pathCanEdit($rule, $userId, $level);
    $path['canManage'] = $userId && pathCanManage($rule, $userId, $level);
  }
  echo json_encode($paths);
?>
