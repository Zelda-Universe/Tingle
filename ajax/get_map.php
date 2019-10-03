<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

   $map = $_GET["game"];
    
   $query = "select m.id
                  , m.name 

                  , m.default_zoom                     as defaultZoom
                  , coalesce(m.max_zoom, c.max_zoom)   as maxZoom
                  , map_copyright                      as mapCopyright

               from " . $map_prefix . "map m
                  , " . $map_prefix . "container c
              where c.id = '" . $map . "'
                and c.id = m.container_id
                and m.visible = 1
             order by m.map_order
                    , m.id
   ;";
   //echo $query;
    
   $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}
   
   $res = array();
   
   while ($row = $result->fetch_assoc()) {
      
      $query = "select sm.id
                     , sm.name
                     
                     , smt.name           as mapTypeName
                     , google_default     as googleDefault
                     
                     , tile_url           as tileURL
                     , tile_ext           as tileExt
                     
                     , img404             as img404
                     , empty_map          as emptyMap
                     
                     , case when m.id is not null then 
                        CONCAT(
                           sm.name,
                           ' Map by ',
                           case when m.email is not null then
                              CONCAT('<a href=mailto:', m.email, '>', m.name, '</a>')
                           else
                              m.name
                           end,
                           case when m.site_name is not null and m.name is not null then
                              CONCAT(' (<a href=', m.site_url, '>', m.site_name, '</a>)') 
                           else 
                              CONCAT('<a href=', m.site_url, '>', m.site_name, '</a>') 
                           end
                        )
                       end
                       as mapMapper
                     
                     , is_default         as isDefault
                     
                     , opacity
                     
                  from " . $map_prefix . "submap sm
                  left outer join " . $map_prefix . "mapper m
                    on sm.mapper_id = m.id
                     , " . $map_prefix . "map_type smt
                 where sm.map_id = " . $row['id'] . "
                   and sm.visible = 1
                   and sm.map_type_id = smt.id
                 order by sm.submap_order
                        , sm.id
               ";
      //echo $query;
      
      $result2 = $mysqli->query($query);
      
      if ($result2) {
         
         $arr_child = array();
         while ($row2 = $result2->fetch_assoc()) {
            
            $query = "select sml.id
                           , sml.name
                           , sml.tile_url           as tileURL
                           , sml.tile_ext           as tileExt
                     
                           , sml.img404             as img404
                           
                           , case when m.id is not null then 
                              CONCAT(
                                 sml.name,
                                 ' Map by ',
                                 case when m.email is not null then
                                    CONCAT('<a href=mailto:', m.email, '>', m.name, '</a>')
                                 else
                                    m.name
                                 end,
                                 case when m.site_name is not null and m.name is not null then
                                    CONCAT(' (<a href=', m.site_url, '>', m.site_name, '</a>)') 
                                 else 
                                    CONCAT('<a href=', m.site_url, '>', m.site_name, '</a>') 
                                 end
                              )
                             end
                             as mapMapper
                           
                           , sml.control_visible    as controlVisible
                           , sml.control_checked    as controlChecked
                           
                           , sml.type
                           , sml.opacity
                           
                        from " . $map_prefix . "submap_layer sml
                        left outer join " . $map_prefix . "mapper m
                          on (sml.mapper_id = m.id)
                       where sml.submap_id = " . $row2['id'] . "
                         and sml.visible = 1
                       order by layer_order
                              , sml.id
            ";
            
            //echo $query;
            $result3 = $mysqli->query($query);
            
            if ($result3) {
               $arr_layer = array();
               while ($row3 = $result3->fetch_assoc()) {
                  array_push($arr_layer, $row3);
               }
               $row2['submapLayer'] = $arr_layer;
            }
            
            array_push($arr_child, $row2);
         }
         $row['subMap'] = $arr_child;
      }
      array_push($res, $row);
   }
   echo json_encode($res);
?>