<?php
  // A path's history (scripts/services/PathEditor.js), newest first: who
  // saved it, what changed, and (with ?revision=) one save's steps and
  // settings, to look at or restore.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  [$userId, $level] = $account ?: [0, 0];
  if (!pathsVisible($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  // (A revision alone, from a [[pathrev:N]] link: its own path.)
  $pathId = (int) ($_GET['id'] ?? 0);
  if (!$pathId && (int) ($_GET['revision'] ?? 0)) $pathId = (int) $db->fetchOne("SELECT path_id FROM `{$map_prefix}path_revision` WHERE id = ?", [(int) $_GET['revision']]);
  $path = pathVisibleTo($db, $map_prefix, $pathId, $userId, $level);
  if (!$path) { echo json_encode(array('success' => false, 'msg' => 'That path is not available.')); return; }

  // Each save as marker History has its revisions (zwiki.js _wikiRevisionRow):
  // who (with their picture), what, how long ago.
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? 'u.profile_picture' : 'NULL';
  $columns = "r.id, r.action, r.summary, UNIX_TIMESTAMP(r.created) AS created, " . wikiAgoSql('r.created') . " AS ago,
              r.user_id AS userId, u.username, u.username AS userName, {$picture} AS profilePicture";
  // (Only those who make paths restore them: revert_path.php.)
  $canRevert = $userId && pathsAllowed($level) && pathCanEdit($path, $userId, $level);
  $latest = (int) $db->fetchOne("SELECT MAX(id) FROM `{$map_prefix}path_revision` WHERE path_id = ?", [$path['id']]);
  $revisionId = (int) ($_GET['revision'] ?? 0);
  if ($revisionId) {
    $revision = $db->fetchAssociative("SELECT {$columns}, r.snapshot FROM `{$map_prefix}path_revision` r LEFT JOIN `{$map_prefix}user` u ON u.id = r.user_id
      WHERE r.id = ? AND r.path_id = ?", [$revisionId, $path['id']]);
    if (!$revision) { echo json_encode(array('success' => false, 'msg' => 'That version is not available.')); return; }
    $snapshot = json_decode($revision['snapshot'], true);
    unset($revision['snapshot']);
    foreach (['id', 'created', 'ago', 'userId'] as $n) $revision[$n] = (int) $revision[$n];
    echo json_encode(array('success' => true, 'snapshot' => $snapshot, 'revision' => $revision,
      'isCurrent' => (int) $revision['id'] === $latest, 'canRevert' => $canRevert, 'pathName' => $path['name'],
      'pathId' => (int) $path['id'], 'pathSlug' => $path['slug'],
      'game' => (string) $db->fetchOne("SELECT short_name FROM `{$map_prefix}container` WHERE id = ?", [$path['container_id']])));
    return;
  }
  $revisions = $db->fetchAllAssociative("
    SELECT {$columns}
      FROM `{$map_prefix}path_revision` r LEFT JOIN `{$map_prefix}user` u ON u.id = r.user_id
     WHERE r.path_id = ? ORDER BY r.id DESC LIMIT 200
  ", [$path['id']]);
  foreach ($revisions as &$revision) foreach (['id', 'created', 'ago', 'userId'] as $n) $revision[$n] = (int) $revision[$n];
  unset($revision);
  echo json_encode(array('success' => true, 'revisions' => $revisions, 'canRevert' => $canRevert, 'pathName' => $path['name'],
    'pathSlug' => $path['slug'], 'game' => (string) $db->fetchOne("SELECT short_name FROM `{$map_prefix}container` WHERE id = ?", [$path['container_id']])));
?>
