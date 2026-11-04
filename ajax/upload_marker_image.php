<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Images for marker descriptions, from the editor's image button. Replaces
  // content/upload.php, which trusted the client's file name and folder.
  [$imagePath, $uploadError] = wikiSaveImage($_FILES['file'] ?? null, 'marker-images', $editor['id'], 1600, 1600, 'fit');
  if ($uploadError !== null) {
    http_response_code(400);
    echo json_encode(array('success' => false, 'msg' => $uploadError, 'error' => array('message' => $uploadError)));
    return;
  }
  echo json_encode(array('success' => true, 'location' => $imagePath));
?>
