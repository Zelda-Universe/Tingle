<?php
  include_once(__DIR__.'/config.php');
  include_once(__DIR__.'/lib/common/log.php');

  $commentRegex = '/^\s*\/\//';

  $output = '';
  $debugOutput = '';

  function checkIfUpdateNecessaryBySourceFiles($cacheRegistryData) {
    global $debugOutput;
    global $commentRegex;

    // $debugOutput .= debug_log('checkIfUpdateNecessaryBySourceFiles START');
    // $debugOutput .= debug_log('count(cacheRegistryData): '.count($cacheRegistryData));
    foreach($cacheRegistryData as $resFile => $time) {
      // $debugOutput .= debug_log("resfile: $resFile");

      $isCommented  = preg_match($commentRegex, $resFile);
      $fileExists   = file_exists($resFile);
      if($isCommented || !$fileExists) {
        // $debugOutput .= debug_log("isCommented: " .var_export($isCommented, true));
        // $debugOutput .= debug_log("fileExists: "  .var_export($fileExists, true));

        // $debugOutput .= debug_log('checkIfUpdateNecessaryBySourceFiles continue');
        continue;
      }

      if($time != filemtime($resFile)) {
        // $debugOutput .= debug_log('checkIfUpdateNecessaryBySourceFiles return');
        return true;
      }
    }
    // $debugOutput .= debug_log('checkIfUpdateNecessaryBySourceFiles END');
  }

  // $debugOutput .= debug_log("__FILE__         : ".__FILE__);
  // $debugOutput .= debug_log("__DIR__          : ".__DIR__ );

  if(!isset($_GET["type"])) {
    print("A type must be provided! javascript or css.");
    exit;
  }

  $type = strtolower($_GET['type']);
  $type = preg_replace("#[^a-z]#", "", $type);
  if(
        $type != "javascript"
    &&  $type != "css"
  ) {
    $output .= "Invalid type! ($type)";
    return;
  }
  $mtype = "text/$type";
  $ext = ".css";

  if($type == "javascript") {
    $ext = ".js";
  }

  // $debugOutput .= debug_log("type                   : $type " );
  // $debugOutput .= debug_log("mtype                  : $mtype" );
  // $debugOutput .= debug_log("ext                    : $ext"   );

  header("Content-Type: $mtype");

        $localRegistryFile = "$type.txt";
  $localRegistryFileExists =  file_exists("$localRegistryFile");
   $localRegistryFileMTime =    filemtime("$localRegistryFile");
        $cacheRegistryFile = "$cacheFolder/$localRegistryFile";
  $cacheRegistryFileExists =  file_exists("$cacheRegistryFile");
   $cacheRegistryFileMTime =    filemtime("$cacheRegistryFile");
            $cacheDestFile = "$cacheFolder/index$ext";
      $cacheDestFileExists =  file_exists("$cacheDestFile");
       $cacheDestFileMTime =    filemtime("$cacheDestFile");

  // $debugOutput .= debug_log("localRegistryFile      : $localRegistryFile"       );
  // $debugOutput .= debug_log("localRegistryFileExists: $localRegistryFileExists" );
  // $debugOutput .= debug_log("localRegistryFileMTime : $localRegistryFileMTime"  );
  // $debugOutput .= debug_log("cacheRegistryFile      : $cacheRegistryFile"       );
  // $debugOutput .= debug_log("cacheRegistryFileExists: $cacheRegistryFileExists" );
  // $debugOutput .= debug_log("cacheRegistryFileMTime : $cacheRegistryFileMTime"  );
  // $debugOutput .= debug_log("cacheDestFile          : $cacheDestFile"           );
  // $debugOutput .= debug_log("cacheDestFileExists    : $cacheDestFileExists"     );
  // $debugOutput .= debug_log("cacheDestFileMTime     : $cacheDestFileMTime"      );

  $update = false;
  // $debugOutput .= debug_log("update           : ".var_export($update, true));
  if(!$cacheRegistryFileExists) {
    // $debugOutput .= debug_log('Source files are prompting an update.');
    $update = true;
    copy("$localRegistryFile", "$cacheRegistryFile")
    or die("Error: Cache file problem with: $cacheRegistryFile");
  }

  if(
        !$update
    &&  isset($_GET['update'])
    &&  (strtolower($_GET['update']) === "true")
  ) {
    // $debugOutput .= debug_log('Resource request is explicitly prompting an update.');
    $update = true;
  }
  if(!$update && $localRegistryFileMTime > $cacheRegistryFileMTime) {
    // $debugOutput .= debug_log('Local registry file having changes being more recent are prompting an update.');
    $update = true;

    $localRegistryFileData = file_get_contents($localRegistryFile);
    $localRegistryFileDataInified = preg_replace('/\n/', "=\n", $localRegistryFileData);
    file_put_contents("$cacheRegistryFile", $localRegistryFileDataInified);

    // $debugOutput .= debug_log("copy(\"$localRegistryFile\", \"$cacheRegistryFile\")");
    // copy("$localRegistryFile", "$cacheRegistryFile")
    // or die("Error: Cache file problem with: $cacheRegistryFile");
  }

  $cacheRegistryData = parse_ini_file("$cacheRegistryFile");
  $cacheRegistryDataLinesCount = count($cacheRegistryData);
  // $debugOutput .= debug_log("cacheRegistryDataLinesCount: $cacheRegistryDataLinesCount");
  // $debugOutput .= debug_log("cacheRegistryData: ".var_export($cacheRegistryData, true)); // Big

  if(!$update) {
    if(checkIfUpdateNecessaryBySourceFiles($cacheRegistryData)) {
      // $debugOutput .= debug_log('Source files are prompting an update.');
      $update = true;
    }
  }
  // $debugOutput .= debug_log("update           : ".var_export($update, true));

  # Update the minified cache file.
  if($update) {
    // $debugOutput .= debug_log('Updating cached file...');
    // $debugOutput .= debug_log('getcwd: '.getcwd());
    include __DIR__."/lib/minify.php";

    $output = "/* index$ext */\n";
    foreach($cacheRegistryData as $resFile => $time) {
      // $debugOutput .= debug_log("resFile: $resFile");
      $isCommented = preg_match($commentRegex, $resFile);
      if($isCommented) {
        // $debugOutput .= debug_log('Commented file; skipping...');
        continue;
      }
      $resFilePath = __DIR__."/$resFile";
      // $debugOutput .= debug_log("resFilePath: $resFilePath");
      if(!file_exists($resFilePath)) {
          $output .= "/* $resFile doesn't exist */\n";

          continue;
      }
      $output .= "/* Source: $resFile */\n";
      $resFileData = file_get_contents($resFilePath);
      if($minify) {
        if($type == "javascript") {
          // $debugOutput .= debug_log('Minifying javascript...');
          $resFileData = minify_js($resFileData);
        } else {
          // $debugOutput .= debug_log('Minifying css...');
          $resFileData = minify_css($resFileData);
        }
      }
      $output .= "$resFileData\n";
      $cacheRegistryData[$resFile] = filemtime($resFilePath);
    }

    # Save and send the minified file.
    file_put_contents("$cacheDestFile", $output);

    # Store timestamps for freshly-chached resource files in the registry file.
    $regData = "";
    foreach($cacheRegistryData as $resFile=>$time) {
      $regData .= "$resFile=$time\n";
    }
    file_put_contents("$cacheRegistryFile", $regData);
  }

  $output .= $debugOutput;
  $output .= file_get_contents("$cacheDestFile");
  $output .= "\n";
  header("X-Updated: ".(($update) ? 'true' : 'false'));
  if(strlen($debugOutput) === 0) header("Content-Length: ".strlen($output));
  print($output);
?>
