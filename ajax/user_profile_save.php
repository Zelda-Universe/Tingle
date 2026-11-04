<?php
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;

  // Saves a profile's bio, or removes its banner. Your own, or anyone's as
  // an admin.
  if (!wikiHasUserColumn($db, $map_prefix, 'bio')) {
    echo json_encode(array('success' => false, 'msg' => 'Run the create_wiki migration to edit profiles.'));
    return;
  }
  $userId = (int) ($_POST['userId'] ?? $editor['id']);
  if ($userId !== $editor['id'] && $editor['level'] < WIKI_ADMIN_LEVEL) {
    echo json_encode(array('success' => false, 'msg' => "You can't edit this profile."));
    return;
  }
  if (isset($_POST['removeBanner'])) {
    $db->executeStatement("UPDATE `{$map_prefix}user` SET `profile_banner` = NULL WHERE `id` = ?", [$userId]);
    foreach (glob(dirname(__DIR__) . '/uploads/profile-banners/' . $userId . '-*.webp') ?: [] as $old) @unlink($old);
    echo json_encode(array('success' => true, 'msg' => 'Banner removed.'));
    return;
  }
  $bio = trim(is_string($_POST['bio'] ?? null) ? str_replace("\r\n", "\n", $_POST['bio']) : '');
  if (mb_strlen($bio) > 2000) {
    echo json_encode(array('success' => false, 'msg' => 'Bios can be up to 2,000 characters.'));
    return;
  }
  $db->executeStatement("UPDATE `{$map_prefix}user` SET `bio` = ? WHERE `id` = ?", [$bio === '' ? null : $bio, $userId]);
  echo json_encode(array('success' => true, 'msg' => 'Profile saved.', 'bio' => $bio));
?>
