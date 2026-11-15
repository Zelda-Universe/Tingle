<?php
  // Records that the signed-in account has started a user's path (POST id):
  // pressed its Start or Continue, or completed a step from its page
  // (scripts/services/PathEditor.js). Once per person per path. Official
  // paths aren't tracked: their figures come from completions.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $account = pathAccount($db, $map_prefix);
  if (!$account) { echo json_encode(array('success' => false, 'msg' => 'Sign in to track a path.')); return; }
  [$userId, $level] = $account;
  if (!pathsVisible($level)) { echo json_encode(array('success' => false, 'msg' => 'Paths are not available yet.')); return; }
  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}path_start'")) { echo json_encode(array('success' => true, 'tracked' => false)); return; }
  $path = pathVisibleTo($db, $map_prefix, (int) ($_POST['id'] ?? 0), $userId, $level);
  if (!$path) { echo json_encode(array('success' => false, 'msg' => 'That path is not available.')); return; }
  if ($path['scope'] !== 'user') { echo json_encode(array('success' => true, 'tracked' => false)); return; }
  $added = $db->executeStatement("INSERT IGNORE INTO `{$map_prefix}path_start` (path_id, user_id) VALUES (?, ?)", [(int) $path['id'], $userId]);
  echo json_encode(array('success' => true, 'tracked' => true, 'new' => (bool) $added));
?>
