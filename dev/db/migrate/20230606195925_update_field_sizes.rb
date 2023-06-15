class UpdateFieldSizes < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE `container`
      MODIFY COLUMN `max_zoom` int(2) DEFAULT '6',
      MODIFY COLUMN `cluster_max_zoom` int(2) NOT NULL DEFAULT '4' COMMENT 'Max zoom to cluster the markers. Best -2 from the max zoom allowed (if 6 is the max, cluster should be 4)',
      MODIFY COLUMN `cluster_grid_size` int(2) NOT NULL DEFAULT '30' COMMENT 'Pixel size of grid (default 30)',
      MODIFY COLUMN `tile_size` int(3) NOT NULL DEFAULT '256' COMMENT 'Internet default is 256',
      MODIFY COLUMN `icon_width` int(11) NOT NULL,
      MODIFY COLUMN `icon_height` int(11) NOT NULL
      ;
    SQL

    execute <<-SQL
      ALTER TABLE `map`
        MODIFY COLUMN `default_zoom` tinyint(2) NOT NULL DEFAULT '1',
        MODIFY COLUMN `map_order` tinyint(2) NOT NULL
      ;
    SQL

    execute <<-SQL
      ALTER TABLE `marker`
        MODIFY COLUMN `path` text NOT NULL
      ;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `container`
      MODIFY COLUMN `max_zoom` int(11) DEFAULT '6',
      MODIFY COLUMN `cluster_max_zoom` int(11) NOT NULL DEFAULT '4' COMMENT 'Max zoom to cluster the markers. Best -2 from the max zoom allowed (if 6 is the max, cluster should be 4)',
      MODIFY COLUMN `cluster_grid_size` int(11) NOT NULL DEFAULT '30' COMMENT 'Pixel size of grid (default 30)',
      MODIFY COLUMN `tile_size` int(11) NOT NULL DEFAULT '256' COMMENT 'Internet default is 256',
      MODIFY COLUMN `icon_width` int(11) NOT NULL DEFAULT '23',
      MODIFY COLUMN `icon_height` int(11) NOT NULL DEFAULT '23'
      ;
    SQL

    execute <<-SQL
      ALTER TABLE `map`
        MODIFY COLUMN `default_zoom` tinyint(4) NOT NULL DEFAULT '1',
        MODIFY COLUMN `map_order` tinyint(4) NOT NULL
      ;
    SQL

    execute <<-SQL
      ALTER TABLE `marker`
        MODIFY COLUMN `path` text NOT NULL DEFAULT ''
      ;
    SQL
  end
end
