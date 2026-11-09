<?php
// A dynamic entry point prevents long-lived static CDN caching from hiding
// worker updates. No session or account data is included in this response.
// (config.php is deliberately not included: it needs the database.)
header('Content-Type: application/javascript; charset=utf-8');
header('Cache-Control: no-store, no-cache, must-revalidate');
header('Service-Worker-Allowed: /');
include_once(__DIR__ . '/lib/common/assets.php');
// Shared with index.php's res.php tags, so the worker's cache names and
// precache URLs always name the exact bytes res.php will serve.
echo "const SERVER_ASSET_VERSION = '" . asset_version() . "';\n";
readfile(__DIR__ . '/service-worker.js');
