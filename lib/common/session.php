<?php
  function start_session($name) {
    if(!isset($name)) throw new Exception('No name parameter provided.');

    if(!defined("PHP_MAJOR_VERSION") || PHP_MAJOR_VERSION < 7) {
      return session_start($name);
    } else {
      $opts = ["name" => $name];
      return session_start($opts);
    }
  }
?>
