# Feature Work Process

  Our process should be similar to the Git Flow style.

  1. Branch off of `master` using the branch prefix `feature/`.
  2. While working on code changes, commit & push, early & often, so other team members are aware of current code changes to possibly integrate and/or merge with.  Also mind Development Guidelines below.
  3. When finalized, merge to `staging`, and open a pull request on GitHub.
  4. At this point, auto deployment should push it to the staging server.  You can check that it works there.
  5. After review, the pull request can be merged by the reviewer, or maybe even the developer, back into `master`.

# Issue-/Bug-Fixing Process

  You can follow the Feature Work Process, only when making a branch, use this format instead: `issue/#-very-brief-descriptive-summary`, where `#` is the GitHub issue number, and you create your own summary specific to the issue you intend to work on.

# Mainline Re-synchronization

  Hopefully this should not be needed when following the other guidelines, but if you start to experience unique merge troubles for each mainline branch, or code was accidentally merged into a later stream too early, or like the hot-fixing process, you can merge the streams back into latest, but only in the direction.
  These should always contain the same code, in that order, and is important to keep the streams' code healthy, and merges easy.
  We don't need to pollute the streams with commits doing this often at all.  Only when experiencing difficulty working, or when the infrequent operation will get the streams back to a clean state easily.

# Releases

  - From `master` to `production` by the owner / release manager.

  - When changelog notifications are enabled:
    - They must manually set all user accounts `seen_latest_changelog` to `0` (`false`).
      - Don't want a fresh commit to do this before every release; that would be cruft.
      - Do this after you deploy the code, with database changes.
        - This is to prevent the edge case of a user visiting the site in the small window of time with the old database without the new changelog entries, which would incorrectly set the `seen_latest_changelog` flag again, so when the new data is present, it would not be triggered and shown to them.
      - Can use this script: `dev/db/resetUsersChangelogSeenPresence.sh`

# Add new game support

  - Add new database migrations to add:
    - `container`:
      - Example: `dev/db/migrate/20230405204517_container_add_basic_tot_k_support.rb`
    - `map`:
      - Example: `/srv/ZU/Tingle/dev/db/migrate/20230405222955_map_add_tot_k_overworld_maps.rb`
    - `submap`:
      - Example: `dev/db/migrate/20230406031615_submap_add_tot_k_overworld_submaps.rb`
  - Update sample SQL data files in a focused style.
    - `set -x tableNames (read)`
    - `./dev/db/createSampleDatabaseExport/run.sh`
  - Update game support list in readme file.
  - Optional:
    - Change default game parameter for container in index page script block, and any other specific SEO data in the head section.
  - Test, commit, push, and create a PR!

## Version Info

  The project uses the file `dev\info\versionsInfo.json` to, at least once in an early migration file when the changelog table was first introduced, appropriately mark users the release level that users had seen / were already comfortable with / knowledgeable about as inferred by their last login time.
  It's also useful for satisfying curiosity quickly using CLI commands, and is in a machine-parseable format ready for any other sort of task, so I try to make it the authority of this task.

  In order to add new versions to it, I find the latest commit related to that day. I start from `HEAD` following parent commits until I find the day or so after it was released, then I browse forward until the end of any potential 0-day bugfixes and run this command `git log -1 --format='%at' (getclip) | putclip` when I have the commit SHA hash copied to my system clipboard.
  The human-readable output version of this command is this: `git log -1 --format='%aD' (getclip)`.

  I used this command to reverse the timestamps: `date -d @(getclip) | head -c -1 | putclip`.

  You can see if a version already exists by using this command `git show-ref refs/tags/<version_name>` and seeing if you have a line output with a hash or not.

# Backup

  Not sure where to put this section for now.

  Live data, probably both the data and schema layout, are already being backed up somehow to somewhere by someone (Matthew?).

  To add to this, we may also want to backup the `dev/db/schema.rb` file so the system knows which migrations are needed to be run, if any.

# Development Guidelines

  - Follow the format of the code file you are working in.
    - We may introduce style checking later, and if so, it will only apply to modified/created code as you work in it.
  - Comment your code so other team members can understand it.
    - We want to communicate why code is there, since the 'what' is already represented by the code statements themselves, and those are straightforward for the most part, or should try to be.
  - When you're done, add a changelog entry for it, or probably just wait for it from the release team since they will make one anyway.  The ones development makes are in the commit messages at least.
    - Add a migration to add this new changelog entry into the db, details in its own section below.
    - Use the next release number as given to the development team or self-determined for smaller or self-initiated features.
    - If you need to use a single escape, escape it as such in the Ruby- (and to some extent, Rails-) based migration file: `\\\'`.

## Backend

  Written in PHP.

  I'm thinking to store more information in the session, rather than the client's cookies.  We would only use cookies when needed, so when the user is not authenticated.

  We use the helper function we created `start_session("zmap");` with that name commonly.
  Then we close it after all `$_SESSION` references have been passed: `session_write_close();`.

  Try to issue these commands as close to the block of all session references as possible, since our framework probably does not support concurrency, and this way the lock on the session file can be released and other users requests can continue to be processed after the current.

# Etc.

