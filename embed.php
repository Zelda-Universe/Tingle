<?php
  // The map inside another site's page (an embed: scripts/zmap.js
  // _copyToClipboardEmbed). The one page other sites may frame: the server's
  // frame-ancestors / X-Frame-Options rule exempts this file alone, and every
  // other page stays unframeable. It's index.php in embed mode: never signed
  // in (it doesn't read the session, and the page never asks who's there),
  // with no account, search or ways elsewhere, so a framing site has nothing
  // of anyone's to trick them into doing (clickjacking).
  $zmEmbed = true;
  header('Content-Security-Policy: frame-ancestors *; upgrade-insecure-requests');
  header_remove('X-Frame-Options');
  // Not a page of its own for search engines: the map's own page is.
  header('X-Robots-Tag: noindex');
  // Counted when it's shown inside another site's page, with that site's
  // name (the Admin panel's Embeds; lib/common/embeds.php). Never in the way
  // of the page itself.
  try {
    $embedSite = parse_url((string) ($_SERVER['HTTP_REFERER'] ?? ''), PHP_URL_HOST);
    $ownSite = parse_url('//' . (string) ($_SERVER['HTTP_HOST'] ?? ''), PHP_URL_HOST);
    $inFrame = ($_SERVER['HTTP_SEC_FETCH_DEST'] ?? 'iframe') === 'iframe';
    if ($embedSite && $embedSite !== $ownSite && $inFrame) {
      include_once(__DIR__ . '/config.php');
      include_once(__DIR__ . '/lib/common/database.php');
      include_once(__DIR__ . '/lib/common/embeds.php');
      if (open() === 0) embedRecord($db, $map_prefix, 'view', embedTargetOf($_GET), (string) ($_GET['game'] ?? ''), $embedSite);
    }
  } catch (Throwable $e) {
    error_log('embed.php: counting a view: ' . $e->getMessage());
  }
  include __DIR__ . '/index.php';
