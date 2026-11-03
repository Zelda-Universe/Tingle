<?php
// A dynamic entry point prevents long-lived static CDN caching from hiding
// worker updates. No session or account data is included in this response.
header('Content-Type: application/javascript; charset=utf-8');
header('Cache-Control: no-store, no-cache, must-revalidate');
header('Service-Worker-Allowed: /');
readfile(__DIR__ . '/service-worker.js');
