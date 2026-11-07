<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Puts a marker back to an earlier revision. Like MediaWiki, the revert is
  // saved as a new revision, so it can itself be reverted.
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to keep marker history.'));
    return;
  }
  $revision = $db->fetchAssociative(
    "SELECT `id`, `marker_id`, `data` FROM `{$map_prefix}marker_revision` WHERE `id` = ?",
    [(int) ($_POST['revisionId'] ?? 0)]
  );
  if (!$revision) {
    echo json_encode(array('success' => false, 'msg' => 'That revision was not found.'));
    return;
  }
  $markerId = (int) $revision['marker_id'];
  $owner = $db->fetchOne("SELECT `user_id` FROM `{$map_prefix}marker` WHERE `id` = ?", [$markerId]);
  if ($owner === false || !wikiCanEditMarker($editor, $owner)) {
    echo json_encode(array('success' => false, 'msg' => "You can't revert this marker."));
    return;
  }
  $latestId = (int) $db->fetchOne("SELECT MAX(`id`) FROM `{$map_prefix}marker_revision` WHERE `marker_id` = ?", [$markerId]);
  if ((int) $revision['id'] === $latestId) {
    echo json_encode(array('success' => false, 'msg' => 'That is already the current version.'));
    return;
  }

  $summary = trim(is_string($_POST['summary'] ?? null) ? $_POST['summary'] : '');
  $snapshot = json_decode($revision['data'], true);
  // Beta testers can't hide or show markers (lib/common/account_status.php),
  // so their reverts leave the marker as visible as it is now.
  if ($editor['beta']) {
    $snapshot['visible'] = (int) $db->fetchOne("SELECT `visible` FROM `{$map_prefix}marker` WHERE `id` = ?", [$markerId]);
  }
  begin();
  wikiApplySnapshot($db, $map_prefix, $markerId, $snapshot, $editor['id']);
  $newId = wikiRecordRevision(
    $db, $map_prefix, $markerId, $editor['id'], 'revert',
    $summary !== '' ? $summary : 'Restored [[rev:' . (int) $revision['id'] . ']]',
    (int) $revision['id']
  );
  commit();
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  notifyMarkerChange($db, $map_prefix, $editor['id'], $markerId, $newId, 'revert');

  // The marker as get_markers renders it, to refresh the map.
  $_GET['newMarkerId'] = $markerId;
  $_GET['game'] = (string) ($_POST['game'] ?? '');
  ob_start();
  include(__DIR__ . '/get_markers.php');
  $output = ob_get_clean();

  echo json_encode(array('success' => true, 'msg' => 'Reverted.', 'revisionId' => $newId, 'marker' => $output));
?>
