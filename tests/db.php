<?php
  $path = __DIR__;

  include_once("$path/../config.php");

  print('Checking if tests are enabled...<br>');

  if(!$enableTests) {
    print('Tests are disabled; exiting...<br>');
    exit;
  }

  print('Continuing with tests...<br>');

  # Direct settings
  $testdbsocket = '/var/run/mysqld/mysql.sock';
  // $testdbsocket = '/var/lib/mysql/mysql.sock';

  # dbpassword should always use the db config variable.
  # Never include it directly to this SCM-tracked file.

  include "$path/../lib/common/database.php";

  print('Checking database...<br>');
  print('<br>');

  print('Using database library open method...<br>');

  // $openRetCode = open();
  // print("openRetCode: $openRetCode<br>" );

  print("dbms       : $dbms<br>"    );
  print("dbhost     : $dbhost<br>"  );
  print("dbuser     : $dbuser<br>"  );
  // print("dbpasswd   : $dbpasswd<br>");
  print("dbname     : $dbname<br>"  );
  print("dbport     : $dbport<br>"  );
  print("dbsocket   : $dbsocket<br>");
  print('<br>');

  print('Using PHP library mysqli construction method directly...<br>');
  print('Variant 1 - Variables');
  print('<br>');

  $mysqli = @new mysqli(
    $dbhost, $dbuser, $dbpasswd, $dbname, $dbport, $dbsocket
  );
  print_r($mysqli); unset($mysqli);
  print('<hr>');



  print('Using PHP library mysqli construction method directly...<br>');
  print('Variant 2 - Literals - IP, Port 0');
  print('<br>');

  $mysqli = @new mysqli(
    '127.0.0.1'   ,
    'zeldamaps'   ,
    $dbpasswd     ,
    'zeldamaps'   ,
    0             ,
    $testdbsocket
  );
  print_r($mysqli); unset($mysqli);
  print('<hr>');



  print('Using PHP library mysqli construction method directly...<br>');
  print('Variant 2 - Literals - Hostname, Port 0');
  print('<br>');

  $mysqli = @new mysqli(
    'localhost'   ,
    'zeldamaps'   ,
    $dbpasswd     ,
    'zeldamaps'   ,
    0             ,
    $testdbsocket
  );
  print_r($mysqli); unset($mysqli);
  print('<hr>');



  print('Using PHP library mysqli construction method directly...<br>');
  print('Variant 2 - Literals - IP, Port NULL');
  print('<br>');

  $mysqli = @new mysqli(
    '127.0.0.1'   ,
    'zeldamaps'   ,
    $dbpasswd     ,
    'zeldamaps'   ,
    NULL          ,
    $testdbsocket
  );
  print_r($mysqli); unset($mysqli);
  print('<hr>');



  print('Using PHP library mysqli construction method directly...<br>');
  print('Variant 2 - Literals - Hostname, Port NULL');
  print('<br>');

  $mysqli = @new mysqli(
    'localhost'   ,
    'zeldamaps'   ,
    $dbpasswd     ,
    'zeldamaps'   ,
    NULL          ,
    $testdbsocket
  );
  print_r($mysqli); unset($mysqli);
  print('<hr>');
?>
