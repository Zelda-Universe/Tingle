<?php
  include_once(dirname(__DIR__) . '/lib/common/user_settings.php');

  start_session('zmap');
  if (empty($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(array('success' => false, 'msg' => 'Please log in first.'));
    return;
  }
  $userId = (int) $_SESSION['user_id'];
  session_write_close();

  if (!userSettingsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Settings cannot be saved yet.'));
    return;
  }

  $settings = userSettingsClean(json_decode(is_string($_POST['settings'] ?? null) ? $_POST['settings'] : '', true));
  $db->executeStatement(
    "UPDATE `{$map_prefix}user` SET `settings` = ? WHERE `id` = ? AND `deleted` IS NULL",
    [json_encode($settings), $userId]
  );
  echo json_encode(array('success' => true, 'settings' => (object) $settings));
?>
