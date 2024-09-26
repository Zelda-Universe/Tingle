class ChangelogAddAccountDeletionEntry < ActiveRecord::Migration[7.1]
  def up
    execute File.open(
      'dev/db/migrate/sql/20240530222520_changelog_add_account_deletion_entry.sql'
    ).read
  end
end
