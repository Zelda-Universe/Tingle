<?php
  // Restores a path's steps and look to an earlier save (POST id, revision),
  // as a new save in its history. Who sees it and who can edit it stay as
  // they are. Anyone who can edit the path can do it.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $account = pathAccount($db, $map_prefix);
  if (!$account) { $fail('Sign in to restore a path.'); return; }
  [$userId, $level] = $account;
  if (!pathsAllowed($level)) { $fail('Paths are not available yet.'); return; }
  $id = (int) ($_POST['id'] ?? 0);
  $revisionId = (int) ($_POST['revision'] ?? 0);

  $db->beginTransaction();
  try {
    $path = $db->fetchAssociative("SELECT * FROM `{$map_prefix}path` WHERE id = ? FOR UPDATE", [$id]);
    if (!$path || !pathCanEdit($path, $userId, $level)) { $db->rollBack(); $fail('You can\'t change this path.'); return; }
    $snapshot = json_decode((string) $db->fetchOne("SELECT snapshot FROM `{$map_prefix}path_revision` WHERE id = ? AND path_id = ?", [$revisionId, $id]), true);
    if (!is_array($snapshot)) { $db->rollBack(); $fail('That version is not available.'); return; }
    // A marker since removed from the map: a user's path keeps it (it was
    // theirs); an official one leaves it out, as deleting it did.
    $snapshotMarkers = array_values(array_filter(array_map(function($s) { return (int) ($s['markerId'] ?? 0); }, $snapshot['steps'] ?? array())));
    $keep = array();
    if ($snapshotMarkers) {
      $hidden = array_map('intval', $db->fetchFirstColumn("SELECT id FROM `{$map_prefix}marker` WHERE visible = 0 AND id IN (" . implode(',', $snapshotMarkers) . ")"));
      if ($path['scope'] === 'user') $keep = $hidden;
      else $snapshot['steps'] = array_values(array_filter($snapshot['steps'], function($s) use ($hidden) { return !in_array((int) ($s['markerId'] ?? 0), $hidden, true); }));
    }
    $read = pathRead($db, $map_prefix, (int) $path['container_id'], $snapshot, $keep);
    if (is_string($read)) { $db->rollBack(); $fail('That version can\'t be restored: ' . $read); return; }
    $before = pathSnapshot($db, $map_prefix, $id);
    pathWrite($db, $map_prefix, $id, $read[0], $read[1]);
    // (Who saved it, not when: times read in each viewer's own zone.)
    $summary = 'Restored ' . $db->fetchOne("SELECT u.username FROM `{$map_prefix}path_revision` r JOIN `{$map_prefix}user` u ON u.id = r.user_id WHERE r.id = ?", [$revisionId]) . '’s earlier version';
    $restored = pathRecordRevision($db, $map_prefix, $id, $userId, 'revert', $summary, $before);
    $db->commit();
  } catch (Throwable $ex) {
    $db->rollBack();
    throw $ex;
  }
  pathNotifyOwner($db, $map_prefix, array_merge($path, array('name' => $read[0]['name'])), $userId, 'revert', $summary, $restored);
  echo json_encode(array('success' => true, 'slug' => $path['slug']));
?>
