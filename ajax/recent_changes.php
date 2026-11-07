<?php
  // Recent community edits, newest first, for everyone: every game's (All
  // Changes) or one game's (Recent Changes, ?game=short name). Pages with
  // ?before=revision id. Editors see changes to hidden markers too; everyone
  // else only to markers on the map.
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to keep marker history.'));
    return;
  }
  start_session('zmap');
  $level = (int) ($_SESSION['level'] ?? 0);
  session_write_close();

  $limit = 50;
  $where = ["`r`.`action` <> 'import'", "`c`.`visible` = 1"];
  $params = [];
  if ($level < WIKI_EDITOR_LEVEL) $where[] = "`m`.`visible` = 1";
  $game = (string) ($_GET['game'] ?? '');
  if ($game !== '') {
    $where[] = "`c`.`short_name` = ?";
    $params[] = $game;
  }
  $before = (int) ($_GET['before'] ?? 0);
  if ($before > 0) {
    $where[] = "`r`.`id` < ?";
    $params[] = $before;
  }
  $rows = $db->fetchAllAssociative("
    SELECT `r`.`id`, `r`.`marker_id` AS `markerId`, `r`.`action`, `r`.`summary`,
           `r`.`user_id` AS `userId`, `u`.`username`, " . wikiAgoSql('`r`.`created`') . " AS `ago`,
           `m`.`name` AS `markerTitle`, `c`.`short_name` AS `game`, `c`.`name` AS `gameName`
      FROM `{$map_prefix}marker_revision` `r`
      JOIN `{$map_prefix}marker` `m` ON `m`.`id` = `r`.`marker_id`
      JOIN `{$map_prefix}submap` `s` ON `s`.`id` = `m`.`submap_id`
      JOIN `{$map_prefix}map` `mp` ON `mp`.`id` = `s`.`map_id`
      JOIN `{$map_prefix}container` `c` ON `c`.`id` = `mp`.`container_id`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `r`.`user_id`
     WHERE " . implode(' AND ', $where) . "
     ORDER BY `r`.`id` DESC
     LIMIT " . ($limit + 1), $params);
  $more = count($rows) > $limit;
  $rows = array_slice($rows, 0, $limit);
  foreach ($rows as &$row) {
    foreach (['id', 'markerId', 'userId', 'ago'] as $key) $row[$key] = $row[$key] === null ? null : (int) $row[$key];
    $row['markerTitle'] = wikiDecode($row['markerTitle']);
  }
  unset($row);
  echo json_encode(array('success' => true, 'changes' => $rows, 'more' => $more));
?>
