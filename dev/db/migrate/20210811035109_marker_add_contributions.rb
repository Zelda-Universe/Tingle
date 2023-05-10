class MarkerAddContributions < ActiveRecord::Migration[6.0]
  def up
    # A file example for large queries.
    # May also help manage in the text editor somehow..
    execute File.open('dev/db/migrate/sql/20210811035109_marker_add_contributions.sql').read
  end
end
