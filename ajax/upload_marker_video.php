<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Videos for marker content, from the editor's Upload Video button: short
  // clips like a Switch's 30-second recordings (MP4), shown muted and looping
  // (scripts/zvideo.js). GET answers how large an upload may be.
  $bytes = function($value) {
    $value = trim((string) $value);
    $number = (float) $value;
    switch (strtolower(substr($value, -1))) {
      case 'g': $number *= 1024;
      case 'm': $number *= 1024;
      case 'k': $number *= 1024;
    }
    return (int) $number;
  };
  $maxBytes = min(64 * 1024 * 1024, $bytes(ini_get('upload_max_filesize')), $bytes(ini_get('post_max_size')));
  if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(array('success' => true, 'maxBytes' => $maxBytes));
    return;
  }
  $limitText = round($maxBytes / 1048576) . 'MB';
  $upload = $_FILES['file'] ?? null;
  if (!$upload || !is_array($upload) || ($upload['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
    $error = $upload['error'] ?? UPLOAD_ERR_NO_FILE;
    $msg = in_array($error, [UPLOAD_ERR_INI_SIZE, UPLOAD_ERR_FORM_SIZE], true)
      ? "Videos can be up to {$limitText}."
      : (empty($_FILES) && !empty($_SERVER['CONTENT_LENGTH']) ? "Videos can be up to {$limitText}." : 'Choose a video to upload.');
    http_response_code(400);
    echo json_encode(array('success' => false, 'msg' => $msg));
    return;
  }
  if ($upload['size'] > $maxBytes) {
    http_response_code(400);
    echo json_encode(array('success' => false, 'msg' => "Videos can be up to {$limitText}."));
    return;
  }
  $types = array('video/mp4' => 'mp4', 'video/quicktime' => 'mov', 'video/webm' => 'webm');
  $mime = (new finfo(FILEINFO_MIME_TYPE))->file($upload['tmp_name']);
  if (!isset($types[$mime])) {
    http_response_code(400);
    echo json_encode(array('success' => false, 'msg' => 'Videos can be MP4 (like the Switch records), MOV or WebM.'));
    return;
  }
  $folder = dirname(__DIR__) . '/uploads/marker-videos';
  if (!is_dir($folder) && !mkdir($folder, 0755, true)) {
    http_response_code(500);
    echo json_encode(array('success' => false, 'msg' => 'The video could not be saved.'));
    return;
  }
  $name = (int) $editor['id'] . '-' . bin2hex(random_bytes(12)) . '.' . $types[$mime];
  if (!move_uploaded_file($upload['tmp_name'], "$folder/$name")) {
    http_response_code(500);
    echo json_encode(array('success' => false, 'msg' => 'The video could not be saved.'));
    return;
  }
  echo json_encode(array('success' => true, 'location' => 'uploads/marker-videos/' . $name, 'type' => $mime));
?>
