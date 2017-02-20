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
    
    if(file_exists("$path/.env")) {
        $ENV = parse_ini_file("$path/.env");
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
		@$mysqli->query("BEGIN");
	}
	
	function commit() {
		@$mysqli->query("COMMIT");
	}
	
	function rollback()	{
		@$mysqli->query("ROLLBACK");
	}		
?>