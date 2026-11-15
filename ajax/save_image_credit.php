<?php
  // Sets an image's credit (scripts/services/ImageCredits.js, from the
  // marker editor's Credit button). POST src, author, source, license.
  // Own work with no author or source clears it. Editors only.
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');
  include_once(dirname(__DIR__) . '/lib/common/image_credits.php');
  if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); echo json_encode(array('success' => false, 'msg' => 'Use POST.')); return; }
  $origin = $_SERVER['HTTP_ORIGIN'] ?? '';
  if (($_SERVER['HTTP_SEC_FETCH_SITE'] ?? '') === 'cross-site' || ($origin && strcasecmp((string) parse_url($origin, PHP_URL_HOST), preg_replace('/:\d+$/', '', $_SERVER['HTTP_HOST'] ?? '')) !== 0)) {
    http_response_code(403); echo json_encode(array('success' => false, 'msg' => 'Invalid request origin.')); return;
  }
  $editor = wikiRequireEditor($db, $map_prefix);
  if ($editor === null) return;
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  if (!imageCreditsAvailable($db, $map_prefix)) { $fail('Run the image_credits migration to credit images.'); return; }

  $key = imageCreditKey($_POST['src'] ?? '');
  if ($key === null) { $fail('Only uploaded images and images from other sites can be credited.'); return; }
  $author = trim(is_string($_POST['author'] ?? null) ? $_POST['author'] : '');
  $source = trim(is_string($_POST['source'] ?? null) ? $_POST['source'] : '');
  $license = is_string($_POST['license'] ?? null) ? $_POST['license'] : 'own';
  if (!isset(imageCreditLicenses()[$license])) { $fail('Choose a license.'); return; }
  if (mb_strlen($author) > 120 || preg_match('/[<>]/', $author)) { $fail('Keep the author under 120 characters, without < or >.'); return; }
  if ($source !== '' && (strlen($source) > 500 || !preg_match('#^https?://#i', $source) || !filter_var($source, FILTER_VALIDATE_URL))) { $fail('The source must be a web address (https://…).'); return; }
  if ($license !== 'own' && $author === '' && $source === '') { $fail('Say who made it, or where it’s from.'); return; }

  $hash = hash('sha256', $key);
  if ($license === 'own' && $author === '' && $source === '') {
    $db->executeStatement("DELETE FROM `{$map_prefix}image_credit` WHERE src_hash = ?", [$hash]);
    echo json_encode(array('success' => true, 'credit' => null));
    return;
  }
  $db->executeStatement("INSERT INTO `{$map_prefix}image_credit` (src, src_hash, author, source_url, license, user_id, created, updated)
    VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())
    ON DUPLICATE KEY UPDATE author = VALUES(author), source_url = VALUES(source_url), license = VALUES(license), user_id = VALUES(user_id), updated = NOW()",
    [$key, $hash, $author, $source, $license, $editor['id']]);
  echo json_encode(array('success' => true, 'credit' => array('author' => $author, 'source' => $source, 'license' => $license)));
?>
