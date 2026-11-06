<?php
   $path = __DIR__;
   include_once("$path/../config.php");
   include_once("$path/../lib/common/database.php");
   include_once("$path/../lib/common/seo.php");

   // Fail visibly, so search engines retry later instead of reading an empty
   // sitemap.
   function sitemapUnavailable() {
     http_response_code(503);
     header('Retry-After: 3600');
     header('Content-Type: text/plain');
     echo "Sitemap temporarily unavailable.\n";
   }

   if (open() !== 0) {
     sitemapUnavailable();
     return;
   }

   // Game pages and category pages. Individual markers point search engines
   // at their category's page instead, so they are left out.
   try {
     $games = $db->fetchFirstColumn("
        select c.short_name
          from {$map_prefix}container c
         where c.visible = 1
         order by 1
     ");
     $categories = seoLandingCategories($db, $map_prefix);
     $areas = seoAreaPages($db, $map_prefix);
   } catch (\Throwable $e) {
     debug_log('Sitemap query error: ' . $e->getMessage());
     sitemapUnavailable();
     return;
   }

   function sitemapLoc($url) {
     return htmlspecialchars($url, ENT_XML1 | ENT_QUOTES, 'UTF-8');
   }

   header('Content-Type: application/xml; charset=utf-8');
   echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
   echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";
   // The home page: the whole site's page (index.php), linking every game.
   echo "\t<url>\n\t\t<loc>https://zeldamaps.com/</loc>\n\t</url>\n";

   foreach ($games as $game) {
      // The OoT remake: OoTR in the database and its addresses, OoT in
      // seo.php's lists. (The old N64 OoT is hidden, so never listed.)
      $seoGame = isOcarina($game) ? 'OoT' : $game;
      echo "\t<url>\n";
      echo "\t\t<loc>" . sitemapLoc('https://zeldamaps.com/?' . http_build_query(['game' => $game])) . "</loc>\n";
      echo "\t</url>\n";

      foreach ($categories[$seoGame] ?? [] as $category) {
         echo "\t<url>\n";
         echo "\t\t<loc>" . sitemapLoc(seoCategoryUrl($seoGame, $category['slug'])) . "</loc>\n";
         if ($category['lastUpdated']) echo "\t\t<lastmod>" . $category['lastUpdated'] . "</lastmod>\n";
         echo "\t</url>\n";
      }
   }

   foreach($areas as $area) echo "\t<url><loc>".sitemapLoc($area['url'])."</loc></url>\n";
   echo "</urlset>\n";
?>
