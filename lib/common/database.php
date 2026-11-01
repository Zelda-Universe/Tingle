<?php
  use Doctrine\DBAL\DriverManager;

  /**
   * Open the application's database connection.
   *
   * Sets $db, a Doctrine\DBAL\Connection. Every query goes through it with
   * bound parameters; nothing from the request is ever concatenated into SQL.
   *
   * The legacy $mysqli handle is kept alive until the remaining (write)
   * endpoints are converted. Both handles point at the same server and
   * database. begin()/commit()/rollback() still operate on $mysqli for the
   * same reason, so an endpoint must not mix the two inside one transaction.
   *
   * Returns 0 on success, 1 on failure (ajax.php checks the return value).
   */
  function open() {
    global $db, $mysqli, $dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket;

    $params = [
      'driver'   => 'pdo_mysql',
      'user'     => $dbuser,
      'password' => $dbpasswd,
      'dbname'   => $dbname,
      // Matches the SET NAMES 'utf8' the application has always issued.
      'charset'  => 'utf8',
      'driverOptions' => [
        // mysqli returned every column as a string; keep the JSON responses
        // byte-for-byte identical so nothing in the frontend changes type.
        PDO::ATTR_STRINGIFY_FETCHES => true,
        PDO::ATTR_EMULATE_PREPARES  => false,
      ],
    ];

    if (!empty($dbsocket)) {
      $params['unix_socket'] = $dbsocket;
    } else {
      $params['host'] = $dbhost;
      if (!empty($dbport)) {
        $params['port'] = (int) $dbport;
      }
    }

    try {
      $db = DriverManager::getConnection($params);
      // Connect now rather than lazily, so a bad configuration fails here
      // with "No database connection!" instead of inside an endpoint.
      $db->getNativeConnection();

      $mysqli = new mysqli($dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket);
      $mysqli->set_charset('utf8');
    } catch (\Throwable $e) {
      debug_log('Database connection error: ' . $e->getMessage());
      return 1;
    }

    return 0;
  }

  function begin() {
    global $mysqli;
    return $mysqli->query("BEGIN");
  }

  function commit() {
    global $mysqli;
    return $mysqli->query("COMMIT");
  }

  function rollback() {
    global $mysqli;
    return $mysqli->query("ROLLBACK");
  }
?>
