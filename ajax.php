<?php
    include_once(__DIR__.'/config.php');
    include_once(__DIR__.'/lib/common/database.php');
    open();

    if(!isset($_GET["command"])) {
        die(json_encode(array("success"=>false,"msg"=>"No command defined!")));
    }
    $cmd = $_GET["command"];
    $cmd = preg_replace("#[^a-zA-Z_]#","",$cmd);
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
