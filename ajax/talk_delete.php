<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Removes a comment's text, by its author or an admin. The comment keeps
  // its place in the thread as "Comment removed".
  if (!wikiAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to use Talk pages.'));
    return;
  }
  $id = (int) ($_POST['id'] ?? 0);
  $author = $db->fetchOne("SELECT `user_id` FROM `{$map_prefix}talk_comment` WHERE `id` = ? AND `deleted` IS NULL", [$id]);
  if ($author === false) {
    echo json_encode(array('success' => false, 'msg' => 'That comment was not found.'));
    return;
  }
  if ((int) $author !== $editor['id'] && $editor['level'] < WIKI_ADMIN_LEVEL) {
    echo json_encode(array('success' => false, 'msg' => "You can't remove this comment."));
    return;
  }
  $db->executeStatement("UPDATE `{$map_prefix}talk_comment` SET `deleted` = NOW() WHERE `id` = ?", [$id]);
  echo json_encode(array('success' => true));
?>
