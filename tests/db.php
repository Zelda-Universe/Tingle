<?php
  $path = __DIR__;

  include_once("$path/../config.php");

  print('Checking if tests are enabled...<br>');

  if(!$enableTests) {
    print('Tests are disabled; exiting...<br>');
    exit;
  }

  print('Continuing with tests...<br>');

  # dbpassword should always use the db config variable.
  # Never include it directly to this SCM-tracked file.

  include "$path/../lib/common/database.php";

  print('Checking database...<br>');
  print('<br>');

  print("dbms       : $dbms<br>"    );
  print("dbhost     : $dbhost<br>"  );
  print("dbuser     : $dbuser<br>"  );
  // print("dbpasswd   : $dbpasswd<br>");
  print("dbname     : $dbname<br>"  );
  print("dbport     : $dbport<br>"  );
  print("dbsocket   : $dbsocket<br>");
  print('<br>');

  print('Using database library open method...<br>');
  $openRetCode = open();
  print("openRetCode: $openRetCode<br>");

  if ($openRetCode === 0) {
    $serverVersion = $db->fetchOne('SELECT VERSION()');
    print("Connected. Server version: $serverVersion<br>");
    print('Tables: ' . count($db->fetchFirstColumn('SHOW TABLES')) . '<br>');
  } else {
    print('Connection failed; see the debug log / PHP error log.<br>');
  }
?>
