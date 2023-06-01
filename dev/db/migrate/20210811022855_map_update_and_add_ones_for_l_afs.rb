class MapUpdateAndAddOnesForLAfs < ActiveRecord::Migration[6.0]
  def up
    idBotW = execute("SELECT `id` FROM `container` WHERE `short_name` = 'BotW';").each{}[0][0]
    idLAfS = execute("SELECT `id` FROM `container` WHERE `short_name` = 'LA';").each{}[0][0]
    
    execute <<-SQL
      UPDATE `map` SET `name` = 'Hyrule' WHERE `container_id` = #{idBotW};
    SQL
    
    execute <<-SQL
      INSERT INTO `map` (
        `id`,
        `container_id`,
        `name`,
        `is_default`,
        `default_zoom`,
        `max_zoom`,
        `map_copyright`,
        `map_order`,
        `visible`
      ) VALUES
        (20, #{idLAfS},'Koholint Island',1,2,4,'(c) Nintendo',0,1),
        (21, #{idLAfS},'Tail Cave',1,2,4,'(c) Nintendo',1,1),
        (22, #{idLAfS},'Bottle Grotto',1,2,4,'(c) Nintendo',2,1),
        (23, #{idLAfS},'Key Cavern',1,2,4,'(c) Nintendo',3,1),
        (24, #{idLAfS},'Angler`s Tunnel',1,2,4,'(c) Nintendo',4,1),
        (25, #{idLAfS},'Catfish`s Maw',1,2,4,'(c) Nintendo',5,1),
        (26, #{idLAfS},'Face Shrine',1,2,4,'(c) Nintendo',6,1),
        (27, #{idLAfS},'Eagle`s Tower',1,2,4,'(c) Nintendo',7,1),
        (28, #{idLAfS},'Turtle Rock',1,2,4,'(c) Nintendo',8,1),
        (29, #{idLAfS},'Color Dungeon',1,2,4,'(c) Nintendo',9,1)
      ;
    SQL
    # Almost tried using SQL variables since I couldn't figure out any potential mixed SQL literal select or into syntax..
    # Maybe would help?: https://stackoverflow.com/questions/25969/insert-into-values-select-from
    # probably won't matter without auto increments on some tables we just use the shared ids anyway..
  end
end
