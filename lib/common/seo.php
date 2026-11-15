<?php
  include_once(__DIR__ . '/game_order.php');
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

  // Shared by page metadata and the category editor's placeholder.
  function seoCategoryDescription($category, $game, $gameName) {
    $count = number_format($category['count']);
    $maps = $category['maps'];
    if (isOcarina($game)) {
      $dungeons = count(array_diff($maps, ['Hyrule']));
      $where = in_array('Hyrule', $maps, true)
        ? 'across Hyrule' . ($dungeons ? ' and ' . $dungeons . ($dungeons === 1 ? ' dungeon' : ' dungeons') : '')
        : 'across ' . $dungeons . ($dungeons === 1 ? ' dungeon' : ' dungeons');
      return 'All ' . $count . ' ' . $category['name'] . ' in Ocarina of Time Remake, ' . $where . ', on the Zelda Maps interactive map.';
    }
    $where = count($maps) > 1 && count($maps) <= 3
      ? ' across the ' . implode(', ', array_slice($maps, 0, -1)) . ' and ' . end($maps) : '';
    return 'All ' . $count . ' ' . $category['name'] . ' locations' . $where .
      ' in The Legend of Zelda: ' . $gameName . ', on the Zelda Maps interactive map.';
  }

  // [slug => [id, name, slug, count, maps, lastUpdated]] for one game, or for
  // every visible game when $gameShortName is null (keyed by game, then slug).
  // The OoT remake is keyed OoT, index.php's name for it; in the database
  // it's OoTR (OoT there is the old N64 map, which is hidden).
  function seoLandingCategories($db, $prefix, $gameShortName = null) {
    $rows = $db->fetchAllAssociative("
      SELECT IF(LOWER(c.short_name) = 'ootr', 'OoT', c.short_name) AS game, mc.id, mc.name, mc.slug, mc.description, mc.seo_description, COUNT(m.id) AS markers,
             GROUP_CONCAT(DISTINCT mp.name ORDER BY mp.id SEPARATOR '|') AS maps,
             -- Stored in the database's own time zone: converted to UTC, and
             -- as a date only, never later than today, since search engines
             -- reject dates in the future (a time of day could be, by a few
             -- seconds, if their clock and ours disagree).
             DATE_FORMAT(LEAST(MAX(m.last_updated) - INTERVAL TIMESTAMPDIFF(SECOND, UTC_TIMESTAMP(), NOW()) SECOND, UTC_TIMESTAMP()),
                         '%Y-%m-%d') AS last_updated
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
       GROUP BY game, mc.id
       ORDER BY game, mc.id
    ", $gameShortName === null ? [] : [isOcarina($gameShortName) ? 'OoTR' : $gameShortName]);

    $categories = [];
    foreach ($rows as $row) {
      $name = seoPlainText($row['name']);
      $slug = !empty($row['slug']) ? $row['slug'] : seoSlug($name);
      if ($slug === '') continue;
      // Names can repeat within a game; the first with markers wins.
      if (isset($categories[$row['game']][$slug])) continue;
      $categories[$row['game']][$slug] = [
        'id' => (int) $row['id'],
        'name' => $name,
        'description' => seoPlainText($row['description'] ?? ''),
        'seoDescription' => seoPlainText($row['seo_description'] ?? ''),
        'slug' => $slug,
        'count' => (int) $row['markers'],
        'maps' => array_map('seoPlainText', explode('|', $row['maps'])),
        'lastUpdated' => $row['last_updated']
      ];
    }
    if ($gameShortName === null) return $categories;
    return $categories[isOcarina($gameShortName) ? 'OoT' : $gameShortName] ?? [];
  }

  // One OoT marker, for its link preview: [name, categoryId, category, place,
  // details], or null. place is its area (Kakariko Village) or its map.
  function seoOotMarker($db, $prefix, $markerId) {
    $marker = $db->fetchAssociative("
      SELECT m.name, m.marker_category_id AS categoryId, mc.name AS category, m.game_data AS gameData, mp.name AS map,
             (SELECT t.tab_text FROM `{$prefix}marker_tab` t WHERE t.marker_id = m.id AND t.visible = 1
               ORDER BY t.tab_order, t.marker_tab_id LIMIT 1) AS tabText
        FROM `{$prefix}marker` m
        JOIN `{$prefix}marker_category` mc ON mc.id = m.marker_category_id
        JOIN `{$prefix}submap` smp ON smp.id = m.submap_id
        JOIN `{$prefix}map` mp ON mp.id = smp.map_id
        JOIN `{$prefix}container` c ON c.id = mp.container_id
       WHERE m.id = ? AND LOWER(c.short_name) = 'ootr'
         AND m.visible = 1 AND mc.visible = 1 AND smp.visible = 1 AND mp.visible = 1 AND c.visible = 1
    ", [(int) $markerId]);
    if (!$marker) return null;
    $gameData = json_decode((string) ($marker['gameData'] ?? ''), true) ?: [];
    $place = $gameData['areaName'] ?? '';
    if ($place === '') $place = $marker['map'];
    // The first paragraph says where it is and how to get it. Tab text is
    // stored HTML-encoded.
    $tabText = html_entity_decode((string) ($marker['tabText'] ?? ''), ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $details = preg_match('#<p>(.*?)</p>#s', $tabText, $match) ? seoPlainText($match[1]) : '';
    return [
      'name' => seoPlainText($marker['name']), 'categoryId' => (int) $marker['categoryId'],
      'category' => seoPlainText($marker['category']), 'place' => seoPlainText($place), 'details' => $details
    ];
  }

  function seoCategoryUrl($gameShortName, $slug) {
    return 'https://zeldamaps.com/?' . http_build_query(['game' => $gameShortName === 'OoT' ? 'OoTR' : $gameShortName, 'category' => $slug]);
  }

  // Paths' pages (scripts/services/PathEditor.js): official, published
  // paths, once everyone may see them (lib/common/paths.php PATHS_STAGE;
  // none while they're staff-only). $game: a container short name (OoTR,
  // not seo.php's OoT), or null for every game. Each: id, name, slug, game,
  // description (plain text), steps (their names, in order), lastUpdated.
  function seoPathPages($db, $prefix, $game = null, $slug = null) {
    include_once(__DIR__ . '/paths.php');
    if (!pathsVisible(0) || !$db->fetchOne("SHOW TABLES LIKE '{$prefix}path'")) return [];
    $where = $game !== null ? ' AND c.short_name = ?' : '';
    $params = $game !== null ? [$game] : [];
    if ($slug !== null) { $where .= ' AND p.slug = ?'; $params[] = $slug; }
    $paths = $db->fetchAllAssociative("
      SELECT p.id, p.name, p.slug, p.description, p.visibility, c.short_name AS game,
             DATE_FORMAT(GREATEST(COALESCE(p.published_at, 0), COALESCE((SELECT MAX(r.created) FROM `{$prefix}path_revision` r WHERE r.path_id = p.id), 0)), '%Y-%m-%d') AS lastUpdated
        FROM `{$prefix}path` p JOIN `{$prefix}container` c ON c.id = p.container_id
       WHERE p.visible = 1 AND p.scope = 'official' AND " . pathPublishedSql() . " AND c.visible = 1{$where}
       ORDER BY c.short_name, p.id", $params);
    if (!$paths) return [];
    $steps = [];
    foreach ($db->fetchAllAssociative("
      SELECT s.path_id, COALESCE(m.name, s.name) AS name
        FROM `{$prefix}path_step` s LEFT JOIN `{$prefix}marker` m ON m.id = s.marker_id AND m.visible = 1
       WHERE s.path_id IN (" . implode(',', array_map('intval', array_column($paths, 'id'))) . ")
         AND (s.marker_id IS NOT NULL OR s.shown = 1)
       ORDER BY s.path_id, s.step_order") as $step) {
      $name = seoPlainText($step['name']);
      if ($name !== '') $steps[$step['path_id']][] = $name;
    }
    foreach ($paths as &$path) {
      $path['name'] = seoPlainText($path['name']);
      // [[marker:5|Cojiro]] reads as "Cojiro", as notifications read codes.
      $path['description'] = seoPlainText(preg_replace('/\[\[\w+:[^\]|]*\|([^\]]*)\]\]/', '$1', preg_replace('/\[\[\w+:([^\]|]*)\]\]/', '$1', (string) $path['description'])));
      $path['steps'] = $steps[$path['id']] ?? [];
    }
    unset($path);
    return $paths;
  }

  function seoPathUrl($game, $slug) {
    return 'https://zeldamaps.com/?' . http_build_query(['game' => $game, 'path' => $slug]);
  }

  // A path's description for search results and link previews: its own
  // words, and how many steps it takes, within 160 characters.
  function seoPathDescription($path, $gameName) {
    $count = count($path['steps']);
    $tail = $count ? 'A ' . $count . '-step guide on the Zelda Maps interactive map.' : 'A guide on the Zelda Maps interactive map.';
    $own = trim($path['description']);
    if ($own === '') return $path['name'] . ' in ' . $gameName . '. ' . $tail;
    $text = mb_strlen($own) <= 160 - mb_strlen($tail) - 1 ? $own . ' ' . $tail : $own;
    return mb_strimwidth($text, 0, 160, '…', 'UTF-8');
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

  // OoT's collectibles counted per Hyrule area (by name) and per map
  // ("map-<id>"), both ages together: [key => [categoryId => count]].
  // $markers: [mapId, categoryId, areaName]; $worldMapId: Hyrule's map.
  function seoOotCollectibleCounts($markers, $worldMapId) {
    $counts = [];
    foreach ($markers as $marker) {
      $category = (string) $marker['categoryId'];
      $map = 'map-' . $marker['mapId'];
      $counts[$map][$category] = ($counts[$map][$category] ?? 0) + 1;
      $area = (string) $marker['mapId'] === (string) $worldMapId ? ($marker['areaName'] ?? '') : '';
      if ($area !== '') $counts[$area][$category] = ($counts[$area][$category] ?? 0) + 1;
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

  // OoT's area pages, from its rows in the database (seoAreaPages reads
  // them): $maps [id, name, kind, subMaps (ids, in order)], $labels (place
  // names) [name, mapId, subMapId], $markers (collectibles) [mapId,
  // categoryId, areaName].
  // One page per Hyrule area (both ages) and one per map (all its floors and
  // water levels): near-identical variant pages would compete with each
  // other. Each page lists every submap it covers and the address keys that
  // reach it (old "zora-s-river" style links included).
  function seoOotAreaPages($maps, $labels, $markers) {
    $worldMapId = null;
    foreach ($maps as $map) if (($map['kind'] ?? '') === 'world') $worldMapId = (string) $map['id'];
    $counts = seoOotCollectibleCounts($markers, $worldMapId);
    $areas = [];
    $mapNames = [];
    foreach ($maps as $map) {
      $mapNames[(string) $map['id']] = seoPlainText($map['name']);
      $subMaps = array_map('strval', $map['subMaps']);
      $isWorld = (string) $map['id'] === $worldMapId;
      $areas[] = ['game'=>'OoT','key'=>'map-'.$map['id'],'keys'=>['map-'.$map['id']],'map'=>(string) $map['id'],'subMap'=>$subMaps[0],
        'subMaps'=>$subMaps,'name'=>$mapNames[(string) $map['id']],'mapName'=>$mapNames[(string) $map['id']],'variant'=>'','isMap'=>true,
        'description'=>seoOotDescription($mapNames[(string) $map['id']], $counts['map-'.$map['id']] ?? [], !$isWorld && count($subMaps) > 1)];
    }
    $places = [];
    foreach ($labels as $label) {
      $name = seoPlainText($label['name']);
      $key = seoAreaSlug($name);
      if ($key === '') continue;
      if (!isset($places[$key])) {
        // The first age listed (Child) leads, when the area exists for both.
        $places[$key] = ['game'=>'OoT','key'=>$key,'keys'=>array_values(array_unique([$key, seoSlug($name)])),
          'map'=>(string) $label['mapId'],'subMap'=>(string) $label['subMapId'],'subMaps'=>[],'name'=>$name,
          'mapName'=>$mapNames[(string) $label['mapId']] ?? '','variant'=>'',
          'description'=>seoOotDescription($name, $counts[$name] ?? [])];
      }
      if (!in_array((string) $label['subMapId'], $places[$key]['subMaps'], true)) $places[$key]['subMaps'][] = (string) $label['subMapId'];
    }
    return array_merge($areas, array_values($places));
  }

  // Every game's area and map pages (the sitemap lists their 'url', each
  // page's canonical address). OoT's are seoOotAreaPages'; other games get a
  // page per place name and per map variant.
  function seoAreaPages($db = null, $prefix = '') {
    $areas=[];
    if($db) {
      $ootMaps=[];
      foreach($db->fetchAllAssociative("SELECT mp.id, mp.name, mp.kind, sm.id AS subMapId
          FROM `{$prefix}map` mp JOIN `{$prefix}container` c ON c.id=mp.container_id
          JOIN `{$prefix}submap` sm ON sm.map_id=mp.id
          WHERE LOWER(c.short_name)='ootr' AND c.visible=1 AND mp.visible=1 AND sm.visible=1
          ORDER BY mp.kind='world' DESC, mp.id, sm.id") as $row) {
        $ootMaps[$row['id']]=$ootMaps[$row['id']] ?? ['id'=>$row['id'],'name'=>$row['name'],'kind'=>$row['kind'],'subMaps'=>[]];
        $ootMaps[$row['id']]['subMaps'][]=$row['subMapId'];
      }
      $ootRows=function($type) use ($db, $prefix) {
        return $db->fetchAllAssociative("SELECT m.name, sm.map_id AS mapId, m.submap_id AS subMapId,
            m.marker_category_id AS categoryId, m.game_data AS gameData
          FROM `{$prefix}marker` m
          JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id
          JOIN `{$prefix}submap` sm ON sm.id=m.submap_id
          JOIN `{$prefix}map` mp ON mp.id=sm.map_id
          JOIN `{$prefix}container` c ON c.id=mp.container_id
          WHERE LOWER(c.short_name)='ootr' AND mc.marker_category_type_id=? AND m.visible=1 AND mc.visible=1
            AND sm.visible=1 AND mp.visible=1 AND c.visible=1
          ORDER BY m.submap_id, m.id", [$type]);
      };
      $ootMarkers=array_map(function($row) {
        $gameData=json_decode((string) $row['gameData'], true) ?: [];
        return ['mapId'=>$row['mapId'],'categoryId'=>$row['categoryId'],'areaName'=>$gameData['areaName'] ?? ''];
      }, $ootRows(1));
      $areas=seoOotAreaPages(array_values($ootMaps), $ootRows(3), $ootMarkers);
      $rows=$db->fetchAllAssociative("SELECT c.short_name AS game, m.id, m.name, m.description,
          sm.map_id AS mapId, m.submap_id AS subMapId, sm.name AS variant, mp.name AS mapName
        FROM `{$prefix}marker` m
        JOIN `{$prefix}marker_category` mc ON mc.id=m.marker_category_id
        JOIN `{$prefix}submap` sm ON sm.id=m.submap_id
        JOIN `{$prefix}map` mp ON mp.id=sm.map_id
        JOIN `{$prefix}container` c ON c.id=mp.container_id
        WHERE mc.marker_category_type_id=3 AND m.visible=1 AND mc.visible=1 AND sm.visible=1 AND mp.visible=1 AND c.visible=1 AND LOWER(c.short_name) NOT IN ('oot','ootr')");
      foreach($rows as $row) $areas[]=['game'=>$row['game'],'key'=>(string)$row['id'],'map'=>$row['mapId'],
        'subMap'=>$row['subMapId'],'name'=>seoPlainText($row['name']),'mapName'=>seoPlainText($row['mapName']),'variant'=>seoPlainText($row['variant']),
        'description'=>seoPlainText($row['description'])];
      $mapRows=$db->fetchAllAssociative("SELECT c.short_name AS game, mp.id, mp.name, sm.id AS subMapId, sm.name AS variant
        FROM `{$prefix}map` mp JOIN `{$prefix}container` c ON c.id=mp.container_id
        JOIN `{$prefix}submap` sm ON sm.map_id=mp.id WHERE c.visible=1 AND mp.visible=1 AND sm.visible=1 AND LOWER(c.short_name) NOT IN ('oot','ootr')");
      foreach($mapRows as $row) $areas[]=['game'=>$row['game'],'key'=>'map-'.$row['id'],'map'=>$row['id'],
        'subMap'=>$row['subMapId'],'name'=>seoPlainText($row['name']),'mapName'=>seoPlainText($row['name']),
        'variant'=>seoPlainText($row['variant']),'isMap'=>true,'description'=>''];
    }
    $areas=seoFinishAreaPages($areas);
    if($db) {
      $overrides=$db->fetchAllKeyValue("SELECT id, seo_description FROM `{$prefix}map` WHERE seo_description IS NOT NULL AND seo_description<>''");
      foreach($areas as &$area) if(!empty($area['isMap'])) {
        $area['defaultSeoDescription']=$area['description'];
        if(isset($overrides[$area['map']])) $area['description']=seoPlainText($overrides[$area['map']]);
      }
      unset($area);
    }
    return $areas;
  }

  // Fills in what every area page has: its keys and submaps, a description
  // when it has none, and its canonical address ('url').
  function seoFinishAreaPages($areas) {
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
