<?php
  // Completes a pin on a path, or un-completes it, for the signed-in account
  // (scripts/services/PathEditor.js): a pin is one of its path's checks, as
  // its markers are. POST pathId, pinKey, done (1 or 0). Completing one is
  // starting a user's path (ajax/start_path.php).
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $account = pathAccount($db, $map_prefix);
  if (!$account) { $fail('Sign in to complete pins.'); return; }
  [$userId, $level] = $account;
  if (!pathsAllowed($level)) { $fail('Paths are not available yet.'); return; }
  if (!pathHasPins($db, $map_prefix)) { $fail('Pins can\'t be completed yet.'); return; }
  $path = pathVisibleTo($db, $map_prefix, (int) ($_POST['pathId'] ?? 0), $userId, $level);
  if (!$path) { $fail('That path is not available.'); return; }
  $id = (int) $path['id'];
  $key = (string) ($_POST['pinKey'] ?? '');
  if (!$db->fetchOne("SELECT 1 FROM `{$map_prefix}path_step` WHERE path_id = ? AND pin_key = ? AND marker_id IS NULL AND shown = 1", [$id, $key])) {
    $fail('That pin is no longer on this path.');
    return;
  }
  $done = !empty($_POST['done']) && $_POST['done'] !== '0';
  if ($done) {
    $db->executeStatement("INSERT IGNORE INTO `{$map_prefix}path_pin_complete` (user_id, path_id, pin_key) VALUES (?, ?, ?)", [$userId, $id, $key]);
    if ($path['scope'] === 'user' && $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}path_start'")) {
      $db->executeStatement("INSERT IGNORE INTO `{$map_prefix}path_start` (path_id, user_id) VALUES (?, ?)", [$id, $userId]);
    }
  } else {
    $db->executeStatement("DELETE FROM `{$map_prefix}path_pin_complete` WHERE user_id = ? AND path_id = ? AND pin_key = ?", [$userId, $id, $key]);
  }
  echo json_encode(array('success' => true, 'done' => $done));
?>
