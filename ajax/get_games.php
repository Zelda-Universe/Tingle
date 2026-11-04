<?php
  $path = __DIR__;
  if (file_exists("$path/static/games.json")) {
    readfile("$path/static/games.json");
    return;
  }

  include_once(dirname(__DIR__) . '/lib/common/game_order.php');
  $res = $db->fetchAllAssociative("
    SELECT c.id
      , c.short_name AS shortName
      , c.name
      , c.icon
    FROM {$map_prefix}container c
    WHERE c.visible = 1
      AND c.enabled = 1
    ORDER BY " . gameOrderSql('c.short_name') . ", c.id
  ");

  echo json_encode($res);
?>
