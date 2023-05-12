<?php
  $path = __DIR__;

  $settingIncludeHidden = (
    isset($_GET["includeHidden"])
    && $_GET["includeHidden"] == 'true'
  );
  $settingAllSince = (
    isset($_GET["allSince"])
    && $_GET["allSince"] == 'true'
  );

  if(isset($_GET["sinceVersion"])) {
    $sinceVersion = $mysqli->real_escape_string($_GET["sinceVersion"]);
    $sinceVersionParts = explode('.', $sinceVersion, 3);
    // $resDebug['sinceVersionParts-GET'] = $sinceVersionParts;
  } else {
    start_session("zmap");

    if(
        isset($_SESSION['v1'])
      & isset($_SESSION['v2'])
      & isset($_SESSION['v3'])
    ) {
      $sinceVersionParts = array(
        $_SESSION['v1'],
        $_SESSION['v2'],
        $_SESSION['v3']
      );
      // $resDebug['sinceVersionParts-SESSION'] = $sinceVersionParts;

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

  $sqlVersionFieldsConcat = "CONCAT(
    `version_major`,
    '.',
    `version_minor`,
    '.',
    `version_patch`
  )";
  if($settingAllSince) {
    $sqlSelectUnseenVersion = "SELECT $sqlVersionFieldsConcat `version`";
    $sqlGroup               = "GROUP BY `version`";
  } else {
    $sqlSelectUnseenVersion = "SELECT MAX($sqlVersionFieldsConcat) `version`";
    $sqlGroup               = "";
  }
  // $resDebug['_GET["allSince"]'] = $_GET["allSince"];
  if(!$settingIncludeHidden) {
    $sqlHiddenPredicate = "AND `hidden` = '0'";
  }
  $query = "
    SELECT `id`
          , `version_major` AS `v1`
          , `version_minor` AS `v2`
          , `version_patch` AS `v3`
          , `content`       AS `content`
    FROM `{$map_prefix}changelog`
        , (
            $sqlSelectUnseenVersion
            FROM `changelog`
            WHERE $sqlVersionFieldsConcat > '{$sinceVersion}'
            $sqlGroup
          ) `unseenVersions`
    WHERE
      `unseenVersions`.`version` = $sqlVersionFieldsConcat
      $sqlHiddenPredicate
    ORDER BY
        `version_major` ASC
      , `version_minor` ASC
      , `version_patch` ASC
    ;
  ";

  // $resDebug['map_prefix']  = $map_prefix;
  // $resDebug['query']       = $query;

  $result = @$mysqli->query($query);

  if(!$result) {
    print($mysqli->error);
    return;
  }

  if(isset($resDebug)) {
    $res = $resDebug;
  } else {
    $res = array();
    // if(isset($resDebug)) $res['__DEBUG__'] = $resDebug;
    // Source: https://stackoverflow.com/a/9785685/1091943
    while($row = $result->fetch_assoc()) {
      $res[] = $row;
    }
  }
  echo json_encode($res);
?>
