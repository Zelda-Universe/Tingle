# Feature Work Process

  Our process should be similar to the Git Flow style.

  1. Branch off of `master` using the branch prefix `feature/`.
  2. While working on code changes, commit & push, early & often, so other team members are aware of current code changes to possibly integrate and/or merge with.  Also mind Development Guidelines below.
  3. When finalized, merge to `staging`, and open a pull request on GitHub.  Probably assign it to Jason.
  4. At this point, auto deployment should push it to the staging server.  You can check that it works there.
  5. After review, the pull request can be merged by the reviewer, or maybe even the developer, back into `master`.

# Issue-/Bug-Fixing Process

  You can follow the Feature Work Process, only when making a branch, use this format instead: `issue/#-very-brief-descriptive-summary`, where `#` is the GitHub issue number, and you create your own summary specific to the issue you intend to work on.

# Mainline Re-synchronization

  Hopefully this should not be needed when following the other guidelines, but if you start to experience unique merge troubles for each mainline branch, or code was accidentally merged into a later stream too early, or like the hot-fixing process, you can merge the streams back into latest, but only in the direction.
  These should always contain the same code, in that order, and is important to keep the streams' code healthy, and merges easy.
  We don't need to pollute the streams with commits doing this often at all.  Only when experiencing difficulty working, or when the infrequent operation will get the streams back to a clean state easily.

# Releases

  Done by Jason, from `master` to `production`, at the end of every 2-week sprint.

  The release manager will manually set all user accounts `seen_latest_changelog` to `0` (`false`).
    Don't want a fresh commit to do this before every release; that would be cruft.
    Do this after you deploy the code, to prevent the edge case of a user visiting the site in the small window of time with the old and/or database without the new changelog entries, and would incorrectly set the `seen_latest_changelog`, and even the `last_login` field as well, so once the new data is present, it would not be triggered and shown to them.
    Can use this script: `dev/db/resetUsersChangelogSeenPresence.sh`
      Make sure to set the MySQL parameters appropriately.  See the script header for more deatils.

# Backup

  Not sure where to put this section for now.

  Live data, probably both the data and schema layout, are already being backed up somehow to somewhere by someone.

  To add to this, we may also want to backup the `dev/db/schema.rb` file so the system knows which migrations are needed to be run, if any.

# Development Guidelines

  - Follow the format of the code file you are working in.
    - We may introduce style checking later, and if so, it will only apply to modified/created code as you work in it.
  - Comment your code so other team members can understand it.
    - We want to communicate why code is there, since the 'what' is already represented by the code statements themselves, and those are straightforward for the most part, or should try to be.
  - When you're done, add a changelog entry for it.
    - Add a migration for this new entry.
    - Use the next release number as given to the development team.
    - If you need to use a single escape, escape it as such in the Ruby- (and to some extent, Rails-) based migration file: `\\\'`.

## Backend

  Written in PHP.

  I'm thinking to store more information in the session, rather than the client's cookies.  We would only use cookies when needed, so when the user is not authenticated.

  We use the helper function we created `start_session("zmap");` with that name commonly.
  Then we close it after all `$_SESSION` references have been passed: `session_write_close();`.

  Try to issue these commands as close to the block of all session references as possible, since our framework probably does not support concurrency, and this way the lock on the session file can be released and other users requests can continue to be processed after the current.

# Etc.

## Icons
  We use the website `https://icomoon.io/app` to choose, compile, and generate the stylesheets that contain the icon font graphics we display in our map's web page.
  - We do not use the hosted 'Quick Usage' premium feature of icomoon, just the local browser storage to work with the set, then export it to the filesystem, and update the project with the new files.
  - Import into website / review
    - Be sure to import it as an entire project.
    - Try to avoid creating a new, blank project, and then importing just the icons, as something may be missing using this method.
    - Many of the graphics were made by Connor.  If you need more you can work with him.
    - You will know it works, because even the title of the project should appear and indicate the project's Zelda content.
  - Export into project / update
      - The export file we save is `dev/icomoon Export - BotW Maps Icon Set Font.json`.
      - Copy all font files into the `fonts` directory.
      - Copy the CSS file into the `styles` directory.
        - Remove the first change that sets a new random query parameter for each font file link.
        - I don't think this is necessary yet.  Client caches should hopefully be invalidated by normal web server file timestamp comparison.




