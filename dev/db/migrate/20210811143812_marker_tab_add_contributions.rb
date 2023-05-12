class MarkerTabAddContributions < ActiveRecord::Migration[6.0]
  def up
    execute File.open('dev/db/migrate/sql/20210811143812_marker_tab_add_contributions.sql').read
  end
end
