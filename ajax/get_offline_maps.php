<?php
  $manifestCacheDirectory = sys_get_temp_dir() . '/zeldamaps-offline-manifests';
  $manifestCacheLifetime = 6 * 60 * 60;
  $tileRoot = realpath(dirname(__DIR__) . '/tiles');

  function encodeOfflineTilePath($path) {
    return implode('/', array_map('rawurlencode', explode('/', str_replace('\\', '/', $path))));
  }

  function getOfflineTileDirectories($mysqli, $map_prefix, $gameId) {
    $escapedGameId = $mysqli->real_escape_string($gameId);
    $query = "
      SELECT DISTINCT `tile_url` AS `tileURL`
      FROM `{$map_prefix}submap` sm
      INNER JOIN `{$map_prefix}map` m ON m.id = sm.map_id
      INNER JOIN `{$map_prefix}container` c ON c.id = m.container_id
      WHERE (c.short_name = '{$escapedGameId}' OR c.id = '{$escapedGameId}')
        AND sm.visible = 1
      UNION
      SELECT DISTINCT sml.`tile_url` AS `tileURL`
      FROM `{$map_prefix}submap_layer` sml
      INNER JOIN `{$map_prefix}submap` sm ON sm.id = sml.submap_id
      INNER JOIN `{$map_prefix}map` m ON m.id = sm.map_id
      INNER JOIN `{$map_prefix}container` c ON c.id = m.container_id
      WHERE (c.short_name = '{$escapedGameId}' OR c.id = '{$escapedGameId}')
        AND sml.visible = 1
    ";
    $result = $mysqli->query($query);
    $directories = array();
    while ($result && ($row = $result->fetch_assoc())) {
      if (!empty($row['tileURL']) && !preg_match('#^https?://#i', $row['tileURL'])) {
        $directories[] = trim($row['tileURL'], '/');
      }
    }
    return array_values(array_unique($directories));
  }

  function buildOfflineManifest($mysqli, $map_prefix, $gameId, $tileRoot) {
    $tilesByPath = array();
    if (!$tileRoot) return array();

    foreach (getOfflineTileDirectories($mysqli, $map_prefix, $gameId) as $relativeDirectory) {
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
          'url' => '/tiles/' . encodeOfflineTilePath($relativePath),
          'size' => $file->getSize()
        );
      }
    }

    ksort($tilesByPath, SORT_NATURAL);
    return array_values($tilesByPath);
  }

  function getOfflineManifest($mysqli, $map_prefix, $gameId, $tileRoot, $cacheDirectory, $cacheLifetime) {
    if (!is_dir($cacheDirectory)) @mkdir($cacheDirectory, 0755, true);
    $cacheFile = $cacheDirectory . '/' . preg_replace('/[^A-Za-z0-9_-]/', '', $gameId) . '.json';
    if (is_file($cacheFile) && filemtime($cacheFile) > time() - $cacheLifetime) {
      $cachedManifest = json_decode(file_get_contents($cacheFile), true);
      if (is_array($cachedManifest)) return $cachedManifest;
    }

    $manifest = buildOfflineManifest($mysqli, $map_prefix, $gameId, $tileRoot);
    @file_put_contents($cacheFile, json_encode($manifest), LOCK_EX);
    return $manifest;
  }

  $gameRows = array();
  $gameResult = $mysqli->query("
    SELECT `id`, `short_name` AS `shortName`, `name`
    FROM `{$map_prefix}container`
    WHERE `visible` = 1 AND `enabled` = 1
    ORDER BY `id`
  ");
  while ($gameResult && ($gameRow = $gameResult->fetch_assoc())) {
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
      $mysqli, $map_prefix, $requestedGame, $tileRoot,
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

  $games = array();
  foreach ($gameRows as $gameRow) {
    $manifest = getOfflineManifest(
      $mysqli, $map_prefix, $gameRow['shortName'], $tileRoot,
      $manifestCacheDirectory, $manifestCacheLifetime
    );
    $games[] = array(
      'id' => $gameRow['shortName'],
      'name' => $gameRow['name'],
      'tileCount' => count($manifest),
      'size' => array_sum(array_column($manifest, 'size')),
      'available' => count($manifest) > 0
    );
  }

  echo json_encode(array('success' => true, 'games' => $games));
?>