## Update Sample Database Data

  We will store somewhat of the mined, active, production data snapshot in the `dev/db/zeldamaps.sql` file so developers and others can start using the project faster, and at all.

  We have a separate method below about migrations for modifying data, including production's, to include new fixes and feature data.

  If there is important data you would like to add to this file and check it in, you can issue the following command: `dev/db/exportDatabaseForDev.sh`.  Then you can review any changes/updates to commit in place of that file.
  Now that this has become a decent system, here are the available configuration environmental flags you can utilize:
    - `QUIET` (Default: `false`)
    - `VERBOSE` (Default: `false`)
    - `BRIEF_MESSAGES` (Default: `false`)
    - `PAUSE` (Default: `false`)
    - `DRY_RUN` (Default: `false`)
    - `FAIL_FAST` (Default: `true`)
    - `CLEAN_ON_FAILURE` (Default: `true`)
    - `DB_NAME` (Default: `zeldamaps`)
    - `MYSQL_OTHER_CONNECTION_OPTIONS` (Default: `""`)
    - `MYSQL_CONNECTION_STRING` (Default: `$MYSQL_OTHER_CONNECTION_OPTIONS -u'$MYSQL_USER' -p'$MYSQL_PASS'`)
    - `MYSQL_USER`
    - `MYSQL_PASS`

  This will export the structure, but not the content for the 'user' tables, as this may contain more sensitive information we do not want to store in the code repository.  Instead, we capture the useful ids with associated information, then sanitize and generate test data for the other fields.

  Our export format guidelines:
  - It's usually better to print one insert per line for easier diffing.
    - This was also chosen over performance of Import/Export since the dataset is small, and our use case is also infrequent.
      - [StackOverflow - Using mysqldump to format one insert per line?](https://stackoverflow.com/questions/15750535/using-mysqldump-to-format-one-insert-per-line)
      - We would use extended insert, but at least on non-Windows systems, it still does not contain a line break, even though this feature has been requested:
        - https://bugs.mysql.com/bug.php?id=4328
        - https://bugs.mysql.com/bug.php?id=31343
        - https://bugs.mysql.com/bug.php?id=55007
        - https://bugs.mysql.com/bug.php?id=65465
  - We like to include the database step for completeness sake, and more easily getting the project running.
    - It also helps spread the common database naming convention.
    - [StackOverflow - Mysqldump not creating create database syntax](https://stackoverflow.com/questions/9223130/mysqldump-not-creating-create-database-syntax)
  - Keep as few redundant statements in there are possible.
    - A good rule for anything that doesn't require or encourage data redundancy.
    - We want accurate data.
  - Use of the MySQL login path system was useful, and may be recommended for any project-related database work, especially when contacting different servers.
  - Refreshing the data may involve these statements:
    - ``echo 'DROP DATABASE `zeldamaps`' | mysql --login-path=local``
    - `mysql --login-path=local < "dev/db/zeldamaps.sql";`

## Migrations

  Tracking database changes to use in the future for features and bug fixes is important, and we will create migration files that can be easily issued in any environment.

  Thought it would be easy that we use what existing projects use to accomplish this, and I have been using Ruby on Rails lately that seems to do a good job of it.
  https://github.com/thuss/standalone-migrations

  Now that only accomplishes half of the responsibility.  In order to operate on that actual database content data, we don't have ActiveRecord objects to use as an API, so we just implement raw SQL for these, and make sure that both of the `up` and `down` methods are made as appropriate as possible, if both methods possible for that certain situation.

  Important Note:
    Do not edit a migration that has been pushed (to others).

  Common Commands:
    Create a new migration:
      `rake db:new_migration name=foo_bar_migration`
      Then edit it with your features's details.
    To apply your newest migration:
      `rake db:migrate`
    To migrate to a specific version (for example to rollback)
      `rake db:migrate VERSION=20081220234130`
    To migrate a specific database (for example your "testing" database)
      `rake db:migrate RAILS_ENV=test`
    To execute a specific up/down of one single migration
      `rake db:migrate:up VERSION=20081220234130`
    To revert your last migration
      `rake db:rollback`
    To revert your last 3 migrations
      `rake db:rollback STEP=3`
    Check which version of the tool you are currently using
      `rake db:version`

  More Info:
    http://edgeguides.rubyonrails.org/active_record_migrations.html
    https://www.ralfebert.de/snippets/ruby-rails/models-tables-migrations-cheat-sheet/

## MySQL Workbench (MWB) File Handling

  **Update:** Since the MWB file in our project only contains the schema information, and we need to give developers at least some populated data to work with, it will only be used to design the structure of the tables, so we will no longer use it to merge data into the database for working, either directly, or by exporting it into SQL.

  I felt it may be more convenient to deal with a SQL file, at least for non-designing (development/deployment) tasks, especially when one does not use that particular database control program.

  This file will have to be carefully minded to, and re-exported when the MWB file experiences changes.
  If this is needed more in the future, we can try automating using information from these sources:
   - [StackOverflow - file conversion- .mwb to .sql file](https://stackoverflow.com/questions/10532208/file-conversion-mwb-to-sql-file)
   - [GitHub - tomoemon/mwb2sql - convert mwb (MySQL Workbench file format) to sql](https://github.com/tomoemon/mwb2sql)
   - [DBA StackExchange - Export .MWB to working .SQL file using command line](https://dba.stackexchange.com/questions/137249/export-mwb-to-working-sql-file-using-command-line)

  To do this manually, I followed these steps:
  1. Open the file in MySQL Workbench.
    a. Open the program
    b. File > Open Model
  2. File > Export > Forward Engineer SQL CREATE Script
  3. Choose this output location inside of the project directory: `.../Zelda-Maps/!dbsetup/zmodel.sql`
  4. Use the following options:
      * Generate DROP Statements Before Each CREATE Statement
      * Generate DROP SCHEMA
      * Generate Separate CREATE INDEX Statements
      * Add SHOW WARNING After Every DDL Statement
      * Generate INSERT Statements for Tables
      * Create triggers after inserts
  5. Export these object(s):
      * Export MySQL Table Objects (The only non-zero total)
  6. Finish
