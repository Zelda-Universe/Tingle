<?php
  // Deletes a path, its steps, checks, history and Yeahs (telling its owner if
  // it wasn't them): by its owner or an admin. POST id.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  if (!$account) { echo json_encode(array('success' => false, 'msg' => 'Sign in to delete a path.')); return; }
  [$userId, $level] = $account;
  if (!pathsAllowed($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  $id = (int) ($_POST['id'] ?? 0);
  $path = $id ? $db->fetchAssociative("SELECT * FROM `{$map_prefix}path` WHERE id = ?", [$id]) : false;
  if (!$path || !pathCanManage($path, $userId, $level)) {
    echo json_encode(array('success' => false, 'msg' => 'You can\'t delete this path.'));
    return;
  }
  $db->beginTransaction();
  $db->executeStatement("DELETE FROM `{$map_prefix}path_revision` WHERE path_id = ?", [$id]);
  $db->executeStatement("DELETE FROM `{$map_prefix}like` WHERE target_type = 'path' AND target_id = ?", [$id]);
  $db->executeStatement("DELETE FROM `{$map_prefix}user_completed_path` WHERE path_id = ?", [$id]);
  if (pathHasPins($db, $map_prefix)) $db->executeStatement("DELETE FROM `{$map_prefix}path_pin_complete` WHERE path_id = ?", [$id]);
  $db->executeStatement("DELETE FROM `{$map_prefix}path_step` WHERE path_id = ?", [$id]);
  $db->executeStatement("DELETE FROM `{$map_prefix}path` WHERE id = ?", [$id]);
  $db->commit();
  pathNotifyOwner($db, $map_prefix, $path, $userId, 'delete');
  echo json_encode(array('success' => true));
?>
