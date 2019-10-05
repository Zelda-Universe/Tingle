<?php
   header('Content-type: application/xml');
?>
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"> 
<?php
   $path = DIRNAME(__FILE__);
   include_once("$path/../config.php");

   $query = 'select c.short_name
				   from ' . $map_prefix . 'container c
              where c.visible = 1
              order by 1
                ';
                
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

	$res = array();
	while ($row = $result->fetch_assoc()) {
      echo "\t<url>";
		echo "\t\t<loc>https://zeldamaps.com/?game=" . $row['short_name'] . "</loc>\n";
      echo "\t</url>\n";
	}

   $query = 'select m.id as id
                  , c.short_name
				      , DATE_FORMAT(m.last_updated, \'%Y-%m-%dT%TZ\') as last_updated
                  , CASE WHEN M.LAST_UPDATED > DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN \'monthly\'
                         ELSE \'yearly\'
                    end as frequency
				   from ' . $map_prefix . 'marker m
                  , ' . $map_prefix . 'submap smp
                  , ' . $map_prefix . 'map mp
                  , ' . $map_prefix . 'container c
              where m.submap_id = smp.id
                and smp.map_id = mp.id
                and mp.container_id = c.id
                and m.visible = 1
                and smp.visible = 1
                and mp.visible = 1
                and c.visible = 1
              order by 2, 1
                ';
                
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

	$res = array();
	while ($row = $result->fetch_assoc()) {
      echo "\t<url>";
		echo "\t\t<loc>https://zeldamaps.com/?game=" . $row['short_name'] . "&#038;amp;marker=" . $row["id"] . "</loc>\n";
      echo "\t\t<lastmod>" . $row["last_updated"] . "</lastmod>\n";
      echo "\t\t<changefreq>" . $row["frequency"] . "</changefreq>\n";
      echo "\t</url>\n";
	}
?>
</urlset>