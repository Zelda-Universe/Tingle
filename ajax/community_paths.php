<?php
  // Community Paths (scripts/services/PathEditor.js): everyone's public,
  // published paths, in every game the viewer can see, newest first
  // (?sort=latest), most Yeah'd (?sort=yeahs) or most finished (?sort=completes:
  // the most people who've completed every step). ?offset= pages through them.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  [$userId, $level] = $account ?: [0, 0];
  if (!pathsAllowed($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  $sort = in_array($_GET['sort'] ?? '', ['yeahs', 'completes'], true) ? $_GET['sort'] : 'latest';
  $offset = max(0, (int) ($_GET['offset'] ?? 0));
  $limit = 30;
  $checks = pathChecksSql($map_prefix);
  $paths = $db->fetchAllAssociative("
    SELECT p.id, p.name, p.slug, p.description, p.color, p.kind, p.loops, p.smooth, u.username AS userName,
           c.short_name AS game, c.name AS gameName, UNIX_TIMESTAMP(p.published_at) AS publishedAt,
           (SELECT COUNT(*) FROM `{$map_prefix}path_step` s WHERE s.path_id = p.id) AS steps,
           (SELECT COUNT(*) FROM `{$map_prefix}like` l WHERE l.target_type = 'path' AND l.target_id = p.id) AS yeahs,
           COALESCE(f.finished, 0) AS finished
      FROM `{$map_prefix}path` p
      LEFT JOIN (SELECT t.path_id, SUM(t.done = k.total) AS finished
                   FROM (SELECT ch.path_id, c.user_id, COUNT(*) AS done
                           FROM ($checks) ch JOIN `{$map_prefix}user_completed_marker` c ON c.marker_id = ch.marker_id
                          GROUP BY ch.path_id, c.user_id) t
                   JOIN (SELECT path_id, COUNT(*) AS total FROM ($checks) x GROUP BY path_id) k ON k.path_id = t.path_id
                  GROUP BY t.path_id) f ON f.path_id = p.id
      JOIN `{$map_prefix}container` c ON c.id = p.container_id
      LEFT JOIN `{$map_prefix}user` u ON u.id = p.user_id
     WHERE p.visible = 1 AND c.enabled = 1 AND " . pathListedSql() . "
       AND (c.visible = 1 OR (c.visible = 2 AND ? >= " . PATHS_ADMIN_LEVEL . "))
     ORDER BY " . array('yeahs' => 'yeahs DESC, p.published_at DESC', 'completes' => 'finished DESC, p.published_at DESC', 'latest' => 'p.published_at DESC')[$sort] . ", p.id DESC
     LIMIT " . ($limit + 1) . " OFFSET " . $offset, [$level]);
  $more = count($paths) > $limit;
  $paths = array_slice($paths, 0, $limit);
  foreach ($paths as &$path) {
    foreach (['id', 'publishedAt', 'steps', 'yeahs', 'finished'] as $n) $path[$n] = (int) $path[$n];
    foreach (['loops', 'smooth'] as $flag) $path[$flag] = (bool) $path[$flag];
    $path['description'] = mb_substr((string) $path['description'], 0, 200);
  }
  unset($path);
  $thumbs = pathThumbs($db, $map_prefix, array_column($paths, 'id'));
  foreach ($paths as &$path) $path['thumb'] = $thumbs[$path['id']];
  unset($path);
  echo json_encode(array('success' => true, 'paths' => $paths, 'more' => $more));
?>
