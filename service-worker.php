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
// Minified where the site's scripts are (.env minify): no comments sent.
$worker = file_get_contents(__DIR__ . '/service-worker.js');
// (As config.php reads it, which this can't include: on unless .env says no.)
$minify = true;
if(is_readable(__DIR__ . '/.env')) {
  foreach(file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES) as $line) {
    if(preg_match('/^\s*minify\s*=\s*(\S+)/', $line, $m)) $minify = strtolower(trim($m[1], " \"'")) === 'true';
  }
}
if($minify) {
  include_once(__DIR__ . '/lib/minify.php');
  // (JSMin is older than PHP 8: its deprecation notices must not land in
  // the script.)
  $reporting = error_reporting(error_reporting() & ~E_DEPRECATED);
  $worker = minify_js($worker);
  error_reporting($reporting);
}
echo $worker;
