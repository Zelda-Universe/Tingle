#!/usr/bin/env php
<?php
  // Applies the SQL migrations in migrations/ that this database hasn't had
  // yet, in file-name order, and records each in app_migration. deploy.sh
  // runs it after composer install, so a merge to staging or production
  // brings its schema changes with it. See migrations/README.md.
  //
  //   php bin/migrate.php            apply pending migrations
  //   php bin/migrate.php status     list applied and pending, change nothing
  //   php bin/migrate.php mark [NAME ...]
  //                                  record the named files (or every file)
  //                                  as applied without running them: for a
  //                                  database that already has the changes
  //                                  by hand
  //   php bin/migrate.php down NAME  run migrations/NAME.down.sql, if there is
  //                                  one, and forget NAME
  //
  // MySQL can't roll DDL back, so a migration that fails halfway stays
  // halfway: write them so a second run is harmless (IF NOT EXISTS), and
  // the deploy rolls the code back when this exits non-zero.

  if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

  $root = dirname(__DIR__);
  chdir($root);
  include_once("$root/config.php");
  include_once("$root/lib/common/database.php");

  $command = $argv[1] ?? 'up';
  $directory = "$root/migrations";
  $out = function($line) { fwrite(STDOUT, $line . "\n"); };
  $fail = function($line) { fwrite(STDERR, "migrate: $line\n"); exit(1); };

  if (open() !== 0) $fail('no database connection');
  /** @var \Doctrine\DBAL\Connection $db */
  global $db;

  $db->executeStatement("
    CREATE TABLE IF NOT EXISTS `app_migration` (
      `name`    VARCHAR(128) NOT NULL,
      `applied` DATETIME     NOT NULL,
      PRIMARY KEY (`name`)
    ) ENGINE=InnoDB
  ");

  // The statements of one file: `--` comment lines dropped, split on a `;`
  // that ends a line. Keep semicolons out of string literals.
  $statements = function($file) {
    $lines = [];
    foreach (file($file) as $line) {
      if (preg_match('/^\s*--/', $line)) continue;
      $lines[] = $line;
    }
    $parts = preg_split('/;[ \t]*(?:\r?\n|$)/', implode('', $lines));
    return array_values(array_filter(array_map('trim', $parts), 'strlen'));
  };

  $files = glob("$directory/[0-9]*_*.sql") ?: [];
  $files = array_values(array_filter($files, function($f) { return !preg_match('/\.down\.sql$/', $f); }));
  sort($files, SORT_STRING);
  $applied = array_fill_keys($db->fetchFirstColumn("SELECT `name` FROM `app_migration`"), true);

  if ($command === 'status') {
    foreach ($files as $file) {
      $name = basename($file, '.sql');
      $out((isset($applied[$name]) ? 'applied ' : 'pending ') . $name);
    }
    exit(0);
  }

  // One deploy at a time per database.
  if (!$db->fetchOne("SELECT GET_LOCK('zeldamaps_migrate', 120)")) $fail('another migration run holds the lock');

  if ($command === 'mark') {
    $only = array_map(function($n) { return preg_replace('/\.sql$/', '', basename($n)); }, array_slice($argv, 2));
    foreach ($files as $file) {
      $name = basename($file, '.sql');
      if (isset($applied[$name])) continue;
      if ($only && !in_array($name, $only, true)) continue;
      $db->executeStatement("INSERT INTO `app_migration` (`name`, `applied`) VALUES (?, NOW())", [$name]);
      $out("marked  $name");
    }
    exit(0);
  }

  if ($command === 'down') {
    $name = preg_replace('/[^A-Za-z0-9_]/', '', (string) ($argv[2] ?? ''));
    if ($name === '' || !isset($applied[$name])) $fail("'$name' isn't an applied migration");
    $file = "$directory/$name.down.sql";
    if (!is_file($file)) $fail("$name has no .down.sql");
    foreach ($statements($file) as $sql) $db->executeStatement($sql);
    $db->executeStatement("DELETE FROM `app_migration` WHERE `name` = ?", [$name]);
    $out("reverted $name");
    exit(0);
  }

  if ($command !== 'up') $fail("unknown command '$command'");

  $pending = 0;
  foreach ($files as $file) {
    $name = basename($file, '.sql');
    if (isset($applied[$name])) continue;
    $pending++;
    $out("applying $name");
    $started = microtime(true);
    try {
      foreach ($statements($file) as $index => $sql) {
        $db->executeStatement($sql);
      }
    } catch (\Throwable $e) {
      $fail(sprintf("%s failed at statement %d: %s", $name, ($index ?? 0) + 1, $e->getMessage()));
    }
    $db->executeStatement("INSERT INTO `app_migration` (`name`, `applied`) VALUES (?, NOW())", [$name]);
    $out(sprintf("applied  %s (%.1fs)", $name, microtime(true) - $started));
  }
  if ($pending === 0) $out('nothing to apply');
  exit(0);
?>
