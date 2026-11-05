<?php
  $path = __DIR__;
  include_once(dirname(__DIR__) . '/lib/common/oot_pack.php');
  if (file_exists("$path/static/games.json")) {
    echo json_encode(ootPackAppendGame(json_decode(file_get_contents("$path/static/games.json"), true, 512, JSON_THROW_ON_ERROR)));
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

  echo json_encode(ootPackAppendGame($res));
?>
