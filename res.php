<?php
    ob_start();
    define('NOW',time());

    $whitelist = array(
        '127.0.0.1',
        '::1'
    );

    define('IS_LOCAL',in_array($_SERVER['REMOTE_ADDR'], $whitelist));
    define('DO_MINIFY',isset($_GET['minify'])?
                          ($_GET['minify']!=="0"):
                          (IS_LOCAL?false:true));
    define('UPDATE',isset($_GET['update'])?
                          ($_GET['update']!=="0"):
                          false);
    $path = DIRNAME(__FILE__);
    
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

    $cached_meta = array();

    function get_file_meta($file,$time,$update=false) {
      global $path;
      if(!isset($cached_meta[$file]) || $update) {
        $fpath = $file;
        $nToUpdate=false;
        $ftime = 0;
        if(stripos($file,"//")===false) {
            $fpath = "$path/$file";
            if(!file_exists($fpath)) {
              return null;
            }
            $ftime = filemtime($fpath);
            $nToUpdate = ($time!=$ftime);
        }
        $cached_meta[$file]=array("path"=>$fpath,"update"=>$nToUpdate,"time"=>$ftime);
      }
      return $cached_meta[$file];
    }
    
    function read_cached_file($file,$time) {
      global $path, $ext, $type;
      $cfpath = preg_replace('/\\.[^.\\s]{3,4}$/', '', $file).(DO_MINIFY?".min":"")."$ext";
      $meta = get_file_meta($file,$time);
      if($meta===null) return null;
      $fpath = $meta["path"];
      $nToUpdate=$meta["update"];
      
      $folpath = dirname($file)."/";
      $filedata = "";
      if(file_exists($cfpath) && !$nToUpdate && !UPDATE) {
        $filedata = file_get_contents($cfpath);
      } else {
        $filedata = file_get_contents($fpath);
        if(DO_MINIFY) {
          if($type=="javascript") {
              $filedata = minify_js($filedata);
          } else {
              $filedata = minify_css($filedata);
          }
        }
        $filedata = preg_replace('/(url\([\'"]?(?!.*\/\/))/i', '$1'.$folpath, $filedata);

        $filedata = "/* START $file */\n".
                      $filedata.
                      "\n/* END $file */\n";

        if(!is_dir("cache/".dirname($cfpath))) {
          mkdir("cache/".dirname($cfpath),0775,true);
        }
        file_put_contents("cache/$cfpath",$filedata);
      }
      return $filedata;
    }

    header("Content-Type: $mtype");

    $data = parse_ini_file("$path/$type.ini");
    $update = false;
    if(filemtime("$path/$type.ini")!=$data["_self"]) {
      $update=true;
    }
    if(isset($data["_self"])) {
      unset($data["_self"]);
    }
    if(!$update && file_exists("$path/cache/index".(DO_MINIFY?".min":"")."$ext") && !isset($_GET['update']) && !IS_LOCAL) {
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
    $cfmpath = "$path/cache/index".(DO_MINIFY?".min":"")."$ext";
    if($update) {
        include "$path/lib/minify.php";
        $output = "";
        if(!file_exists($cfmpath)) {
          $output = "/* cache/index".(DO_MINIFY?".min":"")."$ext */\n";
          $nToUpdate;
          foreach($data as $file=>$time) {
              $filedata = read_cached_file($file,$time);
              $meta = get_file_meta($file,$time);
              if($filedata===null) continue;
              $output.="$filedata\n";
              if(stripos($file,"//")===false) {
                  $data[$file]=$meta["time"];
              } else {
                  $data[$file]=NOW;
              }
          }
          file_put_contents($cfmpath,$output);
        } else {
          $output = file_get_contents($cfmpath);
          $nToUpdate;
          foreach($data as $file=>$time) {
              $filedata = read_cached_file($file,$time);
              if($filedata===null) continue;
              $meta = get_file_meta($file,$time);
              $fpath = $meta["path"];
              $prefix = "/* START $file */\n";
              $suffix = "\n/* END $file */\n";
              $spos = stripos($output,$prefix);
              $epos = stripos($output,$suffix);
              if($spos===false || $epos===false) {
                $output.="$filedata\n";
              } else {
                $output = substr($output,0,$spos)."$filedata\n".substr($output,$epos+strlen($suffix)+1);
              }
              if(stripos($file,"//")===false) {
                  $data[$file]=$meta["time"];
              } else {
                  $data[$file]=NOW;
              }
          }
          file_put_contents("$path/cache/index".(DO_MINIFY?".min":"")."$ext",$output);
        }
        ob_end_clean();
        header("Content-Length: ".strlen($output));
        header("X-Updated: true");
        readfile("$path/cache/index".(DO_MINIFY?".min":"")."$ext");
        ob_start();
        $output = "";
        foreach($data as $file=>$time) {
            $output.="$file=$time\n";
        }
        $now = NOW;
        $output.="_self=$now";
        file_put_contents("$path/$type.ini",$output);
        touch("$path/$type.ini",$now);
        ob_end_clean();
        return;
    }
    ob_end_clean();
    
    header("Content-Length: ".strlen($out));
    header("X-Updated: false");
    readfile("$path/cache/index".(DO_MINIFY?".min":"")."$ext");