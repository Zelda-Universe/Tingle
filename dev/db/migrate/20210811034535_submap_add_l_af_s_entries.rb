class SubmapAddLAfSEntries < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO `submap` VALUES
        (2000,20,1,1,'Koholint Island',1,'la_rmk/koholint_island/','png','blank',0,0,1,1),
        (2001,21,1,1,'Tail Cave',1,'la_rmk/1_tail_cave/','png','blank',1,0,1,1),
        (2002,22,1,1,'Bottle Grotto',1,'la_rmk/2_bottle_grotto/','png','blank',2,0,1,1),
        (2003,23,1,1,'Key Cavern',1,'la_rmk/3_key_cavern/','png','blank',3,0,1,1),
        (2004,24,1,1,'Angler`s Tunnel',1,'la_rmk/4_anglers_tunnel/','png','blank',4,0,1,1),
        (2005,25,1,1,'Catfish`s Maw',1,'la_rmk/5_catfishs_maw/','png','blank',5,0,1,1),
        (2006,26,1,1,'Face Shrine',1,'la_rmk/6_face_shrine/','png','blank',6,0,1,1),
        (2007,27,1,1,'Eagle`s Tower',1,'la_rmk/7_eagles_tower/','png','blank',7,0,1,1),
        (2008,28,1,1,'Turtle Rock',1,'la_rmk/8_turtle_rock/','png','blank',8,0,1,1),
        (2009,29,1,1,'Color Dungeon',1,'la_rmk/0_color_dungeon/','png','blank',9,0,1,1)
      ;
    SQL
  end
end
