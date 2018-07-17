<?php
  require __DIR__ . '/vendor/autoload.php';

  date_default_timezone_set("UTC");

  $lostPasswordRandomGeneratorStrengthStrings = array_keys((new SecurityLib\Strength)->getConstList());

	// LOCAL
   error_reporting((E_ALL ^ E_DEPRECATED) & ~E_NOTICE);
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

   $minifyResources = true;
   $path = DIRNAME(__FILE__);

	define("MAPROOT",$path);
    // We want production to run smoothly,
    // and still requires a mail server as checked below.
    $mailEnabled = true;
    if(file_exists(MAPROOT."/.env")) {
        $ENV = parse_ini_file(MAPROOT."/.env");
        $dbms = $ENV["DBMS"];
        $dbhost = $ENV["DBHOST"];
        $dbport = $ENV["DBPORT"];
        $dbname = $ENV["DBNAME"];
        $dbuser = $ENV["DBUSER"];
        $dbpasswd = $ENV["DBPASSWD"];
        $map_prefix = $ENV["PREFIX"];
        $minifyResources = $ENV["minifyResources"];
        $lostPasswordRandomGeneratorStrengthString = $ENV["LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH"];
        if(array_search($lostPasswordRandomGeneratorStrengthString, $lostPasswordRandomGeneratorStrengthStrings) === false) {
          error_log("Miconfigured \"LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH\" setting; using the value \"MEDIUM\" by default.");
          $lostPasswordRandomGeneratorStrengthString = "MEDIUM";
        }
        $lostPasswordRandomGeneratorStrengthConstant = new SecurityLib\Strength((new SecurityLib\Strength)->getConstList()[$lostPasswordRandomGeneratorStrengthString]);

        $mailEnabled = $ENV['mailEnabled'];
        $mailServer = $ENV['server'];
        if(!$mailServer) $mailEnabled = false;
        $mailPort = $ENV['port'];
        $mailUsername = $ENV['username'];
        $mailPassword = $ENV['password'];
        $mailReplyToAddress = $ENV['replyToAddress'];
        $mailReplyToName = $ENV['replyToName'];

        $lostPasswordSubject = $ENV["lostPasswordSubject"];
        if(isset($ENV["lostPasswordBodyTemplateFilePath"])) $lostPasswordBodyTemplateFilePath = $ENV["lostPasswordBodyTemplateFilePath"];
        if(isset($lostPasswordBodyTemplateFilePath) && !empty($lostPasswordBodyTemplateFilePath)) {
          $lostPasswordBodyTemplate = file_get_contents($lostPasswordBodyTemplateFilePath);
        }

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
		return $mysqli->query("BEGIN");
	}

	function commit() {
		global $mysqli;
		return $mysqli->query("COMMIT");
	}

	function rollback()	{
		global $mysqli;
		return $mysqli->query("ROLLBACK");
	}

	function start_session($name="zmap") {
		if(!defined("PHP_MAJOR_VERSION") || PHP_MAJOR_VERSION<7) {
			return session_start($name);
		} else {
			$opts = ["name"=>$name];
			return session_start($opts);
		}
	}
?>
