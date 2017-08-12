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

## MySQL Workbench (MWB) File Handling

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
