<?php
  // Searching for people (user:name in the search box), for anyone: the
  // people who edit, who are the ones with profiles (user_profile.php).
  // Usernames starting with the text come first, then any containing it.
  include_once(dirname(__DIR__) . '/lib/common/wiki.php');

  $q = trim(is_string($_GET['q'] ?? null) ? $_GET['q'] : '');
  if ($q === '') {
    echo json_encode(array('success' => true, 'users' => array()));
    return;
  }
  $like = addcslashes($q, '%_\\');
  $picture = wikiHasUserColumn($db, $map_prefix, 'profile_picture') ? '`u`.`profile_picture`' : 'NULL';
  $edits = wikiAvailable($db, $map_prefix)
    ? "(SELECT COUNT(*) FROM `{$map_prefix}marker_revision` `r` WHERE `r`.`user_id` = `u`.`id` AND `r`.`action` <> 'import')"
    : '0';
  $users = $db->fetchAllAssociative("
    SELECT `u`.`id`, `u`.`username`, " . accountLevelSql($db, $map_prefix, 'u') . " AS `level`,
           " . accountBetaSql($db, $map_prefix, 'u') . " AS `beta`, {$picture} AS `profilePicture`, {$edits} AS `edits`
      FROM `{$map_prefix}user` `u`
     WHERE `u`.`username` LIKE ? AND " . accountUsableSql($db, $map_prefix, 'u') . "
       AND " . accountLevelSql($db, $map_prefix, 'u') . " >= " . WIKI_EDITOR_LEVEL . "
     ORDER BY `u`.`username` LIKE ? DESC, CHAR_LENGTH(`u`.`username`), `u`.`username`
     LIMIT 20
  ", ['%' . $like . '%', $like . '%']);
  foreach ($users as &$user) {
    foreach (['id', 'level', 'edits'] as $key) $user[$key] = (int) $user[$key];
    $user['beta'] = (bool) $user['beta'];
  }
  unset($user);
  echo json_encode(array('success' => true, 'users' => $users));
?>
