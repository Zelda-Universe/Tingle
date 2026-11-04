<?php
  include_once(dirname(__DIR__) . '/lib/common/notifications.php');
  include_once(dirname(__DIR__) . '/lib/common/push.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Saves (or, with remove=1, forgets) this browser's push subscription.
  if (!pushAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Push notifications aren\'t available yet.'));
    return;
  }
  $endpoint = (string) ($_POST['endpoint'] ?? '');
  $url = parse_url($endpoint);
  if (strlen($endpoint) > 2000 || ($url['scheme'] ?? '') !== 'https' || empty($url['host'])) {
    echo json_encode(array('success' => false, 'msg' => 'That isn\'t a push subscription.'));
    return;
  }
  $hash = hash('sha256', $endpoint);
  if (!empty($_POST['remove'])) {
    $db->executeStatement("DELETE FROM `{$map_prefix}push_subscription` WHERE `endpoint_hash` = ?", [$hash]);
    echo json_encode(array('success' => true));
    return;
  }
  $db->executeStatement("
    INSERT INTO `{$map_prefix}push_subscription` (`user_id`, `endpoint`, `endpoint_hash`, `p256dh`, `auth`, `user_agent`, `created`)
    VALUES (?, ?, ?, ?, ?, ?, NOW())
    ON DUPLICATE KEY UPDATE `user_id` = VALUES(`user_id`), `p256dh` = VALUES(`p256dh`), `auth` = VALUES(`auth`), `user_agent` = VALUES(`user_agent`)
  ", [
    $editor['id'], $endpoint, $hash, substr((string) ($_POST['p256dh'] ?? ''), 0, 255),
    substr((string) ($_POST['auth'] ?? ''), 0, 64), substr((string) ($_SERVER['HTTP_USER_AGENT'] ?? ''), 0, 255)
  ]);
  echo json_encode(array('success' => true));
?>
