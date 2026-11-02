<?php
  $path = __DIR__;

  $res = $db->fetchAllAssociative("
    SELECT c.id
      , c.short_name AS shortName
      , c.name
      , c.icon
    FROM {$map_prefix}container c
    WHERE c.visible = 1
      AND c.enabled = 1
    ORDER BY c.id
  ");

  echo json_encode($res);
?>
