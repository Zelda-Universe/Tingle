<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');

  // A profile page: banner, picture, bio and recent changes. Anyone can see
  // the profiles of people who edit (Contributors, Admins and the editing
  // beta's testers); other accounts have none, as far as anyone but an admin
  // can tell. Only editors see changes to markers that aren't on the map.
  start_session('zmap');
  $viewerId = (int) ($_SESSION['user_id'] ?? 0);
  session_write_close();
  $viewerRole = $viewerId ? accountRole($db, $map_prefix, $viewerId) : false;
  $viewerLevel = $viewerRole ? $viewerRole[0] : 0;
  $viewerEditor = $viewerLevel >= WIKI_EDITOR_LEVEL;
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? '`profile_picture`' : 'NULL';
  $bio = wikiHasUserColumn($db, $map_prefix, 'bio') ? '`bio`' : 'NULL';
  $banner = wikiHasUserColumn($db, $map_prefix, 'profile_banner') ? '`profile_banner`' : 'NULL';
  $select = "
    SELECT `id`, `username`, `level`, " . accountLevelSql($db, $map_prefix) . " AS `editLevel`,
           " . accountBetaSql($db, $map_prefix) . " AS `beta`, `created`, " . wikiAgoSql('`created`') . " AS `joinedAgo`,
           {$picture} AS `profilePicture`, {$bio} AS `bio`, {$banner} AS `banner`
      FROM `{$map_prefix}user`
     WHERE `deleted` IS NULL AND ";
  // ?name= is what profile links carry: a username, or an account ID from
  // before links used names (tried only when no one has that name).
  $name = is_string($_GET['name'] ?? null) ? $_GET['name'] : null;
  if ($name !== null) {
    $user = $db->fetchAssociative($select . "`username` = ?", [$name]);
    if (!$user && ctype_digit($name)) $user = $db->fetchAssociative($select . "`id` = ?", [(int) $name]);
  } else {
    $user = isset($_GET['username']) && is_string($_GET['username'])
      ? $db->fetchAssociative($select . "`username` = ?", [$_GET['username']])
      : $db->fetchAssociative($select . "`id` = ?", [(int) ($_GET['id'] ?? $viewerId)]);
  }
  if ($user && (int) $user['editLevel'] < WIKI_EDITOR_LEVEL && $viewerLevel < WIKI_ADMIN_LEVEL) $user = false;
  if (!$user) {
    echo json_encode(array('success' => false, 'msg' => 'That user was not found.'));
    return;
  }
  foreach (['id', 'level', 'joinedAgo'] as $key) $user[$key] = (int) $user[$key];
  unset($user['editLevel']);
  // In the community editing beta (lib/common/account_status.php).
  $user['beta'] = (bool) $user['beta'];

  $changes = [];
  $counts = ['edits' => 0, 'comments' => 0];
  if (wikiAvailable($db, $map_prefix)) {
    include_once(dirname(__DIR__).'/lib/common/community_changes.php');
    $filter=is_string($_GET['filter'] ?? null)?$_GET['filter']:'all';
    $changes=communityChanges($db,$map_prefix,$viewerEditor,'',(int)$user['id'],'',30,$viewerLevel>=WIKI_ADMIN_LEVEL,$filter)['changes'];
    $counts['edits'] = (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$map_prefix}marker_revision` WHERE `user_id` = ? AND `action` <> 'import'", [$user['id']]
    );
    if($viewerLevel>=WIKI_ADMIN_LEVEL && $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}map_revision'")) $counts['edits']+=(int)$db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}map_revision` WHERE user_id=? AND kind IN ('game','map','category','layout','map_order')",[$user['id']]);
    $counts['comments'] = (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$map_prefix}talk_comment` WHERE `user_id` = ? AND `deleted` IS NULL", [$user['id']]
    );
  }
  $counts['markers'] = (int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}marker` WHERE `user_id` = ? AND `visible` = 1", [$user['id']]
  );

  // Their own paths (scope user), in the games the viewer can see: games in
  // progress (visible = 2) only for admins. Others see the public, published
  // ones; the owner sees them all, drafts and unlisted ones marked.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $paths = null;
  if (pathsAllowed($viewerLevel) && $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}path'")) {
    $paths = $db->fetchAllAssociative("
      SELECT p.id, p.name, p.slug, p.kind, p.loops, p.color, p.visibility, UNIX_TIMESTAMP(p.published_at) AS publishedAt,
             " . pathPublishedSql() . " AS published, c.short_name AS game, c.name AS gameName,
             (SELECT COUNT(*) FROM `{$map_prefix}like` l WHERE l.target_type = 'path' AND l.target_id = p.id) AS yeahs,
             (SELECT COUNT(*) FROM `{$map_prefix}path_step` s WHERE s.path_id = p.id) AS steps
        FROM `{$map_prefix}path` p JOIN `{$map_prefix}container` c ON c.id = p.container_id
       WHERE p.user_id = ? AND p.scope = 'user' AND p.visible = 1 AND c.enabled = 1
         AND (" . pathListedSql() . " OR p.user_id = ?)
         AND (c.visible = 1 OR (c.visible = 2 AND ? >= " . (int) WIKI_ADMIN_LEVEL . "))
       ORDER BY p.updated DESC, p.id DESC
    ", [$user['id'], $viewerId, $viewerLevel]);
    foreach ($paths as &$path) { $path['steps'] = (int) $path['steps']; $path['loops'] = (bool) $path['loops']; $path['published'] = (bool) $path['published'];
      $path['publishedAt'] = $path['publishedAt'] === null ? null : (int) $path['publishedAt']; $path['yeahs'] = (int) $path['yeahs']; }
    unset($path);
    // Path cards' thumbnails (lib/common/paths.php).
    $thumbs = pathThumbs($db, $map_prefix, array_column($paths, 'id'));
    foreach ($paths as &$path) $path['thumb'] = $thumbs[(int) $path['id']];
    unset($path);
  }

  echo json_encode(array(
    'success' => true,
    'paths' => $paths,
    'user' => $user,
    'counts' => $counts,
    'changes' => $changes,
    'isSelf' => $user['id'] === $viewerId,
    'canEdit' => $viewerEditor && ($user['id'] === $viewerId || $viewerLevel >= WIKI_ADMIN_LEVEL)
  ));
?>
