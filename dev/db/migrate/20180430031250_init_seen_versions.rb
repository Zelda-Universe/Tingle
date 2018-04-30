class InitSeenVersions < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE
        `user`
      SET
        `seen_version_minor` = 5
      ;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE
        `user`
      SET
        `seen_version_minor` = 0
      ;
    SQL
  end
end
