<?php
  // Sign-up prompt events from the page (ZMap.trackFeatureEvent), sent with
  // sendBeacon. Anonymous; see lib/common/signups.php.
  include_once(dirname(__DIR__) . '/lib/common/signups.php');
  $saved = signupRecord(
    $db, $map_prefix, (string) ($_POST['event'] ?? ''), (string) ($_POST['feature'] ?? ''),
    (string) ($_POST['variant'] ?? '')
  );
  echo json_encode(array('success' => true, 'saved' => $saved));
?>
