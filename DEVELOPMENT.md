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

## Update Sample Database Data

  We will store somewhat of a snapshot of the mined, active, production data in the `dev/db/zelda_maps.sql` file so developers and others can start using the project faster, and at all.

  If there is important data you would like to add to this file and check it in, you can issue the following command: `dev/db/exportDatabaseCustom.sh`.  Then you can review any changes/updates to commit in place of that file.

  This will export the structure, but not the content for the 'user' tables, as this may contain more sensitive information we do not want to store in the code repository.

  Our export format guidelines:
  - It's usually better to print one insert per line for easier diffing.
    - This was also chosen over performance since the dataset is small.
    - [StackOverflow - Using mysqldump to format one insert per line?](https://stackoverflow.com/questions/15750535/using-mysqldump-to-format-one-insert-per-line)
  - We like to include the database step for completeness sake, and more easily getting the project running.
    - [StackOverflow - Mysqldump not creating create database syntax](https://stackoverflow.com/questions/9223130/mysqldump-not-creating-create-database-syntax)
  - Keep as few redundant statements in there are possible.
    - A good rule for anything that doesn't require or encourage redundancy.

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
