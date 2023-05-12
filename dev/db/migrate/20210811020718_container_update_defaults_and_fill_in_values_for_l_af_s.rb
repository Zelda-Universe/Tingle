class ContainerUpdateDefaultsAndFillInValuesForLAfS < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE `container` SET `background_color` = '#000000';
    SQL
    execute <<-SQL
      UPDATE `container` SET
        `visible` = 0
      WHERE `short_name` = 'ALttP';
    SQL
    execute <<-SQL
      UPDATE `container` SET
        `icon` = 'Links-Awakening',
        `default_pos_x` = 128,
        `default_pos_y` = -128,
        `bound_top_pos_x` = -50,
        `bound_top_pos_y` = -80,
        `bound_bottom_pos_x` = -226,
        `bound_bottom_pos_y` = 306,
        `switch_icons_at_zoom` = -1,
        `visible` = 1
      WHERE `short_name` = 'LA';
    SQL
    execute <<-SQL
      UPDATE `container` SET
        `icon` = 'Breath-of-the-Wild',
        `default_pos_x` = 112,
        `default_pos_y` = -159,
        `bound_top_pos_x` = -49.875,
        `bound_top_pos_y` = 34.25,
        `bound_bottom_pos_x` = -206,
        `bound_bottom_pos_y` = 221,
        `default_zoom` = 5
      WHERE `short_name` = 'BotW';
    SQL
  end
  def down
    # Not going to bother, but the original color for most was '#DEECFD' before for some reason..
  end
end
