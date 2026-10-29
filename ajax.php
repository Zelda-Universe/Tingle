<?php
    include_once(__DIR__.'/config.php');
    include_once(__DIR__.'/lib/common/database.php');
    include_once(__DIR__.'/lib/common/session.php');

    $openRetCode = open();
    // debug_log('openRetCode: '.$openRetCode);
    if (!empty($openRetCode) or $openRetCode != 0) {
      die(json_encode(
        array(
          "success" => false,
          "msg" => "No database connection!"
        )
      ));
    }

    if(!isset($_GET["command"])) {
      die(json_encode(
        array(
          "success" => false,
          "msg" => "No command defined!"
        )
      ));
    }

    $cmd = $_GET["command"];
    $cmd = preg_replace("#[^a-zA-Z_]#","",$cmd);
    // --- Request hardening (added during cPanel migration) ---
    // Every endpoint interpolates request values straight into SQL,
    // so constrain the types here, once, before dispatch.
    $harden = function (array &$req) {
        foreach (['userId', 'markerId', 'newMarkerId', 'submapId', 'categoryId', 'gameId'] as $p) {
            if (isset($req[$p])) { $req[$p] = (int) $req[$p]; }
        }
        foreach (['lng', 'lat'] as $p) {
            if (isset($req[$p])) { $req[$p] = (float) $req[$p]; }
        }
        if (isset($req['game'])) {   // numeric id or short_name; no SQL metacharacters either way
            $req['game'] = preg_replace('/[^A-Za-z0-9_-]/', '', (string) $req['game']);
        }
    };
    $harden($_GET);
    $harden($_POST);
    unset($harden);    
    $path = __DIR__;
    $cmdpath = "$path/ajax/$cmd.php";
    if(!file_exists($cmdpath)) {
      die(json_encode(array("success"=>false,"code"=>-1,"msg"=>"Invalid command!")));
    }
    $error=false;
    ob_start();
    try {
      require($cmdpath);
    } catch(Exception $ex) {
      print_r($ex);
      $error=$ex;
      // Source: https://stackoverflow.com/questions/3258634/php-how-to-send-http-response-code
      // http_response_code(503); // Service Unavailable
    }
    $output = ob_get_clean();
    $res = "$output";
    $data = array();
    if($error===false) {
      try {
        $data = json_decode($res,true);
        if($data===null) {
          throw new Exception("Invalid JSON!", 10);
        }
      } catch(Exception $ex) {
        $error=$ex;
      }
    }

    if($error!==false) {
      $data = array("success"=>false,"code"=>$error->getCode(),"msg"=>$error->getMessage(),"output"=>$res);
    }

    $flags = 0;

    if(isset($_GET["pretty"])) {
      $flags |= JSON_PRETTY_PRINT;
    }

    $out = json_encode($data,$flags);

    header("Content-Type: ".(isset($_GET['forcedMode'])?$_GET['forcedMode']:"application/json"));
    header("Content-Length: ".strlen($out));
    echo $out;
