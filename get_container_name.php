<?php
   include('config.php');

   $game = $_GET["game"];
    
   $query = "select name
               from " . $map_prefix . "container c
              where (c.id = '" . $game . "'
                     or c.short_name = '" . $game . "')
                and c.visible = 1;
    ";
   $result = @mysql_query($query) or die(mysql_error());
   
   $row = mysql_fetch_array($result);
   echo $row['name'];
?>
