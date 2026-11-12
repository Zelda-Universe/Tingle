<?php
  // One version string for the bundled assets, shared by the page (the two
  // res.php tags in index.php) and the service worker (injected by
  // service-worker.php before service-worker.js is sent). It is derived from
  // the same signals that res.php uses to decide whether to rebuild the
  // bundles — the registry files, each bundled source's timestamp, and the
  // bundler — so the version changes exactly when the bytes the server will
  // serve change, and neither the browser's HTTP cache nor the worker's can
  // keep feeding a page stale code. (Versions used to be bumped by hand in
  // four places; this is the one value they all come from now.)
  //
  // Deliberately independent of config.php, which requires the database.
  function asset_version() {
    $root = dirname(__DIR__, 2);
    $hash = '';

    // The registries, by content: which files are bundled, in what order.
    // (Content, not timestamp, so merely touching a registry doesn't change
    // the version while a same-content edit does.)
    foreach (array('javascript.txt', 'css.txt') as $registry) {
      $path = $root . '/' . $registry;
      $hash .= 'registry ' . $registry . ' ';
      if (!file_exists($path)) {
        $hash .= '= missing;';
        continue;
      }
      $hash .= '=' . md5_file($path) . ' ';
      // res.php treats lines starting with // as commented-out.
      foreach (file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $source = trim($line);
        if ($source === '' || preg_match('/^\s*\/\//', $source)) continue;
        // The same signal res.php's rebuild check uses: each source's
        // timestamp, in registry order, with a marker for missing files.
        $sourcePath = $root . '/' . $source;
        $hash .= $source . '=' . (file_exists($sourcePath) ? filemtime($sourcePath) : 0) . ';';
      }
    }

    // A changed bundler — or its minify switch in .env — alters the bundles'
    // bytes without touching any bundled source.
    foreach (array('res.php', 'lib/minify.php', 'lib/CSSmin.php', 'lib/JSMin.php', '.env') as $tool) {
      $path = $root . '/' . $tool;
      $hash .= $tool . '=' . (file_exists($path) ? filemtime($path) : 0) . ';';
    }

    // Tile routing and worker changes can require fresh browser caches even
    // when no bundled JS/CSS changed. Keep offline download packs intact:
    // the worker rotates only its app/data/rolling-tile caches on activation.
    foreach (array('service-worker.js', 'service-worker.php', 'ajax/get_map.php',
                   'lib/common/tile_delivery.php') as $dependency) {
      $path = $root . '/' . $dependency;
      $hash .= $dependency . '=' . (file_exists($path) ? md5_file($path) : 'missing') . ';';
    }

    return substr(md5($hash), 0, 10);
  }
