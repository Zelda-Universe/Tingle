<?php
  start_session('zmap');
  if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false, 'msg' => 'Please log in to download offline maps.'));
    return;
  }
  session_write_close();
  include_once(dirname(__DIR__) . '/lib/common/game_order.php');
  include_once(dirname(__DIR__) . '/lib/common/tile_delivery.php');

  // Per site (see $cacheFolder in config.php): staging and production can
  // share a temp folder.
  $manifestCacheDirectory = sys_get_temp_dir() . '/zeldamaps-offline-manifests-v8-' . substr(md5(dirname(__DIR__)), 0, 12);
  $manifestCacheLifetime = 6 * 60 * 60;
  $tileRoot = realpath(dirname(__DIR__) . '/tiles');
  $tilePublicBaseURL = rtrim(
    get_config('tilesBaseURL', 'string', array('https://zeldamaps.com/tiles/')),
    '/'
  ) . '/';

  function encodeOfflineTilePath($path) {
    return implode('/', array_map('rawurlencode', explode('/', str_replace('\\', '/', $path))));
  }

  // Each tile folder the game's maps use, with its artwork version (OoT's
  // tile addresses end in ?v=<version>; other games have none).
  function getOfflineTileDirectories($db, $map_prefix, $gameId) {
    // Downloads call the OoT remake OoT, the old N64 game's short name.
    if (isOcarina($gameId)) $gameId = 'OoTR';
    $rows = $db->fetchAllAssociative("
      SELECT DISTINCT `tile_url` AS `tileURL`, sm.`tile_version` AS `tileVersion`
      FROM `{$map_prefix}submap` sm
      INNER JOIN `{$map_prefix}map` m ON m.id = sm.map_id
      INNER JOIN `{$map_prefix}container` c ON c.id = m.container_id
      WHERE (c.short_name = ? OR c.id = ?)
        AND sm.visible = 1
      UNION
      SELECT DISTINCT sml.`tile_url` AS `tileURL`, NULL AS `tileVersion`
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
        $directory = trim($row['tileURL'], '/');
        if (empty($directories[$directory])) $directories[$directory] = $row['tileVersion'] ?: null;
      }
    }
    return $directories;
  }

  // Everything a downloaded game needs: its map tiles, plus the game's data
  // folder (marker images and text) and map icons, which the site serves.
  function getOfflineSources($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL) {
    $sources = array();
    $siteRoot = realpath(dirname(__DIR__));
    $iconFolders = array();
    foreach (getOfflineTileDirectories($db, $map_prefix, $gameId) as $relativeDirectory => $tileVersion) {
      $iconFolders[] = explode('/', $relativeDirectory)[0];
      if (!$tileRoot) continue;
      $sources[] = array(
        'root' => $tileRoot,
        'directory' => $tileRoot . '/' . $relativeDirectory,
        'base' => bundledMapTileBaseURL($relativeDirectory . '/') ?? $tilePublicBaseURL,
        'pattern' => '/^\d+_\d+_\d+\.(?:png|jpe?g|webp)$/i',
        'tile' => true,
        'version' => $tileVersion
      );
    }
    $assetDirectories = array('data/' . $gameId);
    foreach (array_unique($iconFolders) as $folder) $assetDirectories[] = 'images/icons/' . $folder;
    foreach ($assetDirectories as $relativeDirectory) {
      $sources[] = array(
        'root' => $siteRoot,
        'directory' => $siteRoot . '/' . $relativeDirectory,
        'base' => '',
        'pattern' => '/\.(?:png|jpe?g|webp|gif|svg|json|css)$/i',
        // JSON directly in data/<game>/ is server-side data, which offline
        // downloads never need; lang/ JSON is used by the page and stays in.
        'exclude' => '#^data/[^/]+/[^/]+\.json$#i',
        'tile' => false
      );
    }
    return $sources;
  }

  function buildOfflineManifest($sources) {
    $filesByURL = array();
    foreach ($sources as $source) {
      $root = $source['root'];
      $directory = realpath($source['directory']);
      if (!$directory || strpos($directory, $root . DIRECTORY_SEPARATOR) !== 0) continue;

      $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($directory, FilesystemIterator::SKIP_DOTS)
      );
      foreach ($iterator as $file) {
        if (!$file->isFile()) continue;
        if (!preg_match($source['pattern'], $file->getFilename())) continue;

        $absolutePath = $file->getRealPath();
        if (!$absolutePath || strpos($absolutePath, $root . DIRECTORY_SEPARATOR) !== 0) continue;
        if (!empty($source['exclude']) && preg_match($source['exclude'], str_replace('\\', '/', substr($absolutePath, strlen($root) + 1)))) continue;
        $url = $source['base'] . encodeOfflineTilePath(substr($absolutePath, strlen($root) + 1));
        // The same address the page asks for, so downloads are found offline.
        if (!empty($source['version'])) $url .= '?v=' . rawurlencode($source['version']);
        $filesByURL[$url] = array(
          'url' => $url,
          'size' => $file->getSize(),
          // Changes when a file is replaced, so downloads can update just it.
          'm' => $file->getMTime()
        );
        if ($source['tile']) $filesByURL[$url]['tile'] = 1;
      }
    }

    ksort($filesByURL, SORT_NATURAL);
    return array_values($filesByURL);
  }

  // The newest change to any folder the game's files are in. Adding,
  // removing or replacing (by upload and rename, or git) a file updates its
  // folder.
  function getOfflineTileSignature($sources) {
    $latest = 0;
    $pending = array();
    foreach ($sources as $source) {
      $directory = realpath($source['directory']);
      if ($directory && strpos($directory, $source['root'] . DIRECTORY_SEPARATOR) === 0) $pending[] = $directory;
    }
    while ($pending) {
      $directory = array_pop($pending);
      $latest = max($latest, (int) @filemtime($directory));
      foreach (glob($directory . '/*', GLOB_ONLYDIR | GLOB_NOSORT) ?: array() as $child) $pending[] = $child;
    }
    return $latest;
  }

  // The game's file list and version. The version is a hash of every file's
  // path, size and modified time, so it changes whenever a map pack or the
  // game's marker images do.
  function getOfflineManifest($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL, $cacheDirectory, $cacheLifetime) {
    if (!is_dir($cacheDirectory)) @mkdir($cacheDirectory, 0755, true);
    $cacheFile = $cacheDirectory . '/' . preg_replace('/[^A-Za-z0-9_-]/', '', $gameId) . '.json';
    $sources = getOfflineSources($db, $map_prefix, $gameId, $tileRoot, $tilePublicBaseURL);
    $signature = getOfflineTileSignature($sources);
    if (is_file($cacheFile) && filemtime($cacheFile) > time() - $cacheLifetime) {
      $cached = json_decode(file_get_contents($cacheFile), true);
      if (
        is_array($cached) && !empty($cached['tiles']) &&
        ($cached['signature'] ?? null) === $signature
      ) return $cached;
    }

    $tiles = buildOfflineManifest($sources);
    // Only a game with map tiles can be downloaded.
    if (!array_filter(array_column($tiles, 'tile'))) $tiles = array();
    $manifest = array(
      'signature' => $signature,
      'version' => $tiles ? substr(sha1(implode("\n", array_map(function($tile) {
        return $tile['url'] . '|' . $tile['size'] . '|' . $tile['m'];
      }, $tiles))), 0, 16) : null,
      'tiles' => $tiles
    );
    if (count($tiles) > 0) {
      @file_put_contents($cacheFile, json_encode($manifest), LOCK_EX);
    }
    return $manifest;
  }

  include_once(dirname(__DIR__) . '/lib/common/game_order.php');
  $gameRows = array();
  foreach ($db->fetchAllAssociative("
    SELECT `id`, `short_name` AS `shortName`, `name`
    FROM `{$map_prefix}container`
    WHERE `visible` = 1 AND `enabled` = 1
    ORDER BY " . gameOrderSql('`short_name`') . ", `id`
  ") as $gameRow) {
    // Downloads have always called the OoT remake OoT: existing ones are
    // saved under that name, so it stays.
    if (isOcarina($gameRow['shortName'])) $gameRow['shortName'] = 'OoT';
    $gameRows[$gameRow['shortName']] = $gameRow;
  }

  $requestedGame = isset($_GET['game']) ? (string) $_GET['game'] : '';
  if (isOcarina($requestedGame)) $requestedGame = 'OoT';
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
    $tiles = $manifest['tiles'];
    $offset = max(0, isset($_GET['offset']) ? (int) $_GET['offset'] : 0);
    $limit = min(250, max(1, isset($_GET['limit']) ? (int) $_GET['limit'] : 100));
    echo json_encode(array(
      'success' => true,
      'game' => $requestedGame,
      'version' => $manifest['version'],
      'total' => count($tiles),
      'totalBytes' => array_sum(array_column($tiles, 'size')),
      'offset' => $offset,
      'tiles' => array_slice($tiles, $offset, $limit)
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
      'version' => $manifest['version'],
      'tileCount' => count($manifest['tiles']),
      'size' => array_sum(array_column($manifest['tiles'], 'size')),
      'available' => count($manifest['tiles']) > 0
    );
  };

  // Several games' sizes and versions at once, for checking downloaded maps
  // for updates (?games=TotK,BotW).
  if ($mode === 'versions') {
    $games = array();
    foreach (array_unique(explode(',', (string) ($_GET['games'] ?? ''))) as $gameId) {
      if (isset($gameRows[$gameId])) $games[] = $summarizeGame($gameRows[$gameId]);
    }
    echo json_encode(array('success' => true, 'games' => $games));
    return;
  }

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
