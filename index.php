<!DOCTYPE html>
<?php 
   if (!isset($_GET['game'])) {
      $url = 'http' . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . "{$_SERVER['HTTP_HOST']}/{$_SERVER['REQUEST_URI']}";
      header( 'Location: ' . $url . '?game=BotW' ) ;
   }
?>
<html>
   <head>
      <link rel="shortcut icon" href="favicon.ico" type="image/vnd.microsoft.icon" />
      <title><?php include_once('get_container_name.php'); ?> Map | ZeldaMaps.com</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
      
      <!-- Third-Party LIBs -->
   <?php 
      if ($_SERVER['SERVER_ADDR'] == "127.0.0.1" || $_SERVER['SERVER_ADDR'] == '::1') {
   ?>

      <!-- JQuery 3.0.0 | Downloaded 2016-06-28 | http://jquery.com/ -->
      <script src="scripts/jquery.min.js"></script>
   
      <!-- Leaflet 1.0.2+4bbb16c | Downloaded 2016-12-13 | http://leafletjs.com/download.html -->
      <link rel="stylesheet" href="scripts/leaflet.css?<?php echo filemtime('scripts/leaflet.css'); ?>" />
      <script src="scripts/leaflet-src.js?<?php echo filemtime('scripts/leaflet-src.js'); ?>"></script>
      
      <!-- Leaflet.markercluster (leaflet.markercluster@1.0.0) | Downloaded 2016-12-13 | https://github.com/Leaflet/Leaflet.markercluster -->
      <link rel="stylesheet" href="scripts/MarkerCluster.css?<?php echo filemtime('scripts/MarkerCluster.css'); ?>" />
      <link rel="stylesheet" href="scripts/MarkerCluster.Default.css?<?php echo filemtime('scripts/MarkerCluster.Default.css'); ?>" />
      <script src="scripts/leaflet.markercluster-src.js?<?php echo filemtime('scripts/leaflet.markercluster-src.js'); ?>" /></script>
      
      <!-- Leaflet.toolbar | Downloaded 2016-12-16 | https://github.com/Leaflet/Leaflet.toolbar -->
      <link rel="stylesheet" href="scripts/leaflet.toolbar-src.css?<?php echo filemtime('scripts/leaflet.toolbar-src.css'); ?>" />
      <script src="scripts/leaflet.toolbar-src.js?<?php echo filemtime('scripts/leaflet.toolbar-src.js'); ?>" /></script>
      
      <!-- jQuery Unslider | Download 2016-06-28 | http://unslider.com/ -->
      <script src="scripts/jquery.event.move.js"></script>
      <script src="scripts/jquery.event.swipe.js"></script>

      <script src="scripts/unslider-min.js"></script>
      <link rel="stylesheet" href="scripts/unslider.css">
      <link rel="stylesheet" href="scripts/unslider-dots.css">         
      
      <!-- Leaflet.EasyButton | Download 2016-12-28 | https://github.com/cliffcloud/Leaflet.EasyButton -->
      <script src="scripts/easy-button.js?<?php echo filemtime('scripts/easy-button.js'); ?>" /></script>
      <link rel="stylesheet" href="scripts/easy-button.css?<?php echo filemtime('scripts/easy-button.css'); ?>" /></script>
      
      <!-- Font Awesome 4.7.0 | Download 2017-01-02 | http://fontawesome.io/assets/font-awesome-4.7.0.zip -->
      <link rel="stylesheet" type="text/css" href="scripts/font-awesome/css/font-awesome.css" />
      
      <!-- L.ControlWindow | Download 2017-01-23 | https://github.com/mapshakers/leaflet-control-window -->
      <script src="scripts/L.Control.Window.js?<?php echo filemtime('scripts/L.Control.Window.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/L.Control.Window.css?<?php echo filemtime('scripts/L.Control.Window.css'); ?>" />
      
      <!-- Context Menu | Download 2017-01-23 | https://github.com/aratcliffe/Leaflet.contextmenu -->
      <script src="scripts/leaflet.contextmenu.js?<?php echo filemtime('scripts/leaflet.contextmenu.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/leaflet.contextmenu.css?<?php echo filemtime('scripts/leaflet.contextmenu.css'); ?>" />
 
      <!-- Slide Menu | Download 2017-01-23 | https://github.com/unbam/Leaflet.SlideMenu -->
      <script src="scripts/L.Control.SlideMenu.js?<?php echo filemtime('scripts/L.Control.SlideMenu.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/L.Control.SlideMenu.css?<?php echo filemtime('scripts/L.Control.SlideMenu.css'); ?>">

      <!-- TESTE -->
      <link rel="stylesheet" href="scripts/style.css">
 
      <script src="http://labs.easyblog.it/maps/leaflet-search/src/leaflet-search.js"></script>
      <link rel="stylesheet" href="http://labs.easyblog.it/maps/leaflet-search/src/leaflet-search.css">
      
      <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
      <script>tinymce.init({ selector:'textarea' });</script>
   <?php 
      } else {
   ?>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
      <link rel="stylesheet" href="scripts/leaflet.css?<?php echo filemtime('scripts/leaflet.css'); ?>" />
      <script src="scripts/leaflet.js?<?php echo filemtime('scripts/leaflet.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/MarkerCluster.css?<?php echo filemtime('scripts/MarkerCluster.css'); ?>" />
      <link rel="stylesheet" href="scripts/MarkerCluster.Default.css?<?php echo filemtime('scripts/MarkerCluster.Default.css'); ?>" />
      <script src="scripts/leaflet.markercluster.js?<?php echo filemtime('scripts/leaflet.markercluster.js'); ?>" /></script>
      <link rel="stylesheet" href="scripts/leaflet.toolbar.css?<?php echo filemtime('scripts/leaflet.toolbar.css'); ?>" />
      <script src="scripts/leaflet.toolbar-src.js?<?php echo filemtime('scripts/leaflet.toolbar-src.js'); ?>" /></script>
      <script src="scripts/jquery.event.move.js?<?php echo filemtime('scripts/jquery.event.move.js'); ?>" /></script>
      <script src="scripts/jquery.event.swipe.js?<?php echo filemtime('scripts/jquery.event.swipe.js'); ?>" /></script>
      <script src="scripts/unslider-min.js?<?php echo filemtime('scripts/unslider-min.js'); ?>" /></script>
      <link rel="stylesheet" href="scripts/unslider.css?<?php echo filemtime('scripts/unslider.css'); ?>">
      <link rel="stylesheet" href="scripts/unslider-dots.css?<?php echo filemtime('scripts/unslider-dots.css'); ?>">   
      <script src="scripts/easy-button.js?<?php echo filemtime('scripts/easy-button.js'); ?>" /></script>
      <link rel="stylesheet" href="scripts/easy-button.css?<?php echo filemtime('scripts/easy-button.css'); ?>" /></script>
      <link rel="stylesheet" href="scripts/style.css">
      <link rel="stylesheet" type="text/css" href="scripts/font-awesome/css/font-awesome.css" />
      <script src="scripts/L.Control.Window.js?<?php echo filemtime('scripts/L.Control.Window.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/L.Control.Window.css?<?php echo filemtime('scripts/L.Control.Window.css'); ?>" />
      <script src="scripts/leaflet.contextmenu.js?<?php echo filemtime('scripts/leaflet.contextmenu.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/leaflet.contextmenu.css?<?php echo filemtime('scripts/leaflet.contextmenu.css'); ?>" />
      <script src="scripts/L.Control.SlideMenu.js?<?php echo filemtime('scripts/L.Control.SlideMenu.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/L.Control.SlideMenu.css?<?php echo filemtime('scripts/L.Control.SlideMenu.css'); ?>">
       
      <script src="http://labs.easyblog.it/maps/leaflet-search/src/leaflet-search.js"></script>
      <link rel="stylesheet" href="http://labs.easyblog.it/maps/leaflet-search/src/leaflet-search.css">
      <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
      <script>tinymce.init({ selector:'textarea' });</script>
   <?php 
      }
   ?>

      <!-- Internal LIBS -->
      <script src="scripts/zmap.js?<?php echo filemtime('scripts/zmap.js'); ?>"></script>
      <script src="scripts/zmain.js?<?php echo filemtime('scripts/zmain.js'); ?>"></script>
      <script src="scripts/Control.ZLayers2.js?<?php echo filemtime('scripts/Control.ZLayers2.js'); ?>"></script>
      <link rel="stylesheet" href="scripts/zmain.css?<?php echo filemtime('scripts/zmain.css'); ?>" />

   </head>
   <body>
      <div id="map"></div>
      <!--<div id="logoContainer">
         <img src="http://maps.zelda.com.br/beta_maps.png">
      </div>-->
   <?php
   if ($_SERVER['SERVER_ADDR'] != "127.0.0.1" && $_SERVER['SERVER_ADDR'] != '::1') {
   ?>

      <script type="text/javascript">
         
         var _gaq = _gaq || [];
         _gaq.push(['_setAccount', 'UA-31332716-1']);
         _gaq.push(['_setDomainName', 'maps.zelda.com.br']);
         _gaq.push(['_trackPageview']);
         
         (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
         })();
   
      </script> 
   <?php
   }
   ?>
   </body>
</html>
