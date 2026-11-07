<?php
  // Saves the category list's layout from Map Settings (its Save Changes
  // button): its sections, in order, and the categories in each, with what
  // changed in words. Saved as each category's menu_section and
  // menu_order (lib/common/map_settings.php), with the layouts before and
  // after in the map's history.
  include_once(dirname(__DIR__) . '/lib/common/map_settings.php');
  $editor = mapSettingsRequire($db, $map_prefix);
  if ($editor === null) return;
  if (!mapSettingsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $game = mapSettingsGame($db, $map_prefix, $_POST['game'] ?? '');
  if (!$game) return $fail('That game was not found.');
  $containerId = (int) $game['id'];
  $layout = mapSettingsCleanLayout($db, $map_prefix, $containerId, $_POST['layout'] ?? '');
  if (is_string($layout)) return $fail($layout);
  // What changed, in words, from the page (for the history).
  $changes = json_decode(is_string($_POST['changes'] ?? null) ? $_POST['changes'] : '[]', true);
  $changes = array_slice(array_values(array_filter(is_array($changes) ? $changes : array(), 'is_string')), 0, 50);
  $changes = array_map(function($text) { return mb_substr(trim($text), 0, 200); }, $changes);

  begin();
  $before = mapSettingsLayout($db, $map_prefix, $containerId);
  if ($before === $layout) {
    rollback();
    echo json_encode(array('success' => true, 'msg' => 'Nothing changed.', 'changed' => false));
    return;
  }
  mapSettingsApplyLayout($db, $map_prefix, $containerId, $layout);
  mapSettingsRecord($db, $map_prefix, $containerId, $editor['id'], 'layout', 0, '',
    array('name' => 'Category list', 'changes' => $changes, 'before' => $before, 'after' => $layout));
  commit();
  echo json_encode(array('success' => true, 'msg' => 'Saved.', 'changed' => true));
?>
