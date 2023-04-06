class MapAddTotKOverworldMaps < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO `map`
      VALUES
        (30, 20, 'Ground', 1, 2, 6, '(c) Nintendo', 1, 1),
        (31, 20, 'Sky'   , 0, 2, 6, '(c) Nintendo', 2, 1)
      ;
    SQL
  end
end
