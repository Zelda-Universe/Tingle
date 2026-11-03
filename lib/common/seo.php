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
    return 'https://zeldamaps.com/?' . http_build_query(['game' => $gameShortName, 'category' => $slug]);
  }
?>
