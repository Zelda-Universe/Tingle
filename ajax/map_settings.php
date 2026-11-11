<?php
  // A game's maps, sections and categories, and the history of changes made
  // to them, for Map Settings (lib/common/map_settings.php).
  include_once(dirname(__DIR__) . '/lib/common/map_settings.php');
  $editor = mapSettingsRequire($db, $map_prefix);
  if ($editor === null) return;
  if (!mapSettingsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $game = mapSettingsGame($db, $map_prefix, $_GET['game'] ?? '');
  if (!$game) {
    echo json_encode(array('success' => false, 'msg' => 'That game was not found.'));
    return;
  }
  include_once(dirname(__DIR__) . '/lib/common/game_metadata.php');
  $gameSeoDescription=$db->fetchOne("SELECT seo_description FROM `{$map_prefix}container` WHERE id=?",[(int)$game['id']]);
  $gamePageTitle=$db->fetchOne("SELECT page_title FROM `{$map_prefix}container` WHERE id=?",[(int)$game['id']]);
  $maps = $db->fetchAllAssociative(
    "SELECT `id`, `name`, `description`, `seo_description` FROM `{$map_prefix}map` WHERE `container_id` = ? AND `visible` = 1 ORDER BY `map_order`, `id`",
    [(int) $game['id']]
  );
  $categories = $db->fetchAllAssociative(
    "SELECT `id`, `parent_id` AS `parentId`, `marker_category_type_id` AS `typeId`, `name`, `description`, `seo_description`, `img`, `color`, `glyph_color` AS `glyphColor`,
            `shape`, `custom_style` AS `customStyle`, `visible`, `menu_section` AS `menuSection`, `menu_order` AS `menuOrder`
       FROM `{$map_prefix}marker_category` WHERE `container_id` = ? ORDER BY `parent_id`, `id`",
    [(int) $game['id']]
  );
  foreach ($categories as &$category) {
    foreach (['id', 'parentId', 'typeId'] as $key) $category[$key] = $category[$key] === null ? null : (int) $category[$key];
    $category['customStyle'] = (bool) $category['customStyle'];
    $category['visible'] = (bool) $category['visible'];
  }
  unset($category);
  include_once(dirname(__DIR__) . '/lib/common/seo.php');
  $areaPages = seoAreaPages($db, $map_prefix);
  foreach ($maps as &$map) {
    foreach ($areaPages as $area) {
      if (!empty($area['isMap']) && (int)$area['map'] === (int)$map['id']) {
        $map['defaultSeoDescription'] = $area['defaultSeoDescription'] ?? $area['description'];
        break;
      }
    }
  }
  unset($map);
  include_once(dirname(__DIR__) . '/lib/common/seo.php');
  $landing = seoLandingCategories($db, $map_prefix, $game['short_name']);
  $seoNames = ['LA' => "Link's Awakening", 'BotW' => 'Breath of the Wild',
    'TotK' => 'Tears of the Kingdom', 'EoW' => 'Echoes of Wisdom'];
  foreach ($categories as &$category) {
    $entry = $landing[seoSlug(seoPlainText($category['name']))] ?? null;
    $category['defaultSeoDescription'] = seoCategoryDescription($entry ?? [
      'name' => $category['name'], 'count' => 0, 'maps' => []
    ], $game['short_name'], $seoNames[$game['short_name']] ?? $game['name']);
  }
  unset($category);
  $history = $db->fetchAllAssociative("
    SELECT `r`.`id`, `r`.`kind`, `r`.`target_id` AS `targetId`, `r`.`summary`, `r`.`data`,
           (r.id=(SELECT MAX(latest.id) FROM `{$map_prefix}map_revision` latest WHERE latest.container_id=r.container_id AND latest.kind=r.kind AND latest.target_id=r.target_id)) AS isCurrent,
           " . wikiAgoSql('`r`.`created`') . " AS `ago`, `r`.`user_id` AS `userId`, `u`.`username`
      FROM `{$map_prefix}map_revision` `r`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `r`.`user_id`
     WHERE `r`.`container_id` = ? AND r.kind IN ('game','map','category','layout','map_order')
     ORDER BY `r`.`id` DESC
     LIMIT 100
  ", [(int) $game['id']]);
  foreach ($history as &$row) {
    foreach (['id', 'targetId', 'ago', 'userId'] as $key) $row[$key] = (int) $row[$key];
    $row['data'] = json_decode($row['data'], true);
    $row['isCurrent']=(bool)$row['isCurrent'];
  }
  unset($row);
  echo json_encode(array(
    'success' => true,
    'game' => array('id' => (int) $game['id'], 'name' => $game['name'], 'shortName' => $game['short_name'],
      'page_title'=>$gamePageTitle ?: '', 'defaultPageTitle'=>defaultGamePageTitle($game['short_name'],$game['name']),
      'seo_description'=>$gameSeoDescription ?: '', 'defaultSeoDescription'=>defaultGameSeoDescription($game['short_name'])),
    'maps' => array_map(function($m) { $m['id']=(int)$m['id']; return $m; }, $maps),
    'categories' => $categories,
    'history' => $history
  ));
?>
