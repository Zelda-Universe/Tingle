class UpdateTotKData < ActiveRecord::Migration[7.0]
  def sqlFileNamesUp
    [
      '1-marker_category' ,
      '2-marker'          ,
      '3-marker_tab'
    ]
  end
  def sqlFileNamesDown
    [
      '4-marker_category' ,
      '5-marker'
    ]
  end
  def previousMigrationFileName
    '20230509201500_add_tot_k_data.rb'
  end

  def database
    connection.instance_variable_get(:@config)[:database]
  end

  def up
    execute <<-SQL
      DELETE FROM `marker`
      WHERE `marker_category_id` BETWEEN 2100 AND 2300
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker`
      AUTO_INCREMENT=12522
      ;
    SQL

    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 2100 AND 2300
      AND `parent_id` IS NOT NULL
      ;
    SQL
    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 2100 AND 2300
      AND `parent_id` IS NULL
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker_category`
      AUTO_INCREMENT=1970
      ;
    SQL

    execute <<-SQL
      UPDATE `container`
      SET
        `icon`                  = 'Tears-of-the-Kingdom',
        `max_zoom`              = 4,
        `cluster_max_zoom`      = 8,
        `cluster_grid_size`     = 9,
        `tile_size`             = 50,
        `icon_width`            = 256,
        `icon_height`           = 23,
        `icon_small_width`      = 23,
        `icon_small_height`     = 16,
        `switch_icons_at_zoom`  = 16,
        `visible`               = 5,
        `default_zoom`          = 1
      WHERE `id` = 21
      ;
    SQL

    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNamesUp.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      # print "sqlFile: #{sqlFile}"
      execute File.open(sqlFile).read
    end
  end

  def down
    execute <<-SQL
      DELETE FROM `marker_tab`
      WHERE `marker_tab_id`
      BETWEEN 21000 AND 24341
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker_tab`
      AUTO_INCREMENT=4075
      ;
    SQL

    execute <<-SQL
      DELETE FROM `marker`
      WHERE `marker_category_id`
      BETWEEN 2100 AND 2300
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker`
      AUTO_INCREMENT=12522
      ;
    SQL

    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 2100 AND 2300
      AND `parent_id` IS NOT NULL
      ;
    SQL
    execute <<-SQL
      DELETE FROM `marker_category`
      WHERE `id` BETWEEN 2100 AND 2300
      AND `parent_id` IS NULL
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `marker_category`
      AUTO_INCREMENT=1970
      ;
    SQL

    execute <<-SQL
      UPDATE `container`
      SET
        `icon`                  = 'Breath-of-the-Wild',
        `max_zoom`              = 8,
        `cluster_max_zoom`      = 9,
        `cluster_grid_size`     = 50,
        `tile_size`             = 256,
        `icon_width`            = 23,
        `icon_height`           = 23,
        `icon_small_width`      = 16,
        `icon_small_height`     = 16,
        `switch_icons_at_zoom`  = 5,
        `visible`               = 1,
        `default_zoom`          = 4
      WHERE `id` = 21
      ;
    SQL

    filePathPattern = "#{__dir__}/sql/" +
      previousMigrationFileName.
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNamesDown.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      print "sqlFile: #{sqlFile}"
      execute File.open(sqlFile).read
    end
  end
end
