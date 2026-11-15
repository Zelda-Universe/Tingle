<?php
  // Credits for the images on a page (scripts/services/ImageCredits.js):
  // GET srcs, a JSON list of up to 100 image addresses. Answers
  // {credits: {src: {author, source, license}}} for those that have one, by
  // the address as asked.
  include_once(dirname(__DIR__) . '/lib/common/image_credits.php');
  $srcs = json_decode(is_string($_GET['srcs'] ?? null) ? $_GET['srcs'] : '', true);
  if (!is_array($srcs) || count($srcs) > 100) { http_response_code(400); echo json_encode(array('success' => false, 'msg' => 'Invalid images.')); return; }
  $keys = array();
  foreach ($srcs as $src) if (is_string($src) && ($key = imageCreditKey($src)) !== null) $keys[$src] = $key;
  $byKey = imageCreditsFor($db, $map_prefix, array_values(array_unique($keys)));
  $credits = array();
  foreach ($keys as $src => $key) if (isset($byKey[$key])) $credits[$src] = $byKey[$key];
  echo json_encode(array('success' => true, 'credits' => (object) $credits, 'licenses' => imageCreditLicenses()));
?>
