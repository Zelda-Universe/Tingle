-- custom projections aside from flat 256
ALTER TABLE container 
        ADD scaleP FLOAT  NOT NULL DEFAULT 1 AFTER switch_icons_at_zoom
      , ADD scaleN FLOAT  NOT NULL DEFAULT 1 AFTER scaleP
      , ADD offsetX FLOAT NOT NULL DEFAULT 0 AFTER scaleN
      , ADD offsetY FLOAT NOT NULL DEFAULT 0 AFTER offsetX
;

-- default
update container 
   set scaleP =  0.01171875
     , scaleN = -0.01171875
     , offsetX = 70.3125
     , offsetY = 58.59375
 where id = 21
;

-- update all totk markers 
update marker 
   set x = (x*256*12000/36000)-6000
     , y = (y*256*10000/30000+5000)
 where submap_id in (2101, 2102, 2103)
;