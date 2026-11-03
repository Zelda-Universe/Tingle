<?php
   $path = __DIR__;

   if (!isset($_POST['user']) || !isset($_POST['password'])) {
     echo json_encode(array(
       "success" => false,
       "msg"     => "Oops, something went wrong..."
     ));
     return;
   }

   $username = (string) $_POST['user'];
   $password = (string) $_POST['password'];
   $ip       = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

   // Older accounts were hashed from a mysqli-escaped copy of the password
   // (quotes, backslashes and a few control characters backslash-escaped), so
   // the escaped form is tried as well. New hashes always use the raw password.
   $passwordLegacyEscaped = strtr($password, [
     "\\"   => "\\\\",
     "'"    => "\\'",
     "\""   => "\\\"",
     "\n"   => "\\n",
     "\r"   => "\\r",
     "\0"   => "\\0",
     "\x1a" => "\\Z",
   ]);

   // The profile_picture column arrives with a migration; older databases
   // don't have it yet, so select it only when it exists.
   $hasProfileColumn = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'");
   $profilePictureSelect = $hasProfileColumn
     ? '`profile_picture` AS `profilePicture`'
     : 'NULL AS `profilePicture`';
   $hasDeletedColumn = (bool) $db->fetchOne("SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'deleted'");
   $deletedSelect = $hasDeletedColumn ? '`deleted`' : 'NULL AS `deleted`';

   $row = $db->fetchAssociative("
     SELECT
       `id`                        ,
       `username`                  ,
       `email`                     ,
       `name`                      ,
       {$profilePictureSelect}     ,
       {$deletedSelect}            ,
       `password`                  ,
       `level`                     ,
       `seen_version_major` AS `v1`,
       `seen_version_minor` AS `v2`,
       `seen_version_patch` AS `v3`
     FROM
       `{$map_prefix}user`
     WHERE (
           `username` = ?
       OR  `email`    = ?
     )
   ", [$username, $username]);

   if (
         !$row
     ||  $row['deleted'] !== null
     ||  !isset($row['password'])
     ||  !(
              password_verify($password,              $row['password'])
          ||  password_verify($passwordLegacyEscaped, $row['password'])
         )
   ) {
     echo json_encode(array("success"=>false, "msg"=>"Username or password invalid!"));
     return;
   }

   $user['id']           = $row['id'];
   $user['username']     = $row['username'];
   $user['email']        = $row['email'];
   $user['name']         = $row['name'];
   $user['profilePicture'] = $row['profilePicture'];
   if (!$user['profilePicture']) {
     $profileFiles = glob(
       dirname(__DIR__) . '/uploads/profile-pictures/' . (int) $row['id'] . '-*.webp'
     );
     if ($profileFiles) {
       usort($profileFiles, function($a, $b) {
         return filemtime($b) <=> filemtime($a);
       });
       $user['profilePicture'] = 'uploads/profile-pictures/' . basename($profileFiles[0]);
     }
   }
   $user['level']        = $row['level'];
   $user['seen_version'] = $row['v1'] . '.' . $row['v2'] . '.' . $row['v3'];

   $rememberLifetime = isset($_POST['remember']) ? 60 * 60 * 24 * 30 : 0;
   start_session("zmap", $rememberLifetime);
   session_regenerate_id(true);

   $_SESSION['username'] = $user['username'];
   $_SESSION['user_id']  = $user['id'];
   $_SESSION['level']    = $user['level'];
   $_SESSION['v1']       = $row['v1'];
   $_SESSION['v2']       = $row['v2'];
   $_SESSION['v3']       = $row['v3'];
   $_SESSION['remember'] = $rememberLifetime > 0;

   session_write_close();

   $db->executeStatement("
     UPDATE {$map_prefix}user
        SET ip = ?
          , last_login = now()
      WHERE id = ?
   ", [$ip, (int) $row['id']]);

   echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));
?>
