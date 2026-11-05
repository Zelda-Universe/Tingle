<?php
  // Category landing pages, shared by index.php and the sitemap. A category
  // gets a page when it appears in the category list: a regular (not label)
  // category inside a group, with at least one visible marker.

  function seoSlug($name) {
    $slug = strtolower(str_replace('&', ' and ', (string) $name));
    return trim(preg_replace('/[^a-z0-9]+/', '-', $slug), '-');
  }

  function seoPlainText($value) {
    $text = strip_tags(html_entity_decode((string) $value, ENT_QUOTES | ENT_HTML5, 'UTF-8'));
    $text = html_entity_decode($text, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    return trim(preg_replace('/\s+/u', ' ', str_replace('`', "'", $text)));
  }

  // [slug => [id, name, slug, count, maps, lastUpdated]] for one game, or for
  // every visible game when $gameShortName is null (keyed by game, then slug).
  function seoLandingCategories($db, $prefix, $gameShortName = null) {
    $rows = $db->fetchAllAssociative("
      SELECT c.short_name AS game, mc.id, mc.name, COUNT(m.id) AS markers,
             GROUP_CONCAT(DISTINCT mp.name ORDER BY mp.id SEPARATOR '|') AS maps,
             DATE_FORMAT(MAX(m.last_updated), '%Y-%m-%dT%TZ') AS last_updated
        FROM `{$prefix}marker_category` mc
        JOIN `{$prefix}container` c ON c.id = mc.container_id
        JOIN `{$prefix}marker` m ON m.marker_category_id = mc.id AND m.visible = 1
        JOIN `{$prefix}submap` smp ON smp.id = m.submap_id AND smp.visible = 1
        JOIN `{$prefix}map` mp ON mp.id = smp.map_id AND mp.visible = 1
       WHERE c.visible = 1
         AND mc.visible = 1
         AND mc.parent_id IS NOT NULL
         AND mc.marker_category_type_id = 1
         " . ($gameShortName === null ? "" : "AND c.short_name = ?") . "
       GROUP BY c.short_name, mc.id
       ORDER BY c.short_name, mc.id
    ", $gameShortName === null ? [] : [$gameShortName]);

    $categories = [];
    foreach ($rows as $row) {
      $name = seoPlainText($row['name']);
      $slug = seoSlug($name);
      if ($slug === '') continue;
      // Names can repeat within a game; the first with markers wins.
      if (isset($categories[$row['game']][$slug])) continue;
      $categories[$row['game']][$slug] = [
        'id' => (int) $row['id'],
        'name' => $name,
        'slug' => $slug,
        'count' => (int) $row['markers'],
        'maps' => array_map('seoPlainText', explode('|', $row['maps'])),
        'lastUpdated' => $row['last_updated']
      ];
    }
    return $gameShortName === null ? $categories : ($categories[$gameShortName] ?? []);
  }

  function seoCategoryUrl($gameShortName, $slug) {
    return 'https://zeldamaps.com/?' . http_build_query(['game' => $gameShortName === 'OoT' ? 'OoTR' : $gameShortName, 'category' => $slug]);
  }

  // Share one area catalog between metadata and the sitemap.
  function seoAreaPages($db = null, $prefix = '') {
    include_once(__DIR__ . '/oot_pack.php');
    $areas=[];
    foreach (ootPackData('maps') ?? [] as $map) foreach ($map['subMap'] as $submap) {
      $areas[]=['game'=>'OoT','key'=>'map-'.$map['id'],'map'=>$map['id'],'subMap'=>$submap['id'],
        'name'=>$map['name'],'mapName'=>$map['name'],'variant'=>$submap['name'],'isMap'=>true,'description'=>''];
      foreach ($submap['placeLabels'] ?? [] as $place) {
        $name=seoPlainText($place['name']);
        $areas[]=['game'=>'OoT','key'=>seoSlug($name),'map'=>$map['id'],'subMap'=>$submap['id'],
          'name'=>$name,'mapName'=>$map['name'],'variant'=>$submap['name'],'description'=>seoPlainText($place['description'] ?? '')];
      }
    }
    if($db) {
      $rows=$db->fetchAllAssociative("SELECT c.short_name AS game, m.id, m.name, m.description,
          sm.map_id AS mapId, m.submap_id AS subMapId, sm.name AS variant, mp.name AS mapName
        FROM `{$prefix}marker` m
        JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id
        JOIN `{$prefix}submap` sm ON sm.id=m.submap_id
        JOIN `{$prefix}map` mp ON mp.id=sm.map_id
        JOIN `{$prefix}container` c ON c.id=mp.container_id
        WHERE mc.marker_category_type_id=3 AND m.visible=1 AND mc.visible=1 AND sm.visible=1 AND mp.visible=1 AND c.visible=1 AND c.short_name NOT IN ('OoT','OoTR')");
      foreach($rows as $row) $areas[]=['game'=>$row['game'],'key'=>(string)$row['id'],'map'=>$row['mapId'],
        'subMap'=>$row['subMapId'],'name'=>seoPlainText($row['name']),'mapName'=>seoPlainText($row['mapName']),'variant'=>seoPlainText($row['variant']),
        'description'=>seoPlainText($row['description'])];
      $mapRows=$db->fetchAllAssociative("SELECT c.short_name AS game, mp.id, mp.name, sm.id AS subMapId, sm.name AS variant
        FROM `{$prefix}map` mp JOIN `{$prefix}container` c ON c.id=mp.container_id
        JOIN `{$prefix}submap` sm ON sm.map_id=mp.id WHERE c.visible=1 AND mp.visible=1 AND sm.visible=1 AND c.short_name NOT IN ('OoT','OoTR')");
      foreach($mapRows as $row) $areas[]=['game'=>$row['game'],'key'=>'map-'.$row['id'],'map'=>$row['id'],
        'subMap'=>$row['subMapId'],'name'=>seoPlainText($row['name']),'mapName'=>seoPlainText($row['name']),
        'variant'=>seoPlainText($row['variant']),'isMap'=>true,'description'=>''];
    }
    foreach($areas as &$area) {
      $area['variant']=preg_replace('/(?:\s*·\s*)?State\s*\d+/i','',$area['variant']);
      $gameNames=['OoT'=>'Ocarina of Time Remake (2026)','BotW'=>'Breath of the Wild','TotK'=>'Tears of the Kingdom','EoW'=>'Echoes of Wisdom','LA'=>"Link's Awakening"];
      if($area['description']==='') $area['description']='Explore '.$area['name'].(empty($area['isMap']) && !empty($area['mapName']) ? ' in '.$area['mapName'] : '').($area['variant'] ? ' ('.$area['variant'].')' : '').
        ' on the '.($gameNames[$area['game']] ?? $area['game']).' interactive map. Find local points of interest and browse markers by category on Zelda Maps.';
      $area['url']='https://zeldamaps.com/?'.http_build_query(['game'=>$area['game']==='OoT' ? 'OoTR' : $area['game'],'map'=>$area['map'],'subMap'=>$area['subMap'],'area'=>$area['key']]);
    }
    unset($area);
    return $areas;
  }
?>
