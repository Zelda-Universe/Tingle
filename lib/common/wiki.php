<?php
  // Community editing, wiki-style: marker revisions (History), Talk pages
  // and profiles. For now only editors (Contributors and Admins, level 5+)
  // can see any of it. Tables from the create_wiki migration.

  include_once(__DIR__ . '/account_status.php');

  const WIKI_EDITOR_LEVEL = 5;
  const WIKI_ADMIN_LEVEL = 10;

  // The signed-in editor as [id, level, username], or null after answering
  // 403. Checks the database, not the session's level from sign-in.
  function wikiRequireEditor($db, $prefix) {
    start_session('zmap');
    $userId = (int) ($_SESSION['user_id'] ?? 0);
    session_write_close();
    $editor = $userId ? $db->fetchAssociative(
      "SELECT `id`, `level`, `username` FROM `{$prefix}user` WHERE `id` = ? AND " . accountUsableSql($db, $prefix),
      [$userId]
    ) : false;
    if (!$editor || (int) $editor['level'] < WIKI_EDITOR_LEVEL) {
      http_response_code(403);
      echo json_encode(array('success' => false, 'msg' => 'Editors only.'));
      return null;
    }
    $editor['id'] = (int) $editor['id'];
    $editor['level'] = (int) $editor['level'];
    return $editor;
  }

  function wikiAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) {
      $available = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}marker_revision'")
        && (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}talk_comment'");
    }
    return $available;
  }

  // The same rule as add_marker.php and del_marker.php: admins may change
  // any marker, other editors only their own.
  function wikiCanEditMarker($editor, $ownerId) {
    return $editor['level'] >= WIKI_ADMIN_LEVEL ||
      ($editor['level'] >= WIKI_EDITOR_LEVEL && (int) $ownerId === $editor['id']);
  }

  function wikiDecode($text) {
    return html_entity_decode((string) $text, ENT_QUOTES, 'UTF-8');
  }

  // A marker as it stands: the fields an edit can change and its visible
  // tabs, decoded as they're displayed.
  function wikiMarkerSnapshot($db, $prefix, $markerId) {
    $marker = $db->fetchAssociative("
      SELECT `user_id`, `submap_id`, `marker_category_id`, `name`, `description`,
             `x`, `y`, `z`, `global`, `visible`
        FROM `{$prefix}marker` WHERE `id` = ?
    ", [(int) $markerId]);
    if (!$marker) return null;
    $tabs = $db->fetchFirstColumn("
      SELECT `tab_text` FROM `{$prefix}marker_tab`
       WHERE `marker_id` = ? AND `visible` = 1
       ORDER BY `tab_order`, `marker_tab_id`
    ", [(int) $markerId]);
    return array(
      'title'       => wikiDecode($marker['name']),
      'description' => wikiDecode($marker['description']),
      'categoryId'  => (int) $marker['marker_category_id'],
      'submapId'    => (int) $marker['submap_id'],
      'x'           => (float) $marker['x'],
      'y'           => (float) $marker['y'],
      'z'           => $marker['z'] === null ? null : (float) $marker['z'],
      'global'      => (int) $marker['global'],
      'visible'     => (int) $marker['visible'],
      'tabs'        => array_map('wikiDecode', $tabs)
    );
  }

  function wikiRecordRevision($db, $prefix, $markerId, $userId, $action, $summary = null, $revertsId = null, $created = null) {
    if (!wikiAvailable($db, $prefix)) return null;
    $snapshot = wikiMarkerSnapshot($db, $prefix, $markerId);
    if (!$snapshot) return null;
    $summary = $summary === null ? null : mb_substr(trim((string) $summary), 0, 255);
    $db->executeStatement("
      INSERT INTO `{$prefix}marker_revision`
        (`marker_id`, `user_id`, `action`, `summary`, `reverts_revision_id`, `data`, `created`)
      VALUES (?, ?, ?, ?, ?, ?, " . ($created === null ? 'NOW()' : '?') . ")
    ", array_merge(
      [(int) $markerId, (int) $userId, $action, $summary === '' ? null : $summary, $revertsId, json_encode($snapshot)],
      $created === null ? [] : [$created]
    ));
    return (int) $db->lastInsertId();
  }

  // Markers from before history was kept get their current version saved,
  // credited to whoever added them, before their first change, so there's
  // always a version to go back to.
  function wikiEnsureBaseline($db, $prefix, $markerId) {
    if (!wikiAvailable($db, $prefix)) return;
    if ($db->fetchOne("SELECT 1 FROM `{$prefix}marker_revision` WHERE `marker_id` = ? LIMIT 1", [(int) $markerId])) return;
    $marker = $db->fetchAssociative(
      "SELECT `user_id`, COALESCE(`last_updated`, NOW()) AS `updated` FROM `{$prefix}marker` WHERE `id` = ?",
      [(int) $markerId]
    );
    if ($marker) wikiRecordRevision($db, $prefix, $markerId, $marker['user_id'], 'import', null, null, $marker['updated']);
  }

  // Puts a marker back as a snapshot had it (a revert), encoding text the way
  // add_marker.php stores it.
  function wikiApplySnapshot($db, $prefix, $markerId, $snapshot, $userId) {
    $encode = function($text) { return htmlentities((string) $text, ENT_QUOTES, 'UTF-8'); };
    $db->executeStatement("
      UPDATE `{$prefix}marker`
         SET `submap_id` = ?, `marker_category_id` = ?, `name` = ?, `description` = ?,
             `x` = ?, `y` = ?, `z` = ?, `global` = ?, `visible` = ?, `last_updated` = NOW()
       WHERE `id` = ?
    ", [
      (int) $snapshot['submapId'], (int) $snapshot['categoryId'], $encode($snapshot['title']),
      $encode($snapshot['description']), (float) $snapshot['x'], (float) $snapshot['y'],
      $snapshot['z'] === null ? null : (float) $snapshot['z'], (int) $snapshot['global'],
      (int) $snapshot['visible'], (int) $markerId
    ]);
    $db->executeStatement(
      "UPDATE `{$prefix}marker_tab` SET `visible` = 0 WHERE `marker_id` = ? AND `visible` = 1",
      [(int) $markerId]
    );
    foreach ($snapshot['tabs'] as $text) {
      if ($text === '') continue;
      $db->executeStatement("
        INSERT INTO `{$prefix}marker_tab`
          (`marker_id`, `marker_tab_status_id`, `user_id`, `tab_title`, `tab_text`, `tab_order`, `visible`)
        VALUES (?, 1, ?, '', ?, 1, 1)
      ", [(int) $markerId, (int) $userId, $encode($text)]);
    }
  }

  // Seconds since a database time, from the database's clock.
  function wikiAgoSql($column) {
    return "TIMESTAMPDIFF(SECOND, {$column}, NOW())";
  }

  // Each marker's game, for links from lists that span games.
  function wikiMarkerGamesSql($prefix, $markerColumn) {
    return "(SELECT `c`.`short_name` FROM `{$prefix}marker` `gm`
               JOIN `{$prefix}submap` `gs` ON `gs`.`id` = `gm`.`submap_id`
               JOIN `{$prefix}map` `gmap` ON `gmap`.`id` = `gs`.`map_id`
               JOIN `{$prefix}container` `c` ON `c`.`id` = `gmap`.`container_id`
              WHERE `gm`.`id` = {$markerColumn})";
  }

  // PHP's memory_limit in bytes; 0 when unlimited.
  function wikiMemoryLimitBytes() {
    $limit = trim((string) ini_get('memory_limit'));
    if ($limit === '' || $limit === '-1') return 0;
    $unit = strtolower(substr($limit, -1));
    $value = (int) $limit;
    if ($unit === 'g') return $value * 1024 * 1024 * 1024;
    if ($unit === 'm') return $value * 1024 * 1024;
    if ($unit === 'k') return $value * 1024;
    return $value;
  }

  // Saves an uploaded image re-encoded as WebP, so nothing but pixels from
  // the client reaches the server. 'cover' crops to exactly $width x $height;
  // 'fit' only shrinks to fit within them. Returns [path] or [null, message].
  function wikiSaveImage($upload, $folder, $owner, $width, $height, $mode) {
    if (!is_array($upload) || ($upload['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
      $tooBig = in_array($upload['error'] ?? null, [UPLOAD_ERR_INI_SIZE, UPLOAD_ERR_FORM_SIZE], true);
      return [null, $tooBig ? 'The image is too large.' : 'Choose an image to upload.'];
    }
    if ($upload['size'] > 8 * 1024 * 1024) return [null, 'Images must be 8 MB or smaller.'];
    $info = @getimagesize($upload['tmp_name']);
    if (
      !$info || !in_array($info['mime'], ['image/jpeg', 'image/png', 'image/webp', 'image/gif'], true) ||
      $info[0] < 1 || $info[1] < 1
    ) {
      return [null, 'Choose a valid JPG, PNG, WebP, or GIF image.'];
    }
    // GD decodes to about 5 bytes a pixel (more with EXIF rotation), so an
    // image we can't hold in PHP's memory limit is refused here rather than
    // crashing the request. 20 megapixels is 5000 x 4000.
    $pixels = $info[0] * $info[1];
    $limit = wikiMemoryLimitBytes();
    if ($pixels > 20000000 || ($limit > 0 && memory_get_usage() + $pixels * 6 > $limit)) {
      return [null, 'That image is too large. Try one under 20 megapixels (about 5000 x 4000).'];
    }
    $bytes = file_get_contents($upload['tmp_name']);
    $source = $bytes === false ? false : @imagecreatefromstring($bytes);
    if (!$source) return [null, 'The image could not be read.'];
    if ($info['mime'] === 'image/jpeg' && function_exists('exif_read_data')) {
      $exif = @exif_read_data($upload['tmp_name']);
      $rotate = [3 => 180, 6 => -90, 8 => 90][(int) ($exif['Orientation'] ?? 1)] ?? 0;
      if ($rotate) $source = imagerotate($source, $rotate, 0);
    }
    $sw = imagesx($source);
    $sh = imagesy($source);
    if ($mode === 'cover') {
      $scale = max($width / $sw, $height / $sh);
      $cw = (int) round($width / $scale);
      $ch = (int) round($height / $scale);
      $sx = (int) floor(($sw - $cw) / 2);
      $sy = (int) floor(($sh - $ch) / 2);
      $dw = $width;
      $dh = $height;
    } else {
      $scale = min(1, $width / $sw, $height / $sh);
      [$sx, $sy, $cw, $ch] = [0, 0, $sw, $sh];
      $dw = max(1, (int) round($sw * $scale));
      $dh = max(1, (int) round($sh * $scale));
    }
    $output = imagecreatetruecolor($dw, $dh);
    imagealphablending($output, false);
    imagesavealpha($output, true);
    imagefill($output, 0, 0, imagecolorallocatealpha($output, 0, 0, 0, 127));
    imagecopyresampled($output, $source, 0, 0, $sx, $sy, $dw, $dh, $cw, $ch);
    imagedestroy($source);

    $directory = dirname(__DIR__, 2) . '/uploads/' . $folder;
    if (!is_dir($directory) && !mkdir($directory, 0755, true)) {
      imagedestroy($output);
      return [null, 'The upload folder is unavailable.'];
    }
    $name = (int) $owner . '-' . bin2hex(random_bytes(12)) . '.webp';
    $saved = imagewebp($output, $directory . '/' . $name, 86);
    imagedestroy($output);
    if (!$saved) return [null, 'The image could not be saved.'];
    return ['uploads/' . $folder . '/' . $name, null];
  }

  // Talk pages exist for every marker and every account.
  function wikiTalkPageExists($db, $prefix, $type, $id) {
    if ($type === 'marker') {
      return (bool) $db->fetchOne("SELECT 1 FROM `{$prefix}marker` WHERE `id` = ?", [(int) $id]);
    }
    if ($type === 'user') {
      return (bool) $db->fetchOne("SELECT 1 FROM `{$prefix}user` WHERE `id` = ? AND `deleted` IS NULL", [(int) $id]);
    }
    return false;
  }

  function wikiHasUserColumn($db, $prefix, $column) {
    static $columns = [];
    if (!in_array($column, ['bio', 'profile_banner', 'profile_picture'], true)) return false;
    if (!array_key_exists($column, $columns)) {
      $columns[$column] = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$prefix}user` LIKE '{$column}'");
    }
    return $columns[$column];
  }
?>
