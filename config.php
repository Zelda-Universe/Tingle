<?php
  include_once(__DIR__."/lib/common/log.php");

  // debug_log('Config START');

  function load_config() {
    global $config;
    $config = parse_ini_file(CONFIGFILE);
  }
  function get_config($key, $type = "string", $default = null) {
    global $config;
    if(!isset($config)) die("Error: Config not loaded; exiting...");

    if(empty($default)) {
      if(strtolower($type) === "int") {
        $default = 0;
      } else if(strtolower($type) === "boolean") {
        $default = 'true';
      } else if(strtolower($type) === "string") {
        $default = '';
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

  !file_exists(CONFIGFILE) and die('Project `.env` file not found and must be provided.');

  load_config();

  # Debug feature
  {
    $debugLoggingMode = get_config('debugLoggingMode', 'string', 'errorLog');
    // debug_log("debugLoggingMode: $debugLoggingMode");
  }

  // debug_log('Config START2');

  require __DIR__ . '/vendor/autoload.php';

  # All but deprecated and notices.
  # TODO: This is a dev or prod setting currently?
  error_reporting((E_ALL ^ E_DEPRECATED) & ~E_NOTICE);

  # Database Config Loading
  {
    $dbms         = get_config("DBMS"       , 'string', 'mysql' );
    $dbhost       = get_config("DBHOST"     , 'string'          );
    $dbuser       = get_config("DBUSER"     , 'string'          );
    $dbpasswd     = get_config("DBPASSWD"   , 'string'          );
    $dbname       = get_config("DBNAME"     , 'string'          );
    $dbport       = get_config("DBPORT"     , 'int'             );
    $dbsocket     = get_config("DBSOCKET"   , 'string'          );
    $map_prefix   = get_config("PREFIX"     , 'string'          );
    $minify       = get_config("minify"     , 'boolean', true   );
    $enableTests  = get_config("enableTests", 'boolean', false  );

    // debug_log('dbms: '.$dbms);
    // debug_log('dbhost: '.$dbhost);
    // debug_log('dbuser: '.$dbuser);
    // debug_log('dbpasswd: '.$dbpasswd);
    // debug_log('dbname: '.$dbname);
    // debug_log('dbport: '.$dbport);
    // debug_log('dbsocket: '.$dbsocket);
    // debug_log('map_prefix: '.$map_prefix);
    // debug_log('minify: '.$minify);
    // debug_log('enableTests: '.$enableTests);
  }

  # User features

  # Lost password dependent options
  {
    $lostPasswordRandomGeneratorStrengthStrings = array_keys((new SecurityLib\Strength)->getConstList());

    $lostPasswordRandomGeneratorStrengthString = get_config("LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH");
    if(
      array_search(
        $lostPasswordRandomGeneratorStrengthString, $lostPasswordRandomGeneratorStrengthStrings
      ) === false
    ) {
      // Display notice instead of using a silent default since it could be an important setting for security.
      error_log("Miconfigured \"LOST_PASSWORD_RANDOM_GENERATOR_STRENGTH\" setting; using the value \"MEDIUM\" by default.");
      $lostPasswordRandomGeneratorStrengthString = "MEDIUM";
    }
    $lostPasswordRandomGeneratorStrengthConstant = new SecurityLib\Strength((new SecurityLib\Strength)->getConstList()[$lostPasswordRandomGeneratorStrengthString]);
  }

  # Mail
  {
    # Config Loading
    $mailEnabled        = get_config('mailEnabled'    );
    $mailServer         = get_config('server'         );
    $mailPort           = get_config('port'           );
    $mailUsername       = get_config('username'       );
    $mailPassword       = get_config('password'       );
    $mailReplyToAddress = get_config('replyToAddress' );
    $mailReplyToName    = get_config('replyToName'    );

    $lostPasswordSubject = get_config("lostPasswordSubject");
    $lostPasswordBodyTemplateFilePath = get_config("lostPasswordBodyTemplateFilePath");

    # Validation
    if(!empty($lostPasswordBodyTemplateFilePath)) {
      $lostPasswordBodyTemplateFilePath = __DIR__."/$lostPasswordBodyTemplateFilePath";
      $lostPasswordBodyTemplate = file_get_contents($lostPasswordBodyTemplateFilePath);
    }

    # Fallback disable feature
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
  }

  # Cache / temporary control
  {
    $cacheFolderRootPath = get_config("cacheFolderRootPath", sys_get_temp_dir());
    $cacheFolder = $cacheFolderRootPath."/Tingle";

    $cacheFolderRootPath = get_config("cacheFolderRootPath", sys_get_temp_dir());
    $cacheFolder = $cacheFolderRootPath."/Tingle";

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
  }

  // debug_log('Config END');
?>
