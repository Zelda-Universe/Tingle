<?php
  start_session('zmap');
  if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false, 'msg' => 'Please log in to download offline maps.'));
    return;
  }
  session_write_close();

  $manifestCacheDirectory = sys_get_temp_dir() . '/zeldamaps-offline-manifests-v2';
  $manifestCacheLifetime = 6 * 60 * 60;
  $tileRoot = realpath(dirname(__DIR__) . '/tiles');
  $tilePublicBaseURL = rtrim(
    get_config('tilesBaseURL', 'string', array('/tiles/')),
    '/'
  ) . '/';

  function encodeOfflineTilePath($path) {
    return implode('/', array_map('rawurlencode', explode('/', str_replace('\\', '/', $path))));
  }

  function getOfflineTileDirectories($db, $map_prefix, $gameId) {
    $rows = $db->fetchAllAssociative("
      SELECT DISTINCT `tile_url` AS `tileURL`
      FROM `{$map_prefix}submap` sm
      INNER JOIN `{$map_prefix}map` m ON m.id = sm.map_id
      INNER JOIN `{$map_prefix}container` c ON c.id = m.container_id
      WHERE (c.short_name = ? OR c.id = ?)
        AND sm.visible = 1
      UNION
      SELECT DISTINCT sml.`tile_url` AS `tileURL`
      FROM `{$map_prefix}submap_layer` sml
      INNER JOIN `{$map_prefix}submap` sm ON sm.id = sml.submap_id
      INNER JOIN `{$map_prefix}map` m ON m.id = sm.map_id
      INNER JOIN `{$map_prefix}container` c ON c.id = m.container_id
      WHERE (c.short_name = ? OR c.id = ?)
        AND sml.visible = 1
    ", [$gameId, $gameId, $gameId, $gameId]);
    $directories = array();
    foreach ($rows as $row) {
      if (!empty($row['tileURL']) && !preg_match('#^https?://#i', $row['tileURL'])) {
        $directories[] = trim($row['tileURL'], '/');
      }
    }
    return array_values(array_unique($directories));
  }

  function buildOfflineManifest($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL) {
    $tilesByPath = array();
    if (!$tileRoot) return array();

    foreach (getOfflineTileDirectories($db, $map_prefix, $gameId) as $relativeDirectory) {
      $directory = realpath($tileRoot . '/' . $relativeDirectory);
      if (!$directory || strpos($directory, $tileRoot . DIRECTORY_SEPARATOR) !== 0) continue;

      $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($directory, FilesystemIterator::SKIP_DOTS)
      );
      foreach ($iterator as $file) {
        if (!$file->isFile()) continue;
        if (!preg_match('/^\d+_\d+_\d+\.(?:png|jpe?g|webp)$/i', $file->getFilename())) continue;

        $absolutePath = $file->getRealPath();
        if (!$absolutePath || strpos($absolutePath, $tileRoot . DIRECTORY_SEPARATOR) !== 0) continue;
        $relativePath = substr($absolutePath, strlen($tileRoot) + 1);
        $tilesByPath[$relativePath] = array(
          'url' => $tilePublicBaseURL . encodeOfflineTilePath($relativePath),
          'size' => $file->getSize()
        );
      }
    }

    ksort($tilesByPath, SORT_NATURAL);
    return array_values($tilesByPath);
  }

  function getOfflineManifest($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL, $cacheDirectory, $cacheLifetime) {
    if (!is_dir($cacheDirectory)) @mkdir($cacheDirectory, 0755, true);
    $cacheFile = $cacheDirectory . '/' . preg_replace('/[^A-Za-z0-9_-]/', '', $gameId) . '.json';
    if (is_file($cacheFile) && filemtime($cacheFile) > time() - $cacheLifetime) {
      $cachedManifest = json_decode(file_get_contents($cacheFile), true);
      if (is_array($cachedManifest) && count($cachedManifest) > 0) return $cachedManifest;
    }

    $manifest = buildOfflineManifest($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL);
    if (count($manifest) > 0) {
      @file_put_contents($cacheFile, json_encode($manifest), LOCK_EX);
    }
    return $manifest;
  }

  $gameRows = array();
  foreach ($db->fetchAllAssociative("
    SELECT `id`, `short_name` AS `shortName`, `name`
    FROM `{$map_prefix}container`
    WHERE `visible` = 1 AND `enabled` = 1
    ORDER BY `id`
  ") as $gameRow) {
    $gameRows[$gameRow['shortName']] = $gameRow;
  }

  $requestedGame = isset($_GET['game']) ? (string) $_GET['game'] : '';
  $mode = isset($_GET['mode']) ? (string) $_GET['mode'] : 'summary';
  if ($mode === 'manifest') {
    if (!isset($gameRows[$requestedGame])) {
      echo json_encode(array('success' => false, 'msg' => 'Unknown game.'));
      return;
    }
    $manifest = getOfflineManifest(
      $db, $map_prefix, $requestedGame, $tileRoot, $tilePublicBaseURL,
      $manifestCacheDirectory, $manifestCacheLifetime
    );
    $offset = max(0, isset($_GET['offset']) ? (int) $_GET['offset'] : 0);
    $limit = min(250, max(1, isset($_GET['limit']) ? (int) $_GET['limit'] : 100));
    echo json_encode(array(
      'success' => true,
      'game' => $requestedGame,
      'total' => count($manifest),
      'totalBytes' => array_sum(array_column($manifest, 'size')),
      'offset' => $offset,
      'tiles' => array_slice($manifest, $offset, $limit)
    ));
    return;
  }

  // The games alone, so the page can list them before any sizes are known.
  if ($mode === 'list') {
    $games = array();
    foreach ($gameRows as $gameRow) {
      $games[] = array('id' => $gameRow['shortName'], 'name' => $gameRow['name']);
    }
    echo json_encode(array('success' => true, 'games' => $games));
    return;
  }

  $summarizeGame = function($gameRow) use ($db, $map_prefix, $tileRoot, $tilePublicBaseURL, $manifestCacheDirectory, $manifestCacheLifetime) {
    $manifest = getOfflineManifest(
      $db, $map_prefix, $gameRow['shortName'], $tileRoot, $tilePublicBaseURL,
      $manifestCacheDirectory, $manifestCacheLifetime
    );
    return array(
      'id' => $gameRow['shortName'],
      'name' => $gameRow['name'],
      'tileCount' => count($manifest),
      'size' => array_sum(array_column($manifest, 'size')),
      'available' => count($manifest) > 0
    );
  };

  // One game's size, so each can be loaded on its own.
  if ($requestedGame !== '') {
    if (!isset($gameRows[$requestedGame])) {
      echo json_encode(array('success' => false, 'msg' => 'Unknown game.'));
      return;
    }
    echo json_encode(array('success' => true, 'game' => $summarizeGame($gameRows[$requestedGame])));
    return;
  }

  $games = array();
  foreach ($gameRows as $gameRow) {
    $games[] = $summarizeGame($gameRow);
  }

  echo json_encode(array('success' => true, 'games' => $games));
?>
