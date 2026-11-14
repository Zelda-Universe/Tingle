<?php
  // Community Paths (scripts/services/PathEditor.js): everyone's public,
  // published paths, in every game the viewer can see, newest first
  // (?sort=latest), most Yeah'd (?sort=yeahs), most started (?sort=started) or
  // most finished (?sort=completes). Started and finished count those who
  // started each path there (path_start, lib/common/paths.php). ?offset= pages through them.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  [$userId, $level] = $account ?: [0, 0];
  if (!pathsAllowed($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  $sort = in_array($_GET['sort'] ?? '', ['yeahs', 'completes', 'started'], true) ? $_GET['sort'] : 'latest';
  $offset = max(0, (int) ($_GET['offset'] ?? 0));
  $limit = 30;
  // Who started each path, and how many of them have done every step.
  $tracked = $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}path_start'") ?
    "LEFT JOIN (" . pathTrackedSql($db, $map_prefix) . ") f ON f.path_id = p.id" :
    "LEFT JOIN (SELECT NULL AS path_id, 0 AS started, 0 AS finished) f ON f.path_id = p.id";
  $paths = $db->fetchAllAssociative("
    SELECT p.id, p.name, p.slug, p.description, p.color, p.kind, p.loops, p.smooth, u.username AS userName,
           c.short_name AS game, c.name AS gameName, UNIX_TIMESTAMP(p.published_at) AS publishedAt,
           (SELECT COUNT(*) FROM `{$map_prefix}path_step` s WHERE s.path_id = p.id) AS steps,
           (SELECT COUNT(*) FROM `{$map_prefix}like` l WHERE l.target_type = 'path' AND l.target_id = p.id) AS yeahs,
           COALESCE(f.started, 0) AS started, COALESCE(f.finished, 0) AS finished
      FROM `{$map_prefix}path` p
      $tracked
      JOIN `{$map_prefix}container` c ON c.id = p.container_id
      LEFT JOIN `{$map_prefix}user` u ON u.id = p.user_id
     WHERE p.visible = 1 AND c.enabled = 1 AND " . pathListedSql() . "
       AND (c.visible = 1 OR (c.visible = 2 AND ? >= " . PATHS_ADMIN_LEVEL . "))
     ORDER BY " . array('yeahs' => 'yeahs DESC, p.published_at DESC', 'completes' => 'finished DESC, p.published_at DESC', 'started' => 'started DESC, p.published_at DESC', 'latest' => 'p.published_at DESC')[$sort] . ", p.id DESC
     LIMIT " . ($limit + 1) . " OFFSET " . $offset, [$level]);
  $more = count($paths) > $limit;
  $paths = array_slice($paths, 0, $limit);
  foreach ($paths as &$path) {
    foreach (['id', 'publishedAt', 'steps', 'yeahs', 'started', 'finished'] as $n) $path[$n] = (int) $path[$n];
    foreach (['loops', 'smooth'] as $flag) $path[$flag] = (bool) $path[$flag];
    $path['description'] = mb_substr((string) $path['description'], 0, 200);
  }
  unset($path);
  $thumbs = pathThumbs($db, $map_prefix, array_column($paths, 'id'));
  foreach ($paths as &$path) $path['thumb'] = $thumbs[$path['id']];
  unset($path);
  echo json_encode(array('success' => true, 'paths' => $paths, 'more' => $more));
?>
