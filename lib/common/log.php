<?php
  # MIT Licensed
  # by Pysis(868)
  # https://choosealicense.com/licenses/mit/

  include_once(__DIR__."/../../config.php");

  $debugLog = '';

  function debug_log($message) {
    global $debugLoggingMode, $debugLog;
    $formattedMessage = 'DEBUG: '.$message."\n";

    if($debugLoggingMode == 'errorLog') {
      error_log($formattedMessage);
    } elseif ($debugLoggingMode == 'output') {
      print($formattedMessage);
    } elseif ($debugLoggingMode == 'buffer') {
      $debugLog .= $formattedMessage;
    } elseif ($debugLoggingMode == 'return') {
      return $formattedMessage;
    }
  }
?>
