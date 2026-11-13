<?php
  // Creates or changes a path (scripts/services/PathEditor.js). POST path: a
  // JSON object {id?, game, name, description, kind, loops, numbered,
  // categoryId, color, steps: [{markerId, note} | {submapId, x, y, name,
  // shown, note}], scope, visibility, editAccess, publish: 'draft' | 'now' |
  // 'schedule', publishAt (Unix seconds), summary}. A path keeps its link
  // (slug) when renamed; every save is kept in its history, and its owner
  // hears about others' changes.
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/paths.php');
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };

  $account = pathAccount($db, $map_prefix);
  if (!$account) { $fail('Sign in to save a path.'); return; }
  [$userId, $level] = $account;
  if (!pathsAllowed($level)) { $fail('Paths are not available yet.'); return; }

  $in = json_decode((string) ($_POST['path'] ?? ''), true);
  if (!is_array($in)) { $fail('Nothing to save.'); return; }
  $game = preg_replace('/[^A-Za-z0-9_-]/', '', (string) ($in['game'] ?? ''));
  if ($game === '' || adminOnlyGameDenied($db, $map_prefix, $game)) { $fail('Unknown game.'); return; }
  $containerId = (int) $db->fetchOne("SELECT id FROM `{$map_prefix}container` WHERE (id = ? OR short_name = ?) AND enabled = 1", [$game, $game]);
  if (!$containerId) { $fail('Unknown game.'); return; }

  $read = pathRead($db, $map_prefix, $containerId, $in);
  if (is_string($read)) { $fail($read); return; }
  [$fields, $rows] = $read;
  $summary = trim((string) ($in['summary'] ?? ''));
  if (mb_strlen($summary) > 255 || preg_match('/[<>]/', $summary)) { $fail('Keep the summary under 255 characters, without < or >.'); return; }

  // Who sees it and when: official (on the map for everyone, editors only),
  // or a user's own, private, unlisted or public. Drafts wait to be published.
  $scope = ($in['scope'] ?? '') === 'official' ? 'official' : 'user';
  if ($scope === 'official' && $level < PATH_EDITOR_LEVEL) { $fail('Only editors can make paths for everyone.'); return; }
  $visibility = in_array($in['visibility'] ?? '', ['private', 'unlisted', 'public'], true) ? $in['visibility'] : 'private';
  if ($scope === 'official') $visibility = 'public';
  $editAccess = ($in['editAccess'] ?? '') === 'editors' ? 'editors' : 'owner';
  $publish = in_array($in['publish'] ?? '', ['draft', 'now', 'schedule'], true) ? $in['publish'] : 'draft';
  $publishAt = null;
  if ($publish === 'schedule') {
    $publishAt = (int) ($in['publishAt'] ?? 0);
    if ($publishAt <= time()) $publish = 'now';
    elseif ($publishAt > time() + 366 * 86400) { $fail('Schedule it within a year.'); return; }
  }

  // Times as the database keeps them (its clock decides what's published).
  $publishTime = $publish === 'draft' ? null : $db->fetchOne($publishAt ? "SELECT FROM_UNIXTIME(?)" : "SELECT NOW()", $publishAt ? [$publishAt] : []);

  $id = (int) ($in['id'] ?? 0);
  $db->beginTransaction();
  try {
    if ($id) {
      $old = $db->fetchAssociative("SELECT * FROM `{$map_prefix}path` WHERE id = ? AND container_id = ? FOR UPDATE", [$id, $containerId]);
      if (!$old || !pathCanEdit($old, $userId, $level)) { $db->rollBack(); $fail('You can\'t change this path.'); return; }
      $before = pathSnapshot($db, $map_prefix, $id);
      $slug = $old['slug'];
      // Someone its owner lets edit it changes the path itself, not who
      // sees or edits it, or when it's published.
      if (pathCanManage($old, $userId, $level)) {
        $fields += array('scope' => $scope, 'visibility' => $visibility, 'edit_access' => $editAccess);
        // Publishing now keeps an already-published path's date.
        $published = (bool) $db->fetchOne("SELECT " . pathPublishedSql() . " FROM `{$map_prefix}path` p WHERE id = ?", [$id]);
        if ($publish !== 'now' || !$published) $fields['published_at'] = $publishTime;
      }
      pathWrite($db, $map_prefix, $id, $fields, $rows);
      $action = 'edit';
    } else {
      $before = null;
      $slug = pathSlug($db, $map_prefix, $containerId, $fields['name']);
      $db->executeStatement("INSERT INTO `{$map_prefix}path` (container_id, user_id, scope, visibility, edit_access, published_at, name, slug) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [$containerId, $userId, $scope, $visibility, $editAccess, $publishTime, $fields['name'], $slug]);
      $id = (int) $db->lastInsertId();
      pathWrite($db, $map_prefix, $id, $fields, $rows);
      $action = 'create';
    }
    $revision = pathRecordRevision($db, $map_prefix, $id, $userId, $action, $summary, $before);
    $db->commit();
  } catch (Throwable $ex) {
    $db->rollBack();
    throw $ex;
  }
  if ($action === 'edit' && $revision) pathNotifyOwner($db, $map_prefix, array_merge($old, array('name' => $fields['name'])), $userId, 'edit',
    $db->fetchOne("SELECT summary FROM `{$map_prefix}path_revision` WHERE id = ?", [$revision]));
  echo json_encode(array('success' => true, 'id' => $id, 'slug' => $slug));
?>
