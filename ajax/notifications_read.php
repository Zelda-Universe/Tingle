<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Marks notifications read: ids[], or all=1.
  if (notificationsAvailable($db, $map_prefix)) {
    if (!empty($_POST['all'])) {
      $db->executeStatement(
        "UPDATE `{$map_prefix}notification` SET `read_at` = NOW() WHERE `user_id` = ? AND `read_at` IS NULL",
        [$editor['id']]
      );
    } else {
      $ids = array_slice(array_values(array_filter(array_map('intval', (array) ($_POST['ids'] ?? [])))), 0, 200);
      if ($ids) {
        $marks = implode(',', array_fill(0, count($ids), '?'));
        $db->executeStatement(
          "UPDATE `{$map_prefix}notification` SET `read_at` = NOW() WHERE `user_id` = ? AND `read_at` IS NULL AND `id` IN ({$marks})",
          array_merge([$editor['id']], $ids)
        );
      }
    }
  }
  echo json_encode(array('success' => true, 'unread' => notificationUnreadCount($db, $map_prefix, $editor['id'])));
?>
