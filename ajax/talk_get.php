<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // A Talk page's comments, oldest first, flat with parent ids; the page
  // threads them. Deleted comments keep their place so replies stay put.
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to use Talk pages.'));
    return;
  }
  $type = (string) ($_GET['pageType'] ?? '');
  $pageId = (int) ($_GET['pageId'] ?? 0);
  if (!wikiTalkPageExists($db, $map_prefix, $type, $pageId)) {
    echo json_encode(array('success' => false, 'msg' => 'That page was not found.'));
    return;
  }
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? '`u`.`profile_picture`' : 'NULL';
  $comments = $db->fetchAllAssociative("
    SELECT `c`.`id`, `c`.`parent_id` AS `parentId`, `c`.`user_id` AS `userId`, `u`.`username`,
           `u`.`level`, {$picture} AS `profilePicture`, `c`.`body`, `c`.`created`,
           " . wikiAgoSql('`c`.`created`') . " AS `ago`, `c`.`deleted` IS NOT NULL AS `deleted`
      FROM `{$map_prefix}talk_comment` `c`
      LEFT JOIN `{$map_prefix}user` `u` ON `u`.`id` = `c`.`user_id`
     WHERE `c`.`page_type` = ? AND `c`.`page_id` = ?
     ORDER BY `c`.`id`
     LIMIT 1000
  ", [$type, $pageId]);
  foreach ($comments as &$comment) {
    foreach (['id', 'parentId', 'userId', 'level', 'ago'] as $key) {
      $comment[$key] = $comment[$key] === null ? null : (int) $comment[$key];
    }
    $comment['deleted'] = (bool) $comment['deleted'];
    $comment['canDelete'] = !$comment['deleted'] &&
      ($comment['userId'] === $editor['id'] || $editor['level'] >= WIKI_ADMIN_LEVEL);
    if ($comment['deleted']) $comment['body'] = null;
  }
  unset($comment);

  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  echo json_encode(array(
    'success' => true, 'comments' => $comments,
    'following' => $type === 'marker' && notificationIsFollowing($db, $map_prefix, $editor['id'], 'marker', $pageId),
    'canFollow' => $type === 'marker' && notificationsAvailable($db, $map_prefix)
  ));
?>
