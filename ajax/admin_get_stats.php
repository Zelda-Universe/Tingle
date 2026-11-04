<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // The graph: new accounts or active accounts per day, week or month over
  // the chosen range. Active means signed in or visited (user_activity).
  $ranges = [
    '7d'  => ['days' => 7,   'bucket' => 'day'],
    '14d' => ['days' => 14,  'bucket' => 'day'],
    '30d' => ['days' => 30,  'bucket' => 'day'],
    '6m'  => ['days' => 182, 'bucket' => 'week'],
    '1y'  => ['days' => 365, 'bucket' => 'week'],
    'all' => ['days' => null, 'bucket' => 'month']
  ];
  $range = isset($ranges[$_GET['range'] ?? '']) ? $_GET['range'] : '30d';
  $metric = ($_GET['metric'] ?? '') === 'active' ? 'active' : 'registrations';
  $bucket = $ranges[$range]['bucket'];

  $hasActivity = (bool) $db->fetchOne("SHOW TABLES LIKE '{$map_prefix}user_activity'");
  if ($metric === 'registrations') {
    $table = "`{$map_prefix}user`"; $column = '`created`'; $count = 'COUNT(*)';
  } else {
    $table = "`{$map_prefix}user_activity`"; $column = '`day`'; $count = 'COUNT(DISTINCT `user_id`)';
  }
  // SQL bucket keys, matched by the PHP keys below.
  $sqlKey = [
    'day' => "DATE_FORMAT($column, '%Y-%m-%d')",
    'week' => "DATE_FORMAT(DATE_SUB(DATE($column), INTERVAL WEEKDAY($column) DAY), '%Y-%m-%d')",
    'month' => "DATE_FORMAT($column, '%Y-%m')"
  ][$bucket];

  // MySQL's date, which user_activity records, rather than PHP's time zone.
  $today = new DateTimeImmutable($db->fetchOne('SELECT CURDATE()'));
  if ($ranges[$range]['days'] === null) {
    $first = $metric === 'active' && !$hasActivity ? null
      : $db->fetchOne("SELECT MIN($column) FROM $table WHERE $column IS NOT NULL");
    $start = new DateTimeImmutable($first ? substr($first, 0, 7) . '-01' : $today->format('Y-m-01'));
  } else {
    $start = $today->modify('-' . ($ranges[$range]['days'] - 1) . ' days');
  }
  if ($bucket === 'week') $start = $start->modify('monday this week');
  if ($bucket === 'month') $start = $start->modify('first day of this month');

  $counts = [];
  if ($metric === 'registrations' || $hasActivity) {
    foreach ($db->fetchAllAssociative(
      "SELECT $sqlKey AS `bucket`, $count AS `count` FROM $table WHERE $column >= ? GROUP BY `bucket`",
      [$start->format('Y-m-d')]
    ) as $row) {
      $counts[$row['bucket']] = (int) $row['count'];
    }
  }

  // Every bucket in the range, including empty ones.
  $buckets = [];
  $step = ['day' => '+1 day', 'week' => '+1 week', 'month' => '+1 month'][$bucket];
  for ($at = $start; $at <= $today; $at = $at->modify($step)) {
    $key = $at->format($bucket === 'month' ? 'Y-m' : 'Y-m-d');
    $buckets[] = [
      'start' => $at->format('Y-m-d'),
      'label' => $at->format($bucket === 'month' ? 'M Y' : 'M j'),
      'count' => $counts[$key] ?? 0
    ];
  }

  // The boxes: active accounts over the last complete day, 7 days and 30
  // days, each against the period before it.
  $activeBetween = function($from, $to) use ($db, $map_prefix, $hasActivity) {
    if (!$hasActivity) return 0;
    return (int) $db->fetchOne(
      "SELECT COUNT(DISTINCT `user_id`) FROM `{$map_prefix}user_activity` WHERE `day` BETWEEN ? AND ?",
      [$from->format('Y-m-d'), $to->format('Y-m-d')]
    );
  };
  $yesterday = $today->modify('-1 day');
  $summary = [];
  foreach (['daily' => 1, 'weekly' => 7, 'monthly' => 30] as $name => $days) {
    $end = $yesterday;
    $summary[$name] = [
      'current' => $activeBetween($end->modify('-' . ($days - 1) . ' days'), $end),
      'previous' => $activeBetween($end->modify('-' . (2 * $days - 1) . ' days'), $end->modify("-$days days"))
    ];
  }

  echo json_encode(array(
    'success' => true,
    'range' => $range,
    'metric' => $metric,
    'bucket' => $bucket,
    'total' => (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE `deleted` IS NULL"),
    'buckets' => $buckets,
    'summary' => $summary,
    'tracking' => $hasActivity
  ));
?>
