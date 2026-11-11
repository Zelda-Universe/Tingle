<?php
  // Map Settings: Contributors and Admins (level 5+, not the editing beta's
  // testers) rename a game's maps and sections, and rename, move and restyle
  // its categories. Every change goes in map_revision, the map's history.
  include_once(__DIR__ . '/wiki.php');

  // The signed-in Contributor or Admin as [id, level], or null after
  // answering 403.
  function mapSettingsRequire($db, $prefix) {
    start_session('zmap');
    $userId = (int) ($_SESSION['user_id'] ?? 0);
    session_write_close();
    $role = $userId ? accountRole($db, $prefix, $userId) : false;
    if (!$role || $role[0] < WIKI_EDITOR_LEVEL || $role[1]) {
      http_response_code(403);
      echo json_encode(array('success' => false, 'msg' => 'Game Settings are for Contributors and Admins.'));
      return null;
    }
    return array('id' => $userId, 'level' => $role[0]);
  }

  function mapSettingsAvailable($db, $prefix) {
    return (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}map_revision'");
  }

  // A game by id or short name: [id, name, short_name], or false.
  function mapSettingsGame($db, $prefix, $game) {
    return $db->fetchAssociative(
      "SELECT `id`, `name`, `short_name` FROM `{$prefix}container` WHERE `id` = ? OR `short_name` = ? LIMIT 1",
      [ctype_digit((string) $game) ? (int) $game : 0, (string) $game]
    );
  }

  // One change, in the map's history.
  function mapSettingsRecord($db, $prefix, $containerId, $userId, $kind, $targetId, $summary, $data) {
    $db->executeStatement(
      "INSERT INTO `{$prefix}map_revision` (`container_id`, `user_id`, `kind`, `target_id`, `summary`, `data`, `created`)
       VALUES (?, ?, ?, ?, ?, ?, NOW())",
      [(int) $containerId, (int) $userId, $kind, (int) $targetId, $summary !== '' ? $summary : null, json_encode($data)]
    );
  }

  // The category list's layout as saved: [{title, ids}], in order, or null
  // while the game still uses its built-in one (scripts/util/poiStyle.js).
  function mapSettingsLayout($db, $prefix, $containerId) {
    $rows = $db->fetchAllAssociative(
      "SELECT `id`, `menu_section` FROM `{$prefix}marker_category`
        WHERE `container_id` = ? AND `menu_section` IS NOT NULL ORDER BY `menu_order`, `id`",
      [(int) $containerId]
    );
    if (!$rows) return null;
    $layout = array();
    $index = array();
    foreach ($rows as $row) {
      $title = $row['menu_section'];
      if (!isset($index[$title])) {
        $index[$title] = count($layout);
        $layout[] = array('title' => $title, 'ids' => array());
      }
      $layout[$index[$title]]['ids'][] = (int) $row['id'];
    }
    return $layout;
  }

  // A layout sent from Map Settings, checked: sections of 1 to 45 characters
  // and each of this game's categories at most once. The cleaned layout, or
  // a message saying what's wrong.
  function mapSettingsCleanLayout($db, $prefix, $containerId, $raw) {
    $layout = is_string($raw) ? json_decode($raw, true) : null;
    if (!is_array($layout) || !$layout || count($layout) > 100) return 'That layout couldn\'t be read.';
    $known = array_flip(array_map('intval', $db->fetchFirstColumn(
      "SELECT `id` FROM `{$prefix}marker_category` WHERE `container_id` = ?", [(int) $containerId]
    )));
    $seen = array();
    $clean = array();
    foreach ($layout as $section) {
      $title = trim((string) ($section['title'] ?? ''));
      if ($title === '' || mb_strlen($title) > 45) return 'Section names are 1 to 45 characters.';
      $ids = array();
      foreach ((array) ($section['ids'] ?? array()) as $id) {
        $id = (int) $id;
        if (!isset($known[$id])) return 'That category isn\'t one of this map\'s.';
        if (isset($seen[$id])) return 'A category can only be in one section.';
        $seen[$id] = true;
        $ids[] = $id;
      }
      // A section left with no categories goes (sections are their categories').
      if ($ids) $clean[] = array('title' => $title, 'ids' => $ids);
    }
    if (!$clean) return 'Keep at least one category in the list.';
    return $clean;
  }

  // Saves a layout: each category's section and place in the list. Categories
  // left out keep no section, and are listed after the rest.
  function mapSettingsApplyLayout($db, $prefix, $containerId, $layout) {
    $db->executeStatement(
      "UPDATE `{$prefix}marker_category` SET `menu_section` = NULL, `menu_order` = NULL WHERE `container_id` = ?",
      [(int) $containerId]
    );
    $order = 0;
    foreach ($layout as $section) {
      foreach ($section['ids'] as $id) {
        $db->executeStatement(
          "UPDATE `{$prefix}marker_category` SET `menu_section` = ?, `menu_order` = ? WHERE `id` = ? AND `container_id` = ?",
          [$section['title'], ++$order, $id, (int) $containerId]
        );
      }
    }
  }
?>
