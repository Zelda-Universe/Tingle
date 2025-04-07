<?php
  include_once(__DIR__.'/config.php');
  include_once(__DIR__.'/lib/common/data.php');
  include_once(__DIR__.'/lib/common/log.php');

  // // debug_log("__FILE__               : ".__FILE__);
  // // debug_log("__DIR__                : ".__DIR__ );

  ## Library Functions
  {
    function checkIfUpdateNecessaryBySourceFiles($cacheRegistryData) {
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
        // // debug_log("resfile: $resFile");

        $isCommented  = preg_match($commentRegex, $resFile);
        $fileExists   = file_exists($resFile);
        if($isCommented || !$fileExists) {
          // // debug_log("isCommented: " .var_export($isCommented, true));
          // // debug_log("fileExists: "  .var_export($fileExists, true));

          // // debug_log('checkIfUpdateNecessaryBySourceFiles continue');
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
    file_put_contents($toFile, $fromFileDataInified);
  }
  }

  ## Initialization
  {
    $commentRegex = '/^\s*\/\//';

    $update = false;
    // debug_log("update                 : ".var_export($update, true));
    // debug_log('');
  }

  ## Validation
  if(!isset($_GET["type"])) {
    print("A type must be provided! javascript or css.");
    exit;
  }

  ## Request Mode selection
  {
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
    // debug_log('');
  }

  ## Check for any metadata file updates
  {
    ### localRegistryFile
    {
      $localRegistryFile = "$type.txt";
      // debug_log("localRegistryFile      : $localRegistryFile");
      $localRegistryFileExists = file_exists("$localRegistryFile");
      // debug_log("localRegistryFileExists: $localRegistryFileExists");

      if($localRegistryFileExists) {
        $localRegistryFileMTime = filemtime("$localRegistryFile");
        // debug_log("localRegistryFileMTime : $localRegistryFileMTime");
        $localRegistryFileLC = getLineCount("$localRegistryFile");
        // debug_log("localRegistryFileLC    : $localRegistryFileLC");
      } else {
        $localRegistryFileMTime = false;
        // debug_log("localRegistryFileMTime : $localRegistryFileMTime");
        $localRegistryFileLC    = false;
        // debug_log("localRegistryFileLC    : $localRegistryFileLC");
      }
      // debug_log('');
    }

    // exit('Debug forced stop: '."\n".$debugLog); // Debug

    ### Check for forced/manual/URL update
    {
      if(
            !$update
        &&  isset($_GET['update'])
        &&  (strtolower($_GET['update']) === "true")
      ) {
        // debug_log('Resource request is explicitly prompting an update.');
        $update = true;
        // debug_log("update                 : ".var_export($update, true));
      }
    }

    ### cacheRegistryFile
    {
      # Initialization
      $cacheRegistryFile = "$cacheFolder/$localRegistryFile";
      // debug_log("cacheRegistryFile      : $cacheRegistryFile");
      $cacheRegistryFileExists = file_exists($cacheRegistryFile);
      // debug_log("cacheRegistryFileExists: $cacheRegistryFileExists");

      if($cacheRegistryFileExists) {
        $cacheRegistryData = parse_ini_file($cacheRegistryFile);
        // // debug_log("cacheRegistryData        : $cacheRegistryData");
        if($cacheRegistryData) {
          // debug_log('cacheRegistryData found.');
          $cacheRegistryDataCount = count($cacheRegistryData);
          // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
        } else {
          // debug_log('No cacheRegistryData found.');
          $cacheRegistryDataCount = 0;
          // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
        }

        if($cacheRegistryDataCount == 0) {
          // debug_log('Cache registry file still empty, or could not be parsed as INI data; removing...');
          unlink($cacheRegistryFile);
          $cacheRegistryFileExists = false;
          // debug_log("cacheRegistryFileExists: $cacheRegistryFileExists");
          $cacheRegistryData = '';
          // debug_log("cacheRegistryData      : $cacheRegistryData");
          $cacheRegistryDataCount = 0;
          // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
          $update = true;
          // debug_log("update                 : ".var_export($update, true));
        } else {
          $cacheRegistryFileMTime = filemtime("$cacheRegistryFile");
          // debug_log("cacheRegistryFileMTime : $cacheRegistryFileMTime");
          $cacheRegistryFileLC    = getLineCount("$cacheRegistryFile");
          // debug_log("cacheRegistryFileLC    : $cacheRegistryFileLC");
        }
      }

      if(!$cacheRegistryFileExists || $update) {
        // debug_log('Registry file not currectly cached; copying over, inifying, and prompting an update...');
        $update = true;
        // debug_log("update                 : ".var_export($update, true));
        copy($localRegistryFile, $cacheRegistryFile);

        inifyFileToFile(
          $localRegistryFile,
          $cacheRegistryFile
        );

        $cacheRegistryFileExists = file_exists($cacheRegistryFile);
        // debug_log("cacheRegistryFileExists: $cacheRegistryFileExists");
        $cacheRegistryData = parse_ini_file($cacheRegistryFile);
        // // debug_log("cacheRegistryData        : $cacheRegistryData");
        if($cacheRegistryData) {
          $cacheRegistryDataCount = count($cacheRegistryData);
          // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
        } else {
          $cacheRegistryDataCount = 0;
          // debug_log("cacheRegistryDataCount : $cacheRegistryDataCount");
        }
      }

      // exit('Debug forced stop: '."\n".$debugLog); // Debug

      if($cacheRegistryFileExists && $cacheRegistryDataCount > 0) {
        $cacheRegistryFileMTime = filemtime($cacheRegistryFile);
        // debug_log("cacheRegistryFileMTime : $cacheRegistryFileMTime");
        $cacheRegistryFileLC    = getLineCount($cacheRegistryFile);
        // debug_log("cacheRegistryFileLC    : $cacheRegistryFileLC");

        if(
              !$update
          &&  $localRegistryFileMTime > $cacheRegistryFileMTime
        ) {
          // debug_log('Local registry file having changes being more recent are prompting an update.');
          $update = true;
          // debug_log("update                 : ".var_export($update, true));
        }
      } else {
        $cacheRegistryFileMTime = false;
        // debug_log("cacheRegistryFileMTime : $cacheRegistryFileMTime");
        $cacheRegistryFileLC = false;
        // debug_log("cacheRegistryFileLC    : $cacheRegistryFileLC");
      }
      // debug_log('');
    }

    ### cacheDestFile
    {
      $cacheDestFile = "$cacheFolder/index$ext";
      // debug_log("cacheDestFile          : $cacheDestFile");
      $cacheDestFileExists = file_exists("$cacheDestFile");
      // debug_log("cacheDestFileExists    : $cacheDestFileExists");
      if($cacheDestFileExists) {
        $cacheDestFileMTime = filemtime("$cacheDestFile");
        // debug_log("cacheDestFileMTime     : $cacheDestFileMTime");
        $cacheDestFileLC = getLineCount("$cacheDestFile");
        // debug_log("cacheDestFileLC        : $cacheDestFileLC");
      } else {
        $cacheDestFileMTime = false;
        // debug_log("cacheDestFileMTime     : $cacheDestFileMTime");
        $cacheDestFileLC = false;
        // debug_log("cacheDestFileLC        : $cacheDestFileLC");
        $update = true;
        // debug_log("update                 : ".var_export($update, true));
      }
      // debug_log('');
    }

    ### Check for newer source file update
    if(!$update) {
      // debug_log('Checking if source files are prompting an update...');
      if(checkIfUpdateNecessaryBySourceFiles($cacheRegistryData)) {
        // debug_log('Source files are prompting an update.');
        $update = true;
        // debug_log("update                 : ".var_export($update, true));
      }
    }
  }

  // exit('Debug forced stop: '."\n\n".$debugLog); // Debug

  ## Update the minified cache file.
  if($update && $cacheRegistryDataCount > 0) {
    // debug_log('Updating cached file...');
    // // debug_log('getcwd: '.getcwd());

    include __DIR__."/lib/minify.php";

    $output = "/* index$ext */\n";
    foreach($cacheRegistryData as $resFile => $time) {
      // // debug_log("resFile: $resFile");
      $isCommented = preg_match($commentRegex, $resFile);
      if($isCommented) {
        // debug_log('Commented file; skipping...');
        continue;
      }

      $resFilePath = __DIR__."/$resFile";
      // // debug_log("resFilePath: $resFilePath");
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
  } else {
    // debug_log('Not updating cached file...');
  }

  ## Finalization
  {
    $output = $debugLog;
    $output .= file_get_contents("$cacheDestFile");
    $output .= "\n";
    header("Content-Type: $mtype");
    header("X-Updated: ".(($update) ? 'true' : 'false'));
    header("Content-Length: ".strlen($output));
    print($output);
  }
?>
