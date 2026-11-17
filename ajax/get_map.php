<?php
   include_once(dirname(__DIR__) . '/lib/common/tile_delivery.php');
   $path = __DIR__;

   $map = $_GET["game"] ?? '';
   if ($map === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $map)) {
     echo json_encode(array());
     return;
   }
  include_once(dirname(__DIR__) . '/lib/common/admin.php');
  if (adminOnlyGameDenied($db, $map_prefix, $map)) { echo json_encode(array()); return; }

   if (file_exists("$path/static/map_{$map}.json")) {
     readfile("$path/static/map_{$map}.json");
     return;
   }

   // The "Map by <mapper>" credit line, shared by submaps and submap layers.
   $sqlMapperCredit = "
      case when m.id is not null then
         CONCAT(
            %s.name,
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
      end as mapMapper
   ";

   $maps = $db->fetchAllAssociative("
      select m.id
           , m.name
           , m.description

           , m.default_zoom                     as defaultZoom
           , coalesce(m.max_zoom, c.max_zoom)   as maxZoom
           , map_copyright                      as mapCopyright
           , m.kind                             as kind
           , m.always_show_categories            as alwaysShowCategories

        from {$map_prefix}map m
           , {$map_prefix}container c
       where c.id = ?
         and c.id = m.container_id
         and m.visible = 1
       order by m.map_order
             , m.id
   ", [$map]);

   // Named regions with borders, by submap: tower regions (kind tower) and
   // the game's named areas (kind area). Optional: until the map_region
   // migrations have run there are none (or no kind column, so all are tower
   // regions), and the map works as before.
   $regionsBySubmap = array();
   try {
      $regionRows = $db->fetchAllAssociative("
         select r.*
           from {$map_prefix}map_region r
           join {$map_prefix}submap sm on sm.id = r.submap_id
           join {$map_prefix}map m on m.id = sm.map_id
          where m.container_id = ?
            and r.visible = 1
          order by r.region_order, r.id
      ", [$map]);
   } catch (\Doctrine\DBAL\Exception\TableNotFoundException $e) {
      $regionRows = array();
   }
   foreach ($regionRows as $region) {
      $regionsBySubmap[$region['submap_id']][] = array(
         'id' => $region['id'],
         'description' => $region['description'] ?? '',
         'connectionKey' => $region['connection_key'] ?? $region['name'],
         'labelMarkerId' => $region['label_marker_id'] ?? null,
         'name' => $region['name'],
         'shortName' => $region['short_name'],
         'kind' => $region['kind'] ?? 'tower',
         'polygon' => json_decode($region['polygon'], true)
      );
   }

   $res = array();

   foreach ($maps as $row) {
      $submaps = $db->fetchAllAssociative("
         select sm.id
              , sm.name

              , smt.name           as mapTypeName
              , google_default     as googleDefault

              , tile_url           as tileURL
              , tile_ext           as tileExt

              , img404             as img404
              , empty_map          as emptyMap

              , " . sprintf($sqlMapperCredit, 'sm') . "

              , is_default         as isDefault

              , opacity

              , sm.tile_version    as tileVersion
              , sm.bounds          as bounds
              , sm.connections     as connections

           from {$map_prefix}submap sm
           left outer join {$map_prefix}mapper m
             on sm.mapper_id = m.id
              , {$map_prefix}map_type smt
          where sm.map_id = ?
            and sm.visible = 1
            and sm.map_type_id = smt.id
          order by sm.submap_order
                 , sm.id
      ", [$row['id']]);

      $arr_child = array();
      foreach ($submaps as $row2) {
         $bundledTileBase = bundledMapTileBaseURL($row2['tileURL']);
         if ($bundledTileBase !== null) {
            $row2['tileBaseURL'] = $bundledTileBase;
         } elseif (PHP_SAPI === 'cli-server' && is_dir(dirname(__DIR__) . '/tiles/' . $row2['tileURL'])) {
            $row2['tileBaseURL'] = '/tiles/';
         }
         // The Switch Map thumbnail's version (its file's change time and
         // size): in its address (scripts/zmap.js _mapIconURL), so new art
         // at the same file is a new address, never a cached copy of the old.
         $iconFile = dirname(__DIR__) . '/images/icons/' . $row2['tileURL'] . 'icon.' . $row2['tileExt'];
         if (strpos($row2['tileURL'] . $row2['tileExt'], '..') === false && is_file($iconFile)) {
            $row2['iconVersion'] = substr(md5(filemtime($iconFile) . ':' . filesize($iconFile)), 0, 10);
         }
         $row2['submapLayer'] = $db->fetchAllAssociative("
            select sml.id
                 , sml.name
                 , sml.tile_url           as tileURL
                 , sml.tile_ext           as tileExt

                 , sml.img404             as img404

                 , " . sprintf($sqlMapperCredit, 'sml') . "

                 , sml.control_visible    as controlVisible
                 , sml.control_checked    as controlChecked

                 , sml.type
                 , sml.opacity

              from {$map_prefix}submap_layer sml
              left outer join {$map_prefix}mapper m
                on (sml.mapper_id = m.id)
             where sml.submap_id = ?
               and sml.visible = 1
             order by layer_order
                    , sml.id
         ", [$row2['id']]);

         $row2['regions'] = $regionsBySubmap[$row2['id']] ?? array();
         // OoT's extras (step 1's columns): the artwork's version, Hyrule's
         // pan limits and connector lines. Left out where empty, as for
         // every other game.
         foreach (['tileVersion', 'bounds', 'connections'] as $extra) {
            if ($row2[$extra] === null) unset($row2[$extra]);
            elseif ($extra !== 'tileVersion') $row2[$extra] = json_decode($row2[$extra], true);
         }
         $arr_child[] = $row2;
      }
      if ($row['kind'] === null) unset($row['kind']);
      $row['subMap'] = $arr_child;
      $res[] = $row;
   }
   echo json_encode($res);
?>
