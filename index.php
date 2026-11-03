<?php
  $gameKey = isset($_GET['game']) ? strtolower((string) $_GET['game']) : 'totk';
  $gameAliases = [
    'la' => 'LA',
    'linksawakening' => 'LA',
    'botw' => 'BotW',
    'totk' => 'TotK',
    'eow' => 'EoW'
  ];
  $gameId = $gameAliases[$gameKey] ?? 'TotK';
  $gameMetadata = [
    'LA' => [
      'name' => "Link's Awakening",
      'description' => "Explore Koholint Island with the Zelda Maps interactive map for The Legend of Zelda: Link's Awakening.",
      'image' => 'social-la.png',
      'themeColor' => '#43a047'
    ],
    'BotW' => [
      'name' => 'Breath of the Wild',
      'description' => 'Explore Hyrule with the Zelda Maps interactive map for The Legend of Zelda: Breath of the Wild.',
      'image' => 'social-botw.png',
      'themeColor' => '#67c6e8'
    ],
    'TotK' => [
      'name' => 'Tears of the Kingdom',
      'description' => 'Explore the Surface, Sky, and Depths with the Zelda Maps interactive map for The Legend of Zelda: Tears of the Kingdom.',
      'image' => 'social-totk.png',
      'themeColor' => '#67b9ad'
    ],
    'EoW' => [
      'name' => 'Echoes of Wisdom',
      'description' => 'Explore Hyrule with the Zelda Maps interactive map for The Legend of Zelda: Echoes of Wisdom.',
      'image' => 'social-eow.png',
      'themeColor' => '#d4a738'
    ]
  ];
  $metadata = $gameMetadata[$gameId];
  $pageTitle = 'Zelda Maps - ' . $metadata['name'] . ' Interactive Map';
  $canonicalUrl = 'https://zeldamaps.com/?game=' . rawurlencode($gameId);
  $socialImageUrl = 'https://zeldamaps.com/images/' . $metadata['image'];
  function metadataEscape($value) {
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
  }
?>
<!DOCTYPE html>
<html>
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

        <meta name="description" content="<?= metadataEscape($metadata['description']) ?>">
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

        <meta property="og:description" content="<?= metadataEscape($metadata['description']) ?>">
        <meta property="og:locale"  content="en_US" />
        <meta property="og:locale:alternate"  content="en_US" />
        <meta property="og:image" content="<?= metadataEscape($socialImageUrl) ?>">
        <meta property="og:image:width" content="1200">
        <meta property="og:image:height" content="630">
        <meta property="og:image:alt" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="og:site_name" content="Zelda Maps" />
        <meta property="og:title" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="og:type"    content="website">
        <meta property="og:url" content="<?= metadataEscape($canonicalUrl) ?>">
        <link rel="canonical" href="<?= metadataEscape($canonicalUrl) ?>">


      <!-- Twitter Meta Tags -->

        <meta name="twitter:card"     content="summary_large_image">
        <meta name="twitter:description" content="<?= metadataEscape($metadata['description']) ?>">
        <meta property="twitter:domain"   content="zeldamaps.com">
        <meta name="twitter:image" content="<?= metadataEscape($socialImageUrl) ?>">
        <meta name="twitter:image:alt" content="<?= metadataEscape($pageTitle) ?>">
        <meta name="twitter:title" content="<?= metadataEscape($pageTitle) ?>">
        <meta property="twitter:url" content="<?= metadataEscape($canonicalUrl) ?>">



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
        src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.16/tinymce.min.js"
      ></script>
      <script>
        tinymce.init({ selector:'textarea' });
      </script>


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
      <script type="text/javascript" src="res.php?type=javascript&amp;v=20261103-poi-close"></script>
      <link rel="stylesheet" type="text/css" href="res.php?type=css&amp;v=20261103-poi-close" />
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
            window.location.href = "?game=TotK";
            return;
          }

          $.getJSON(
            "ajax.php?command=get_container_name&game=" + game,
            function(data) {
              if(!data.success) {
                document.title = "Zelda Maps";
                return;
              }

              document.title = data.name + " Interactive Map - Zelda Maps";
            });
          })();
      </script>
  </head>
  <body>
    <main>
      <!--
        Note: Ads should be above the map/layers/tiles area,
        and beneath the leaflet controls
      -->
      <div id="ads" align="center">
	      <div id="mobileAds" >
          <div class="googlePageAds">
  	        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
      			<ins
              class="adsbygoogle"
      			  style="display:block"
      			  data-ad-client="ca-pub-7269573247649351"
      			  data-ad-slot="4512666333"
      			></ins>
      			<script>
      			  (adsbygoogle = window.adsbygoogle || []).push({});
      			</script>
          </div>
	      </div>
	      <div id="desktopAds">
          <!-- Dynamically resize this section-->
	        <script>
            var width = $(document).width();
            var adsWidth = 0;
            var adsHeight = 0;
            if (width > 728) {
              adsWidth = 728;
              adsHeight = 90;
            } else if (width > 468) {
              adsWidth = 468;
              adsHeight = 60;
            } else {
              adsWidth = 234;
              adsHeight = 60;
            }

            var dtAdsStyle = document.getElementById('desktopAds').style
            dtAdsStyle.width  = adsWidth  + 'px';
            dtAdsStyle.height = adsHeight + 'px';
	        </script>

          <div class="googlePageAds">
  	        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
      			<ins class="adsbygoogle infeed"
      			     style="display:block;"
      			     data-ad-client="ca-pub-7269573247649351"
      			     data-ad-slot="4512666333"
      			     data-ad-format="horizontal"></ins>
       			<script>
       			  (adsbygoogle = window.adsbygoogle || []).push({});
       			</script>
          </div>
	      </div>
      </div>

      <!-- Zelda Maps -->
    </main>

    <div id="tracking">
      <!-- Google Analytics -->
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
         })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-317947-14', 'auto');
        ga('send', 'pageview');
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
