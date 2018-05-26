<?php
  $path = DIRNAME(__FILE__);
  include("$path/../config.php");

  if(isset($_GET["sinceVersion"]))
    $sinceVersion = $mysqli->real_escape_string($_GET["sinceVersion"]);

  if(isset($sinceVersion)) {
    $sinceVersionParts = split('\.', $sinceVersion, 3);
  } else {
    start_session("zmap");

    if(isset($_SESSION['seen_latest_changelog'])) {
      if($_SESSION['seen_latest_changelog']) {
        echo json_encode(
          array(
            "success"=>true,
            "msg"=>"User has already seen the latest changelog entries."
          )
        );
        return;
      }

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
    SELECT
      *
    FROM (
      SELECT
        `id`,
        `version_major` AS v1,
        `version_minor` AS v2,
        `version_patch` AS v3,
        `content` AS content
      FROM
        `{$map_prefix}changelog`
    ) AS innerTable
    WHERE
      `v1` > {$sinceVersionParts[0]} OR
      `v2` > {$sinceVersionParts[1]} OR
      `v3` > {$sinceVersionParts[2]}
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
