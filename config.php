<?php
  include_once(__DIR__."/lib/common/log.php");

  function load_config() {
    global $config;
    $config = parse_ini_file(CONFIGFILE);
  }
  function get_config($key, $default = null, $type = "string") {
    global $config;
    if(!isset($config)) die("Error: Config not loaded; exiting...");

    if(empty($default)) {
      if(strtolower($type) === "int") {
        $default = 0;
      } else if(strtolower($type) === "boolean") {
        $default = 'true';
      }
    }

    $value = $config[$key] ?? $default;

    if(strtolower($type) === "boolean") {
      // $value = strtolower($value) === "true"; # Seems 'true' string values are 1 already from the ini file load.
    } else if(strtolower($type) === "int") {
      $value = intval($value);
    }

    return $value;
  }

  define("MAPROOT", __DIR__);
  define("CONFIGFILE", MAPROOT."/.env");

  require __DIR__ . '/vendor/autoload.php';

  $lostPasswordRandomGeneratorStrengthStrings = array_keys((new SecurityLib\Strength)->getConstList());

  # All but deprecated and notices.
  # TODO: This is a dev or prod setting currently?
  error_reporting((E_ALL ^ E_DEPRECATED) & ~E_NOTICE);

  !file_exists(CONFIGFILE) and die('Project `.env` file not found and must be provided.');

  load_config();
  $cacheFolderRootPath = get_config("cacheFolderRootPath", sys_get_temp_dir());
  $cacheFolder = $cacheFolderRootPath."/Tingle";

  # Database
  $dbms         = get_config("DBMS"    );
  $dbhost       = get_config("DBHOST"  );
  $dbuser       = get_config("DBUSER"  );
  $dbpasswd     = get_config("DBPASSWD");
  $dbname       = get_config("DBNAME"  );
  $dbport       = get_config("DBPORT"  ,    type: "int");
  $dbsocket     = get_config("DBSOCKET");
  $map_prefix   = get_config("PREFIX"  );
  $minify       = get_config("minify",      type: "boolean");
  $enableTests  = get_config("enableTests", type: "boolean");

  # User features
  $lostPasswordRandomGeneratorStrengthString = get_config("LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH");
  if(
    array_search(
      $lostPasswordRandomGeneratorStrengthString, $lostPasswordRandomGeneratorStrengthStrings
    ) === false
  ) {
    error_log("Miconfigured \"LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH\" setting; using the value \"MEDIUM\" by default.");
    $lostPasswordRandomGeneratorStrengthString = "MEDIUM";
  }
  $lostPasswordRandomGeneratorStrengthConstant = new SecurityLib\Strength((new SecurityLib\Strength)->getConstList()[$lostPasswordRandomGeneratorStrengthString]);

  # Mail
  $mailEnabled        = get_config('mailEnabled');
  $mailServer         = get_config('server'     );
  $mailPort           = get_config('port'     );
  $mailUsername       = get_config('username' );
  $mailPassword       = get_config('password' );
  $mailReplyToAddress = get_config('replyToAddress');
  $mailReplyToName    = get_config('replyToName');

  $lostPasswordSubject = get_config("lostPasswordSubject");
  $lostPasswordBodyTemplateFilePath = get_config("lostPasswordBodyTemplateFilePath");
  if(!empty($lostPasswordBodyTemplateFilePath)) {
    $lostPasswordBodyTemplateFilePath = __DIR__."/$lostPasswordBodyTemplateFilePath";
    $lostPasswordBodyTemplate = file_get_contents($lostPasswordBodyTemplateFilePath);
  }

  if(
    empty($mailServer)                        ||
    empty($mailPort)                          ||
    empty($mailUsername)                      ||
    empty($mailPassword)                      ||
    empty($mailReplyToAddress)                ||
    empty($mailReplyToName)                   ||
    empty($lostPasswordSubject)               ||
    empty($lostPasswordBodyTemplateFilePath)
  ) {
    # Don't want this message output for every request.
    // error_log("Warning: Disabling mail server integration as a required setting was blank...");
    $mailEnabled = false;
  }

  $debugLoggingMode = get_config('debugLoggingMode', default: 'errorLog');
  // debug_log("debugLoggingMode: $debugLoggingMode");
  $cFRPFileExists = file_exists($cacheFolderRootPath);
  $cFFileExists = file_exists($cacheFolder);
  // debug_log("cacheFolderRootPath: $cacheFolderRootPath");
  // debug_log("cacheFolder        : $cacheFolder");
  // debug_log("cFRPFileExists     : $cFRPFileExists");
  // debug_log("cFFileExists       : $cFFileExists");
  if(!$cFRPFileExists) {
    mkdir($cacheFolderRootPath) or
    die("Cache root directory error at: ".$cacheFolderRootPath);
  }
  if(!$cFFileExists) {
    mkdir($cacheFolder) or
    die("Cache directory error at: ".$cacheFolder);
  }
?>