## Icons
  For existing icon reference: https://app.tettra.co/teams/zelda/pages/icon-index

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

  We will store somewhat of the mined, active, production data snapshot in the `dev/db/tingle.sql` file so developers and others can start using the project faster, and at all.

  We have a separate method below about migrations for modifying data, including production's, to include new fixes and feature data.

  If there is important data you would like to add to this file and check it in, you can issue the following command: `dev/db/createSampleDatabaseExport.sh`.  Then you can review any changes/updates to commit in place of that file.
  - Use of the MySQL login path system is recommended, for any project-related database work, especially when contacting different servers.
  - If a connection requires an SSH tunnel, the login path can bet set to a localhost with matching ports, and a command like this can be used:
    - `ssh -nNTL <local_port_or_socket>:/var/run/mysqld/mysqld.sock <username>@zm-p-db`
      - https://www.howtogeek.com/howto/ubuntu/access-your-mysql-server-remotely-over-ssh/
  - Production: `env MYSQL_USER="<username>" MYSQL_CONNECTION_STRING="--login-path=tingle-prod-db '-p(read -s)"'" CONVERGE_SQL="true" ./dev/db/createSampleDatabaseExport.sh`.
  - Development: `env DB_NAME="tingle" MYSQL_USER="root" CONVERGE_SQL="true" ./dev/db/createSampleDatabaseExport.sh`.
    - Then enter the password for the script prompt, or else you will have to do so for every MySQL(Dump) prompt step thereafter.
    - Not using the manage role made for database migrations since it doesn't have the `PROCESS` privilege and I think this type of action should be kept separate since it relates to the entire database.
  - Refreshing the data may involve these statements:
    - ``echo 'DROP DATABASE `zeldamaps`' | mysql --login-path=local``
    - `mysql --login-path=local < "dev/db/zeldamaps.sql";`

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

