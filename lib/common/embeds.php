<?php
  // Embed usage (migrations/..._embed_events.sql): Embed Code copied
  // (ajax/track_embed.php) and embeds shown on other sites (embed.php).
  // Anonymous: a site's host, never who was reading it.
  include_once(__DIR__ . '/signups.php');

  function embedTargets() {
    return array('marker' => 'Markers', 'pin' => 'Dropped pins', 'path' => 'Paths', 'map' => 'Maps');
  }

  function embedsAvailable($db, $prefix) {
    static $available = array();
    if (!isset($available[$prefix])) $available[$prefix] = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}embed_event'");
    return $available[$prefix];
  }

  // kind: 'copy' or 'view'. host: the embedding site's, for a view.
  function embedRecord($db, $prefix, $kind, $target, $game, $host = null) {
    if (!embedsAvailable($db, $prefix)) return false;
    if (!in_array($kind, array('copy', 'view'), true) || !isset(embedTargets()[$target])) return false;
    $game = preg_replace('/[^A-Za-z0-9_-]/', '', (string) $game);
    $host = $host === null ? null : strtolower(substr((string) $host, 0, 190));
    $hash = signupIpHash();
    // Enough for anyone reading or copying; not for someone filling the table.
    if ((int) $db->fetchOne("SELECT COUNT(*) FROM `{$prefix}embed_event` WHERE `ip_hash` = ? AND `created` > NOW() - INTERVAL 1 HOUR", [$hash]) >= 120) return false;
    $db->executeStatement("INSERT INTO `{$prefix}embed_event` (`kind`, `target`, `game`, `host`, `ip_hash`) VALUES (?, ?, ?, ?, ?)",
      [$kind, $target, $game === '' ? null : substr($game, 0, 32), $host, $hash]);
    return true;
  }

  // What an embed's address shows: a path, a dropped pin, a marker, or a map.
  function embedTargetOf($query) {
    if (!empty($query['path'])) return 'path';
    if (!empty($query['droppedPin'])) return 'pin';
    if (!empty($query['marker'])) return 'marker';
    return 'map';
  }
?>
