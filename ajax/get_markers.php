<?php
  if (!isset($_GET['newMarkerId'])) {
    $path = __DIR__;
  }

  $game = $_GET["game"] ?? '';
  include_once(dirname(__DIR__) . '/lib/common/oot_pack.php');
  if (ootPackIsGame($game)) { echo json_encode(ootPackData('markers')); return; }
  if ($game === '' || !preg_match('/^[A-Za-z0-9_-]+$/', $game)) {
    echo json_encode(array());
    return;
  }

  if (file_exists("$path/static/markers_{$game}.json")) {
    readfile("$path/static/markers_{$game}.json");
    return;
  }

  // Hidden markers are included for the admin grid (grid.html) or on request.
  // @TODO: this should require an admin-level session; see the review notes.
  $includeHidden = (
    isset($_GET['all'])
    || (
          isset($_SERVER["HTTP_REFERER"])
      &&  strpos($_SERVER["HTTP_REFERER"], '/grid.html') !== false
    )
  );
  $sqlVisible = $includeHidden ? 'm.visible in (0, 1)' : 'm.visible = 1';

  $db->executeStatement("SET SESSION group_concat_max_len = 4294967295");

  $sql = "
    select m.id
         , mp.id                        as mapId
         , m.submap_id                  as submapId
         , m.overlay_id                 as overlayId
         , m.marker_category_id         as markerCategoryId
         , mc.marker_category_type_id   as markerCategoryTypeId
         , m.user_id                    as userId
         , u.username                   as userName
         , m.name
         , m.description
         , m.x
         , m.y
         , m.z
         , m.jump_marker_id             as jumpMakerId
         , GROUP_CONCAT(coalesce(t.marker_tab_id,'') ORDER BY t.marker_tab_id asc SEPARATOR '<|>') as tabId
         , GROUP_CONCAT(coalesce(t.tab_title,'') ORDER BY t.marker_tab_id asc SEPARATOR '<|>')     as tabTitle
         , GROUP_CONCAT(coalesce(t.tab_text, '') ORDER BY t.marker_tab_id asc SEPARATOR '<|>')     as tabText
         , GROUP_CONCAT(coalesce(t.user_id, '') ORDER BY t.marker_tab_id asc SEPARATOR '<|>')      as tabUserId
         , GROUP_CONCAT(coalesce(t.username, '') ORDER BY t.marker_tab_id asc SEPARATOR '<|>')     as tabUserName
         , m.path
         , m.game_data                  as gameData
         , m.global                     as globalMarker
         , m.visible
      from {$map_prefix}marker m
      left outer join (SELECT c.marker_tab_id
                            , c.tab_title
                            , c.tab_text
                            , c.user_id
                            , u2.username
                            , c.marker_id
                         FROM {$map_prefix}marker_tab c
                         LEFT OUTER JOIN {$map_prefix}user u2
                           ON c.user_id = u2.id
                        WHERE c.visible = 1
                      ) t
        on m.id = t.marker_id
         , {$map_prefix}marker_category mc
         , {$map_prefix}submap smp
         , {$map_prefix}map mp
         , {$map_prefix}user u
     where m.marker_category_id = mc.id
       and m.submap_id = smp.id
       and smp.map_id = mp.id
       and mp.container_id = ?
       and m.user_id = u.id
       and {$sqlVisible}
       and mc.visible = 1
  ";
  $params = [$game];

  if (isset($_GET['newMarkerId'])) {
    $sql .= " and m.id = ?";
    $params[] = (int) $_GET['newMarkerId'];
  }
  $sql .= "
     group by m.id
     order by m.id desc
  ";

  $rows = $db->fetchAllAssociative($sql, $params);

  $res = array();
  foreach ($rows as $row) {
    $row["tabTitle"]    = html_entity_decode($row["tabTitle"],    ENT_QUOTES, "UTF-8");
    $row["tabText"]     = html_entity_decode($row["tabText"],     ENT_QUOTES, "UTF-8");
    $row["name"]        = html_entity_decode($row["name"],        ENT_QUOTES, "UTF-8");
    $row["description"] = html_entity_decode($row["description"], ENT_QUOTES, "UTF-8");
    $res[] = $row;
  }
  echo json_encode($res);
?>
