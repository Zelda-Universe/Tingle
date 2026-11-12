<?php
  // Saves one change from Map Settings: a map's name (kind=map), or a
  // category's name, look and visibility (kind=category), or a new category
  // (kind=category, id=0). Only the fields sent are changed; the values
  // before and after go in the map's history. A look set here (custom_style:
  // shape, badge colour, glyph colour and icon) wins over the game's built-in
  // style (scripts/util/poiStyle.js). Sections and order are saved by
  // map_settings_layout.php.
  include_once(dirname(__DIR__) . '/lib/common/map_settings.php');
  $editor = mapSettingsRequire($db, $map_prefix);
  if ($editor === null) return;
  if (!mapSettingsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $kind = (string) ($_POST['kind'] ?? '');
  $id = (int) ($_POST['id'] ?? 0);
  $summary = trim(is_string($_POST['summary'] ?? null) ? $_POST['summary'] : '');
  if (mb_strlen($summary) > 255) return $fail('Keep the summary under 255 characters.');
  $text = function($key) {
    if (!isset($_POST[$key]) || !is_string($_POST[$key])) return null;
    return trim($_POST[$key]);
  };
  $shapes = array('circle', 'diamond', 'square', 'arch', 'none');
  // A category as the page loads it (ajax/get_categories.php).
  $categoryRow = function($id) use ($db, $map_prefix) {
    $row = $db->fetchAssociative("SELECT * FROM `{$map_prefix}marker_category` WHERE `id` = ?", [$id]);
    foreach (array('default_checked', 'visible') as $key) $row[$key] = $row[$key] == '1';
    return $row;
  };

  if ($kind === 'game') {
    $row=$db->fetchAssociative("SELECT id,id AS container_id,name,seo_description FROM `{$map_prefix}container` WHERE id=?",[$id]);
    if(!$row) return $fail('That game was not found.');
    $before=['seo_description'=>$row['seo_description'] ?? ''];
    $after=$before;
    $description=$text('seo_description');
    if($description !== null) {
      if(mb_strlen($description)>5000) return $fail('Descriptions must be 5,000 characters or fewer.');
      $after['seo_description']=strip_tags($description);
    }
    $columns=['seo_description'=>'seo_description'];
    $table='container';
  } elseif ($kind === 'map') {
    $row = $db->fetchAssociative("SELECT `id`, `container_id`, `name`, `description`, `seo_description` FROM `{$map_prefix}map` WHERE `id` = ?", [$id]);
    if (!$row) return $fail('That map was not found.');
    $before = array('name' => $row['name'], 'description' => $row['description'] ?? '', 'seo_description' => $row['seo_description'] ?? '');
    $after = $before;
    $name = $text('name');
    if ($name !== null) {
      if ($name === '' || mb_strlen($name) > 45) return $fail('Map names are 1 to 45 characters.');
      $after['name'] = $name;
    }
    foreach (['description', 'seo_description'] as $field) {
      $description = $text($field);
      if ($description !== null) {
        if (mb_strlen($description) > 5000) return $fail('Descriptions must be 5,000 characters or fewer.');
        $after[$field] = strip_tags($description);
      }
    }
    $columns = array('name' => 'name', 'description' => 'description', 'seo_description' => 'seo_description');
    $table = 'map';
  } elseif ($kind === 'category') {
    if ($id === 0) {
      // A new category: its game, and the layout it joins.
      $game = mapSettingsGame($db, $map_prefix, $_POST['game'] ?? '');
      if (!$game) return $fail('That game was not found.');
      $row = array('id' => 0, 'container_id' => (int) $game['id'], 'parent_id' => null, 'name' => '', 'img' => '',
        'description' => '', 'seo_description' => '', 'color' => '', 'glyph_color' => null, 'shape' => null, 'visible' => 1, 'visible_zoom'=>0, 'custom_style' => 0);
    } else {
      $row = $db->fetchAssociative(
        "SELECT `id`, `container_id`, `parent_id`, `name`, `description`, `seo_description`, `img`, `color`, `glyph_color`, `shape`, `visible`, `visible_zoom`, `custom_style`
           FROM `{$map_prefix}marker_category` WHERE `id` = ?",
        [$id]
      );
      if (!$row) return $fail('That category was not found.');
    }
    $before = array('seo_description' => $row['seo_description'] ?? '', 'description' => $row['description'] ?? '', 'name' => $row['name'], 'img' => $row['img'], 'color' => $row['color'],
      'glyphColor' => $row['glyph_color'], 'shape' => $row['shape'], 'visible' => (bool) $row['visible'], 'visible_zoom'=>(int)$row['visible_zoom'], 'customStyle'=>(int)$row['custom_style']);
    $after = $before;
    foreach (['description', 'seo_description'] as $field) {
      $description = $text($field);
      if ($description !== null) {
        if (mb_strlen($description) > 5000) return $fail('Descriptions must be 5,000 characters or fewer.');
        $after[$field] = strip_tags($description);
      }
    }
    $name = $text('name');
    if ($name !== null) {
      if ($name === '' || mb_strlen($name) > 45) return $fail('Names are 1 to 45 characters.');
      $after['name'] = $name;
    }
    if (isset($_POST['visible'])) $after['visible'] = $_POST['visible'] === '1';
    if(isset($_POST['visible_zoom'])) {
      $zoom=filter_var($_POST['visible_zoom'],FILTER_VALIDATE_INT);
      if($zoom===false || $zoom<0 || $zoom>8) return $fail('Choose a zoom level from 0 to 8.');
      $after['visible_zoom']=$zoom;
    }
    // Its look, sent whole once it's been changed here.
    if (($_POST['style'] ?? '') === '1' || $id === 0) {
      $shape = $text('shape');
      if (!in_array($shape, $shapes, true)) return $fail('Choose a shape.');
      $color = strtolower((string) $text('color'));
      $glyph = strtolower((string) $text('glyphColor'));
      if (!preg_match('/^#[0-9a-f]{6}$/', $color) || !preg_match('/^#[0-9a-f]{6}$/', $glyph)) {
        return $fail('Colours are written like #4395f7.');
      }
      $img = (string) $text('img');
      if (!preg_match('/^[A-Za-z0-9_-]{1,45}$/', $img)) return $fail('Choose one of the site\'s icons.');
      $after['shape'] = $shape;
      $after['color'] = $color;
      $after['glyphColor'] = $glyph;
      $after['img'] = $img;
      $after['customStyle']=1;
    }
    if ($id === 0 && $after['name'] === '') return $fail('Give the category a name.');
    $columns = array('name' => 'name', 'img' => 'img', 'color' => 'color', 'glyphColor' => 'glyph_color',
      'shape' => 'shape', 'visible' => 'visible', 'visible_zoom'=>'visible_zoom', 'description' => 'description', 'seo_description' => 'seo_description', 'customStyle'=>'custom_style');
    $table = 'marker_category';
  } else {
    return $fail('Nothing to save.');
  }

  $changed = array_keys(array_filter($after, function($value, $key) use ($before) { return $value !== $before[$key]; }, ARRAY_FILTER_USE_BOTH));
  if (!$changed && $id !== 0) {
    echo json_encode(array('success' => true, 'msg' => 'Nothing changed.', 'changed' => array()));
    return;
  }
  $containerId = (int) $row['container_id'];
  $style = array_intersect($changed, array('img', 'color', 'glyphColor', 'shape'));

  begin();
  if ($id === 0) {
    // It goes at the end of the section chosen (a new one if that's new), and
    // under the same section in the database as the categories already there.
    $section = trim((string) $text('section'));
    if ($section === '' || mb_strlen($section) > 45) { rollback(); return $fail('Choose a section for it.'); }
    $layout = mapSettingsCleanLayout($db, $map_prefix, $containerId, $_POST['layout'] ?? '');
    if (is_string($layout)) { rollback(); return $fail($layout); }
    $neighbours = array();
    foreach ($layout as $group) if ($group['title'] === $section) $neighbours = $group['ids'];
    $parentId = null;
    $zoom = null;
    if ($neighbours) {
      $places = $db->fetchAllAssociative(
        "SELECT `id`, `parent_id`, `visible_zoom` FROM `{$map_prefix}marker_category` WHERE `id` IN (" .
          implode(',', array_map('intval', $neighbours)) . ")"
      );
      $counts = array();
      foreach ($places as $place) {
        $parent = $place['parent_id'] === null ? (int) $place['id'] : (int) $place['parent_id'];
        $counts[$parent] = ($counts[$parent] ?? 0) + 1;
        $zoom = $zoom === null ? (int) $place['visible_zoom'] : min($zoom, (int) $place['visible_zoom']);
      }
      arsort($counts);
      $parentId = (int) array_key_first($counts);
    }
    if ($parentId === null) {
      $parentId = (int) $db->fetchOne(
        "SELECT `id` FROM `{$map_prefix}marker_category` WHERE `container_id` = ? AND `parent_id` IS NULL
            AND `marker_category_type_id` = 1 ORDER BY `id` LIMIT 1",
        [$containerId]
      );
      if (!$parentId) { rollback(); return $fail('This map has no sections to add a category to yet.'); }
    }
    $type = (int) $db->fetchOne("SELECT `marker_category_type_id` FROM `{$map_prefix}marker_category` WHERE `id` = ?", [$parentId]);
    $db->executeStatement(
      "INSERT INTO `{$map_prefix}marker_category`
         (`parent_id`, `marker_category_type_id`, `container_id`, `name`, `default_checked`, `img`, `color`, `glyph_color`,
          `shape`, `visible_zoom`, `visible`, `custom_style`)
       VALUES (?, ?, ?, ?, 1, ?, ?, ?, ?, ?, ?, 1)",
      [$parentId, $type ?: 1, $containerId, $after['name'], $after['img'], $after['color'], $after['glyphColor'],
        $after['shape'], $zoom ?? 0, $after['visible'] ? 1 : 0]
    );
    $id = (int) $db->lastInsertId();
    $db->executeStatement("UPDATE `{$map_prefix}marker_category` SET visible_zoom=? WHERE id=?",[$after['visible_zoom'],$id]);
    $db->executeStatement("UPDATE `{$map_prefix}marker_category` SET `description` = ? WHERE `id` = ?", [$after['description'], $id]);
    $db->executeStatement("UPDATE `{$map_prefix}marker_category` SET `seo_description` = ? WHERE `id` = ?", [$after['seo_description'], $id]);
    $placed = false;
    foreach ($layout as &$group) {
      if ($group['title'] === $section) { $group['ids'][] = $id; $placed = true; }
    }
    unset($group);
    if (!$placed) $layout[] = array('title' => $section, 'ids' => array($id));
    mapSettingsApplyLayout($db, $map_prefix, $containerId, $layout);
    $data = array('name' => $after['name'], 'created' => true, 'section' => $section, 'after' => $after);
  } else {
    $sets = array();
    $params = array();
    foreach ($changed as $key) {
      $sets[] = "`{$columns[$key]}` = ?";
      $params[] = $key === 'visible' ? ($after[$key] ? 1 : 0) : $after[$key];
    }
    if ($kind === 'category' && $style) $sets[] = '`custom_style` = 1';
    $params[] = $id;
    $db->executeStatement("UPDATE `{$map_prefix}{$table}` SET " . implode(', ', $sets) . " WHERE `id` = ?", $params);
    $data = array('name' => $after['name'] ?? $row['name'], 'before' => array_intersect_key($before, array_flip($changed)),
      'after' => array_intersect_key($after, array_flip($changed)));
  }
  mapSettingsRecord($db, $map_prefix, $containerId, $editor['id'], $kind, $id, $summary, $data);
  commit();
  $result = array('success' => true, 'msg' => 'Saved.', 'changed' => $changed, 'values' => $after, 'id' => $id);
  if ($kind === 'category') $result['category'] = $categoryRow($id);
  echo json_encode($result);
?>
