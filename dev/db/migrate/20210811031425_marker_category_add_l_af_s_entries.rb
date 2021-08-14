class MarkerCategoryAddLAfS < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO `marker_category` VALUES
        (1950,NULL,1,4,'Point of Interest',1,'BotW_Points-of-Interest','#4bc5ee',0,1),
        (1951,1950,1,4,'Cracked Walls',1,'BotW_Bomb','#4bc5ee',0,1),
        (1952,1950,1,4,'Trading Sequence',1,'BotW_Side-Quest','#4bc5ee',0,1),
        (1953,1950,1,4,'Minigame',1,'BotW_Mini-Game','#4bc5ee',0,1),
        (1954,1950,1,4,'Easter Eggs',1,'General_Info','#4bc5ee',0,0),
        (1955,NULL,1,4,'Items',1,'BotW_Items','#ffad48',0,1),
        (1956,1955,1,4,'Pieces of Heart',1,'General_Heart','#ffad48',0,1),
        (1957,1955,1,4,'Seashells',1,'LA_Secret-Seashell','#ffad48',0,1),
        (1958,1955,1,4,'Bottles',1,'General_Bottle','#ffad48',0,1),
        (1960,1955,1,4,'Map',1,'General_Map','#ffad48',0,1),
        (1961,1955,1,4,'Compass',1,'General_Compass','#ffad48',0,1),
        (1962,1955,1,4,'Keys',1,'General_Key','#ffad48',0,1),
        (1963,NULL,1,4,'Locations',1,'BotW_Locations','#8e72b9',0,1),
        (1964,1963,1,4,'Houses',1,'General_House','#8e72b9',0,1),
        (1965,1963,1,4,'Shops',1,'General_Store','#8e72b9',0,1),
        (1966,1963,1,4,'Dungeons',1,'BotW_Dungeon','#8e72b9',0,1),
        (1967,NULL,1,4,'Enemies',1,'BotW_Enemies','#ff422e',0,1),
        (1968,1967,1,4,'Boss',1,'BotW_Boss','#ff422e',0,1),
        (1969,1963,1,4,'Fairy Fountains',1,'BotW_Great-Fairy','#8e72b9',3,1)
      ;
    SQL
  end
end
