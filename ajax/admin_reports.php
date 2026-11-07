<?php
  // Admin > Reports: reported edits, open ones first (?status=open, the
  // default, or resolved), each with the edit, its editor's warnings and
  // standing, and who reported it and why.
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;
  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}edit_report'")) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $open = ($_GET['status'] ?? 'open') !== 'resolved';
  $banned = adminHasColumn($db, $map_prefix, 'banned') ? '`e`.`banned` IS NOT NULL' : '0';
  $reports = $db->fetchAllAssociative("
    SELECT `rp`.`id`, `rp`.`reason`, `rp`.`status`, `rp`.`resolution`, " . wikiAgoSql('`rp`.`created`') . " AS `ago`,
           " . wikiAgoSql('`rp`.`resolved`') . " AS `resolvedAgo`,
           `rp`.`reporter_id` AS `reporterId`, `rr`.`username` AS `reporter`,
           `rv`.`id` AS `revisionId`, `rv`.`action`, `rv`.`summary`, `rv`.`marker_id` AS `markerId`,
           `m`.`name` AS `markerTitle`, " . wikiMarkerGamesSql($map_prefix, '`rv`.`marker_id`') . " AS `game`,
           `e`.`id` AS `editorId`, `e`.`username` AS `editor`, `e`.`warnings`, `e`.`level` AS `editorLevel`, {$banned} AS `editorBanned`,
           `ad`.`username` AS `resolvedBy`
      FROM `{$map_prefix}edit_report` `rp`
      JOIN `{$map_prefix}marker_revision` `rv` ON `rv`.`id` = `rp`.`revision_id`
      LEFT JOIN `{$map_prefix}marker` `m` ON `m`.`id` = `rv`.`marker_id`
      LEFT JOIN `{$map_prefix}user` `e` ON `e`.`id` = `rv`.`user_id`
      LEFT JOIN `{$map_prefix}user` `rr` ON `rr`.`id` = `rp`.`reporter_id`
      LEFT JOIN `{$map_prefix}user` `ad` ON `ad`.`id` = `rp`.`resolved_by`
     WHERE `rp`.`status` " . ($open ? "= 'open'" : "<> 'open'") . "
     ORDER BY `rp`.`id` " . ($open ? 'ASC' : 'DESC') . "
     LIMIT 100
  ");
  foreach ($reports as &$report) {
    foreach (['id', 'ago', 'reporterId', 'revisionId', 'markerId', 'editorId', 'warnings', 'editorLevel'] as $key) {
      $report[$key] = $report[$key] === null ? null : (int) $report[$key];
    }
    $report['resolvedAgo'] = $report['resolvedAgo'] === null ? null : (int) $report['resolvedAgo'];
    $report['editorBanned'] = (bool) $report['editorBanned'];
    $report['markerTitle'] = wikiDecode($report['markerTitle']);
  }
  unset($report);
  echo json_encode(array(
    'success' => true, 'reports' => $reports,
    'openCount' => (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}edit_report` WHERE `status` = 'open'")
  ));
?>
