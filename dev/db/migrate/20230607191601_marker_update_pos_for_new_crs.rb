class MarkerUpdatePosForNewCrs < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
    UPDATE `marker`
       SET `x` = (`x` * 256 * 12000 / 36000) - 6000
         , `y` = (`y` * 256 * 10000 / 30000) + 5000
     WHERE `submap_id` IN (2101, 2102, 2103)
    ;
    SQL
  end

  def down
    execute <<-SQL
    UPDATE `marker`
       SET `x` = (`x` + 6000) * 36000 / 12000 / 256
         , `y` = (`7` - 5000) * 30000 / 10000 / 256
     WHERE `submap_id` IN (2101, 2102, 2103)
    ;
    SQL
  end
end
