# Backend conventions

Read this before writing or changing anything under `ajax/`, `lib/` or
`config.php`. Tools that generate code should be pointed at this file.

## Request handling

- Every command is a file in `ajax/`, included by `ajax.php` after it has
  opened the database and started output buffering. A command prints exactly
  one JSON document and `return`s; it never `exit`s.
- Success: `{"success": true, ...}`. Failure the user can act on:
  `{"success": false, "msg": "..."}`. Anything else should **throw** (or just
  let the database throw); `ajax.php` logs the exception and answers
  `{"success": false, "code": 500, "msg": "Internal error"}`. Never print
  exception messages, stack traces, SQL, or file paths to the client.
- Read request values with `?? null` / `?? ''`; cast to the type you need
  (`(int)`, `(float)`, `(string)`); validate before use. `ajax.php` also
  types the common ID parameters, but each command validates its own input.

## Database

- The connection is `$db`, a `Doctrine\DBAL\Connection`. There is no `$mysqli`.
- **Request values never appear inside an SQL string.** Use `?` placeholders:
  - `$db->fetchAllAssociative($sql, [$a, $b])` — list of rows
  - `$db->fetchAssociative($sql, [...])` — one row or `false`
  - `$db->fetchOne($sql, [...])` — first column of the first row, or `false`
  - `$db->executeStatement($sql, [...])` — INSERT/UPDATE/DELETE, returns rows affected
  - `$db->lastInsertId()` after an INSERT
- Table names use the prefix: `{$map_prefix}user`. Column names and SQL
  keywords may be built from **constants** in your code (e.g. choosing an
  `ORDER BY`); never from request data.
- Several writes that must succeed or fail together go inside
  `begin();` … `commit();` (`rollback()` on a path you handle yourself).
- Expect a duplicate-key error as
  `Doctrine\DBAL\Exception\UniqueConstraintViolationException` when a unique
  key can legitimately be hit (registration); let other exceptions propagate.
- Results come back as strings (deliberate: the frontend expects what mysqli
  returned). Cast in PHP when you need numbers.

## Sessions and authorisation

- `start_session("zmap")` before reading `$_SESSION`; `session_write_close()`
  as soon as you no longer need it (before slow work).
- A write on behalf of a user requires `!empty($_SESSION['user_id'])`, and the
  user ID used in SQL comes from the session, never from the request.
- Authorisation on an existing row (edit/delete a marker, a bookmark) is
  decided by looking the row's owner up in the database, never by comparing
  request fields. Levels: `>= 5` may publish, `>= 10` is admin.

## Schema

- Every schema change is a migration file in `dev/db/migrate/` **and** the
  equivalent SQL run by hand on staging and production before the code that
  needs it deploys. The migration tooling is not run against those databases
  (`schema_migrations` there is stale since 2018).
- Prefer the schema being right over feature-detecting columns with
  `SHOW COLUMNS` in code.
- Everything is `utf8mb4` / `utf8mb4_unicode_ci` (since
  `20261105010000_convert_to_utf8mb4`), and the connection speaks utf8mb4.
  New tables take the database default: don't write `DEFAULT CHARSET` into
  hand-run SQL, and never `latin1`. (The dev export tooling under
  `dev/db/` still stamps `latin1_swedish_ci` on dumps and needs the same
  change.)

  Applying the conversion by hand, per database, in a quiet window
  (tables with text columns are rebuilt — reads continue, writes to that
  table wait; tables without text only get a new default, instantly):

  ```
  mysqldump --single-transaction --quick DBNAME | gzip > /root/DBNAME-pre-utf8mb4.sql.gz
  mysql DBNAME -e "ALTER DATABASE \`DBNAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
  mysql -N DBNAME -e "SELECT CONCAT('ALTER TABLE \`', t.TABLE_NAME, '\` ', IF(EXISTS(SELECT 1 FROM information_schema.COLUMNS c WHERE c.TABLE_SCHEMA = t.TABLE_SCHEMA AND c.TABLE_NAME = t.TABLE_NAME AND c.CHARACTER_SET_NAME IS NOT NULL), 'CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, ROW_FORMAT=DYNAMIC', 'DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci'), ';') FROM information_schema.TABLES t WHERE t.TABLE_SCHEMA = DATABASE() AND t.TABLE_TYPE = 'BASE TABLE' AND t.TABLE_COLLATION <> 'utf8mb4_unicode_ci'" | mysql DBNAME
  mysql DBNAME -e "SELECT TABLE_COLLATION, COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() GROUP BY 1;"
  ```

  Before the first run on a database, check that the latin1 data is real
  Latin-1 and not UTF-8 bytes stored as latin1, which the conversion would
  bake in. A row like that gets shorter when its bytes are read as UTF-8
  (the collation is accent-insensitive, so a `LIKE '%Ã%'` probe is
  useless):

  ```
  SELECT COUNT(*) FROM marker
   WHERE CHAR_LENGTH(CONVERT(BINARY name USING utf8mb4)) < CHAR_LENGTH(name)
      OR CHAR_LENGTH(CONVERT(BINARY description USING utf8mb4)) < CHAR_LENGTH(description);
  ```

  should be 0 (same for `marker_tab.tab_text`, `user.name`, `user.username`).

## Mail

- `lib/zmailer.php` (Symfony Mailer). Build an `Email`, call `sendMail()`,
  check the boolean. Never log message bodies or anything a user typed.
- Password reset is link-based (`lost_password` → e-mail →
  `reset_password`). Passwords are never generated, e-mailed, or logged.

## Files

- Uploads are re-encoded (see `update_profile_picture.php`), named randomly,
  and stored under `uploads/`, which the web server serves as data only.
- Paths built from any client-supplied value are confined with `realpath()`
  and checked against the intended root.
