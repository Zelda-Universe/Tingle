class SubmapAddTotKOverworldSubmaps < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO `mapper`
      VALUES (3, 'Placeholder', '', '', '');
      ;
    SQL
    execute <<-SQL
      INSERT INTO `submap`
      VALUES
        (2010, 30, 1, 3, 'Ground', 1, 'totk/ground/' , 'png', 'blank', 0, 0, 1, 0),
        (2011, 31, 1, 3, 'Sky'   , 1, 'totk/sky/'    , 'png', 'blank', 0, 0, 1, 0)
      ;
    SQL
  end
end
