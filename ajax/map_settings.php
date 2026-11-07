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
  $maps = $db->fetchAllAssociative(
    "SELECT `id`, `name` FROM `{$map_prefix}map` WHERE `container_id` = ? AND `visible` = 1 ORDER BY `map_order`, `id`",
    [(int) $game['id']]
  );
  $categories = $db->fetchAllAssociative(
    "SELECT `id`, `parent_id` AS `parentId`, `marker_category_type_id` AS `typeId`, `name`, `img`, `color`, `glyph_color` AS `glyphColor`,
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
  $history = $db->fetchAllAssociative("
    SELECT `r`.`id`, `r`.`kind`, `r`.`target_id` AS `targetId`, `r`.`summary`, `r`.`data`,
           " . wikiAgoSql('`r`.`created`') . " AS `ago`, `r`.`user_id` AS `userId`, `u`.`username`
      FROM `{$map_prefix}map_revision` `r`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `r`.`user_id`
     WHERE `r`.`container_id` = ?
     ORDER BY `r`.`id` DESC
     LIMIT 100
  ", [(int) $game['id']]);
  foreach ($history as &$row) {
    foreach (['id', 'targetId', 'ago', 'userId'] as $key) $row[$key] = (int) $row[$key];
    $row['data'] = json_decode($row['data'], true);
  }
  unset($row);
  echo json_encode(array(
    'success' => true,
    'game' => array('id' => (int) $game['id'], 'name' => $game['name'], 'shortName' => $game['short_name']),
    'maps' => array_map(function($m) { return array('id' => (int) $m['id'], 'name' => $m['name']); }, $maps),
    'categories' => $categories,
    'history' => $history
  ));
?>
