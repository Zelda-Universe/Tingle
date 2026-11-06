<?php
  // Whether an account may be used: not deleted (delete_account.php), and not
  // disabled or banned by an admin (admin_set_disabled.php, admin_set_ban.php).
  // The deleted, disabled and banned columns come from migrations, so only
  // the ones that exist are checked.

  function accountStatusColumns($db, $prefix) {
    static $columns = null;
    if ($columns === null) {
      $columns = array_column($db->fetchAllAssociative(
        "SHOW COLUMNS FROM `{$prefix}user` WHERE `Field` IN ('deleted', 'disabled', 'banned')"
      ), 'Field');
    }
    return $columns;
  }

  // SQL that's true for a usable account, for a WHERE clause on `user`.
  function accountUsableSql($db, $prefix, $alias = '') {
    $table = $alias === '' ? '' : "`{$alias}`.";
    $sql = "{$table}`password` <> '<deleted>'";
    foreach (accountStatusColumns($db, $prefix) as $column) {
      $sql .= " AND {$table}`{$column}` IS NULL";
    }
    return $sql;
  }

  function accountIsUsable($db, $prefix, $userId) {
    return (bool) $db->fetchOne(
      "SELECT 1 FROM `{$prefix}user` WHERE `id` = ? AND " . accountUsableSql($db, $prefix),
      [(int) $userId]
    );
  }

  // Before any request is handled (ajax.php): ends the session of an account
  // that's been deleted, disabled or banned since it signed in, and brings
  // the session's role up to date when an admin has changed it. Pages left
  // open would otherwise keep working with the old access, e.g. adding
  // markers (add_marker.php and others read the session's level).
  function accountSessionCheck($db, $prefix) {
    if (empty($_COOKIE['zmap'])) return;
    start_session('zmap');
    $userId = (int) ($_SESSION['user_id'] ?? 0);
    $level = $userId ? $db->fetchOne(
      "SELECT `level` FROM `{$prefix}user` WHERE `id` = ? AND " . accountUsableSql($db, $prefix),
      [$userId]
    ) : null;
    if ($userId && isset($_SESSION['level']) && $level !== false && (int) $_SESSION['level'] !== (int) $level) {
      $_SESSION['level'] = (int) $level;
    }
    if ($userId && $level === false) {
      session_unset();
      session_destroy();
      include_once(__DIR__ . '/auth_token.php');
      authRevokeUser($db, $prefix, $userId);
      authSetCookie('', time() - 3600);
      return;
    }
    session_write_close();
  }

  // The form of an email address that a ban blocks: lowercase, without a
  // +tag, and for Gmail without dots, so name.surname+zm@gmail.com and
  // namesurname@googlemail.com are the same address.
  function emailBanKey($email) {
    $email = strtolower(trim((string) $email));
    $at = strrpos($email, '@');
    if ($at === false) return $email;
    $local = substr($email, 0, $at);
    $domain = substr($email, $at + 1);
    $plus = strpos($local, '+');
    if ($plus !== false) $local = substr($local, 0, $plus);
    if ($domain === 'googlemail.com') $domain = 'gmail.com';
    if ($domain === 'gmail.com') $local = str_replace('.', '', $local);
    return $local . '@' . $domain;
  }

  function emailIsBanned($db, $prefix, $email) {
    if (!$db->fetchOne("SHOW TABLES LIKE '{$prefix}banned_email'")) return false;
    return (bool) $db->fetchOne(
      "SELECT 1 FROM `{$prefix}banned_email` WHERE `email` = ?",
      [emailBanKey($email)]
    );
  }
?>
