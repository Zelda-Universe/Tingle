<?php
  // An Embed Code copied (ZMap.trackEmbedCopy), sent with sendBeacon. POST
  // target ('marker', 'pin' or 'path'), game. Anonymous: lib/common/embeds.php.
  include_once(dirname(__DIR__) . '/lib/common/embeds.php');
  $saved = embedRecord($db, $map_prefix, 'copy', (string) ($_POST['target'] ?? ''), (string) ($_POST['game'] ?? ''));
  echo json_encode(array('success' => true, 'saved' => $saved));
?>
