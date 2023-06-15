class MarkerUpdatePathForNewCrs < ActiveRecord::Migration[7.0]
  def up
    File.open(
      'dev/db/migrate/sql/20230607193507_marker_update_path_for_new_crs.sql'
    ).read.lines.each { |line| execute line if line != "\n" }
  end
end
