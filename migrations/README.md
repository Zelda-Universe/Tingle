# Migrations

Schema changes are SQL files in this folder, applied by `bin/migrate.php`,
which `deploy.sh` runs on every deploy after `composer install`. Merging to
`staging` or `production` therefore brings the schema change with it;
nobody has to run SQL by hand. Applied files are recorded in the
`app_migration` table.

## Writing one

- File name `YYYYMMDDHHMMSS_what_it_does.sql`, timestamp first so they sort
  in order. One statement per `;` at the end of a line; `--` comment lines
  are ignored. Keep semicolons out of string literals.
- **Make it safe to run twice.** MySQL can't roll DDL back, so a file that
  fails on its third statement has done the first two. Use
  `CREATE TABLE IF NOT EXISTS`, `ADD COLUMN IF NOT EXISTS`,
  `ADD INDEX IF NOT EXISTS`, `INSERT IGNORE`, and `WHERE … IS NULL` on
  backfills. The deploy rolls the *code* back when a migration fails; the
  next deploy re-runs the file from the top.
- **Additive only.** Add columns and tables; don't drop or rename ones the
  live code reads, because the old code runs until the deploy finishes.
  Removals get their own migration in a later release.
- Don't write `DEFAULT CHARSET`/`COLLATE`: tables inherit `utf8mb4` /
  `utf8mb4_swedish_ci` from the database.
- Anything that rebuilds a big table (`user`, `user_completed_marker`,
  `marker`) or runs for minutes is **not** for a deploy: do it by hand in a
  quiet window first, then commit the migration written so that it's a
  no-op where it has already run (`IF NOT EXISTS`), so other environments
  get it.
- An optional `NAME.down.sql` beside the file lets `php bin/migrate.php
  down NAME` undo it. A down that drops a column loses what was written to
  it; the nightly backup is the real safety net.
- The old Rails files in `dev/db/migrate/` are history and aren't run
  anywhere; a new change needs only the `.sql` file.

## Commands (from the site root, as the site user)

```
php bin/migrate.php           # apply what's pending
php bin/migrate.php status    # applied / pending, changes nothing
php bin/migrate.php mark [NAME ...]   # record as applied without running
php bin/migrate.php down NAME # run NAME.down.sql and forget NAME
```

Locally (WAMP): `php bin\migrate.php` in `C:\wamp64\www\zeldamaps` after
pulling.
