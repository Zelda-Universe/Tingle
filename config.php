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
	
    $connection = mysql_connect($dbhost, $dbuser, $dbpasswd) or die('Database connection problem.');
    mysql_select_db ($dbname, $connection) or die('Database connection problem.');
    mysql_query("SET NAMES 'utf8'");
    mysql_query('SET character_set_connection=utf8');
    mysql_query('SET character_set_client=utf8');
    mysql_query('SET character_set_results=utf8');
	
	function begin() {
		@mysql_query("BEGIN");
	}
	
	function commit() {
		@mysql_query("COMMIT");
	}
	
	function rollback()	{
		@mysql_query("ROLLBACK");
	}		
?>