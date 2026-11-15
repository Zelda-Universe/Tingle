<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Adds a comment, or a reply to one, to a marker's, path's or user's Talk page.
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to use Talk pages.'));
    return;
  }
  $type = (string) ($_POST['pageType'] ?? '');
  $pageId = (int) ($_POST['pageId'] ?? 0);
  $parentId = (int) ($_POST['parentId'] ?? 0);
  $body = trim(is_string($_POST['body'] ?? null) ? $_POST['body'] : '');
  // A path's Talk: only for those who may see the path.
  if ($type === 'path') {
    include_once(dirname(__DIR__) . '/lib/common/paths.php');
    if (!pathReadableBy($db, $map_prefix, $pageId, $editor)) $pageId = 0;
  }
  if (!wikiTalkPageExists($db, $map_prefix, $type, $pageId)) {
    echo json_encode(array('success' => false, 'msg' => 'That page was not found.'));
    return;
  }
  if ($body === '') {
    echo json_encode(array('success' => false, 'msg' => 'Write a comment first.'));
    return;
  }
  if (mb_strlen($body) > 5000) {
    echo json_encode(array('success' => false, 'msg' => 'Comments can be up to 5,000 characters.'));
    return;
  }
  if ($parentId) {
    $parentOk = $db->fetchOne(
      "SELECT 1 FROM `{$map_prefix}talk_comment` WHERE `id` = ? AND `page_type` = ? AND `page_id` = ?",
      [$parentId, $type, $pageId]
    );
    if (!$parentOk) {
      echo json_encode(array('success' => false, 'msg' => 'The comment you replied to is gone.'));
      return;
    }
  }
  $recent = (int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}talk_comment` WHERE `user_id` = ? AND `created` > NOW() - INTERVAL 1 MINUTE",
    [$editor['id']]
  );
  if ($recent >= 10) {
    echo json_encode(array('success' => false, 'msg' => 'Slow down a little, then try again.'));
    return;
  }
  $db->executeStatement("
    INSERT INTO `{$map_prefix}talk_comment` (`page_type`, `page_id`, `parent_id`, `user_id`, `body`, `created`)
    VALUES (?, ?, ?, ?, ?, NOW())
  ", [$type, $pageId, $parentId ?: null, $editor['id'], $body]);

  $commentId = (int) $db->lastInsertId();

  // Notifications, and following markers you comment on (unless you've
  // turned that off).
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $following = false;
  if (notificationsAvailable($db, $map_prefix)) {
    if ($type === 'marker' && notificationUserOptions($db, $map_prefix, $editor['id'])['autoFollow']) {
      notificationFollow($db, $map_prefix, $editor['id'], 'marker', $pageId, true);
    }
    $following = $type === 'marker' && notificationIsFollowing($db, $map_prefix, $editor['id'], 'marker', $pageId);
    notifyTalkComment($db, $map_prefix, $editor, $commentId, $type, $pageId, $parentId, $body);
  }

  echo json_encode(array('success' => true, 'id' => $commentId, 'following' => $following));
?>
