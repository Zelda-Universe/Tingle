class ChangelogAddMissingOldEntriesAndMinorFixes < ActiveRecord::Migration[7.0]
  def up
     File.open('dev/db/migrate/sql/20230331200740_changelog_add_missing_old_entries_and_minor_fixes.sql').read.lines.each { |line| execute line if line != "\n" }
  end
end
