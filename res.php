<?php
  $path=__DIR__;

  if(!isset($_GET["type"])) {
    print("A type must be provided! javascript or css.");
    exit;
  }

  include_once("$path/config.php");

  $type = strtolower($_GET['type']);
  $type = preg_replace("#[^a-z]#","",$type);
  if($type!="javascript" &&
    $type!="css") {
    print("Invalid type! ($type)");
    return;
  }
  $mtype = "text/$type";
  $ext = ".css";

  if($type=="javascript") {
    $ext = ".js";
  }

  header("Content-Type: $mtype");

  $localRegistryFile="$path/$type.ini";
  $cacheRegistryFile="$cacheFolder/$type.ini";
  $cacheDestFile="$cacheFolder/index$ext";

  $update=false;
  if(!file_exists("$cacheRegistryFile")) {
    $update=true;
    copy("$localRegistryFile", "$cacheRegistryFile") or die("Error: Cache file problem with: $cacheRegistryFile");
  }

  # Mark for updating the cache or not based on old or absent timestamps.
  $data = parse_ini_file("$cacheRegistryFile");

  if(!$update) {
    if(!isset($_GET['update'])) {
      foreach($data as $resfile=>$time) {
        if(
          !stripos($resfile,"//") ||
          !file_exists("$path/$resfile")
        ) {
          continue;
        }
        if($time != filemtime("$path/$resfile")) {
          $update=true;
          break;
        }
      }
    } else {
      $update=(strtolower($_GET['update']) === "true");
    }
  }

  # Update the minified cache file.
  if($update) {
    // error_log('DEBUG: Updating cached file...<br>');
    include "$path/lib/minify.php";
    $output = "/* index$ext */\n";
    foreach($data as $resfile=>$time) {
      // error_log('DEBUG: Processing file entry'.$resfile.'...<br>');
      $rfpath = $resfile;
      if(stripos($resfile,"//")) continue;
      $rfpath = "$path/$resfile";
      if(!file_exists($rfpath)) {
          $output.="/* $resfile doesn't exist */\n";
          continue;
      }
      $output.="/* Source: $resfile */\n";
      $resfiledata = file_get_contents($rfpath);
      if($minify) {
        if($type=="javascript") {
          // error_log('DEBUG: Minifying javascript...<br>');
          $resfiledata = minify_js($resfiledata);
        } else {
          // error_log('DEBUG: Minifying css...<br>');
          $resfiledata = minify_css($resfiledata);
        }
      }
      $output.="$resfiledata\n";
      if(stripos($resfile,"//")===false) {
        $data[$resfile]=filemtime($rfpath);
      }
    }
    # Save and send the minified file.
    file_put_contents("$cacheDestFile", $output);
    header("Content-Length: ".strlen($output));
    header("X-Updated: true");
    print $output;

    # Store timestamps for freshly-chached resource files in the registry file.
    $output = "";
    foreach($data as $resfile=>$time) {
      $output.="$resfile=$time\n";
    }
    file_put_contents("$cacheRegistryFile", $output);
    return;
  }

  $output = file_get_contents("$cacheDestFile");

  header("Content-Length: ".strlen($output));
  header("X-Updated: false");
  print($output);
?>
