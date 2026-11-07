<?php
  $path = __DIR__;

  $fieldNamesInts = [
    'categoryId'        ,
    'game'              ,
    'lat'               ,
    'lng'               ,
    'userId'            ,
    'submapId'
  ];
  $fieldNamesStrs = [
    'markerTitle'       ,
    'markerDescription' ,
    'tabText'
  ];

  foreach (array_merge($fieldNamesInts, $fieldNamesStrs) as $fieldName) {
    if (!isset($_POST[$fieldName])) {
      echo json_encode(array(
        "success" => false,
        "msg"     => "Need all relevant marker data!"
      ));
      return;
    }
  }

  foreach ($fieldNamesInts as $fieldName) {
    if (!is_numeric($_POST[$fieldName])) {
      echo json_encode(array(
        "success" => false,
        "msg"     => "Need all marker data to be properly formatted!"
      ));
      return;
    }
  }

  start_session("zmap");
  if (
        !isset($_SESSION['user_id'])
    ||  $_SESSION['user_id'] != $_POST['userId']
  ) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Not logged!"
    ));
    return;
  }
  $sessionUserId = (int) $_SESSION['user_id'];
  $sessionLevel  = (int) ($_SESSION['level'] ?? 0);
  $sessionBeta   = !empty($_SESSION['beta_editor']);
  session_write_close();

  $isUpdate   = isset($_POST['markerId']) && is_numeric($_POST['markerId']);
  $userId     = $sessionUserId;
  $submapId   = (int) $_POST['submapId'];
  $categoryId = (int) $_POST['categoryId'];
  $x          = (float) $_POST['lng'];
  $y          = (float) $_POST['lat'];
  $isGlobal   = isset($_POST['isGlobal']) ? 1 : 0;
  // Height, where a game has one. Blank clears it; editors from before it
  // was a field don't send it, which keeps what's there.
  $hasZ = array_key_exists('z', $_POST);
  $z    = $hasZ && is_numeric(trim((string) $_POST['z'])) ? (float) $_POST['z'] : null;
  if (!is_finite($x) || !is_finite($y) || ($z !== null && !is_finite($z))) {
    echo json_encode(array("success" => false, "msg" => "Coordinates must be numbers."));
    return;
  }

  // Stored entity-encoded; get_markers decodes on the way out.
  // stripslashes() predates the removal of magic quotes and is kept for parity.
  $name        = htmlentities(stripslashes($_POST['markerTitle']),       ENT_QUOTES, "UTF-8");
  $description = htmlentities(stripslashes($_POST['markerDescription']), ENT_QUOTES, "UTF-8");

  if ($isUpdate) {
    $markerId = (int) $_POST['markerId'];

    // Authorisation is decided by who owns the marker in the database, not by
    // the userId the client sends. Level 10+ may edit any marker; level 5-9
    // only their own; beta testers any (they can't change its visibility).
    $ownerId = $db->fetchOne("
      SELECT user_id
        FROM {$map_prefix}marker
       WHERE id = ?
    ", [$markerId]);

    if ($ownerId === false) {
      echo json_encode(array(
        "success" => false,
        "msg"     => "Marker not found!"
      ));
      return;
    }

    if (
          $sessionLevel < 5
      ||  ($sessionLevel < 10 && !$sessionBeta && (int) $ownerId !== $sessionUserId)
    ) {
      echo json_encode(array(
        "success"  => false,
        "msg"      => "You can't add this marker!"
      ));
      return;
    }
  }
  // New markers come from editors: Contributors, Admins and people who've
  // opted in to the editing beta (all level 5+, lib/common/account_status.php).
  if (!$isUpdate && $sessionLevel < 5) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Join the editing beta to add markers."
    ));
    return;
  }

  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  begin();

  // History (lib/common/wiki.php): markers edited for the first time keep
  // the version they had first.
  if ($isUpdate) wikiEnsureBaseline($db, $map_prefix, $markerId);

  if (!$isUpdate) {
    $visible = 1;

    $db->executeStatement("
      INSERT INTO {$map_prefix}marker (
          submap_id
        , marker_status_id
        , marker_category_id
        , user_id
        , name
        , description
        , x
        , y
        , z
        , global
        , visible
        , path
        , last_updated
      ) VALUES (?, 2, ?, ?, ?, ?, ?, ?, ?, ?, ?, '', now())
    ", [$submapId, $categoryId, $userId, $name, $description, $x, $y, $z, $isGlobal, $visible]);

    $markerId = (int) $db->lastInsertId();
  } else {
    $sql = "
      UPDATE {$map_prefix}marker
         SET submap_id          = ?
           , marker_category_id = ?
           , name               = ?
           , description        = ?
           , x                  = ?
           , y                  = ?
           , global             = ?
           , last_updated       = now()
    ";
    $params = [$submapId, $categoryId, $name, $description, $x, $y, $isGlobal];

    if ($hasZ) {
      $sql     .= "   , z = ?\n";
      $params[] = $z;
    }

    if ($sessionLevel >= 10) {
      $sql     .= "   , visible = ?\n";
      $params[] = isset($_POST['isVisible']) ? 1 : 0;
    }

    $sql     .= " WHERE id = ?";
    $params[] = $markerId;

    $db->executeStatement($sql, $params);

    // Replace the marker's tabs: hide the current ones, insert the submitted ones.
    $db->executeStatement("
      UPDATE {$map_prefix}marker_tab
         SET visible = 0
       WHERE visible = 1
         AND marker_id = ?
    ", [$markerId]);
  }

  // The form posts tabText[]; a single string is accepted for older clients.
  $tabTexts = is_array($_POST['tabText']) ? $_POST['tabText'] : [$_POST['tabText']];
  foreach ($tabTexts as $tabText) {
    if (!is_string($tabText) || $tabText === '') {
      continue;
    }

    // Unwrap an image that the editor wrapped in an otherwise empty paragraph.
    $tabText = preg_replace('/<p>\s*?(<a .*?><img.*?><\/a>|<img.*?>)?\s*<\/p>/s', '\1', $tabText);

    $db->executeStatement("
      INSERT INTO {$map_prefix}marker_tab (
          marker_id
        , marker_tab_status_id
        , user_id
        , tab_title
        , tab_text
        , tab_order
        , visible
      ) VALUES (?, 1, ?, '', ?, 1, 1)
    ", [$markerId, $userId, htmlentities(stripslashes($tabText), ENT_QUOTES, "UTF-8")]);
  }

  $revisionId = wikiRecordRevision(
    $db, $map_prefix, $markerId, $sessionUserId, $isUpdate ? 'edit' : 'create',
    is_string($_POST['summary'] ?? null) ? $_POST['summary'] : null
  );

  commit();

  // The marker's owner and followers hear about edits.
  if ($isUpdate) {
    include_once(dirname(__DIR__) . '/lib/common/notifications.php');
    notifyMarkerChange($db, $map_prefix, $sessionUserId, $markerId, $revisionId, 'edit');
  }

  // Return the marker exactly as get_markers renders it.
  $_GET['newMarkerId'] = $markerId;
  $_GET['game']        = $_POST['game'];
  ob_start();
  include("$path/get_markers.php");
  $output = ob_get_clean();

  echo json_encode(array(
    "success" => true,
    "action"  => ($isUpdate ? "UPDATE" : "ADD"),
    "marker"  => $output
  ));
?>
