<?php
  // Image credits (migrations/..._image_credits.sql): who made an image in a
  // marker's contents and where it's from, shown under it wherever it
  // appears (scripts/services/ImageCredits.js). Read by anyone; set by
  // editors from the marker editor (ajax/save_image_credit.php).

  // The licenses an image can be under, and how its credit line names them.
  function imageCreditLicenses() {
    return array(
      'own'        => 'Own work',
      'permission' => 'With permission',
      'cc-by'      => 'CC BY',
      'cc-by-sa'   => 'CC BY-SA',
      'other'      => 'Other'
    );
  }

  function imageCreditsAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) $available = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}image_credit'");
    return $available;
  }

  // An image's key: an upload's path relative to the site (uploads/...),
  // whichever address it was written with, or another site's full URL.
  // Null for anything else (data: URLs, scripts).
  function imageCreditKey($src) {
    $src = trim((string) $src);
    if ($src === '' || strlen($src) > 500) return null;
    $parts = parse_url($src);
    if ($parts === false) return null;
    if (isset($parts['scheme'])) {
      if (!in_array(strtolower($parts['scheme']), ['http', 'https'], true) || empty($parts['host'])) return null;
      $host = strtolower($parts['host']);
      $ours = preg_match('/(^|\.)zeldamaps\.com$/', $host) || $host === strtolower(preg_replace('/:\d+$/', '', $_SERVER['HTTP_HOST'] ?? '')) || $host === 'localhost';
      if (!$ours) return $src;
      $src = ltrim($parts['path'] ?? '', '/');
    }
    $src = ltrim(preg_replace('#^\./#', '', $src), '/');
    return preg_match('#^uploads/[A-Za-z0-9_./-]+$#', $src) && strpos($src, '..') === false ? $src : null;
  }

  // Credits for some images, by key: [key => [author, source, license]].
  function imageCreditsFor($db, $prefix, $keys) {
    if (!$keys || !imageCreditsAvailable($db, $prefix)) return array();
    $hashes = array_map(function($key) { return hash('sha256', $key); }, $keys);
    $rows = $db->fetchAllAssociative("SELECT src, author, source_url, license FROM `{$prefix}image_credit` WHERE src_hash IN (" .
      implode(',', array_fill(0, count($hashes), '?')) . ")", $hashes);
    $credits = array();
    foreach ($rows as $row) $credits[$row['src']] = array('author' => $row['author'], 'source' => $row['source_url'], 'license' => $row['license']);
    return $credits;
  }
?>
