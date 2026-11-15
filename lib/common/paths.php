<?php
  // Paths (ajax/save_path.php, ajax/delete_path.php): who may change one.
  // Anyone signed in makes and changes their own paths; official paths (on
  // the map for everyone) are for editors, as markers are.
  include_once(__DIR__ . '/account_status.php');

  const PATH_EDITOR_LEVEL = 5;
  // How far paths are released, one step at a time:
  //  * 'staff': only staff (moderators and up) see or make any, while
  //    they're built.
  //  * 'readonly': a soft launch. Everyone, signed in or not, sees and uses
  //    the official paths (on the map, their pages, the guide, completing
  //    steps, bookmarking, their History and Talk, embeds); only staff make,
  //    edit, restore or delete paths. Users' own paths stay staff-only.
  //  * 'open': everyone also makes their own (Community Paths, profiles).
  // The page is told which (index.php window.zmapPathsStage, Paths.js).
  const PATHS_STAGE = 'readonly';
  const PATHS_ADMIN_LEVEL = 10;
  // How much can be written about a pin (its page, ajax/save_path_pin.php).
  const PATH_PIN_CONTENT_MAX = 5000;

  // Whether this account (level 0: signed out) sees and uses paths at all.
  function pathsVisible($level) {
    return PATHS_STAGE !== 'staff' || (int) $level >= PATHS_ADMIN_LEVEL;
  }

  // Whether it makes and changes paths, and sees users' own (theirs and
  // others'): Community Paths, profiles, Yeahs on paths.
  function pathsAllowed($level) {
    return PATHS_STAGE === 'open' || (int) $level >= PATHS_ADMIN_LEVEL;
  }

  // [userId, level] for the signed-in account, or null.
  function pathAccount($db, $prefix) {
    start_session('zmap');
    $userId = (int) ($_SESSION['user_id'] ?? 0);
    session_write_close();
    if (!$userId) return null;
    $role = accountRole($db, $prefix, $userId);
    return $role ? [$userId, $role[0]] : null;
  }

  // Changing its name, steps and look: its owner, admins, and, if its owner
  // lets them (edit_access 'editors'), anyone who can edit markers.
  function pathCanEdit($path, $userId, $level) {
    if (pathCanManage($path, $userId, $level)) return true;
    return ($path['edit_access'] ?? 'owner') === 'editors' && $level >= PATH_EDITOR_LEVEL;
  }

  // Changing who sees it and who can edit it, and deleting it: its owner and admins.
  function pathCanManage($path, $userId, $level) {
    return (int) $path['user_id'] === (int) $userId || $level >= PATHS_ADMIN_LEVEL;
  }

  // Who sees a path, past its owner (and admins, for official drafts): it's
  // published (published_at set and come; a later time publishes it then),
  // and official, unlisted (anyone with its link) or public (on its owner's
  // profile and Community Paths too). Private ones are only ever its owner's.
  function pathPublishedSql($a = 'p') {
    return "($a.published_at IS NOT NULL AND $a.published_at <= NOW())";
  }
  function pathOpenSql($a = 'p') {
    return "(" . pathPublishedSql($a) . " AND ($a.scope = 'official' OR $a.visibility IN ('unlisted', 'public')))";
  }
  function pathListedSql($a = 'p') {
    return "(" . pathPublishedSql($a) . " AND $a.scope = 'user' AND $a.visibility = 'public')";
  }

  // A path this account may see (its own, an admin's view of an official
  // draft, or anyone's open one), or false.
  // (Before users' own paths are open, only official ones: pathsAllowed.)
  function pathVisibleTo($db, $prefix, $id, $userId, $level) {
    if (!pathsVisible($level)) return false;
    return $db->fetchAssociative("SELECT p.* FROM `{$prefix}path` p WHERE p.id = ? AND p.visible = 1
      AND (p.user_id = ? OR " . pathOpenSql() . " OR (p.scope = 'official' AND ? >= " . PATHS_ADMIN_LEVEL . "))
      AND (p.scope = 'official' OR ?)", [(int) $id, (int) $userId, (int) $level, pathsAllowed($level) ? 1 : 0]);
  }

  // Which paths' edits show in activity feeds (community_changes.php): all
  // open ones for those who make paths, the official ones for everyone else
  // once paths are out, none before.
  function pathsInFeeds($level) {
    return pathsAllowed($level) ? true : (pathsVisible($level) ? 'official' : false);
  }

  // A path's Talk page and its revisions' Yeahs: for those who may see the
  // path (pathVisibleTo). $viewer: ['id', 'level'].
  function pathReadableBy($db, $prefix, $pathId, $viewer) {
    return pathVisibleTo($db, $prefix, $pathId, (int) ($viewer['id'] ?? 0), (int) ($viewer['level'] ?? 0));
  }

  // A path from what its editor sends (and from a revision, to restore it):
  // [fields, steps] for pathWrite, or an error message.
  // $keep: markers that may be steps though they've been removed from the
  // map (deleted): those a user's path already had (it keeps them, del_marker
  // removes them from official ones). No one can add one anew.
  function pathRead($db, $prefix, $containerId, $in, $keep = array()) {
    $name = trim((string) ($in['name'] ?? ''));
    if ($name === '' || mb_strlen($name) > 120 || preg_match('/[<>]/', $name)) return 'Give the path a name of up to 120 characters, without < or >.';
    $description = trim((string) ($in['description'] ?? ''));
    if (mb_strlen($description) > 2000) return 'Keep the description under 2,000 characters.';
    $color = preg_match('/^#[0-9a-fA-F]{6}$/', (string) ($in['color'] ?? '')) ? strtolower($in['color']) : null;
    $categoryId = (int) ($in['categoryId'] ?? 0) ?: null;
    if ($categoryId && !$db->fetchOne("SELECT 1 FROM `{$prefix}marker_category` WHERE id = ? AND container_id = ?", [$categoryId, $containerId])) {
      return 'That category is not in this game.';
    }
    $fields = array(
      'name' => $name, 'description' => $description === '' ? null : $description,
      'kind' => ($in['kind'] ?? '') === 'single' ? 'single' : 'guide',
      'loops' => !empty($in['loops']) ? 1 : 0, 'numbered' => !empty($in['numbered']) ? 1 : 0, 'smooth' => !empty($in['smooth']) ? 1 : 0,
      // (Unset, as before it was a choice: always.)
      'always_show' => array_key_exists('alwaysShow', $in) && empty($in['alwaysShow']) ? 0 : 1,
      'category_id' => $categoryId, 'color' => $color
    );

    // Steps: the game's own markers, or points on its maps, each with a note.
    $steps = is_array($in['steps'] ?? null) ? array_values($in['steps']) : array();
    if (count($steps) < 2) return 'A path needs at least two steps.';
    if (count($steps) > 300) return 'A path can have up to 300 steps.';
    $markerIds = array(); $submapIds = array();
    foreach ($steps as $step) {
      if (!empty($step['markerId'])) $markerIds[] = (int) $step['markerId'];
      else $submapIds[] = (int) ($step['submapId'] ?? 0);
    }
    $known = function($sql, $ids) use ($db, $containerId) {
      $ids = array_values(array_unique($ids));
      if (!$ids) return array();
      return array_flip(array_map('intval', $db->fetchFirstColumn(sprintf($sql, implode(',', array_fill(0, count($ids), '?'))), array_merge($ids, [$containerId]))));
    };
    $keep = array_values(array_filter(array_map('intval', $keep)));
    $okMarkers = $known("SELECT m.id FROM `{$prefix}marker` m JOIN `{$prefix}submap` s ON s.id = m.submap_id JOIN `{$prefix}map` p ON p.id = s.map_id WHERE m.id IN (%s) AND (m.visible = 1" .
      ($keep ? " OR m.id IN (" . implode(',', $keep) . ")" : '') . ") AND p.container_id = ?", $markerIds);
    $okSubmaps = $known("SELECT s.id FROM `{$prefix}submap` s JOIN `{$prefix}map` p ON p.id = s.map_id WHERE s.id IN (%s) AND p.container_id = ?", $submapIds);
    $rows = array(); $pinKeys = array();
    foreach ($steps as $i => $step) {
      $note = trim((string) ($step['note'] ?? ''));
      if (mb_strlen($note) > 500) return 'Step ' . ($i + 1) . '’s note is over 500 characters.';
      $note = $note === '' ? null : $note;
      if (!empty($step['markerId'])) {
        if (!isset($okMarkers[(int) $step['markerId']])) return 'Step ' . ($i + 1) . ' is not a marker in this game (it may have been deleted).';
        $rows[] = [(int) $step['markerId'], null, null, null, null, $note, 1, null, null];
      } else {
        $x = $step['x'] ?? null; $y = $step['y'] ?? null; $pin = trim((string) ($step['name'] ?? ''));
        if (!isset($okSubmaps[(int) ($step['submapId'] ?? 0)]) || !is_numeric($x) || !is_numeric($y)) return 'Step ' . ($i + 1) . ' is not on this game’s maps.';
        if (mb_strlen($pin) > 120 || preg_match('/[<>]/', $pin)) return 'Step ' . ($i + 1) . '’s name is too long or has < or >.';
        $shown = isset($step['shown']) && (empty($step['shown']) || $step['shown'] === '0') ? 0 : 1;
        // A pin keeps its key (its completions, ajax/toggle_path_pin.php)
        // and what's written about it (ajax/save_path_pin.php); a new one
        // gets a key.
        $key = (string) ($step['pinKey'] ?? '');
        if (!preg_match('/^[a-z0-9]{6,16}$/', $key) || isset($pinKeys[$key])) $key = bin2hex(random_bytes(5));
        $pinKeys[$key] = true;
        $content = trim((string) ($step['content'] ?? ''));
        if (mb_strlen($content) > PATH_PIN_CONTENT_MAX) return 'Step ' . ($i + 1) . '’s description is over ' . number_format(PATH_PIN_CONTENT_MAX) . ' characters.';
        $rows[] = [null, (int) $step['submapId'], (float) $x, (float) $y, $pin === '' ? null : $pin, $note, $shown, $key, $content === '' ? null : $content];
      }
    }
    return [$fields, $rows];
  }

  // Writes a path's fields (any of them) and, given them, its steps.
  function pathWrite($db, $prefix, $id, $fields, $rows = null) {
    if ($fields) {
      $sets = implode(', ', array_map(function($k) { return "`$k` = ?"; }, array_keys($fields)));
      $db->executeStatement("UPDATE `{$prefix}path` SET $sets, updated = NOW() WHERE id = ?", array_merge(array_values($fields), [$id]));
    }
    if ($rows === null) return;
    $db->executeStatement("DELETE FROM `{$prefix}path_step` WHERE path_id = ?", [$id]);
    foreach ($rows as $i => $row) {
      $db->executeStatement("INSERT INTO `{$prefix}path_step` (path_id, step_order, marker_id, submap_id, x, y, name, note, shown, pin_key, content) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        array_merge([$id, $i + 1], $row));
    }
  }

  // A path as it stands, for its history: what an editor sends, so a
  // revision can be read back in by pathRead to restore it.
  function pathSnapshot($db, $prefix, $id) {
    $p = $db->fetchAssociative("SELECT p.*, " . pathPublishedSql() . " AS live FROM `{$prefix}path` p WHERE p.id = ?", [$id]);
    $steps = $db->fetchAllAssociative("SELECT marker_id, submap_id, x, y, name, note, shown, pin_key, content FROM `{$prefix}path_step` WHERE path_id = ? ORDER BY step_order", [$id]);
    return array(
      'name' => $p['name'], 'description' => (string) $p['description'], 'kind' => $p['kind'],
      'loops' => (bool) $p['loops'], 'numbered' => (bool) $p['numbered'], 'smooth' => (bool) ($p['smooth'] ?? false), 'alwaysShow' => (bool) ($p['always_show'] ?? true), 'categoryId' => $p['category_id'] ? (int) $p['category_id'] : null,
      'color' => $p['color'], 'scope' => $p['scope'], 'visibility' => $p['visibility'], 'editAccess' => $p['edit_access'],
      'publishedAt' => $p['published_at'], 'published' => (bool) $p['live'],
      'steps' => array_map(function($s) {
        $step = $s['marker_id'] ? array('markerId' => (int) $s['marker_id']) :
          array('submapId' => (int) $s['submap_id'], 'x' => (float) $s['x'], 'y' => (float) $s['y'], 'name' => (string) $s['name'], 'shown' => (bool) $s['shown'], 'pinKey' => (string) $s['pin_key']);
        if ($s['note'] !== null && $s['note'] !== '') $step['note'] = $s['note'];
        if (!$s['marker_id'] && $s['content'] !== null && $s['content'] !== '') $step['content'] = $s['content'];
        return $step;
      }, $steps)
    );
  }

  // What changed between two snapshots, for a revision with no summary.
  function pathChangeSummary($before, $after) {
    if (!$before) return 'Created the path';
    $parts = array();
    if ($before['name'] !== $after['name']) $parts[] = 'renamed it';
    if ($before['description'] !== $after['description']) $parts[] = 'the description';
    if (json_encode($before['steps']) !== json_encode($after['steps'])) {
      $b = count($before['steps']); $a = count($after['steps']);
      $parts[] = $a > $b ? 'added ' . ($a - $b) . ' step' . ($a - $b === 1 ? '' : 's') : ($a < $b ? 'removed ' . ($b - $a) . ' step' . ($b - $a === 1 ? '' : 's') : 'the steps');
    }
    foreach (['kind' => 'checks', 'loops' => 'looping', 'numbered' => 'numbering', 'smooth' => 'smoothing', 'alwaysShow' => 'showing', 'color' => 'color', 'categoryId' => 'category'] as $key => $label) {
      if (($before[$key] ?? null) !== ($after[$key] ?? null)) { $parts[] = 'the look'; break; }
    }
    if (($before['visibility'] ?? '') !== ($after['visibility'] ?? '') || $before['scope'] !== $after['scope']) $parts[] = 'who sees it';
    if (($before['editAccess'] ?? '') !== ($after['editAccess'] ?? '')) $parts[] = 'who can edit it';
    if (($before['publishedAt'] ?? null) !== ($after['publishedAt'] ?? null) && !(($before['published'] ?? false) && $after['published'])) {
      $parts[] = $after['publishedAt'] === null ? 'made it a draft' : ($after['published'] ? 'published it' : 'scheduled it');
    }
    if (!$parts) return 'No changes';
    $text = implode(', ', $parts);
    return mb_strtoupper(mb_substr($text, 0, 1)) . mb_substr($text, 1);
  }

  // Keeps the path as it now stands in its history (0 when a save changed
  // nothing and says nothing).
  function pathRecordRevision($db, $prefix, $id, $userId, $action, $summary, $before) {
    $after = pathSnapshot($db, $prefix, $id);
    $summary = trim((string) $summary);
    if ($before && $summary === '' && $action === 'edit' && json_encode($before) === json_encode($after)) return 0;
    if ($summary === '') $summary = pathChangeSummary($before, $after);
    $db->executeStatement("INSERT INTO `{$prefix}path_revision` (path_id, user_id, action, summary, snapshot) VALUES (?, ?, ?, ?, ?)",
      [$id, $userId, $action, mb_substr($summary, 0, 255), json_encode($after)]);
    return (int) $db->lastInsertId();
  }

  // Tells a path's owner someone else changed, restored or deleted it.
  function pathNotifyOwner($db, $prefix, $path, $actorId, $action, $summary = '') {
    if ((int) $path['user_id'] === (int) $actorId) return;
    include_once(__DIR__ . '/notifications.php');
    $game = $db->fetchOne("SELECT short_name FROM `{$prefix}container` WHERE id = ?", [$path['container_id']]);
    $actor = $db->fetchOne("SELECT username FROM `{$prefix}user` WHERE id = ?", [$actorId]);
    $data = array('actor' => $actor, 'pathTitle' => $path['name'], 'action' => $action, 'excerpt' => notificationExcerpt($summary));
    $data['link'] = $action === 'delete' ? array('page' => 'notifications') : array('game' => $game, 'path' => $path['slug']);
    notificationDeliver($db, $prefix, $actorId, [(int) $path['user_id'] => ['path_edit']], array(), $data);
  }

  // Each path's checks, for how many start and finish it: its steps'
  // markers, as a table (path_id, marker_id). Not a path that's one check
  // (kind 'single': a Korok pair, a dragon's flight): it shows no such
  // figures, and counting them meant every completion of hundreds of Korok
  // paths' markers on each load of a game's paths (TotK's took seconds).
  // (Not a marker removed from the map: a user's path keeps it, but it can't
  // be completed.)
  function pathChecksSql($prefix) {
    return "SELECT s.path_id, s.marker_id FROM `{$prefix}path_step` s JOIN `{$prefix}path` cp ON cp.id = s.path_id
      JOIN `{$prefix}marker` cm ON cm.id = s.marker_id AND cm.visible = 1
      WHERE s.marker_id IS NOT NULL AND cp.kind <> 'single'
      GROUP BY s.path_id, s.marker_id";
  }

  // Each path's pins that are checks (shown pins, on a path that isn't one
  // check), as a table (path_id, pin_key).
  function pathPinChecksSql($prefix) {
    return "SELECT s.path_id, s.pin_key FROM `{$prefix}path_step` s JOIN `{$prefix}path` pp ON pp.id = s.path_id
      WHERE s.marker_id IS NULL AND s.shown = 1 AND s.pin_key IS NOT NULL AND pp.kind <> 'single'
      GROUP BY s.path_id, s.pin_key";
  }

  // Whether pins can be checks yet (the path_pins migration).
  function pathHasPins($db, $prefix) {
    static $has = array();
    if (!isset($has[$prefix])) $has[$prefix] = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}path_pin_complete'");
    return $has[$prefix];
  }

  // How many checks each path has, its markers' and its pins': a table
  // (path_id, total). $in: "IN (…)" of path ids, or '' for every path.
  function pathTotalsSql($db, $prefix, $in = '') {
    $where = $in === '' ? '' : " WHERE x.path_id $in";
    $checks = "SELECT path_id FROM (" . pathChecksSql($prefix) . ") mc" .
      (pathHasPins($db, $prefix) ? " UNION ALL SELECT path_id FROM (" . pathPinChecksSql($prefix) . ") pc" : '');
    return "SELECT x.path_id, COUNT(*) AS total FROM ($checks) x$where GROUP BY x.path_id";
  }

  // How many of each path's checks each person has done: a table (path_id,
  // user_id, done).
  function pathDoneSql($db, $prefix, $in = '') {
    $where = $in === '' ? '' : " WHERE d.path_id $in";
    $done = "SELECT ch.path_id, c.user_id FROM (" . pathChecksSql($prefix) . ") ch JOIN `{$prefix}user_completed_marker` c ON c.marker_id = ch.marker_id" .
      (pathHasPins($db, $prefix) ? " UNION ALL SELECT pc.path_id, pc.user_id FROM `{$prefix}path_pin_complete` pc
        JOIN (" . pathPinChecksSql($prefix) . ") pk ON pk.path_id = pc.path_id AND pk.pin_key = pc.pin_key" : '');
    return "SELECT d.path_id, d.user_id, COUNT(*) AS done FROM ($done) d$where GROUP BY d.path_id, d.user_id";
  }

  // How many people have started each path (completed at least one of its
  // checks) and finished it (all of them): [id => [started, finished]].
  function pathCompletionStats($db, $prefix, $ids) {
    $ids = array_values(array_filter(array_map('intval', $ids)));
    $stats = array_fill_keys($ids, [0, 0]);
    if (!$ids) return $stats;
    $in = 'IN (' . implode(',', $ids) . ')';
    $rows = $db->fetchAllAssociative("
      SELECT t.path_id, COUNT(*) AS started, SUM(t.done = k.total) AS finished
        FROM (" . pathDoneSql($db, $prefix, $in) . ") t
        JOIN (" . pathTotalsSql($db, $prefix, $in) . ") k ON k.path_id = t.path_id
       GROUP BY t.path_id");
    foreach ($rows as $row) $stats[(int) $row['path_id']] = [(int) $row['started'], (int) $row['finished']];
    // A user's path counts only those who started it there (path_start):
    // finishing is all its checks done, by someone who started it.
    $userIds = array_map('intval', $db->fetchFirstColumn("SELECT id FROM `{$prefix}path` WHERE scope = 'user' AND id $in"));
    if ($userIds) {
      foreach ($userIds as $id) $stats[$id] = [0, 0];
      if ($db->fetchOne("SHOW TABLES LIKE '{$prefix}path_start'")) {
        foreach (pathTrackedStats($db, $prefix, $userIds) as $id => $tracked) $stats[$id] = $tracked;
      }
    }
    return $stats;
  }

  // Started and finished from path_start (users' paths), as SQL: a table
  // (path_id, started, finished).
  function pathTrackedSql($db, $prefix, $in = '') {
    return "SELECT st.path_id, COUNT(*) AS started, SUM(k.total IS NOT NULL AND COALESCE(d.done, 0) = k.total) AS finished
        FROM `{$prefix}path_start` st
        LEFT JOIN (" . pathTotalsSql($db, $prefix, $in) . ") k ON k.path_id = st.path_id
        LEFT JOIN (" . pathDoneSql($db, $prefix, $in) . ") d ON d.path_id = st.path_id AND d.user_id = st.user_id" .
      ($in === '' ? '' : " WHERE st.path_id $in") . "
       GROUP BY st.path_id";
  }

  // [id => [started, finished]] from path_start, for users' paths.
  function pathTrackedStats($db, $prefix, $ids) {
    $ids = array_values(array_filter(array_map('intval', $ids)));
    if (!$ids) return array();
    $result = array();
    foreach ($db->fetchAllAssociative(pathTrackedSql($db, $prefix, 'IN (' . implode(',', $ids) . ')')) as $row) {
      $result[(int) $row['path_id']] = [(int) $row['started'], (int) $row['finished']];
    }
    return $result;
  }

  // What a path card's thumbnail needs (PathEditor.js _pathThumbHTML): the
  // path's line on the map its first step is on ([lat, lng] points, hidden
  // waypoints too), and that map's artwork: its tiles and its projection,
  // as get_container and get_map give them. [id => thumb or null].
  function pathThumbs($db, $prefix, $ids) {
    include_once(__DIR__ . '/tile_delivery.php');
    $ids = array_values(array_filter(array_map('intval', $ids)));
    $thumbs = array_fill_keys($ids, null);
    if (!$ids) return $thumbs;
    $steps = $db->fetchAllAssociative("
      SELECT s.path_id, COALESCE(m.submap_id, s.submap_id) AS submap, COALESCE(m.x, s.x) AS x, COALESCE(m.y, s.y) AS y
        FROM `{$prefix}path_step` s LEFT JOIN `{$prefix}marker` m ON m.id = s.marker_id
       WHERE s.path_id IN (" . implode(',', $ids) . ") ORDER BY s.path_id, s.step_order");
    $lines = array();
    foreach ($steps as $step) {
      $id = (int) $step['path_id'];
      if ($step['submap'] === null || $step['x'] === null) continue;
      if (!isset($lines[$id])) $lines[$id] = array('submap' => (int) $step['submap'], 'points' => array());
      if ((int) $step['submap'] === $lines[$id]['submap']) $lines[$id]['points'][] = [round((float) $step['y'], 3), round((float) $step['x'], 3)];
    }
    if (!$lines) return $thumbs;
    $submapIds = array_values(array_unique(array_column($lines, 'submap')));
    $maps = array();
    foreach ($db->fetchAllAssociative("
      SELECT sm.id, sm.tile_url AS tileURL, sm.tile_ext AS tileExt, sm.tile_version AS tileVersion,
             COALESCE(mp.max_zoom, c.max_zoom) AS maxZoom, c.tile_size AS tileSize,
             c.scaleP, c.scaleN, c.offsetX, c.offsetY, c.background_color AS bgColor
        FROM `{$prefix}submap` sm JOIN `{$prefix}map` mp ON mp.id = sm.map_id JOIN `{$prefix}container` c ON c.id = mp.container_id
       WHERE sm.id IN (" . implode(',', $submapIds) . ")") as $row) {
      $base = bundledMapTileBaseURL($row['tileURL']);
      if ($base === null && PHP_SAPI === 'cli-server' && is_dir(dirname(__DIR__, 2) . '/tiles/' . $row['tileURL'])) $base = '/tiles/';
      $maps[(int) $row['id']] = array(
        'tileBaseURL' => $base, 'tileURL' => $row['tileURL'], 'tileExt' => $row['tileExt'], 'tileVersion' => $row['tileVersion'],
        'maxZoom' => (int) $row['maxZoom'], 'tileSize' => (int) $row['tileSize'] ?: 256,
        'scaleP' => (float) $row['scaleP'], 'scaleN' => (float) $row['scaleN'],
        'offsetX' => (float) $row['offsetX'], 'offsetY' => (float) $row['offsetY'], 'bgColor' => $row['bgColor']
      );
    }
    foreach ($lines as $id => $line) {
      if (isset($maps[$line['submap']])) $thumbs[$id] = $maps[$line['submap']] + array('points' => $line['points']);
    }
    return $thumbs;
  }

  // A marker removed from the map (ajax/del_marker.php) leaves the official
  // paths it was a step of, each change kept in that path's history. Users'
  // own paths keep it: they built them on purpose (get_paths sends a copy of
  // it). Returns the paths it left.
  function pathRemoveDeletedMarker($db, $prefix, $markerId, $userId) {
    if (!$db->fetchOne("SHOW TABLES LIKE '{$prefix}path'")) return array();
    $paths = $db->fetchAllAssociative("SELECT DISTINCT p.id, p.name FROM `{$prefix}path` p JOIN `{$prefix}path_step` s ON s.path_id = p.id
      WHERE s.marker_id = ? AND p.scope = 'official'", [(int) $markerId]);
    if (!$paths) return array();
    $name = html_entity_decode((string) $db->fetchOne("SELECT name FROM `{$prefix}marker` WHERE id = ?", [(int) $markerId]), ENT_QUOTES, 'UTF-8');
    foreach ($paths as $path) {
      $id = (int) $path['id'];
      $before = pathSnapshot($db, $prefix, $id);
      $db->executeStatement("DELETE FROM `{$prefix}path_step` WHERE path_id = ? AND marker_id = ?", [$id, (int) $markerId]);
      foreach ($db->fetchFirstColumn("SELECT id FROM `{$prefix}path_step` WHERE path_id = ? ORDER BY step_order, id", [$id]) as $i => $stepId) {
        $db->executeStatement("UPDATE `{$prefix}path_step` SET step_order = ? WHERE id = ?", [$i + 1, (int) $stepId]);
      }
      $db->executeStatement("UPDATE `{$prefix}path` SET updated = NOW() WHERE id = ?", [$id]);
      pathRecordRevision($db, $prefix, $id, $userId, 'edit',
        'Removed “' . mb_substr($name !== '' ? $name : 'a marker', 0, 160) . '”: it was deleted from the map', $before);
    }
    return array_column($paths, 'name');
  }

  // A URL name from a path's name, unique in its game.
  function pathSlug($db, $prefix, $containerId, $name, $exceptId = 0) {
    $base = trim(preg_replace('/[^a-z0-9]+/', '-', strtolower(iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $name) ?: $name)), '-');
    if ($base === '') $base = 'path';
    $base = substr($base, 0, 120);
    $slug = $base;
    for ($n = 2; $db->fetchOne("SELECT 1 FROM `{$prefix}path` WHERE container_id = ? AND slug = ? AND id <> ?", [$containerId, $slug, $exceptId]); $n++) {
      $slug = $base . '-' . $n;
    }
    return $slug;
  }
?>
