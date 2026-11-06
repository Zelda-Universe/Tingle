<?php
  // Map settings saved to an account, as a small JSON object of on/off values.
  // Matches the settings panel in scripts/controls/SettingsControl.js.

  const USER_SETTING_KEYS = [
    'showCompleted',
    'showPoiLabels',
    'showRegionAreaNames',
    'showRegionBorders',
    'showCategoryCompletionCounts',
    'minimalUI'
  ];

  // Known keys only, as booleans; anything else is dropped.
  function userSettingsClean($settings) {
    $clean = [];
    if (!is_array($settings)) return $clean;
    foreach (USER_SETTING_KEYS as $key) {
      if (array_key_exists($key, $settings) && is_bool($settings[$key])) {
        $clean[$key] = $settings[$key];
      }
    }
    return $clean;
  }

  function userSettingsAvailable($db, $prefix) {
    return (bool) $db->fetchOne("SHOW COLUMNS FROM `{$prefix}user` LIKE 'settings'");
  }

  // The account's settings, or null when none have been saved yet.
  function userSettingsLoad($db, $prefix, $userId) {
    if (!userSettingsAvailable($db, $prefix)) return null;
    $json = $db->fetchOne("SELECT `settings` FROM `{$prefix}user` WHERE `id` = ?", [(int) $userId]);
    if (!$json) return null;
    $settings = userSettingsClean(json_decode($json, true));
    return $settings ?: null;
  }
?>
