<?php
    $path = DIRNAME(__FILE__);

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

    if(!file_exists("$path/cache")) mkdir("$path/cache");

    header("Content-Type: $mtype");

    $data = parse_ini_file("$path/$type.ini");
    $update = false;
    if(file_exists("$path/cache/index$ext") && !isset($_GET['update'])) {
        foreach($data as $file=>$time) {
            if(stripos($file,"//")!==false || !file_exists("$path/$file")) {
                continue;
            }
            if($time!=filemtime("$path/$file")) {
                $update=true;
                break;
            }
        }
    } else {
        $update=true;
    }
    if($update) {
        // print('DEBUG: Updating cached file...<br>');
        include "$path/lib/minify.php";
        $output = "/* cache/index$ext */\n";
        foreach($data as $file=>$time) {
          // print('DEBUG: Processing file entry'.$file.'...<br>');
            $fpath = $file;
            if(stripos($file,"//")===true) continue;
            $fpath = "$path/$file";
            if(!file_exists($fpath)) {
                $output.="/* $file doesn't exist */\n";
                continue;
            }
            $output.="/* Source: $file */\n";
            $filedata = file_get_contents($fpath);
            if($minify) {
              if($type=="javascript") {
                // print('DEBUG: Minifying javascript...<br>');
                  $filedata = minify_js($filedata);
              } else {
                // print('DEBUG: Minifying css...<br>');
                  $filedata = minify_css($filedata);
              }
            }
            $output.="$filedata\n";
            if(stripos($file,"//")===false) {
                $data[$file]=filemtime($fpath);
            }
        }
        file_put_contents("$path/cache/index$ext",$output);
        header("Content-Length: ".strlen($output));
        header("X-Updated: true");
        print $output;

        $output = "";
        foreach($data as $file=>$time) {
            $output.="$file=$time\n";
        }
        file_put_contents("$path/$type.ini",$output);
        return;
    }
    
    $out = file_get_contents("$path/cache/index$ext");
    
    header("Content-Length: ".strlen($out));
    header("X-Updated: false");
    print $out;
