<?php
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminRequire($db, $map_prefix) === null) return;

  // Admin's feature graphs: completes, bookmarks or offline map downloads
  // per day, week or month over a range (the Accounts graph's ranges), with
  // totals for all time and the last 30 days, 7 days and 24 hours, each
  // against the period before it. Offline maps also get their games.
  //
  // Un-completing or removing a bookmark deletes its row, so these count
  // what's saved now, by when it was saved.
  $metrics = [
    'completes' => ['table' => 'user_completed_marker', 'column' => 'complete_date', 'where' => '1 = 1'],
    'bookmarks' => ['table' => 'user_bookmark', 'column' => 'created', 'where' => '1 = 1'],
    'downloads' => ['table' => 'offline_map_event', 'column' => 'created', 'where' => "`event` = 'downloaded'"]
  ];
  $metric = isset($metrics[$_GET['metric'] ?? '']) ? $_GET['metric'] : 'completes';
  $info = $metrics[$metric];
  $ranges = [
    '7d'  => ['days' => 7,   'bucket' => 'day'],
    '14d' => ['days' => 14,  'bucket' => 'day'],
    '30d' => ['days' => 30,  'bucket' => 'day'],
    '6m'  => ['days' => 182, 'bucket' => 'week'],
    '1y'  => ['days' => 365, 'bucket' => 'week'],
    'all' => ['days' => null, 'bucket' => 'month']
  ];
  $range = isset($ranges[$_GET['range'] ?? '']) ? $_GET['range'] : '30d';
  $bucket = $ranges[$range]['bucket'];

  if (!$db->fetchOne("SHOW TABLES LIKE '{$map_prefix}{$info['table']}'")) {
    echo json_encode(array('success' => false, 'metric' => $metric,
      'msg' => $metric === 'downloads' ? 'Run the create_offline_map_event migration to track offline maps.' : 'Nothing to show yet.'));
    return;
  }
  $table = "`{$map_prefix}{$info['table']}`";
  $column = "`{$info['column']}`";
  $where = $info['where'];
  $sqlKey = [
    'day' => "DATE_FORMAT($column, '%Y-%m-%d')",
    'week' => "DATE_FORMAT(DATE_SUB(DATE($column), INTERVAL WEEKDAY($column) DAY), '%Y-%m-%d')",
    'month' => "DATE_FORMAT($column, '%Y-%m')"
  ][$bucket];

  $today = new DateTimeImmutable($db->fetchOne('SELECT CURDATE()'));
  if ($ranges[$range]['days'] === null) {
    $first = $db->fetchOne("SELECT MIN($column) FROM $table WHERE $where");
    $start = new DateTimeImmutable($first ? substr($first, 0, 7) . '-01' : $today->format('Y-m-01'));
  } else {
    $start = $today->modify('-' . ($ranges[$range]['days'] - 1) . ' days');
  }
  if ($bucket === 'week') $start = $start->modify('monday this week');
  if ($bucket === 'month') $start = $start->modify('first day of this month');

  $counts = [];
  foreach ($db->fetchAllAssociative(
    "SELECT $sqlKey AS `bucket`, COUNT(*) AS `count` FROM $table WHERE $where AND $column >= ? GROUP BY `bucket`",
    [$start->format('Y-m-d')]
  ) as $row) {
    $counts[$row['bucket']] = (int) $row['count'];
  }
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

  // The boxes: rolling windows ending now, against the window before.
  $between = function($fromHours, $toHours) use ($db, $table, $column, $where) {
    return (int) $db->fetchOne(
      "SELECT COUNT(*) FROM $table WHERE $where AND $column > NOW() - INTERVAL ? HOUR AND $column <= NOW() - INTERVAL ? HOUR",
      [$fromHours, $toHours]
    );
  };
  $summary = ['total' => ['current' => (int) $db->fetchOne("SELECT COUNT(*) FROM $table WHERE $where"), 'previous' => null]];
  foreach (['month' => 30 * 24, 'week' => 7 * 24, 'day' => 24] as $name => $hours) {
    $summary[$name] = ['current' => $between($hours, 0), 'previous' => $between(2 * $hours, $hours)];
  }
  $people = (int) $db->fetchOne("SELECT COUNT(DISTINCT `user_id`) FROM $table WHERE $where");

  // Most completed or bookmarked markers over the range: how many people
  // saved each. Bookmarks of dropped pins (no marker) are counted apart.
  $top = null;
  $droppedPins = null;
  if ($metric === 'completes' || $metric === 'bookmarks') {
    // Counted first, then described: grouping only by marker_id keeps it
    // valid under ONLY_FULL_GROUP_BY, which the servers use.
    $top = $db->fetchAllAssociative("
      SELECT `top`.`markerId`, `top`.`people`,
             `m`.`name` AS `title`, `m`.`visible`, `mc`.`name` AS `category`,
             `c`.`short_name` AS `game`, `c`.`name` AS `gameName`
        FROM (SELECT `marker_id` AS `markerId`, COUNT(DISTINCT `user_id`) AS `people`
                FROM $table
               WHERE $column >= ? AND `marker_id` IS NOT NULL
               GROUP BY `marker_id`
               ORDER BY `people` DESC, `marker_id`
               LIMIT 5) `top`
        JOIN `{$map_prefix}marker` `m` ON `m`.`id` = `top`.`markerId`
        LEFT JOIN `{$map_prefix}marker_category` `mc` ON `mc`.`id` = `m`.`marker_category_id`
        LEFT JOIN `{$map_prefix}submap` `sm` ON `sm`.`id` = `m`.`submap_id`
        LEFT JOIN `{$map_prefix}map` `mp` ON `mp`.`id` = `sm`.`map_id`
        LEFT JOIN `{$map_prefix}container` `c` ON `c`.`id` = `mp`.`container_id`
       ORDER BY `top`.`people` DESC, `top`.`markerId`
    ", [$start->format('Y-m-d')]);
    foreach ($top as &$row) {
      $row['markerId'] = (int) $row['markerId'];
      $row['people'] = (int) $row['people'];
      $row['visible'] = (bool) $row['visible'];
      $row['title'] = html_entity_decode((string) $row['title'], ENT_QUOTES, 'UTF-8');
    }
    unset($row);
    if ($metric === 'bookmarks') {
      $droppedPins = (int) $db->fetchOne(
        "SELECT COUNT(*) FROM $table WHERE `marker_id` IS NULL AND $column >= ?",
        [$start->format('Y-m-d')]
      );
    }
  }

  $games = null;
  $offline = null;
  if ($metric === 'downloads') {
    // Each person's latest event for each game: downloaded or updated means
    // they still have it.
    $latest = "
      SELECT `e`.`user_id`, `e`.`container_id`, `e`.`event`, `e`.`bytes`
        FROM `{$map_prefix}offline_map_event` `e`
        JOIN (SELECT MAX(`id`) AS `id` FROM `{$map_prefix}offline_map_event`
               WHERE `event` IN ('downloaded', 'updated', 'removed')
               GROUP BY `user_id`, `container_id`) `l` ON `l`.`id` = `e`.`id`
    ";
    $games = $db->fetchAllAssociative("
      SELECT `c`.`short_name` AS `game`, `c`.`name`,
             COALESCE(`now`.`people`, 0) AS `people`, COALESCE(`now`.`bytes`, 0) AS `bytes`,
             COALESCE(`all`.`downloads`, 0) AS `downloads`, COALESCE(`all`.`recent`, 0) AS `recent`,
             COALESCE(`all`.`failed`, 0) AS `failed`, COALESCE(`all`.`removed`, 0) AS `removed`
        FROM `{$map_prefix}container` `c`
        LEFT JOIN (SELECT `container_id`, COUNT(*) AS `people`, SUM(`bytes`) AS `bytes`
                     FROM ($latest) `x` WHERE `event` IN ('downloaded', 'updated') GROUP BY `container_id`) `now`
               ON `now`.`container_id` = `c`.`id`
        LEFT JOIN (SELECT `container_id`,
                          SUM(`event` = 'downloaded') AS `downloads`,
                          SUM(`event` = 'downloaded' AND `created` > NOW() - INTERVAL 30 DAY) AS `recent`,
                          SUM(`event` = 'failed') AS `failed`, SUM(`event` = 'removed') AS `removed`
                     FROM `{$map_prefix}offline_map_event` GROUP BY `container_id`) `all`
               ON `all`.`container_id` = `c`.`id`
       WHERE `now`.`people` > 0 OR `all`.`downloads` > 0 OR `all`.`failed` > 0
       ORDER BY `people` DESC, `downloads` DESC, `c`.`name`
    ");
    foreach ($games as &$game) {
      foreach (['people', 'bytes', 'downloads', 'recent', 'failed', 'removed'] as $key) $game[$key] = (int) $game[$key];
    }
    unset($game);
    $offline = $db->fetchAssociative("
      SELECT COUNT(DISTINCT `user_id`) AS `people`, COUNT(*) AS `packs`, COALESCE(SUM(`bytes`), 0) AS `bytes`
        FROM ($latest) `x` WHERE `event` IN ('downloaded', 'updated')
    ");
    foreach ($offline as $key => $value) $offline[$key] = (int) $value;
    $offline['started'] = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}offline_map_event` WHERE `event` = 'started'");
    $offline['failed'] = (int) $db->fetchOne("SELECT COUNT(*) FROM `{$map_prefix}offline_map_event` WHERE `event` = 'failed'");
  }

  echo json_encode(array(
    'success' => true, 'metric' => $metric, 'range' => $range, 'bucket' => $bucket,
    'buckets' => $buckets, 'summary' => $summary, 'people' => $people,
    'games' => $games, 'offline' => $offline, 'top' => $top, 'droppedPins' => $droppedPins
  ));
?>
