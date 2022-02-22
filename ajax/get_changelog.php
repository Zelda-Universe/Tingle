<?php
  $path = __DIR__;
  include("$path/../config.php");

  if(isset($_GET["sinceVersion"]))
    $sinceVersion = $mysqli->real_escape_string($_GET["sinceVersion"]);


  if(isset($sinceVersion)) {
    $sinceVersionParts = explode('.', $sinceVersion, 3);
  } else {
    start_session("zmap");

    if(isset($_SESSION['v1']) & isset($_SESSION['v2']) & isset($_SESSION['v3'])) {
      $sinceVersionParts = array(
        $_SESSION['v1'],
        $_SESSION['v2'],
        $_SESSION['v3']
      );

      session_write_close();
    } else {
      echo json_encode(
        array(
          "success"=>false,
          "msg"=>"No user currently logged in to provide changelog for, and no changelog version specified."
        )
      );
      return;
    }
  }

  $query = "
     SELECT `id`
          , `version_major` as v1
          , `version_minor` as v2
          , `version_patch` as v3
          , `content` AS content
     FROM `{$map_prefix}changelog`
        , (select max(concat(`version_major`, '.', `version_minor`, '.', `version_patch`)) latestVersion
             from changelog
            WHERE concat(`version_major`, '.', `version_minor`, '.', `version_patch`) > '{$sinceVersion}'
          ) t    
    where t.latestVersion = concat(`version_major`, '.', `version_minor`, '.', `version_patch`)
    ;
  ";
  //echo $query;

  $result = @$mysqli->query($query);

  if(!$result) {
    print($mysqli->error);
    return;
  }

  $res = array();
  while($row = $result->fetch_assoc()) {
    $res[] = $row;
  }
  echo json_encode($res);
?>
