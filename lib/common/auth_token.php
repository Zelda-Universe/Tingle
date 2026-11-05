<?php
  // Staying signed in. PHP sessions alone can't be relied on: the host
  // deletes idle session files on its own schedule, whatever this app asks
  // for, and the session cookie ends when the browser (or an iOS web app)
  // closes. So signing in also sets a long-lived login cookie, checked
  // against a hash in user_login_token, that puts the session back whenever
  // it's gone. Only Log Out removes it (and an account being deleted,
  // disabled or banned).
  //
  // The cookie is "selector:validator". The selector finds the row; only a
  // SHA-256 of the validator is stored. Validators aren't rotated on use,
  // since parallel requests would race and sign people out.

  include_once(__DIR__ . '/session.php');

  const AUTH_COOKIE = 'zmap_auth';
  // Browsers cap cookie lifetimes at 400 days; it's renewed daily on use.
  const AUTH_LIFETIME = 60 * 60 * 24 * 400;
  const AUTH_RENEW_AFTER = 60 * 60 * 24;

  function authTokensAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) {
      $available = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}user_login_token'");
    }
    return $available;
  }

  function authSetCookie($value, $expires) {
    setcookie(AUTH_COOKIE, $value, [
      'expires'  => $expires,
      'path'     => '/',
      'secure'   => session_cookie_is_secure(),
      'httponly' => true,
      'samesite' => 'Lax'
    ]);
    if ($expires > time()) $_COOKIE[AUTH_COOKIE] = $value;
    else unset($_COOKIE[AUTH_COOKIE]);
  }

  // [selector, validator] from the cookie, or null.
  function authCookieParts() {
    $value = $_COOKIE[AUTH_COOKIE] ?? '';
    if (!is_string($value) || !preg_match('/^([a-f0-9]{24}):([a-f0-9]{64})$/', $value, $match)) return null;
    return [$match[1], $match[2]];
  }

  function authIssueToken($db, $prefix, $userId) {
    if (!authTokensAvailable($db, $prefix)) return;
    // Tokens past their cookie's lifetime can never be presented again;
    // clear them out as people sign in, so the table doesn't grow forever.
    $db->executeStatement(
      "DELETE FROM `{$prefix}user_login_token` WHERE `last_used` < NOW() - INTERVAL ? SECOND",
      [AUTH_LIFETIME]
    );
    $selector = bin2hex(random_bytes(12));
    $validator = bin2hex(random_bytes(32));
    $agent = substr((string) ($_SERVER['HTTP_USER_AGENT'] ?? ''), 0, 255);
    $ip = substr(preg_replace('#[^0-9a-fA-F.:]#', '', (string) ($_SERVER['REMOTE_ADDR'] ?? '')), 0, 46);
    $db->executeStatement("
      INSERT INTO `{$prefix}user_login_token`
        (`user_id`, `selector`, `token_hash`, `user_agent`, `ip`, `created`, `last_used`)
      VALUES (?, ?, ?, ?, ?, NOW(), NOW())
    ", [(int) $userId, $selector, hash('sha256', $validator), $agent, $ip]);
    authSetCookie($selector . ':' . $validator, time() + AUTH_LIFETIME);
  }

  // The token row the cookie proves, or null.
  function authCurrentToken($db, $prefix) {
    $parts = authCookieParts();
    if (!$parts || !authTokensAvailable($db, $prefix)) return null;
    $row = $db->fetchAssociative(
      "SELECT `id`, `user_id`, `token_hash`, `last_used`, TIMESTAMPDIFF(SECOND, `last_used`, NOW()) AS `idle`
         FROM `{$prefix}user_login_token` WHERE `selector` = ?",
      [$parts[0]]
    );
    if (!$row || !hash_equals($row['token_hash'], hash('sha256', $parts[1]))) return null;
    return $row;
  }

  // Fills the session as signing in does.
  function authFillSession($db, $prefix, $userId) {
    $row = $db->fetchAssociative("
      SELECT `id`, `username`, `level`,
             `seen_version_major` AS `v1`, `seen_version_minor` AS `v2`, `seen_version_patch` AS `v3`
        FROM `{$prefix}user` WHERE `id` = ?
    ", [(int) $userId]);
    if (!$row) return false;
    // A fresh session id, as login.php gives: the one the browser arrived
    // with was issued before it proved who it was.
    session_regenerate_id(true);
    $_SESSION['username'] = $row['username'];
    $_SESSION['user_id']  = $row['id'];
    $_SESSION['level']    = $row['level'];
    $_SESSION['v1']       = $row['v1'];
    $_SESSION['v2']       = $row['v2'];
    $_SESSION['v3']       = $row['v3'];
    $_SESSION['remember'] = true;
    return true;
  }

  // Before every request (ajax.php): puts back a session that's gone, gives
  // sessions from before login tokens existed one, and renews the cookie.
  // Errors here never sign anyone out; the request just goes on.
  function authRestoreSession($db, $prefix) {
    $hasSession = !empty($_COOKIE['zmap']);
    $hasToken = authCookieParts() !== null;
    if (!$hasSession && !$hasToken) return;
    try {
      if (!authTokensAvailable($db, $prefix)) return;
      start_session('zmap');
      $sessionUser = (int) ($_SESSION['user_id'] ?? 0);
      $token = $hasToken ? authCurrentToken($db, $prefix) : null;

      if ($token && (!$sessionUser || $sessionUser !== (int) $token['user_id'])) {
        // The session is gone (or belongs to someone else): sign back in.
        include_once(__DIR__ . '/account_status.php');
        if (accountIsUsable($db, $prefix, $token['user_id']) && authFillSession($db, $prefix, $token['user_id'])) {
          $sessionUser = (int) $token['user_id'];
        }
      } elseif (!$token && $sessionUser) {
        // Signed in from before login tokens, or a cookie that's been lost.
        authIssueToken($db, $prefix, $sessionUser);
      } elseif ($hasToken && !$token && !$sessionUser) {
        // A cookie for a token that's been revoked.
        authSetCookie('', time() - 3600);
      }

      if ($token && (int) $token['idle'] > AUTH_RENEW_AFTER) {
        $db->executeStatement("UPDATE `{$prefix}user_login_token` SET `last_used` = NOW() WHERE `id` = ?", [$token['id']]);
        authSetCookie($_COOKIE[AUTH_COOKIE], time() + AUTH_LIFETIME);
      }
      session_write_close();
    } catch (\Throwable $e) {
      error_log('authRestoreSession: ' . $e->getMessage());
      if (session_status() === PHP_SESSION_ACTIVE) session_write_close();
    }
  }

  // Log Out: this device's token.
  function authRevokeCurrent($db, $prefix) {
    $parts = authCookieParts();
    if ($parts && authTokensAvailable($db, $prefix)) {
      $db->executeStatement("DELETE FROM `{$prefix}user_login_token` WHERE `selector` = ?", [$parts[0]]);
    }
    authSetCookie('', time() - 3600);
  }

  // Deleted, disabled or banned accounts, and passwords set by a reset link
  // or an admin: every device.
  function authRevokeUser($db, $prefix, $userId) {
    if (authTokensAvailable($db, $prefix)) {
      $db->executeStatement("DELETE FROM `{$prefix}user_login_token` WHERE `user_id` = ?", [(int) $userId]);
    }
  }

  // A password the account holder changed themselves: every device but the
  // one they did it from.
  function authRevokeOtherDevices($db, $prefix, $userId) {
    if (!authTokensAvailable($db, $prefix)) return;
    $parts = authCookieParts();
    if ($parts) {
      $db->executeStatement(
        "DELETE FROM `{$prefix}user_login_token` WHERE `user_id` = ? AND `selector` <> ?",
        [(int) $userId, $parts[0]]
      );
    } else {
      authRevokeUser($db, $prefix, $userId);
    }
  }
?>
