<?php
  // Where sign-ups come from: the prompts that offer registration (Bookmark,
  // Complete) and the Account button, with anonymous counts of what people
  // choose at each prompt. Tables from the track_signups migration.

  function signupFeatures() {
    return array(
      'bookmark' => 'Bookmark',
      'complete' => 'Complete',
      'account'  => 'Account button'
    );
  }

  function signupEvents() {
    // shown → register (tapped Register) → registered; later, never and
    // signed_in (had an account already) are the other ways out.
    // reminder_* are Complete's later prompts (shown, Register, Maybe Later).
    return array('prompt_shown', 'prompt_register', 'prompt_later', 'prompt_never', 'registered', 'signed_in',
      'reminder_shown', 'reminder_register', 'reminder_dismiss');
  }

  function signupsAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) {
      $available = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}feature_event'")
        && (bool) $db->fetchOne("SHOW COLUMNS FROM `{$prefix}feature_event` LIKE 'variant'")
        && (bool) $db->fetchOne("SHOW COLUMNS FROM `{$prefix}user` LIKE 'signup_source'");
    }
    return $available;
  }

  // Changes daily, so rows can't be linked across days or back to an address.
  function signupIpHash() {
    $ip = (string) ($_SERVER['REMOTE_ADDR'] ?? '');
    return hash('sha256', $ip . '|' . gmdate('Y-m-d') . '|' . __DIR__);
  }

  // A/B groups a prompt can be in (Complete's reminder timing).
  function signupVariants() {
    return array('milestone' => 'Milestones', 'visit' => 'Once a visit');
  }

  function signupRecord($db, $prefix, $event, $feature, $variant = null) {
    if (!signupsAvailable($db, $prefix)) return false;
    if (!in_array($event, signupEvents(), true) || !isset(signupFeatures()[$feature])) return false;
    if (!isset(signupVariants()[(string) $variant])) $variant = null;
    $hash = signupIpHash();
    // Enough for anyone using the site; not for someone filling the table.
    $recent = (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$prefix}feature_event` WHERE `ip_hash` = ? AND `created` > NOW() - INTERVAL 1 HOUR",
      [$hash]
    );
    if ($recent >= 60) return false;
    $db->executeStatement(
      "INSERT INTO `{$prefix}feature_event` (`event`, `feature`, `variant`, `ip_hash`, `created`) VALUES (?, ?, ?, ?, NOW())",
      [$event, $feature, $variant, $hash]
    );
    return true;
  }
?>
