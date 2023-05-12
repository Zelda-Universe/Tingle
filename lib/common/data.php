<?php
// Source: https://stackoverflow.com/a/2162528/1091943
function getLineCount($file) {
  $linecount = 0;
  $handle = fopen($file, "r");
  while(!feof($handle)){
    $line = fgets($handle);
    $linecount++;
  }

  fclose($handle);

  return $linecount;
}
?>
