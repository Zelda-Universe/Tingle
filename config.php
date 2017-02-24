<?php
	// LOCAL
   error_reporting(E_ALL ^ E_DEPRECATED);
	if ($_SERVER['SERVER_ADDR'] == "127.0.0.1" || $_SERVER['SERVER_ADDR'] == '::1') {
		$dbms = 'mysql';
		$dbhost = 'localhost';
		$dbport = '';
		$dbname = 'zmap_v2';
		$dbuser = 'root';
		$dbpasswd = '';	
		
		$map_prefix = "";	
	// LIVE SERVER
	} else {
		$dbms = 'mysql';
		$dbhost = 'localhost';
		$dbport = '';
		$dbname = '';
		$dbuser = '';
		$dbpasswd = '';
		
		$map_prefix = "";
   }
   
   $path = DIRNAME(__FILE__);

	define("MAPROOT",$path);
    
    if(file_exists(MAPROOT."/.env")) {
        $ENV = parse_ini_file(MAPROOT."/.env");
        $dbms = $ENV["DBMS"];
        $dbhost = $ENV["DBHOST"];
        $dbport = $ENV["DBPORT"];
        $dbname = $ENV["DBNAME"];
        $dbuser = $ENV["DBUSER"];
        $dbpasswd = $ENV["DBPASSWD"];
        $map_prefix = $ENV["PREFIX"];
        $_ENV = array_merge($ENV,$_ENV);
    }
	
    $mysqli = new mysqli($dbhost, $dbuser, $dbpasswd) or die('Database connection problem.');
    $mysqli->select_db ($dbname) or die('Database connection problem.');
    $mysqli->query("SET NAMES 'utf8'");
    $mysqli->query('SET character_set_connection=utf8');
    $mysqli->query('SET character_set_client=utf8');
    $mysqli->query('SET character_set_results=utf8');
	
	function begin() {
		global $mysqli;
		@$mysqli->query("BEGIN");
	}
	
	function commit() {
		global $mysqli;
		@$mysqli->query("COMMIT");
	}
	
	function rollback()	{
		global $mysqli;
		@$mysqli->query("ROLLBACK");
	}

	function start_session($name="zmap") {
		if(!defined("PHP_MAJOR_VERSION") || PHP_MAJOR_VERSION<7) {
			session_start($name);
		} else {
			$opts = ["name"=>$name];
			session_start($opts);
		}
	}
?>