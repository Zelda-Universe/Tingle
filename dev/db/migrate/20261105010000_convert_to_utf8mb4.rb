class ConvertToUtf8mb4 < ActiveRecord::Migration[7.1]
  # Every table was latin1_swedish_ci, which cannot hold anything outside
  # Latin-1: emoji, CJK, curly quotes. MariaDB in strict mode refuses such a
  # row (error 1366, "Internal error" to the user) rather than storing a '?'
  # as the old server did. Everything becomes utf8mb4, and the application
  # talks utf8mb4 to the server (lib/common/database.php).
  #
  # Rebuilds every table (ALGORITHM=COPY: reads continue, writes to the table
  # being rebuilt wait), so it runs in a quiet window with a fresh backup.
  # ROW_FORMAT=DYNAMIC lets VARCHAR(255) keys fit utf8mb4's 4 bytes a
  # character. The hand-run equivalent is in docs/backend-conventions.md.
  def up
    execute "ALTER DATABASE `#{connection.current_database}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    connection.tables.sort.each do |table|
      execute "ALTER TABLE `#{table}` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, ROW_FORMAT=DYNAMIC"
    end
  end

  def down
    # Going back would discard every character Latin-1 can't hold.
    raise ActiveRecord::IrreversibleMigration
  end
end
