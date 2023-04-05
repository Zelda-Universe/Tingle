<?php
  include_once(__DIR__."/../../config.php");

  function debug_log($message) {
    global $debugLoggingMode;
    $formattedMessage = 'DEBUG: '.$message."\n";

    if($debugLoggingMode == 'errorLog') {
      error_log($formattedMessage);
    } elseif ($debugLoggingMode == 'output') {
      print($formattedMessage);
    } elseif ($debugLoggingMode == 'return') {
      return $formattedMessage;
    }
  }
?>
