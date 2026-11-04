<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // A profile's banner, cropped to 3:1.
  if (!wikiHasUserColumn($db, $map_prefix, 'profile_banner')) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to add banners.'));
    return;
  }
  $userId = (int) ($_POST['userId'] ?? $editor['id']);
  if ($userId !== $editor['id'] && $editor['level'] < WIKI_ADMIN_LEVEL) {
    echo json_encode(array('success' => false, 'msg' => "You can't edit this profile."));
    return;
  }
  [$imagePath, $uploadError] = wikiSaveImage($_FILES['banner'] ?? null, 'profile-banners', $userId, 1500, 500, 'cover');
  if ($uploadError !== null) {
    echo json_encode(array('success' => false, 'msg' => $uploadError));
    return;
  }
  $db->executeStatement("UPDATE `{$map_prefix}user` SET `profile_banner` = ? WHERE `id` = ?", [$imagePath, $userId]);
  $kept = dirname(__DIR__) . '/' . $imagePath;
  foreach (glob(dirname(__DIR__) . '/uploads/profile-banners/' . $userId . '-*.webp') ?: [] as $old) {
    if ($old !== $kept) @unlink($old);
  }
  echo json_encode(array('success' => true, 'msg' => 'Banner updated!', 'banner' => $imagePath));
?>
