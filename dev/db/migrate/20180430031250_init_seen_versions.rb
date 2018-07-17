class InitSeenVersions < ActiveRecord::Migration[5.1]

  def up
    require './lib/VersionMigrator.rb'
    VersionMigrator.createSeenVersionMigrationSQLStatements.each do |sqlStatement|
      execute sqlStatement
    end
  end

  def down
    execute <<-SQL
      UPDATE
        `user`
      SET
        `seen_version_major` = 0,
        `seen_version_minor` = 0,
        `seen_version_patch` = 0
      ;
    SQL
  end
end
