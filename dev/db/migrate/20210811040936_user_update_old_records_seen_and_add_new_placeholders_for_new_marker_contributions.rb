class UserUpdateOldRecordsSeenAndAddNewPlaceholdersForNewMarkerContributions < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE `user` SET `seen_latest_changelog` = 0;
    SQL
    execute File.open('dev/db/migrate/sql/20210811040936_users_add_new_placeholders_for_new_marker_contributions.sql').read
  end
end
