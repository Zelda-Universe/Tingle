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
    // OoT's categories come from its pack, not the database.
    if ($gameShortName === 'OoT') return seoOotLandingCategories();
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
    if ($gameShortName === null) {
      $oot = seoOotLandingCategories();
      if ($oot) $categories['OoT'] = $oot;
      return $categories;
    }
    return $categories[$gameShortName] ?? [];
  }

  // The same for OoT, from data/OoT: each category inside a group with at
  // least one marker. 'maps' lists the maps its markers are on, Hyrule first.
  function seoOotLandingCategories() {
    include_once(__DIR__ . '/oot_pack.php');
    $mapNames = [];
    foreach (ootPackData('maps') ?? [] as $map) $mapNames[(string) $map['id']] = seoPlainText($map['name']);
    $markersByCategory = [];
    foreach (ootPackData('markers') ?? [] as $marker) {
      if ((string) ($marker['visible'] ?? '1') !== '1') continue;
      $markersByCategory[(string) $marker['markerCategoryId']][] = $marker;
    }
    $file = dirname(__DIR__, 2) . '/data/OoT/markers.json';
    $updated = is_file($file) ? gmdate('Y-m-d\TH:i:s\Z', filemtime($file)) : null;
    $categories = [];
    foreach (ootPackData('categories') ?? [] as $category) {
      $markers = $markersByCategory[(string) $category['id']] ?? [];
      if (empty($category['parent_id']) || (string) $category['marker_category_type_id'] !== '1' || !$markers) continue;
      $name = seoPlainText($category['name']);
      $slug = seoSlug($name);
      if ($slug === '' || isset($categories[$slug])) continue;
      $maps = [];
      foreach ($mapNames as $id => $mapName) {
        foreach ($markers as $marker) if ((string) $marker['mapId'] === (string) $id) { $maps[] = $mapName; break; }
      }
      $categories[$slug] = [
        'id' => (int) $category['id'], 'name' => $name, 'slug' => $slug, 'count' => count($markers),
        'maps' => $maps, 'lastUpdated' => $updated
      ];
    }
    return $categories;
  }

  // One OoT marker, for its link preview: [name, categoryId, category, place,
  // details], or null. place is its area (Kakariko Village) or its map.
  function seoOotMarker($markerId) {
    include_once(__DIR__ . '/oot_pack.php');
    foreach (ootPackData('markers') ?? [] as $marker) {
      if ((int) $marker['id'] !== (int) $markerId || (string) ($marker['visible'] ?? '1') !== '1') continue;
      $category = '';
      foreach (ootPackData('categories') ?? [] as $row) {
        if ((string) $row['id'] === (string) $marker['markerCategoryId']) $category = seoPlainText($row['name']);
      }
      $gameData = json_decode((string) ($marker['gameData'] ?? ''), true) ?: [];
      $place = $gameData['areaName'] ?? '';
      if ($place === '') {
        foreach (ootPackData('maps') ?? [] as $map) {
          if ((string) $map['id'] === (string) $marker['mapId']) $place = $map['name'];
        }
      }
      // The first paragraph says where it is and how to get it.
      $details = preg_match('#<p>(.*?)</p>#s', (string) ($marker['tabText'] ?? ''), $match) ? seoPlainText($match[1]) : '';
      return [
        'name' => seoPlainText($marker['name']), 'categoryId' => (int) $marker['markerCategoryId'],
        'category' => $category, 'place' => seoPlainText($place), 'details' => $details
      ];
    }
    return null;
  }

  function seoCategoryUrl($gameShortName, $slug) {
    return 'https://zeldamaps.com/?' . http_build_query(['game' => $gameShortName === 'OoT' ? 'OoTR' : $gameShortName, 'category' => $slug]);
  }

  // Area addresses: apostrophes are dropped, not turned into dashes
  // ("zoras-river", not "zora-s-river"). Category slugs keep seoSlug, so
  // existing category links don't change.
  function seoAreaSlug($name) {
    return seoSlug(str_replace(["'", "\u{2019}"], '', (string) $name));
  }

  // "a, b and c".
  function seoList($items) {
    return count($items) > 1 ? implode(', ', array_slice($items, 0, -1)) . ' and ' . end($items) : ($items[0] ?? '');
  }

  // OoT's collectibles counted per Hyrule area (by name) and per dungeon
  // ("map-<id>"), both ages together: [key => [categoryId => count]].
  function seoOotCollectibleCounts() {
    $counts = [];
    foreach (ootPackData('markers') ?? [] as $marker) {
      $gameData = json_decode((string) ($marker['gameData'] ?? ''), true) ?: [];
      $key = (string) $marker['mapId'] === '65000' ? ($gameData['areaName'] ?? '') : 'map-' . $marker['mapId'];
      if ($key === '') continue;
      $category = (string) $marker['markerCategoryId'];
      $counts[$key][$category] = ($counts[$key][$category] ?? 0) + 1;
      if ((string) $marker['mapId'] === '65000') $counts['map-65000'][$category] = ($counts['map-65000'][$category] ?? 0) + 1;
    }
    return $counts;
  }

  // "Kakariko Village map for Ocarina of Time Remake: where to find its 4
  // Heart Pieces and 6 Gold Skulltulas." A single one goes unnumbered ("its
  // Heart Piece"). Kept to 150 characters, about what results pages show.
  function seoOotDescription($name, $counts, $floors = false) {
    $labels = ['64002' => ['Heart Piece', 'Heart Pieces'], '64001' => ['Gold Skulltula', 'Gold Skulltulas'], '64003' => ['Big Poe', 'Big Poes']];
    $parts = [];
    foreach ($labels as $id => $label) {
      $count = $counts[$id] ?? 0;
      if ($count) $parts[] = $count === 1 ? $label[0] : $count . ' ' . $label[1];
    }
    $lead = $name . ' map for Ocarina of Time Remake' . ($floors ? ', floor by floor' : '');
    if (!$parts) return $lead . ', on the Zelda Maps interactive map.';
    return $lead . ': where to find its ' . seoList($parts) . '.';
  }

  // One page per Hyrule area (both ages) and one per map (all its floors and
  // water levels): near-identical variant pages would compete with each
  // other. Each page lists every submap it covers and the address keys that
  // reach it (old "zora-s-river" style links included); 'url' is the page's
  // canonical address, which the sitemap lists.
  function seoAreaPages($db = null, $prefix = '') {
    include_once(__DIR__ . '/oot_pack.php');
    $areas=[];
    $counts = seoOotCollectibleCounts();
    $ootAreas = [];
    foreach (ootPackData('maps') ?? [] as $map) {
      $subMaps = array_map(function($submap) { return (string) $submap['id']; }, $map['subMap']);
      $isWorld = (string) $map['id'] === '65000';
      $areas[]=['game'=>'OoT','key'=>'map-'.$map['id'],'keys'=>['map-'.$map['id']],'map'=>$map['id'],'subMap'=>$subMaps[0],
        'subMaps'=>$subMaps,'name'=>$map['name'],'mapName'=>$map['name'],'variant'=>'','isMap'=>true,
        'description'=>seoOotDescription($map['name'], $counts['map-'.$map['id']] ?? [], !$isWorld && count($subMaps) > 1)];
      foreach ($map['subMap'] as $submap) foreach ($submap['placeLabels'] ?? [] as $place) {
        $name=seoPlainText($place['name']);
        $key=seoAreaSlug($name);
        if (!isset($ootAreas[$key])) {
          // The child version leads, when the area exists for both ages.
          $ootAreas[$key]=['game'=>'OoT','key'=>$key,'keys'=>array_values(array_unique([$key, seoSlug($name)])),
            'map'=>$map['id'],'subMap'=>(string) $submap['id'],'subMaps'=>[],'name'=>$name,'mapName'=>$map['name'],'variant'=>'',
            'description'=>seoOotDescription($name, $counts[$name] ?? [])];
        }
        $ootAreas[$key]['subMaps'][] = (string) $submap['id'];
      }
    }
    foreach ($ootAreas as $area) $areas[] = $area;
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
      $area['keys']=$area['keys'] ?? [$area['key']];
      $area['subMaps']=$area['subMaps'] ?? [(string) $area['subMap']];
      $area['variant']=preg_replace('/(?:\s*·\s*)?State\s*\d+/i','',$area['variant']);
      $gameNames=['OoT'=>'Ocarina of Time Remake','BotW'=>'Breath of the Wild','TotK'=>'Tears of the Kingdom','EoW'=>'Echoes of Wisdom','LA'=>"Link's Awakening"];
      if($area['description']==='') $area['description']='Explore '.$area['name'].(empty($area['isMap']) && !empty($area['mapName']) ? ' in '.$area['mapName'] : '').($area['variant'] ? ' ('.$area['variant'].')' : '').
        ' on the '.($gameNames[$area['game']] ?? $area['game']).' interactive map. Find local points of interest and browse markers by category on Zelda Maps.';
      $area['url']='https://zeldamaps.com/?'.http_build_query(['game'=>$area['game']==='OoT' ? 'OoTR' : $area['game'],'map'=>$area['map'],'subMap'=>$area['subMap'],'area'=>$area['key']]);
    }
    unset($area);
    return $areas;
  }
?>
