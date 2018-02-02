# Feature Work Process

  Our process should be similar to the Git Flow style.

  1. Branch off of `development` using the branch prefix `feature/`.
  2. While working on code changes, commit & push, early & often, so other team members are aware of current code changes to possibly integrate and/or merge with.  Also mind Development Guidelines below.
  3. When finalized, merge to `staging`, and open a pull request on GitHub.  Probably assign it to Jason.
  4. At this point, auto deployment should push it to the staging server.  You can check that is works there.
  5. Upon review, the pull request can be merged by the reviewer, or maybe even the developer, back into `development`.

# Releases

  Done by Jason, from `development` to `production`, at the end of every 2-week sprint.

# Development Guidelines

  - Follow the format of the code file you are working in.
    - We may introduce style checking later, and if so, it will only apply to modified/created code as you work in it.
  - Comment your code so other team members can understand it.
    - We want to communicate why code is there, since the 'what' is already represented by the code statements themselves.

# Etc.

## Icons
  We use the website `https://icomoon.io/app` to choose, compile, and generate the stylesheets that contain the icon font graphics we display in our map's web page.
  - We do not use the hosted 'Quick Usage' premium feature of icomoon, just the local browser storage to work with the set, then export it to the filesystem, and update the project with the new files.
  - Be sure to import it as an entire project.
    - The export file we save is `dev/icomoon Export - BotW Maps Icon Set Font.json`.
    - Try to avoid creating a new, blank project, and then importing just the icons, as something may be missing using this method.
    - Many of the graphics were made by Connor.  If you need more you can work with him.
    - You will know it works, because even the title of the project should appear and indicate the project's Zelda content.



## Update Sample Database Data

  We will store somewhat of the mined, active, production data snapshot in the `dev/db/zeldamaps.sql` file so developers and others can start using the project faster, and at all.

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
