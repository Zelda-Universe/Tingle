<?php
  use Doctrine\DBAL\DriverManager;

  /**
   * Open the application's database connection.
   *
   * Sets $db, a Doctrine\DBAL\Connection. Every query goes through it with
   * bound parameters; nothing from the request is ever concatenated into SQL.
   * Query failures throw; ajax.php turns an uncaught exception into a logged
   * "Internal error" response.
   *
   * Returns 0 on success, 1 on failure (ajax.php checks the return value).
   */
  function open() {
    global $db, $dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket;

    $params = [
      'driver'   => 'pdo_mysql',
      'user'     => $dbuser,
      'password' => $dbpasswd,
      'dbname'   => $dbname,
      // utf8mb4 since the convert_to_utf8mb4 migration: every table is
      // utf8mb4, so emoji and non-Latin text store as typed. (Before it the
      // application issued SET NAMES 'utf8' against latin1 tables.)
      'charset'  => 'utf8mb4',
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
    } catch (\Throwable $e) {
      debug_log('Database connection error: ' . $e->getMessage());
      return 1;
    }

    return 0;
  }

  function begin() {
    global $db;
    $db->beginTransaction();
  }

  function commit() {
    global $db;
    if ($db->isTransactionActive()) {
      $db->commit();
    }
  }

  function rollback() {
    global $db;
    if ($db->isTransactionActive()) {
      $db->rollBack();
    }
  }
?>
