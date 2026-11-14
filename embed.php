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
  include __DIR__ . '/index.php';
