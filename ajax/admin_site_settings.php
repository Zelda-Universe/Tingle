<?php
  // The site's settings (lib/common/site_settings.php), for Admins and up:
  // read them, or (POST name, value) change one.
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/site_settings.php');
  $adminId = adminRequire($db, $map_prefix);
  if ($adminId === null) return;
  if (adminLevel() < ADMIN_ROLE_LEVEL) {
    http_response_code(403);
    echo json_encode(array('success' => false, 'msg' => 'Admins only.'));
    return;
  }
  if (!siteSettingsTable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the site_settings migration to change site settings.', 'settings' => siteSettings($db, $map_prefix)));
    return;
  }
  if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = (string) ($_POST['name'] ?? '');
    if (!isset(SITE_SETTINGS[$name])) { echo json_encode(array('success' => false, 'msg' => 'That isn’t a site setting.')); return; }
    $value = SITE_SETTINGS[$name]['type'] === 'bool' ? (($_POST['value'] ?? '') === '1') : (string) ($_POST['value'] ?? '');
    siteSettingSet($db, $map_prefix, $name, $value, $adminId);
    adminLog($db, $map_prefix, $adminId, $adminId, 'site_setting', array('name' => $name, 'value' => $value));
  }
  echo json_encode(array('success' => true, 'settings' => siteSettings($db, $map_prefix)));
?>
