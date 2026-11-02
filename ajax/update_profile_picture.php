<?php
  start_session('zmap');

  if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('success' => false, 'msg' => 'Please log in first.'));
    return;
  }

  if (!isset($_FILES['profile_picture'])) {
    echo json_encode(array('success' => false, 'msg' => 'Choose an image to upload.'));
    return;
  }

  $upload = $_FILES['profile_picture'];
  if ($upload['error'] !== UPLOAD_ERR_OK) {
    $message = $upload['error'] === UPLOAD_ERR_INI_SIZE || $upload['error'] === UPLOAD_ERR_FORM_SIZE
      ? 'The image is too large.'
      : 'The image could not be uploaded.';
    echo json_encode(array('success' => false, 'msg' => $message));
    return;
  }

  if ($upload['size'] > 5 * 1024 * 1024) {
    echo json_encode(array('success' => false, 'msg' => 'Profile pictures must be 5 MB or smaller.'));
    return;
  }

  $imageInfo = @getimagesize($upload['tmp_name']);
  $allowedMimeTypes = array('image/jpeg', 'image/png', 'image/webp', 'image/gif');
  if (
    !$imageInfo ||
    !in_array($imageInfo['mime'], $allowedMimeTypes, true) ||
    $imageInfo[0] < 1 || $imageInfo[1] < 1 ||
    $imageInfo[0] > 12000 || $imageInfo[1] > 12000 ||
    ($imageInfo[0] * $imageInfo[1]) > 40000000
  ) {
    echo json_encode(array('success' => false, 'msg' => 'Choose a valid JPG, PNG, WebP, or GIF image.'));
    return;
  }

  $imageBytes = file_get_contents($upload['tmp_name']);
  $sourceImage = $imageBytes === false ? false : @imagecreatefromstring($imageBytes);
  if (!$sourceImage) {
    echo json_encode(array('success' => false, 'msg' => 'The selected image could not be read.'));
    return;
  }

  if ($imageInfo['mime'] === 'image/jpeg' && function_exists('exif_read_data')) {
    $exif = @exif_read_data($upload['tmp_name']);
    $orientation = isset($exif['Orientation']) ? (int) $exif['Orientation'] : 1;
    if ($orientation === 3) {
      $sourceImage = imagerotate($sourceImage, 180, 0);
    } elseif ($orientation === 6) {
      $sourceImage = imagerotate($sourceImage, -90, 0);
    } elseif ($orientation === 8) {
      $sourceImage = imagerotate($sourceImage, 90, 0);
    }
  }

  $sourceWidth = imagesx($sourceImage);
  $sourceHeight = imagesy($sourceImage);
  $cropSize = min($sourceWidth, $sourceHeight);
  $cropX = (int) floor(($sourceWidth - $cropSize) / 2);
  $cropY = (int) floor(($sourceHeight - $cropSize) / 2);
  $outputImage = imagecreatetruecolor(512, 512);
  imagealphablending($outputImage, false);
  imagesavealpha($outputImage, true);
  $transparent = imagecolorallocatealpha($outputImage, 0, 0, 0, 127);
  imagefill($outputImage, 0, 0, $transparent);
  imagecopyresampled(
    $outputImage,
    $sourceImage,
    0, 0,
    $cropX, $cropY,
    512, 512,
    $cropSize, $cropSize
  );
  imagedestroy($sourceImage);

  $uploadDirectory = dirname(__DIR__) . '/uploads/profile-pictures';
  if (!is_dir($uploadDirectory) && !mkdir($uploadDirectory, 0755, true)) {
    imagedestroy($outputImage);
    echo json_encode(array('success' => false, 'msg' => 'The profile-picture folder is unavailable.'));
    return;
  }

  $userId = (int) $_SESSION['user_id'];
  $fileName = $userId . '-' . bin2hex(random_bytes(12)) . '.webp';
  $absolutePath = $uploadDirectory . '/' . $fileName;
  if (!imagewebp($outputImage, $absolutePath, 88)) {
    imagedestroy($outputImage);
    echo json_encode(array('success' => false, 'msg' => 'The profile picture could not be saved.'));
    return;
  }
  imagedestroy($outputImage);

  $profilePicture = 'uploads/profile-pictures/' . $fileName;
  $profileColumnResult = @$mysqli->query(
    "SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'"
  );
  $hasProfileColumn = $profileColumnResult && $profileColumnResult->num_rows > 0;
  if ($hasProfileColumn) {
    $escapedProfilePicture = $mysqli->real_escape_string($profilePicture);
    $updated = $mysqli->query(
      "UPDATE {$map_prefix}user SET profile_picture = '{$escapedProfilePicture}' WHERE id = {$userId}"
    );
    if (!$updated) {
      @unlink($absolutePath);
      echo json_encode(array('success' => false, 'msg' => 'The profile picture could not be attached to your account.'));
      return;
    }
  }

  $oldPictures = glob($uploadDirectory . '/' . $userId . '-*.webp');
  if ($oldPictures) {
    foreach ($oldPictures as $oldAbsolutePath) {
      if ($oldAbsolutePath !== $absolutePath && is_file($oldAbsolutePath)) {
        @unlink($oldAbsolutePath);
      }
    }
  }

  echo json_encode(array(
    'success' => true,
    'msg' => 'Profile picture updated!',
    'profilePicture' => $profilePicture . '?v=' . time()
  ));
?>
