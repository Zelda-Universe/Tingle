<?php
  function session_cookie_is_secure() {
    return (
      (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off')
      || (isset($_SERVER['SERVER_PORT']) && (int) $_SERVER['SERVER_PORT'] === 443)
    );
  }

  function start_session($name, $cookieLifetime = 0) {
    if(!isset($name)) throw new Exception('No name parameter provided.');

    if(!defined("PHP_MAJOR_VERSION") || PHP_MAJOR_VERSION < 7) {
      return session_start($name);
    } else {
      $opts = [
        "name"              => $name,
        "cookie_lifetime"   => (int) $cookieLifetime,
        "cookie_path"       => "/",
        "cookie_secure"     => session_cookie_is_secure(),
        "cookie_httponly"   => true,
        "cookie_samesite"   => "Lax",
        "gc_maxlifetime"    => 60 * 60 * 24 * 30,
        "use_strict_mode"   => true
      ];
      return session_start($opts);
    }
  }
?>
