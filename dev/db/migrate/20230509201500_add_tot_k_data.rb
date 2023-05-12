class AddTotKData < ActiveRecord::Migration[7.0]
  def sqlFileNames
    [
      '1-container'       ,
      '2-map'             ,
      '3-submap'          ,
      '4-marker_category' ,
      '5-marker'
    ]
  end

  def database
    connection.instance_variable_get(:@config)[:database]
  end

  def up
    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNames.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      execute File.open(sqlFile).read
    end
  end

  def down
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
      DELETE FROM `submap`
      WHERE `map_id` BETWEEN 2101 AND 2103
      ;
    SQL

    execute <<-SQL
      DELETE FROM `map`
      WHERE `id` BETWEEN 2101 AND 2103
      ;
    SQL

    execute <<-SQL
      DELETE FROM `container`
      WHERE `id` = 21
      ;
    SQL
    execute <<-SQL
      ALTER TABLE `container`
      AUTO_INCREMENT=20
      ;
    SQL

  end
end
