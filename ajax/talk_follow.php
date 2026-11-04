<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Follows or unfollows a marker's Talk page.
  if (!notificationsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_notifications migration to follow markers.'));
    return;
  }
  $markerId = (int) ($_POST['pageId'] ?? 0);
  if (($_POST['pageType'] ?? 'marker') !== 'marker' || !wikiTalkPageExists($db, $map_prefix, 'marker', $markerId)) {
    echo json_encode(array('success' => false, 'msg' => 'That marker was not found.'));
    return;
  }
  $follow = ($_POST['follow'] ?? '1') === '1';
  notificationFollow($db, $map_prefix, $editor['id'], 'marker', $markerId, $follow);
  echo json_encode(array('success' => true, 'following' => $follow));
?>
