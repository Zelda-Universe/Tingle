<?php
  // A path's history (scripts/services/PathEditor.js), newest first: who
  // saved it, what changed, and (with ?revision=) one save's steps and
  // settings, to look at or restore.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  [$userId, $level] = $account ?: [0, 0];
  if (!pathsAllowed($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  $path = pathVisibleTo($db, $map_prefix, (int) ($_GET['id'] ?? 0), $userId, $level);
  if (!$path) { echo json_encode(array('success' => false, 'msg' => 'That path is not available.')); return; }

  $revisionId = (int) ($_GET['revision'] ?? 0);
  if ($revisionId) {
    $snapshot = $db->fetchOne("SELECT snapshot FROM `{$map_prefix}path_revision` WHERE id = ? AND path_id = ?", [$revisionId, $path['id']]);
    if ($snapshot === false) { echo json_encode(array('success' => false, 'msg' => 'That version is not available.')); return; }
    echo json_encode(array('success' => true, 'snapshot' => json_decode($snapshot, true)));
    return;
  }
  $revisions = $db->fetchAllAssociative("
    SELECT r.id, r.action, r.summary, UNIX_TIMESTAMP(r.created) AS created, u.username AS userName
      FROM `{$map_prefix}path_revision` r LEFT JOIN `{$map_prefix}user` u ON u.id = r.user_id
     WHERE r.path_id = ? ORDER BY r.id DESC LIMIT 200
  ", [$path['id']]);
  foreach ($revisions as &$revision) { $revision['id'] = (int) $revision['id']; $revision['created'] = (int) $revision['created']; }
  unset($revision);
  echo json_encode(array('success' => true, 'revisions' => $revisions,
    'canRevert' => $userId && pathCanEdit($path, $userId, $level)));
?>
