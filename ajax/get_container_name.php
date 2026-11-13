<?php
  // debug_log("get_container_name START");

  $path = __DIR__;

  $game = $_GET["game"] ?? '';
  if ($game === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $game)) {
    print(json_encode(array(
      "success" => false,
      "result"  => 'No game parameter given.'
    )));

    return 1;
  }
  // debug_log("game: $game");

  if (file_exists("$path/ajax/static/container_name_{$game}.json")) {
    readfile("$path/ajax/static/container_name_{$game}.json");
    return;
  }
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminOnlyGameDenied($db, $map_prefix, $game)) { echo json_encode(array()); return; }

  $row = $db->fetchAssociative("
    SELECT `name`
    FROM `{$map_prefix}container` `c`
    WHERE (
            `c`.`id`          = ?
        OR  `c`.`short_name`  = ?
      ) AND `c`.`visible`     = '1'
  ", [$game, $game]);

  if (empty($row)) {
    print(json_encode(array(
      "success" => false,
      "result"  => 'No visible game container found.'
    )));

    return 3;
  }

  print(json_encode(array(
    "success" => true,
    "name"    => $row['name']
  )));

  // debug_log("get_container_name END");
?>
