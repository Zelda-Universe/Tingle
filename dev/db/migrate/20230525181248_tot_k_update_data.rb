class TotKUpdateData < ActiveRecord::Migration[7.0]
  def sqlFileNames
    [
      '1-changelog'       ,
      '2-marker_category' ,
      '3-marker'          ,
      '4-marker_tab'
    ]
  end
  def up
    execute <<-SQL
      UPDATE `container`
      SET
        `bound_top_pos_x`     = '16'  ,
        `bound_top_pos_y`     = '-16' ,
        `bound_bottom_pos_x`  = '-134',
        `bound_bottom_pos_y`  = '157'
      WHERE `id` = '21'
      ;
    SQL

    execute <<-SQL
      UPDATE `map`
      SET
        `name`        = 'Surface',
        `is_default`  = '0'
      WHERE `id` = '2101'
      ;
    SQL
    execute <<-SQL
      UPDATE `map`
      SET
        `is_default`  = '1',
        `map_order`   = '0'
      WHERE `id` = '2102'
      ;
    SQL
    execute <<-SQL
      UPDATE `map`
      SET `name` = 'Depths'
      WHERE `id` = '2103'
      ;
    SQL

    execute <<-SQL
      UPDATE `marker_category`
      SET `name` = 'Skyview Tower'
      WHERE `id` = '2123'
      ;
    SQL

    execute <<-SQL
      UPDATE `marker`
      SET `submap_id` = '2101'
      WHERE `id` = '21001'
      ;
    SQL

    execute <<-SQL
      DELETE FROM `marker`
      WHERE `id` BETWEEN 25178 AND 26169
      ;
    SQL

    filePathPattern = "#{__dir__}/sql/" +
      File.basename(__FILE__).
      sub(/\.rb$/i, '/%s.sql')

    sqlFileNames.each do |sqlFileName|
      sqlFile = sprintf(filePathPattern, sqlFileName);
      # print "sqlFile: #{sqlFile}"
      execute File.open(sqlFile).read
    end
  end
end
