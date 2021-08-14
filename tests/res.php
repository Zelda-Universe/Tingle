<?php
  $path = DIRNAME(__FILE__);

  include_once("$path/../config.php");
  if(!$enableTests) exit;
  
  $path = DIRNAME(__FILE__);
  
  include "$path/../lib/minify.php";
  
  print(minify_css(file_get_contents('../styles/leaflet.contextmenu.css')));
?>
