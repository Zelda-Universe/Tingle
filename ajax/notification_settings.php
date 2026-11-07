<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  include_once(dirname(__DIR__) . '/lib/common/push.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Notification settings. GET reads them; POST saves one kind
  // (type, inApp, email) or an option (autoFollow, followsPaused).
  if (!notificationsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_notifications migration to use notifications.'));
    return;
  }
  // Admins' kinds (reports) are only offered to admins.
  $types = array_filter(notificationTypes(), function($info) use ($editor) {
    return empty($info['admin']) || $editor['level'] >= WIKI_ADMIN_LEVEL;
  });
  if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $type = (string) ($_POST['type'] ?? '');
    if (isset($types[$type])) {
      $db->executeStatement("
        INSERT INTO `{$map_prefix}notification_setting` (`user_id`, `type`, `in_app`, `email`) VALUES (?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE `in_app` = VALUES(`in_app`), `email` = VALUES(`email`)
      ", [$editor['id'], $type, !empty($_POST['inApp']) ? 1 : 0, !empty($_POST['email']) ? 1 : 0]);
    }
    foreach (['autoFollow' => 'notify_auto_follow', 'followsPaused' => 'notify_follows_paused'] as $key => $column) {
      if (isset($_POST[$key])) {
        $db->executeStatement(
          "UPDATE `{$map_prefix}user` SET `{$column}` = ? WHERE `id` = ?",
          [$_POST[$key] === '1' ? 1 : 0, $editor['id']]
        );
      }
    }
  }
  $push = array('available' => false);
  try {
    if (pushAvailable($db, $map_prefix)) $push = array('available' => true, 'publicKey' => pushVapidKeys($db, $map_prefix)['public']);
  } catch (\Throwable $e) {
    error_log('notification_settings: ' . $e->getMessage());
  }
  global $mailEnabled;
  echo json_encode(array(
    'success' => true,
    'types' => array_map(function($type, $info) {
      return array('type' => $type, 'label' => $info['label'], 'hint' => $info['hint'] ?? null, 'group' => $info['group']);
    }, array_keys($types), $types),
    'settings' => notificationSettings($db, $map_prefix, $editor['id']),
    'options' => notificationUserOptions($db, $map_prefix, $editor['id']),
    'followCount' => (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}talk_follow` WHERE `user_id` = ?", [$editor['id']]),
    'emailEnabled' => !empty($mailEnabled),
    'push' => $push
  ));
?>
