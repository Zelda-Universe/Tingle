<!DOCTYPE html>
<html>
   <head>
      <link rel="shortcut icon" href="favicon.ico" type="image/vnd.microsoft.icon" />
      <link rel="apple-touch-icon" href="apple-touch-icon-precomposed.png" />
      <title>Breath of the Wild Interactive Map - Zelda Maps</title>
      <meta charset="utf-8" />
      <meta name="robots" content="index, follow">
      <meta name="keywords" content="Zelda, botw interactive map, breath of the wild interactive map, interactive map, map, botw, BotW, Breath of the Wild, Zelda Maps, breath of the wild map, botw map, Hyrule, hyrule map, botw guide" />
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0, viewport-fit=cover" />
      <meta name="apple-mobile-web-app-capable" content="yes" />
      <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

      <meta name='owner' content='Zelda Universe (zeldauniverse.net) &amp; Hyrule Legends (zelda.com.br)'>
      <meta property="og:locale:alternate" content="en_US" />
      <meta property="og:type" content="activity" />
      <meta property="og:url" content="https://zeldamaps.com" />
      <meta property="og:site_name" content="Zelda Maps" />
      <meta property="og:locale" content="en_US" />

      <meta property="og:title" content="Zelda Maps" />
      <meta property="og:description" content="Zelda Maps provides rich interactive maps of Hyrule from the The Legend of Zelda with detailed descriptions for each location, character, easter egg and more."/>
      
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta http-equiv="Content-Language" content="en-us">
      <meta name="description" content="Zelda Maps provides rich interactive maps of Hyrule from the The Legend of Zelda with detailed descriptions for each single location, characters, easter egg and more." />

      <!-- Third-Party LIBs -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
      <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
      <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
      <script>tinymce.init({ selector:'textarea' });</script>

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

      <!-- LIBs -->
      <script src="scripts/leaflet.contextmenu.js?<?php echo filemtime('scripts/leaflet.contextmenu.js'); ?>"></script>
      <link rel="stylesheet" href="styles/leaflet.contextmenu.css?<?php echo filemtime('styles/leaflet.contextmenu.css'); ?>" />
      
      <link rel="stylesheet" href="styles/style.css?<?php echo filemtime('styles/style.css'); ?>" />
      
      <script src="scripts/Control.ZLayers.js?<?php echo filemtime('scripts/Control.ZLayers.js'); ?>"></script>
      <script src="scripts/Control.ZLayers.Bottom.js?<?php echo filemtime('scripts/Control.ZLayers.Bottom.js'); ?>"></script>
      
      
      <script src="scripts/zmap.js?<?php echo filemtime('scripts/zmap.js'); ?>"></script>
      <script src="scripts/zmain.js?<?php echo filemtime('scripts/zmain.js'); ?>"></script>
      <link rel="stylesheet" href="styles/zmain.css?<?php echo filemtime('styles/zmain.css'); ?>" />
      
      <!-- Curse Ad Script -->
      <script>
		var script = document.createElement('script');
		var tstamp = new Date();
		script.id = 'factorem';
		script.src = '//cdm.cursecdn.com/js/zeldamaps/cdmfactorem_min.js?sec=home&misc=' + tstamp.getTime();
		script.async = false;
		script.type='text/javascript';
		document.head.appendChild(script);
	  </script>
      
      <script>
      var urlParams;
      $(function(){
          (window.onpopstate = function () {
              var match,
                  pl     = /\+/g,  // Regex for replacing addition symbol with a space
                  search = /([^&=]+)=?([^&]*)/g,
                  decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
                  query  = window.location.search.substring(1);

              urlParams = {};
              while (match = search.exec(query))
                 urlParams[decode(match[1])] = decode(match[2]);
          })();
          var game = urlParams["game"];
          if(game===undefined) {
              window.location.href = "?game=BotW";
          }
          $.getJSON("ajax.php?command=get_container_name&game="+game,function(data){
              if(!data.success) {
                document.title="Zelda Maps";
                return;
              }
              document.title=data.name+" Interactive Map - Zelda Maps";
          });
      });
      </script>

      <!-- Internal LIBS -->
       <!--
      <script src="scripts/zmap.js"></script>
      <script src="scripts/zmain.js"></script>
      <script src="scripts/Control.ZLayers2.js"></script>
      <link rel="stylesheet" href="scripts/zmain.css" />
       -->

   </head>
   <body>
      <div id="map"></div>
      <div id="mobileAds" align="center">
         <!-- Curse Ad Div -->
         <div id='cdm-zone-01'></div>
      </div>
      <div id="desktopAds" align="center">
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
            
            document.getElementById('desktopAds').style.width = adsWidth + 'px';
            document.getElementById('desktopAds').style.height = adsHeight + 'px';
         </script>
         <!-- Curse Ad -->
         <div id='cdm-zone-04'></div>
      </div>
      
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
	  <noscript>
	       <img src="http://b.scorecardresearch.com/p?c1=2&amp;c2=6035118&amp;cv=2.0&amp;cj=1" />
	  </noscript>
	
	  <!-- Nielsen Online SiteCensus -->
	  <div><img src="//secure-us.imrworldwide.com/cgi-bin/m?ci=us-603339h&amp;cg=0&amp;cc=1&amp;ts=noscript" width="1" height="1" alt="" /></div>
      
      <!-- End Curse Ad Zone -->
      <div id='cdm-zone-end'></div>
   </body>
</html>