## Migrations

  Description:

    Tracking database changes to use in the future for features and bug fixes is important, and we will create migration files that can be easily issued in any environment.

    Thought it would be easy to utilize other projects' existing mechanisms, and I have been using Ruby on Rails lately that seems to do a good job of it.
    https://github.com/thuss/standalone-migrations

    Now that only accomplishes half of the responsibility.  In order to operate on that actual database content data, we don't have ActiveRecord objects to use as an API, so we just implement raw SQL for these, and make sure that both of the `up` and `down` methods are made as appropriate as possible, if both methods possible for that certain situation.

    It seems we must only pass a single SQL statement per block to avoid a security risk, otherwise it keeps receiving a syntax error only when sent through the migration framework.. https://stackoverflow.com/questions/14856856/how-to-write-sql-in-a-migration-in-rails#comment86794302_42991237
    `Mysql2::Error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATE....'`

  Important Note: Do not edit a migration that has been pushed (to others).

  - Common Commands:
    - Create a new migration:
      - `rake db:new_migration name=(read -P 'Migration Proper Name: ' | tr -d ' ')`
        - Change name subshell to read `read | tr ' ' '_'` on Windows to prevent carriage return characters causing problems.
      - Then edit content with your features' details.
    - To apply your newest migration:
      - `rake db:migrate`
    - To migrate to a specific version (for example to rollback)
      - `rake db:migrate VERSION=20081220234130`
    - To migrate a specific database (for example your "testing" database)
      - `rake db:migrate RAILS_ENV=test`
    - To execute a specific up/down of one single migration
      - `rake db:migrate:up VERSION=20081220234130`
    - To revert the last migration
      - `rake db:rollback`
    - To revert the last 3 migrations
      - `rake db:rollback STEP=3`
    - Check which version of the tool you are currently using
      - `rake db:version`
    - Manually generate a timestamp:
      - `date -u "+%Y%m%d%H%M%S" | head -c -1`

  - Samples:
    - ActiveRecord Ruby Code:
      - Source: http://guides.rubyonrails.org/active_record_migrations.html
      - Source: https://guides.rubyonrails.org/active_record_migrations.html#using-the-change-method
      - Source: https://www.ralfebert.de/snippets/ruby-rails/models-tables-migrations-cheat-sheet/
      - Note: Main benefit is hopefully more terse and efficient syntax, but also applies to automatically handling bidirectional migration/rollback support with declarative styling.
      - Add column:
        - Code (Table 'batch' block): `t.column :hidden, :boolean, null: false, default: 0, after: :version_patch`
        - Source: `dev/db/migrate/20230403193442_changelog_add_hidden_field_and_disable_blank_content.rb`
        - Code (Individual field): `add_column :marker, :path, :text, null: false, default: '', after: :global`
        - Source: `dev/db/migrate/20230523175651_marker_add_path_column.rb`
      - Changing Columns:
        - Source: https://guides.rubyonrails.org/active_record_migrations.html#changing-columns
        - Change table common code:
            - Source: https://guides.rubyonrails.org/active_record_migrations.html#changing-tables
            - Source: https://api.rubyonrails.org/v7.0.4.2/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-change_table
            - Code: `change_table :table_name do |t|`
            - Then refer to the specific section goal below with the reduced  column variants.
        - Change column null property:
          - Code: `t.change_null :content, false`
          - Source: `dev/db/migrate/20230403193442_changelog_add_hidden_field_and_disable_blank_content.rb`
        - Change column default value:
          - Code (Table 'batch' block): `t.change_default :marker_url, from: '/markers/', to: 'markers/'`
          - Code (Individual field): `change_column_default(:table_name, :column_name, '<defaultValue>')`
          - Source: `dev/db/migrate/20230405195637_container_update_and_add_defaults.rb`
          - Source: https://api.rubyonrails.org/v7.0.4.2/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-change_column_default
        - Can't change integer 'width':
          - Limit is bytes and change type too much.\
          - Precision, reverted to `11`, but did not change to `2` at all.
          - So just use raw SQL..
      - Foreign Keys:
        - Remove:
          - Code: `remove_foreign_key  :map, column: :container_id, name: :fk_map_project1`
          - SQL: ```
            ALTER TABLE `map`
            DROP FOREIGN KEY `fk_map_project1`
          ```
        - Add:
          - Code: `add_foreign_key     :map, :container, column: :container_id, name: :fk_map_project1, on_delete: :restrict, on_update: :restrict`
          - SQL: ```
            ALTER TABLE `map`
            ADD CONSTRAINT `fk_map_project1`
            FOREIGN KEY (`container_id`)
            REFERENCES `container` (`id`)
            ON DELETE NO ACTION ON UPDATE NO ACTION
          ```
          - Notes:
            - No action cannot be specified using AR code, as it does not support that key as a dependency, so use raw SQL for that choice instead.
            - Restrict is MySQL-specific, MariaDB of course supports, equivalent to no action for the standard, mostly, may be a difference between immediate rejection by statement, when using InnoDB engine, or upon transaction commit, allowing it to be resolved more flexibly.
          - Source: `dev/db/migrate/20230607153536_update_fk_actions.rb`
    - Execute Raw SQL:
      - So far in the migration Ruby code just have the up method typically, but could always support down with the custom opposing statements in later habits where necessary.
      - Inline statement:
        - ```
          execute <<-SQL
            UPDATE `user` SET `seen_latest_changelog` = 0;
          SQL
          ```
      - External file:
        - Code: ```
          execute File.open(
            'dev/db/migrate/sql/20210811040936_users_add_new_placeholders_for_new_marker_contributions.sql'
          ).read
          ```
      - External files:
        - Code: ```
          def sqlFileNames
            [
              '1-container'       ,
              '2-map'             ,
              '3-submap'          ,
              '4-marker_category' ,
              '5-marker'
            ]
          end
          ```
          ```
          filePathPattern = "#{__dir__}/sql/" +
            File.basename(__FILE__).
            sub(/\.rb$/i, '/%s.sql')

          sqlFileNames.each do |sqlFileName|
            sqlFile = sprintf(filePathPattern, sqlFileName);
            execute File.open(sqlFile).read
          end
          ```
      - Multiple Queries:
        - Add `.lines.each { |line| execute line if line != "\n" }` the string containing the queries separated by newlines.
    - Specific Goals:
      - Investigating/Debugging
        - ```
          require 'pry'; binding.pry
          exit
          ```
      - Removing entries:
        - Code (List/Array of Values): ```
        execute <<-SQL
          DELETE FROM `submap`
          WHERE `id` IN (2010, 2011)
          ;
        SQL
        ```
        - Code (Condition): ```
        execute <<-SQL
          DELETE FROM `mapper`
          WHERE `id` = 3;
          ;
        SQL
          ```
        - Source: `dev/db/migrate/disabled/20230406031615_submap_add_tot_k_overworld_submaps.rb`
      - Reverting the auto increment value:
        - Note: Be sure to check if the table actually has auto increment column(s).
        - Code (Dynamic): ```
          def database
            connection.instance_variable_get(:@config)[:database]
          end
          ```
          ```
          aiValue = (
            execute <<-SQL
              SELECT `AUTO_INCREMENT`
              FROM `INFORMATION_SCHEMA`.`TABLES`
              WHERE `TABLE_SCHEMA` = '#{database}'
              AND `TABLE_NAME` = 'mapper'
              LIMIT 1
              ;
            SQL
          ).first.first
          contentEntryAmount = 1
          execute <<-SQL
            ALTER TABLE `mapper`
            AUTO_INCREMENT=#{aiValue - contentEntryAmount}
            ;
          SQL
          ```
        - Code (Manual): ```
          execute <<-SQL
            ALTER TABLE `mapper`
            AUTO_INCREMENT=...
            ;
          SQL
          ```
        - Source: `dev/db/migrate/disabled/20230406031615_submap_add_tot_k_overworld_submaps.rb`
    - Names:
      - Note: The RoR AR Migrations guide may recommend trying to keep migrations focused on a specific table per file.
      - Format:
        - Database table,
        - action,
        - object,
        - and repeat.
      - `ChangelogAddHiddenField`
      - `ChangelogHideOldEntries`
      - `ContainerUpdateAndAddDefaults`
      - `ContainerAddTotKSupport`
      - `MapAddTotKOverworldMaps`

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
