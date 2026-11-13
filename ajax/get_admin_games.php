<?php
  // Games in progress (container.visible = 2) for the game switcher, shaped
  // like get_games: only for admins, an empty list for everyone else (not a
  // 403, so ordinary visits don't log an error). Never cached in
  // ajax/static, which is shared by everyone.
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/game_order.php');
  if (!adminSignedIn($db, $map_prefix)) {
    echo json_encode(array());
    return;
  }
  $res = $db->fetchAllAssociative("
    SELECT c.id
      , c.short_name AS shortName
      , c.name
      , c.icon
    FROM {$map_prefix}container c
    WHERE c.visible = 2
      AND c.enabled = 1
    ORDER BY " . gameOrderSql('c.short_name') . ", c.id
  ");
  echo json_encode($res);
?>
