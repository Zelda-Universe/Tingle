<?php
  $path = __DIR__;

  $game = $_GET["game"] ?? '';
  if ($game === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $game)) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Must provide the game parameter with an integer!"
    ));
    return;
  }
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminOnlyGameDenied($db, $map_prefix, $game)) { echo json_encode(array()); return; }

  if (file_exists("$path/static/categories_{$game}.json")) {
    readfile("$path/static/categories_{$game}.json");
    return;
  }

  $rows = $db->fetchAllAssociative("
    SELECT *
    FROM `{$map_prefix}marker_category`
    WHERE `container_id` = ?
    ORDER BY
      `parent_id` ASC,
      `id` ASC
  ", [$game]);

  $res = array();
  foreach ($rows as $row) {
    $booleanFieldNames = [
      'default_checked',
      'visible'
    ];
    foreach ($booleanFieldNames as $booleanFieldName) {
      $row[$booleanFieldName] = ($row[$booleanFieldName] == '1');
    }
    $res[] = $row;
  }
  echo json_encode($res);
?>
