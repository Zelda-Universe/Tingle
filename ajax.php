<?php
    if(!isset($_GET["command"])) {
        die(json_encode(array("success"=>false,"msg"=>"No command defined!")));
    }
    $cmd = $_GET["command"];
    $cmd = str_replace("/","",$cmd);
    $path = DIRNAME(__FILE__);
    $cmdpath = "$path/ajax/$cmd.php";
    if(!file_exists($cmdpath)) {
        die(json_encode(array("success"=>false,"msg"=>"Invalid command!")));
    }
    $error=false;
    ob_start();
    try {
        require($cmdpath);
    } catch(Exception $ex) {
        print_r($ex);
        $error=$ex;
    }
    $output = ob_get_clean();
    $res = "$output";
    $data = array();
    try {
        if($error===false) {
            $data = json_decode($res,true);
            if($data===null) {
                throw new Exception("Invalid JSON!");
            }
        }
    } catch(Exception $ex) {
        $data = array("success"=>false,"msg"=>$res);
        $error=$ex;
    }
    
    if($error!==false) {
        $data = array("success"=>false,"msg"=>$data["msg"],"error"=>$error->getMessage());
    }
    die(json_encode($data));