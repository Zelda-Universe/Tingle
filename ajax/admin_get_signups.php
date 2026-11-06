<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  include_once(dirname(__DIR__) . '/lib/common/signups.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // Admin's Sign-Up Sources: for each place registration is offered, how
  // often the prompt was shown, what people chose, and how many accounts it
  // made, over a range. Then how widely features are used.
  // The Accounts graph's time frames (admin_get_stats.php).
  $ranges = ['7d' => 7, '14d' => 14, '30d' => 30, '6m' => 182, '1y' => 365, 'all' => null];
  $range = array_key_exists($_GET['range'] ?? '', $ranges) ? $_GET['range'] : '30d';
  $days = $ranges[$range];
  $since = $days === null ? '1970-01-01' : $db->fetchOne("SELECT DATE(NOW() - INTERVAL ? DAY)", [$days - 1]);

  $available = signupsAvailable($db, $map_prefix);
  $sources = array();
  foreach (signupFeatures() as $feature => $label) {
    $sources[$feature] = array('feature' => $feature, 'label' => $label, 'registrations' => 0,
      'events' => array_fill_keys(signupEvents(), 0));
  }
  $untracked = 0;
  $total = (int) $db->fetchOne(
    "SELECT COUNT(*) FROM `{$map_prefix}user` WHERE `created` >= ? AND `deleted` IS NULL", [$since]
  );
  if ($available) {
    foreach ($db->fetchAllAssociative("
      SELECT `signup_source` AS `source`, COUNT(*) AS `n` FROM `{$map_prefix}user`
       WHERE `created` >= ? AND `deleted` IS NULL GROUP BY `signup_source`
    ", [$since]) as $row) {
      if ($row['source'] !== null && isset($sources[$row['source']])) $sources[$row['source']]['registrations'] = (int) $row['n'];
      else $untracked += (int) $row['n'];
    }
    foreach ($db->fetchAllAssociative("
      SELECT `feature`, `event`, COUNT(*) AS `n` FROM `{$map_prefix}feature_event`
       WHERE `created` >= ? GROUP BY `feature`, `event`
    ", [$since]) as $row) {
      if (isset($sources[$row['feature']]['events'][$row['event']])) $sources[$row['feature']]['events'][$row['event']] = (int) $row['n'];
    }
  } else {
    $untracked = $total;
  }
  $tracking = $available ? $db->fetchOne("SELECT MIN(`created`) FROM `{$map_prefix}feature_event`") : null;

  // Complete's A/B test of reminder timing. A device's first prompt (at 3
  // completes) shows once in either group, so it counts the devices in each.
  $experiment = array();
  if ($available) {
    foreach (signupVariants() as $variant => $label) {
      $experiment[$variant] = array('variant' => $variant, 'label' => $label,
        'devices' => 0, 'reminders' => 0, 'register' => 0, 'later' => 0, 'signedIn' => 0, 'registrations' => 0);
    }
    foreach ($db->fetchAllAssociative("
      SELECT `variant`, `event`, COUNT(*) AS `n` FROM `{$map_prefix}feature_event`
       WHERE `feature` = 'complete' AND `variant` IS NOT NULL AND `created` >= ?
       GROUP BY `variant`, `event`
    ", [$since]) as $row) {
      if (!isset($experiment[$row['variant']])) continue;
      $n = (int) $row['n'];
      $key = ['prompt_shown' => 'devices', 'reminder_shown' => 'reminders', 'prompt_register' => 'register',
        'reminder_register' => 'register', 'prompt_later' => 'later', 'reminder_dismiss' => 'later',
        'signed_in' => 'signedIn'][$row['event']] ?? null;
      if ($key) $experiment[$row['variant']][$key] += $n;
    }
    foreach ($db->fetchAllAssociative("
      SELECT `signup_variant` AS `variant`, COUNT(*) AS `n` FROM `{$map_prefix}user`
       WHERE `signup_source` = 'complete' AND `signup_variant` IS NOT NULL AND `created` >= ? AND `deleted` IS NULL
       GROUP BY `signup_variant`
    ", [$since]) as $row) {
      if (isset($experiment[$row['variant']])) $experiment[$row['variant']]['registrations'] = (int) $row['n'];
    }
    $experiment = array_values($experiment);
  }

  // Feature usage, all time: how many people use each, and how much.
  $usage = array();
  $count = function($sql) use ($db) {
    try { return (int) $db->fetchOne($sql); } catch (\Throwable $e) { return null; }
  };
  $has = function($table) use ($db, $map_prefix) {
    return (bool) $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}{$table}'");
  };
  if ($has('user_bookmark')) {
    $usage[] = array('label' => 'Bookmarks', 'people' => $count("SELECT COUNT(DISTINCT `user_id`) FROM `{$map_prefix}user_bookmark`"),
      'items' => $count("SELECT COUNT(*) FROM `{$map_prefix}user_bookmark`"), 'unit' => 'bookmarks');
  }
  // No completed markers here: counting people across that table (tens of
  // millions of rows) on every visit isn't worth it. Completes & Bookmarks
  // covers them, cached.
  if ($has('push_subscription')) {
    $usage[] = array('label' => 'Push notifications', 'people' => $count("SELECT COUNT(DISTINCT `user_id`) FROM `{$map_prefix}push_subscription`"),
      'items' => $count("SELECT COUNT(*) FROM `{$map_prefix}push_subscription`"), 'unit' => 'devices');
  }
  if ($has('talk_comment')) {
    $usage[] = array('label' => 'Talk comments', 'people' => $count("SELECT COUNT(DISTINCT `user_id`) FROM `{$map_prefix}talk_comment` WHERE `deleted` IS NULL"),
      'items' => $count("SELECT COUNT(*) FROM `{$map_prefix}talk_comment` WHERE `deleted` IS NULL"), 'unit' => 'comments');
  }
  if ($has('marker_revision')) {
    $usage[] = array('label' => 'Marker edits', 'people' => $count("SELECT COUNT(DISTINCT `user_id`) FROM `{$map_prefix}marker_revision` WHERE `action` <> 'import'"),
      'items' => $count("SELECT COUNT(*) FROM `{$map_prefix}marker_revision` WHERE `action` <> 'import'"), 'unit' => 'edits');
  }

  echo json_encode(array(
    'success' => true, 'range' => $range, 'available' => $available,
    'total' => $total, 'untracked' => $untracked, 'trackingSince' => $tracking,
    'sources' => array_values($sources), 'usage' => $usage, 'experiment' => $experiment,
    'accounts' => (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE `deleted` IS NULL")
  ));
?>
