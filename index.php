<?php
  $gameKey = isset($_GET['game']) ? strtolower((string) $_GET['game']) : 'oot';
  $gameAliases = [
    'la' => 'LA',
    'linksawakening' => 'LA',
    'botw' => 'BotW',
    'totk' => 'TotK',
    'eow' => 'EoW',
    'oot' => 'OoT',
    'ootr' => 'OoT'
  ];
  $gameId = $gameAliases[$gameKey] ?? 'OoT';
  $gameMetadata = [
    'OoT' => [
      'name' => 'Ocarina of Time Remake (2026)',
      'description' => 'The Legend of Zelda: Ocarina of Time (2026) interactive map. Find all 36 Heart Pieces, 100 Gold Skulltulas and 10 Big Poes in Hyrule and every dungeon.',
      'image' => 'social-oot.webp',
      'themeColor' => '#b99b4b'
    ],
    'LA' => [
      'name' => "Link's Awakening",
      'description' => "Explore Koholint Island with the Zelda Maps interactive map for The Legend of Zelda: Link's Awakening.",
      'image' => 'social-la.jpg',
      'themeColor' => '#43a047'
    ],
    'BotW' => [
      'name' => 'Breath of the Wild',
      'description' => 'Explore Hyrule with the Zelda Maps interactive map for The Legend of Zelda: Breath of the Wild.',
      'image' => 'social-botw.jpg',
      'themeColor' => '#67c6e8'
    ],
    'TotK' => [
      'name' => 'Tears of the Kingdom',
      'description' => 'Explore the Surface, Sky, and Depths with the Zelda Maps interactive map for The Legend of Zelda: Tears of the Kingdom.',
      'image' => 'social-totk.jpg',
      'themeColor' => '#67b9ad'
    ],
    'EoW' => [
      'name' => 'Echoes of Wisdom',
      'description' => 'Explore Hyrule with the Zelda Maps interactive map for The Legend of Zelda: Echoes of Wisdom.',
      'image' => 'social-eow.jpg',
      'themeColor' => '#d4a738'
    ]
  ];
  $metadata = $gameMetadata[$gameId];
  $pageHeading = $metadata['name'] . ' Interactive Map';
  $pageTitle = $pageHeading . ' - Zelda Maps';
  $pageDescription = $metadata['description'];
  $canonicalUrl = 'https://zeldamaps.com/?game=' . rawurlencode($gameId === 'OoT' ? 'OoTR' : $gameId);
  // Link previews come from the site serving the page (so staging previews
  // show staging's images); search engines' canonical URL stays production.
  $requestHost = strtolower($_SERVER['HTTP_HOST'] ?? '');
  $siteOrigin = preg_match('/^([a-z0-9-]+\.)*zeldamaps\.com$/', $requestHost)
    ? 'https://' . $requestHost : 'https://zeldamaps.com';
  $socialImageUrl = $siteOrigin . '/images/' . $metadata['image'];
  function metadataEscape($value) {
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
  }
  $landingCategoryId = null;
  $pageUrl = null; // Shared link, when it differs from the canonical URL.
  $markerId = isset($_GET['marker']) ? (int) $_GET['marker'] : 0;
  $categorySlug = isset($_GET['category']) ? (string) $_GET['category'] : '';
  if ($markerId > 0 || $categorySlug !== '') {
    include_once(__DIR__ . '/config.php');
    include_once(__DIR__ . '/lib/common/database.php');
    include_once(__DIR__ . '/lib/common/seo.php');
    $landingCategories = open() === 0 ? seoLandingCategories($db, $map_prefix, $gameId) : [];

    // A category from the category list gets its own page.
    $category = $landingCategories[seoSlug($categorySlug)] ?? null;
    if ($markerId === 0 && $category) {
      $landingCategoryId = $category['id'];
      $count = number_format($category['count']);
      $maps = $category['maps'];
      // Name the maps when there are only a few, as with TotK's three layers.
      $where = count($maps) > 1 && count($maps) <= 3
        ? ' across the ' . implode(', ', array_slice($maps, 0, -1)) . ' and ' . end($maps)
        : '';
      $pageHeading = $category['name'] . ' - ' . $metadata['name'] . ' Interactive Map';
      $pageTitle = $category['name'] . ' Map - ' . $metadata['name'] . ' - Zelda Maps';
      $pageDescription = 'All ' . $count . ' ' . $category['name'] . ' locations' . $where .
        ' in The Legend of Zelda: ' . $metadata['name'] . ', on the Zelda Maps interactive map.';
      $canonicalUrl = seoCategoryUrl($gameId, $category['slug']);
    }

    // A marker keeps its own title and description for link previews, but
    // points search engines at its category's page rather than being indexed
    // on its own.
    if ($markerId > 0 && isset($db)) {
      $marker = $db->fetchAssociative("
        SELECT m.name, m.description, m.marker_category_id AS categoryId, mc.name AS category, mp.name AS map
          FROM `{$map_prefix}marker` m
          JOIN `{$map_prefix}marker_category` mc ON mc.id = m.marker_category_id
          JOIN `{$map_prefix}submap` smp ON smp.id = m.submap_id
          JOIN `{$map_prefix}map` mp ON mp.id = smp.map_id
          JOIN `{$map_prefix}container` c ON c.id = mp.container_id
         WHERE m.id = ? AND c.short_name = ?
           AND m.visible = 1 AND smp.visible = 1 AND mp.visible = 1 AND c.visible = 1
      ", [$markerId, $gameId]);
      $markerName = $marker ? seoPlainText($marker['name']) : '';
      if ($markerName !== '') {
        $categoryName = seoPlainText($marker['category']);
        $mapName = seoPlainText($marker['map']);
        $details = seoPlainText($marker['description']);
        // Some descriptions are only game data, such as a Korok's hash.
        if (!preg_match('/\p{L}{3}/u', $details)) $details = '';
        $pageHeading = $markerName . ' - ' . $metadata['name'] . ' Interactive Map';
        $pageTitle = $markerName . ' - ' . $metadata['name'] . ' Map - Zelda Maps';
        $pageDescription = $details !== ''
          ? $markerName . ' (' . $categoryName . ', ' . $mapName . '): ' . $details
          : 'Location of the ' . $markerName . ' (' . $categoryName . ') on the ' . $mapName .
            ' map of The Legend of Zelda: ' . $metadata['name'] . ', on the Zelda Maps interactive map.';
        $pageDescription = mb_strimwidth($pageDescription, 0, 160, '…', 'UTF-8');
        $pageUrl = 'https://zeldamaps.com/?' . http_build_query(['game' => $gameId, 'marker' => $markerId]);
        foreach ($landingCategories as $landingCategory) {
          if ($landingCategory['id'] == $marker['categoryId']) {
            $canonicalUrl = seoCategoryUrl($gameId, $landingCategory['slug']);
            break;
          }
        }
      }
    }
  }
  if(!empty($_GET['area'])) {
    include_once(__DIR__ . '/lib/common/seo.php');
    if($gameId !== 'OoT' && !isset($db)) {
      include_once(__DIR__ . '/config.php');
      include_once(__DIR__ . '/lib/common/database.php');
      open();
    }
    try {
      foreach(seoAreaPages($gameId === 'OoT' ? null : ($db ?? null), $map_prefix ?? '') as $area) {
        if($area['game'] !== $gameId || !in_array((string)$_GET['area'], $area['keys'], true)) continue;
        if(isset($_GET['map']) && (string)$area['map'] !== (string)$_GET['map']) continue;
        if(isset($_GET['subMap']) && !in_array((string)$_GET['subMap'], $area['subMaps'], true)) continue;
        if($gameId === 'OoT') {
          // "Market Map - Ocarina of Time (2026)": one page per area or
          // dungeon, whichever age or floor the link opened.
          $pageHeading=$area['name'].' Map - Ocarina of Time (2026)';
        } else {
          $mapTitle=($area['mapName'] ?? $area['name']).($area['variant'] ? ' ('.$area['variant'].')' : '');
          $pageHeading=(!empty($area['isMap']) ? $mapTitle : $area['name'].' - '.$mapTitle).' - '.$metadata['name'].' Map';
        }
        $pageTitle=$pageHeading.' - Zelda Maps';
        $pageDescription=$area['description'];
        // Shared links keep the age or floor they opened; search engines get the one page.
        $canonicalUrl=$area['url'];
        $openedSubMap=isset($_GET['subMap']) ? (string)$_GET['subMap'] : (string)$area['subMap'];
        $pageUrl='https://zeldamaps.com/?'.http_build_query(['game'=>$gameId === 'OoT' ? 'OoTR' : $gameId,
          'map'=>$area['map'],'subMap'=>$openedSubMap,'area'=>$area['key']]);
        break;
      }
    } catch(\Throwable $e) { error_log('Area metadata unavailable: '.$e->getMessage()); }
  }
  $pageUrl = preg_replace('#^https://zeldamaps\.com#', $siteOrigin, $pageUrl ?: $canonicalUrl);
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Metadata -->

      <!-- Generic / Web Standard -->

        <link
          rel="shortcut icon"
          href="images/favicon.ico"
          type="image/vnd.microsoft.icon"
        />
        <link rel="manifest" href="manifest.webmanifest" />

        <title><?= metadataEscape($pageTitle) ?></title>

        <meta charset="utf-8" />

        <meta http-equiv="Content-Type"     content="text/html; charset=utf-8" />
        <meta
          http-equiv="Content-Language"
          content="en-us"
        />

        <meta name="description" content="<?= metadataEscape($pageDescription) ?>">
        <meta name="application-name" content="Zelda Maps" />
        <meta name="theme-color" content="<?= metadataEscape($metadata['themeColor']) ?>" />
        <meta
          name="keywords"
          content="Zelda, eow interactive map, totk interactive map, echoes of wisdom interactive map, tears of the kingdom interactive map, botw interactive map, breath of the wild interactive map, interactive map, map, eow, EoW, botw, BotW, totk, TotK, Echoes of Wisdom, Breath of the Wild, Tears of the Kingdom, Zelda Maps, echoes of wisdom map, tears of the kingdom map, eow map, totk map, breath of the wild map, botw map, Hyrule, hyrule map, eow guide, botw guide, totk guide"
        />
        <meta name='owner'    content='Zelda Universe (zeldauniverse.net) &amp; Hyrule Legends (zelda.com.br)'>
        <meta name="robots"   content="index, follow">
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0, viewport-fit=cover"
        />


      <!-- Apple -->

        <link
          rel="apple-touch-icon"
          href="images/apple-touch-icon-precomposed.png"
        />

        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <meta name="apple-mobile-web-app-title" content="Zelda Maps" />


      <!-- OpenGraph (OG) / Facebook/Meta Tags -->

        <meta property="og:description" content="<?= metadataEscape($pageDescription) ?>">
        <meta property="og:locale"  content="en_US" />
        <meta property="og:locale:alternate"  content="en_US" />
        <meta property="og:image" content="<?= metadataEscape($socialImageUrl) ?>">
        <!-- Screenshots from dev/captureSocialImages.sh: 1200x630 at 2x. -->
        <meta property="og:image:type" content="image/jpeg">
        <meta property="og:image:width" content="2400">
        <meta property="og:image:height" content="1260">
        <meta property="og:image:alt" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="og:site_name" content="Zelda Maps" />
        <meta property="og:title" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="og:type"    content="website">
        <meta property="og:url" content="<?= metadataEscape($pageUrl) ?>">
        <link rel="canonical" href="<?= metadataEscape($canonicalUrl) ?>">


      <!-- Twitter Meta Tags -->

        <meta name="twitter:card"     content="summary_large_image">
        <meta name="twitter:description" content="<?= metadataEscape($pageDescription) ?>">
        <meta property="twitter:domain"   content="zeldamaps.com">
        <meta name="twitter:image" content="<?= metadataEscape($socialImageUrl) ?>">
        <meta name="twitter:image:alt" content="<?= metadataEscape($pageTitle) ?>">
        <meta name="twitter:title" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="twitter:url" content="<?= metadataEscape($pageUrl) ?>">



    <!-- Third-Party Code -->

      <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"
      ></script>
      <script
        src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js"
      ></script>
      <script
        defer
        src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"
        integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe"
        crossorigin="anonymous"
      ></script>
      <script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
      ></script>
      <script
        src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/3.0.4/fuse.min.js"
      ></script>
      <script
        src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.10.9/tinymce.min.js"
        referrerpolicy="origin"
      ></script>


    <!-- Third-Party Styles -->

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />


    <!-- First-Party Code & Style -->

      <script>
        var isStandalone =
          window.navigator.standalone === true ||
          window.matchMedia('(display-mode: standalone)').matches;
        var isIOSSafari = window.navigator.standalone === false &&
          /Safari/.test(window.navigator.userAgent) &&
          !/(CriOS|FxiOS|EdgiOS|OPiOS)/.test(window.navigator.userAgent);

        if (isStandalone) {
          document.documentElement.classList.add('zm-standalone');
          document.documentElement.style.setProperty('--mobile-control-top', '89px');
        } else if (isIOSSafari) {
          document.documentElement.classList.add('zm-ios-safari');
          document.documentElement.style.setProperty('--mobile-control-top', '18px');
        }
      </script>
      <script>var zmapLandingCategoryId = <?= json_encode($landingCategoryId) ?>;</script>
      <?php if (is_file(__DIR__ . '/data/OoT/icons.css')): ?>
      <link rel="stylesheet" href="data/OoT/icons.css" />
      <?php endif; ?>
      <script type="text/javascript" src="res.php?type=javascript&amp;v=20261105-oot-20"></script>
      <link rel="stylesheet" type="text/css" href="res.php?type=css&amp;v=20261105-oot-20" />
      <script>
        if ('serviceWorker' in navigator) {
          var hadServiceWorkerController = !!navigator.serviceWorker.controller;
          var reloadingForWorker = false;
          navigator.serviceWorker.addEventListener('controllerchange', function() {
            if(!hadServiceWorkerController) {
              hadServiceWorkerController = true;
              return;
            }
            if(reloadingForWorker) return;
            reloadingForWorker = true;
            window.location.reload();
          });
          window.addEventListener('load', function() {
            var lastUpdateCheck = 0;
            function checkAppUpdate() {
              if(!navigator.onLine || document.visibilityState === 'hidden') return;
              if(Date.now() - lastUpdateCheck < 60000) return;
              lastUpdateCheck = Date.now();
              navigator.serviceWorker.register('service-worker.php', { updateViaCache: 'none' })
                .then(function(registration) { return registration.update(); })
                .catch(function(error) {
              console.warn('Offline caching could not be enabled.', error);
                });
            }
            checkAppUpdate();
            window.addEventListener('online', checkAppUpdate);
            window.addEventListener('pageshow', checkAppUpdate);
            document.addEventListener('visibilitychange', checkAppUpdate);
          });
        }
      </script>

      <!-- Auto-select default game when none other provided. -->
      <script>
        (function() {
          var urlParams;

          (window.onpopstate = function () {
            var
              match,
              pl     = /\+/g,  // Regex for replacing addition symbol with a space
              search = /([^&=]+)=?([^&]*)/g,
              decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
              query  = window.location.search.substring(1)
            ;

            urlParams = {};
            while (match = search.exec(query))
              urlParams[decode(match[1])] = decode(match[2]);
          })();

          var game = urlParams["game"];

          if(game === undefined) {
            window.location.href = "?game=OoTR";
            return;
          }
        })();
      </script>
  </head>
  <body>
    <!-- What the page is, in text, for search engines and screen readers. -->
    <header class="sr-only">
      <h1><?= metadataEscape($pageHeading) ?></h1>
      <p><?= metadataEscape($pageDescription) ?></p>
    </header>
    <main>
      <!--
        Note: Ads should be above the map/layers/tiles area,
        and beneath the leaflet controls.
        Filled and placed by updateAdState() in scripts/zmain.lib.js.
      -->
      <div id="ads"></div>

      <!-- Zelda Maps -->
    </main>

    <div id="tracking">
      <!-- Google tag (gtag.js), on the production site only. -->
      <script>
        if (['zeldamaps.com', 'www.zeldamaps.com'].indexOf(location.hostname) > -1) {
          var gtagScript = document.createElement('script');
          gtagScript.async = true;
          gtagScript.src = 'https://www.googletagmanager.com/gtag/js?id=G-YGLG406J6N';
          document.head.appendChild(gtagScript);
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', 'G-YGLG406J6N');
        }
      </script>

      <!-- comScore -->
  	  <script>
  		  var _comscore = _comscore || [];
  		  _comscore.push({ c1: "2", c2: "6035118" });
    		(function() {
    		   var s = document.createElement("script"), el = document.getElementsByTagName("script")[0]; s.async = true;
    		   s.src = (document.location.protocol == "https:" ? "https://sb" : "http://b") + ".scorecardresearch.com/beacon.js";
    		   el.parentNode.insertBefore(s, el);
    		})();
  	  </script>

      <!-- Scorecard Research -->
  	  <noscript>
  	    <img src="http://b.scorecardresearch.com/p?c1=2&amp;c2=6035118&amp;cv=2.0&amp;cj=1" />
  	  </noscript>

  	  <!-- Nielsen Online SiteCensus -->
  	  <div>
        <img src="//secure-us.imrworldwide.com/cgi-bin/m?ci=us-603339h&amp;cg=0&amp;cc=1&amp;ts=noscript" width="1" height="1" alt="" />
      </div>
    </div>
  </body>
</html>
