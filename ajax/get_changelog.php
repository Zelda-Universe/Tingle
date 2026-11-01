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

  // Note: when the version comes from the session, the original code compared
  // against an unset variable (i.e. ''), returning the latest changelog
  // regardless of what the user had seen. That behaviour is preserved here
  // on purpose; the frontend relies on get_user_info's seen_version instead.
  $sinceVersion = '';
  if(isset($_GET["sinceVersion"])) {
    $sinceVersion = (string) $_GET["sinceVersion"];
  } else {
    start_session("zmap");

    if(
        isset($_SESSION['v1'])
      & isset($_SESSION['v2'])
      & isset($_SESSION['v3'])
    ) {
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
  $sqlHiddenPredicate = $settingIncludeHidden ? "" : "AND `hidden` = '0'";

  $res = $db->fetchAllAssociative("
    SELECT `id`
          , `version_major` AS `v1`
          , `version_minor` AS `v2`
          , `version_patch` AS `v3`
          , `content`       AS `content`
    FROM `{$map_prefix}changelog`
        , (
            $sqlSelectUnseenVersion
            FROM `{$map_prefix}changelog`
            WHERE $sqlVersionFieldsConcat > ?
            $sqlGroup
          ) `unseenVersions`
    WHERE
      `unseenVersions`.`version` = $sqlVersionFieldsConcat
      $sqlHiddenPredicate
    ORDER BY
        `version_major` ASC
      , `version_minor` ASC
      , `version_patch` ASC
  ", [$sinceVersion]);

  echo json_encode($res);
?>
