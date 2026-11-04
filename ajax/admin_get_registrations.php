<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // New accounts per month, oldest first.
  $months = $db->fetchAllAssociative("
    SELECT DATE_FORMAT(`created`, '%Y-%m') AS `month`, COUNT(*) AS `count`
      FROM `{$map_prefix}user`
     WHERE `created` IS NOT NULL
     GROUP BY `month`
     ORDER BY `month`
  ");
  $total = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE `deleted` IS NULL");

  echo json_encode(array(
    'success' => true,
    'total' => $total,
    'months' => array_map(function($row) {
      return array('month' => $row['month'], 'count' => (int) $row['count']);
    }, $months)
  ));
?>
