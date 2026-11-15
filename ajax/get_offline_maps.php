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
  // (v9: duplicate tiles point at their first copy, 'same'; TotK's unused
  // _Detail images are left out.)
  $manifestCacheDirectory = sys_get_temp_dir() . '/zeldamaps-offline-manifests-v9-' . substr(md5(dirname(__DIR__)), 0, 12);
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
        // Nor the gallery's _Detail images: the page shows only _Icon ones
        // (zmap.js), and TotK's _Detail images are over 500 MB.
        'exclude' => '#^data/[^/]+/[^/]+\.json$|^data/[^/]+/gallery/[^/]+_Detail\.png$#i',
        'tile' => false
      );
    }
    return $sources;
  }

  // A file's contents as a short hash, to find tiles that are the same
  // image (OoT's floors share blank and edge tiles, and a floor's -state01
  // is mostly its -state00: three in four of its tiles). Kept by path, size
  // and modified time in $hashes, so only new or changed files are read.
  function offlineFileHash($path, $size, $mtime, &$hashes) {
    $key = $path . '|' . $size . '|' . $mtime;
    if (!isset($hashes[$key])) {
      $hashes[$key] = hash_file(in_array('xxh128', hash_algos(), true) ? 'xxh128' : 'md5', $path);
    }
    return $hashes[$key];
  }

  // How much a download is: each different file once (a tile that's the
  // same as another, 'same', is saved as that one).
  function offlineManifestBytes($tiles) {
    $bytes = 0;
    foreach ($tiles as $tile) if (empty($tile['same'])) $bytes += $tile['size'];
    return $bytes;
  }

  function buildOfflineManifest($sources, $hashFile = null) {
    $hashes = array();
    if ($hashFile && is_file($hashFile)) $hashes = json_decode((string) file_get_contents($hashFile), true) ?: array();
    $used = array();
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
        if ($source['tile']) {
          $filesByURL[$url]['tile'] = 1;
          $key = $absolutePath . '|' . $file->getSize() . '|' . $file->getMTime();
          $filesByURL[$url]['hash'] = offlineFileHash($absolutePath, $file->getSize(), $file->getMTime(), $hashes);
          $used[$key] = $hashes[$key];
        }
      }
    }

    ksort($filesByURL, SORT_NATURAL);
    // A tile that's the same image as one before it is downloaded once:
    // 'same' names the copy the browser saves (service-worker.js serves it).
    $first = array();
    foreach ($filesByURL as $url => &$entry) {
      if (!isset($entry['hash'])) continue;
      if (isset($first[$entry['hash']])) $entry['same'] = $first[$entry['hash']];
      else $first[$entry['hash']] = $url;
      unset($entry['hash']);
    }
    unset($entry);
    // (Only the files still in use, so the hashes don't grow forever.)
    if ($hashFile) @file_put_contents($hashFile, json_encode($used), LOCK_EX);
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

    // (Hashing a game's tiles the first time takes a while.)
    @set_time_limit(300);
    $tiles = buildOfflineManifest($sources, $cacheDirectory . '/' . preg_replace('/[^A-Za-z0-9_-]/', '', $gameId) . '-hashes.json');
    // Only a game with map tiles can be downloaded.
    if (!array_filter(array_column($tiles, 'tile'))) $tiles = array();
    $manifest = array(
      'signature' => $signature,
      'version' => $tiles ? substr(sha1(implode("\n", array_map(function($tile) {
        // (With what a duplicate is the same as: a download made before tiles
        // were shared is offered an update, which only frees space.)
        return $tile['url'] . '|' . $tile['size'] . '|' . $tile['m'] . (empty($tile['same']) ? '' : '|' . $tile['same']);
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
      'totalBytes' => offlineManifestBytes($tiles),
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
      'size' => offlineManifestBytes($manifest['tiles']),
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
