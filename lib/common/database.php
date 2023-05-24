<?php
  function open() {
    global $mysqli, $dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket;
    # mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    # TODO: Prepend hostname with "p:"? # https://www.php.net/manual/en/mysqli.construct.php
    // debug_log('dbhost: '.$dbhost);
    try {
      $mysqli = new mysqli($dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket);
    } catch (Exception $e) {
      debug_log('MySQL construction/connection error.');
      debug_log($e);
      return 1;
    }
    // debug_log('dbhost: '.$dbhost);
    if (!$mysqli or $mysqli->errno) {
      debug_log(print_r($mysqli));
      debug_log('$mysqli->errno: '.$mysqli->errno);
      throw new RuntimeException('mysqli error: ' . $mysqli->error);
    }
    $mysqli->query("SET NAMES 'utf8'");
    $mysqli->query('SET character_set_connection=utf8');
    $mysqli->query('SET character_set_client=utf8');
    $mysqli->query('SET character_set_results=utf8');
    # $mysqli->set_charset('utf8mb4');
  }

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
?>
