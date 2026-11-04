<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // A profile page: banner, picture, bio and recent changes.
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? '`profile_picture`' : 'NULL';
  $bio = wikiHasUserColumn($db, $map_prefix, 'bio') ? '`bio`' : 'NULL';
  $banner = wikiHasUserColumn($db, $map_prefix, 'profile_banner') ? '`profile_banner`' : 'NULL';
  $select = "
    SELECT `id`, `username`, `level`, `created`, " . wikiAgoSql('`created`') . " AS `joinedAgo`,
           {$picture} AS `profilePicture`, {$bio} AS `bio`, {$banner} AS `banner`
      FROM `{$map_prefix}user`
     WHERE `deleted` IS NULL AND ";
  $user = isset($_GET['username']) && is_string($_GET['username'])
    ? $db->fetchAssociative($select . "`username` = ?", [$_GET['username']])
    : $db->fetchAssociative($select . "`id` = ?", [(int) ($_GET['id'] ?? $editor['id'])]);
  if (!$user) {
    echo json_encode(array('success' => false, 'msg' => 'That user was not found.'));
    return;
  }
  foreach (['id', 'level', 'joinedAgo'] as $key) $user[$key] = (int) $user[$key];

  $changes = [];
  $counts = ['edits' => 0, 'comments' => 0];
  if (wikiAvailable($db, $map_prefix)) {
    $changes = $db->fetchAllAssociative("
      SELECT `r`.`id`, `r`.`marker_id` AS `markerId`, `r`.`action`, `r`.`summary`,
             " . wikiAgoSql('`r`.`created`') . " AS `ago`, `m`.`name` AS `markerTitle`,
             " . wikiMarkerGamesSql($map_prefix, '`r`.`marker_id`') . " AS `game`
        FROM `{$map_prefix}marker_revision` `r`
        LEFT JOIN `{$map_prefix}marker` `m` ON `m`.`id` = `r`.`marker_id`
       WHERE `r`.`user_id` = ? AND `r`.`action` <> 'import'
       ORDER BY `r`.`id` DESC
       LIMIT 30
    ", [$user['id']]);
    foreach ($changes as &$change) {
      foreach (['id', 'markerId', 'ago'] as $key) $change[$key] = (int) $change[$key];
      $change['markerTitle'] = wikiDecode($change['markerTitle']);
    }
    unset($change);
    $counts['edits'] = (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$map_prefix}marker_revision` WHERE `user_id` = ? AND `action` <> 'import'", [$user['id']]
    );
    $counts['comments'] = (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$map_prefix}talk_comment` WHERE `user_id` = ? AND `deleted` IS NULL", [$user['id']]
    );
  }
  $counts['markers'] = (int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}marker` WHERE `user_id` = ? AND `visible` = 1", [$user['id']]
  );

  echo json_encode(array(
    'success' => true,
    'user' => $user,
    'counts' => $counts,
    'changes' => $changes,
    'isSelf' => $user['id'] === $editor['id'],
    'canEdit' => $user['id'] === $editor['id'] || $editor['level'] >= WIKI_ADMIN_LEVEL
  ));
?>
