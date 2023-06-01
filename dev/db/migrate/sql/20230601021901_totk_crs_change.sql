update marker 
   set x = (x*256*12000/36000)-6000
     , y = (y*256*10000/30000+5000)
 where submap_id in (2101, 2102, 2103)
;