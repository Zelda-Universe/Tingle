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
    // Sessions of accounts deleted, disabled or banned since signing in end
    // here, before the command runs.
    include_once(__DIR__.'/lib/common/account_status.php');
    include_once(__DIR__.'/lib/common/auth_token.php');
    // Puts back the session of anyone signed in whose session has been lost.
    authRestoreSession($db, $map_prefix);
    accountSessionCheck($db, $map_prefix);
    $error=false;
    ob_start();
    try {
      require($cmdpath);
    } catch(Throwable $ex) {
      // Log the detail server-side only. Never emit exception objects or
      // traces to the client: traces carry call arguments, which here can
      // include SQL with user input and composed e-mails.
      error_log(sprintf(
        'ajax.php [%s]: %s: %s at %s:%d',
        $cmd, get_class($ex), $ex->getMessage(), $ex->getFile(), $ex->getLine()
      ));
      $error = new Exception("Internal error", 500);
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
      if($error->getCode() === 10) {
        // Endpoint produced non-JSON output; keep it in the log, not the response.
        error_log(sprintf('ajax.php [%s]: invalid JSON output: %s', $cmd, substr($res, 0, 500)));
      }
      $data = array("success"=>false,"code"=>$error->getCode(),"msg"=>$error->getMessage());
    }

    $flags = 0;

    if(isset($_GET["pretty"])) {
      $flags |= JSON_PRETTY_PRINT;
    }

    $out = json_encode($data,$flags);

    header("Content-Type: ".(isset($_GET['forcedMode'])?$_GET['forcedMode']:"application/json"));
    header("Content-Length: ".strlen($out));
    echo $out;
