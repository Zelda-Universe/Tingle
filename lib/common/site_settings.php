<?php
  // Settings for the whole site, changed by admins (Admin, level 15, and
  // up) in the admin panel's Settings (ajax/admin_site_settings.php) and
  // given to every page as it loads (index.php: window.zmapSiteSettings).
  // Each setting's default stands until it's changed; with no table yet
  // (its migration not run), every setting is its default.
  const SITE_SETTINGS = array(
    // Switching games without a page load (scripts/services/GameSwitch.js),
    // for everyone. Off: as always, each game's a page load (staff can
    // still try it in their own browser, from Settings).
    'gameSwitch' => array('type' => 'bool', 'default' => false),
  );

  function siteSettingsTable($db, $prefix) {
    try { return (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}site_setting'"); }
    catch (Throwable $e) { return false; }
  }

  function siteSettingValue($definition, $raw) {
    if ($definition['type'] === 'bool') return $raw === '1' || $raw === 1 || $raw === true;
    return (string) $raw;
  }

  // Every setting, as its value (its default unless changed).
  function siteSettings($db, $prefix) {
    $settings = array();
    foreach (SITE_SETTINGS as $name => $definition) $settings[$name] = $definition['default'];
    if (!$db || !siteSettingsTable($db, $prefix)) return $settings;
    try {
      foreach ($db->fetchAllAssociative("SELECT `name`, `value` FROM `{$prefix}site_setting`") as $row) {
        if (isset(SITE_SETTINGS[$row['name']])) $settings[$row['name']] = siteSettingValue(SITE_SETTINGS[$row['name']], $row['value']);
      }
    } catch (Throwable $e) {}
    return $settings;
  }

  // Changes one; false if it isn't a setting or there's nowhere to keep it.
  function siteSettingSet($db, $prefix, $name, $value, $userId) {
    if (!isset(SITE_SETTINGS[$name]) || !siteSettingsTable($db, $prefix)) return false;
    $stored = SITE_SETTINGS[$name]['type'] === 'bool' ? ($value ? '1' : '0') : mb_substr((string) $value, 0, 255);
    $db->executeStatement(
      "INSERT INTO `{$prefix}site_setting` (`name`, `value`, `updated`, `updated_by`) VALUES (?, ?, NOW(), ?)
       ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated` = VALUES(`updated`), `updated_by` = VALUES(`updated_by`)",
      [$name, $stored, (int) $userId]
    );
    return true;
  }
?>
