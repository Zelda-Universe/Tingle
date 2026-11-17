<?php
  // Changes a pin on a path, its name and what's written about it, from its
  // page (scripts/services/PathEditor.js openPathPin). POST pathId, pinKey,
  // name, content. Whoever may edit the path may (lib/common/paths.php
  // pathCanEdit: its owner and admins, and editors if its owner lets them).
  // Kept in the path's history like any other change to it.
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $account = pathAccount($db, $map_prefix);
  if (!$account) { $fail('Sign in to change this pin.'); return; }
  [$userId, $level] = $account;
  if (!pathsAllowed($level)) { $fail('Paths are not available yet.'); return; }
  if (!pathHasPins($db, $map_prefix)) { $fail('Pins can\'t be changed yet.'); return; }

  $id = (int) ($_POST['pathId'] ?? 0);
  $key = (string) ($_POST['pinKey'] ?? '');
  $name = trim((string) ($_POST['name'] ?? ''));
  $content = trim(str_replace("\r\n", "\n", (string) ($_POST['content'] ?? '')));
  if (mb_strlen($name) > 120 || preg_match('/[<>]/', $name)) { $fail('Give the pin a name of up to 120 characters, without < or >.'); return; }
  if (mb_strlen($content) > PATH_PIN_CONTENT_MAX) { $fail('Keep the description under ' . number_format(PATH_PIN_CONTENT_MAX) . ' characters.'); return; }

  $db->beginTransaction();
  try {
    $path = $id ? $db->fetchAssociative("SELECT * FROM `{$map_prefix}path` WHERE id = ? AND visible = 1 FOR UPDATE", [$id]) : false;
    if (!$path || !pathCanEdit($path, $userId, $level)) { $db->rollBack(); $fail('You can\'t change this pin.'); return; }
    $step = $db->fetchAssociative("SELECT id, name FROM `{$map_prefix}path_step` WHERE path_id = ? AND pin_key = ? AND marker_id IS NULL", [$id, $key]);
    if (!$step) { $db->rollBack(); $fail('That pin is no longer on this path.'); return; }
    $before = pathSnapshot($db, $map_prefix, $id);
    $db->executeStatement("UPDATE `{$map_prefix}path_step` SET name = ?, content = ? WHERE id = ?",
      [$name === '' ? null : $name, $content === '' ? null : $content, (int) $step['id']]);
    $db->executeStatement("UPDATE `{$map_prefix}path` SET updated = NOW() WHERE id = ?", [$id]);
    $label = $name !== '' ? $name : ($step['name'] ?: 'a pin');
    $summary = 'Edited the pin “' . mb_substr($label, 0, 160) . '”';
    $revision = pathRecordRevision($db, $map_prefix, $id, $userId, 'edit', '', $before);
    if ($revision) $db->executeStatement("UPDATE `{$map_prefix}path_revision` SET summary = ? WHERE id = ?", [$summary, $revision]);
    $db->commit();
  } catch (Throwable $ex) {
    $db->rollBack();
    throw $ex;
  }
  if ($revision) pathNotifyOwner($db, $map_prefix, $path, $userId, 'edit', $summary, $revision);
  echo json_encode(array('success' => true, 'name' => $name, 'content' => $content));
?>
