<?php
  include_once(__DIR__.'/config.php');
  include_once(__DIR__.'/lib/common/data.php');
  include_once(__DIR__.'/lib/common/log.php');



  ## Library Functions

  function checkIfUpdateNecessaryBySourceFiles($cacheRegistryData) {
    global $debugOutput;
    global $commentRegex;

    // debug_log('checkIfUpdateNecessaryBySourceFiles START');
    $cacheRegistryDataCount = count($cacheRegistryData);
    // debug_log("cacheRegistryDataCount: $cacheRegistryDataCount");
    // // debug_log("cacheRegistryData      : ".var_export($cacheRegistryData, true)); // Big
    if($cacheRegistryDataCount = 0) {
      // debug_log('Cache registry file empty, or could not be parsed as INI data; returning...');
      return false;
    }

    foreach($cacheRegistryData as $resFile => $time) {
      // debug_log("resfile: $resFile");

      $isCommented  = preg_match($commentRegex, $resFile);
      $fileExists   = file_exists($resFile);
      if($isCommented || !$fileExists) {
        // debug_log("isCommented: " .var_export($isCommented, true));
        // debug_log("fileExists: "  .var_export($fileExists, true));

        // debug_log('checkIfUpdateNecessaryBySourceFiles continue');
        continue;
      }

      if($time != filemtime($resFile)) {
        // debug_log('checkIfUpdateNecessaryBySourceFiles return');
        return true;
      }
    }
    // debug_log('checkIfUpdateNecessaryBySourceFiles END');
  }

  function inifyFileToFile($fromFile, $toFile) {
    $fromFileData = file_get_contents($fromFile);
    $fromFileDataInified = preg_replace('/\n/', "=\n", $fromFileData);
    file_put_contents("$toFile", $fromFileDataInified);
  }



  ## Initialization

  $commentRegex = '/^\s*\/\//';

  if(!isset($_GET["type"])) {

  }

  // debug_log("__FILE__               : ".__FILE__);
  // debug_log("__DIR__                : ".__DIR__ );



  ## Validation and more init

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
    $output = "Invalid type! ($type)";
    return;
  }
  $mtype = "text/$type";
  $ext = ".css";

  if($type == "javascript") {
    $ext = ".js";
  }

  // debug_log("type                   : $type " );
  // debug_log("mtype                  : $mtype" );
  // debug_log("ext                    : $ext"   );

  header("Content-Type: $mtype");

        $localRegistryFile = "$type.txt";
  $localRegistryFileExists  = file_exists("$localRegistryFile");
  if($localRegistryFileExists) {
    $localRegistryFileMTime = filemtime("$localRegistryFile");
    $localRegistryFileLC    = getLineCount("$localRegistryFile");
  } else {
    $localRegistryFileMTime = false;
    $localRegistryFileLC    = false;
  }
  $cacheRegistryFile        = "$cacheFolder/$localRegistryFile";
  $cacheRegistryFileExists  = file_exists("$cacheRegistryFile");
  if($cacheRegistryFileExists) {
    $cacheRegistryFileMTime = filemtime("$cacheRegistryFile");
    $cacheRegistryFileLC    = getLineCount("$cacheRegistryFile");
  } else {
    $cacheRegistryFileMTime = false;
    $cacheRegistryFileLC    = false;
  }
  $cacheDestFile            = "$cacheFolder/index$ext";
  $cacheDestFileExists      = file_exists("$cacheDestFile");
  if($cacheDestFileExists) {
    $cacheDestFileMTime     = filemtime("$cacheDestFile");
    $cacheDestFileLC        = getLineCount("$cacheDestFile");
  } else {
    $cacheDestFileMTime = false;
    $cacheDestFileLC    = false;
  }

  // debug_log("localRegistryFile      : $localRegistryFile"       );
  // debug_log("localRegistryFileExists: $localRegistryFileExists" );
  // debug_log("localRegistryFileMTime : $localRegistryFileMTime"  );
  // debug_log("localRegistryFileLC    : $localRegistryFileLC"     );
  // debug_log("cacheRegistryFile      : $cacheRegistryFile"       );
  // debug_log("cacheRegistryFileExists: $cacheRegistryFileExists" );
  // debug_log("cacheRegistryFileMTime : $cacheRegistryFileMTime"  );
  // debug_log("cacheRegistryFileLC    : $cacheRegistryFileLC"     );
  // debug_log("cacheDestFile          : $cacheDestFile"           );
  // debug_log("cacheDestFileExists    : $cacheDestFileExists"     );
  // debug_log("cacheDestFileMTime     : $cacheDestFileMTime"      );
  // debug_log("cacheDestFileLC        : $cacheDestFileLC"         );

  // exit('Debug forced stop: '."\n".$debugLog); // Debug



  ## Update category checks

  $update = false;
  // debug_log("update                 : ".var_export($update, true));
  if(!$cacheRegistryFileExists) {
    // debug_log('Registry file not currectly cached; copying over, inifying, and prompting an update...');
    $update = true;
    copy("$localRegistryFile", "$cacheRegistryFile")
    or die("Error: Cache file problem with: $cacheRegistryFile");

    inifyFileToFile(
      $localRegistryFile,
      $cacheRegistryFile
    );
  }

  // exit('Debug forced stop: '."\n".$debugLog); // Debug

  if(
        !$update
    &&  isset($_GET['update'])
    &&  (strtolower($_GET['update']) === "true")
  ) {
    // debug_log('Resource request is explicitly prompting an update.');
    $update = true;
  }

  if(
        !$update
    &&  $localRegistryFileMTime > $cacheRegistryFileMTime
  ) {
    // debug_log('Local registry file having changes being more recent are prompting an update.');
    $update = true;

    inifyFileToFile(
      $localRegistryFile,
      $cacheRegistryFile
    );

    // debug_log("copy(\"$localRegistryFile\", \"$cacheRegistryFile\")");
    // copy("$localRegistryFile", "$cacheRegistryFile")
    // or die("Error: Cache file problem with: $cacheRegistryFile");
  }

  $cacheRegistryData      = parse_ini_file("$cacheRegistryFile" );
  $cacheRegistryDataCount = count         ( $cacheRegistryData  );
  // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
  if($cacheRegistryDataCount == 0) {
    // debug_log('Cache registry file still empty, or could not be parsed as INI data; removing...');
    unlink($cacheRegistryFile);
  }

  if(!$update) {
    if(checkIfUpdateNecessaryBySourceFiles($cacheRegistryData)) {
      // debug_log('Source files are prompting an update.');
      $update = true;
    }
  }
  // debug_log("update                 : ".var_export($update, true));

  // exit('Debug forced stop: '."\n\n".$debugLog); // Debug



  ## Update the minified cache file.
  if($update) {
    // debug_log('Updating cached file...');
    // debug_log('getcwd: '.getcwd());

    include __DIR__."/lib/minify.php";

    $output = "/* index$ext */\n";
    foreach($cacheRegistryData as $resFile => $time) {
      // debug_log("resFile: $resFile");
      $isCommented = preg_match($commentRegex, $resFile);
      if($isCommented) {
        // debug_log('Commented file; skipping...');
        continue;
      }
      $resFilePath = __DIR__."/$resFile";
      // debug_log("resFilePath: $resFilePath");
      if(!file_exists($resFilePath)) {
          $output .= "/* $resFile doesn't exist */\n";

          continue;
      }
      $output .= "/* Source: $resFile */\n";
      $resFileData = file_get_contents($resFilePath);
      if($minify) {
        if($type == "javascript") {
          // debug_log('Minifying javascript...');
          $resFileData = minify_js($resFileData);
        } else {
          // debug_log('Minifying css...');
          $resFileData = minify_css($resFileData);
        }
      }
      $output .= "$resFileData\n";
      $cacheRegistryData[$resFile] = filemtime($resFilePath);
    }

    # Save and send the minified file.
    file_put_contents("$cacheDestFile", $output);

    # Store timestamps for freshly-cached resource files in the registry file.
    $regData = "";
    foreach($cacheRegistryData as $resFile=>$time) {
      $regData .= "$resFile=$time\n";
    }
    file_put_contents("$cacheRegistryFile", $regData);
  }

  $output = $debugLog;
  $output .= file_get_contents("$cacheDestFile");
  $output .= "\n";
  header("X-Updated: ".(($update) ? 'true' : 'false'));
  if(strlen($debugOutput) === 0) header("Content-Length: ".strlen($output));
  print($output);
?>
