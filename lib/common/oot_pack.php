<?php
// Read-only asset preview. Existing database-backed games are unchanged.
function ootPackData($kind) {
  if (!in_array($kind, ['container', 'maps', 'categories', 'markers', 'import-report'], true)) return null;
  $file = dirname(__DIR__, 2) . '/data/OoT/' . $kind . '.json';
  if (!is_file($file)) return null;
  $data = json_decode(file_get_contents($file), true, 512, JSON_THROW_ON_ERROR);
  if ($kind === 'maps') {
    $versions = ootPackTileVersions();
    foreach ($data as &$map) foreach ($map['subMap'] as &$submap) {
      $submap['name']=preg_replace('/(?:\s*·\s*)?State\s*\d+/i','',$submap['name']);
      $submap['tileVersion'] = $versions[trim($submap['tileURL'], '/')] ?? null;
    }
    unset($map, $submap);
  }
  return $data;
}
// Import hashes describe the actual artwork, independent of deploy timestamps.
function ootPackTileVersions() {
  $versions = [];
  foreach ((ootPackData('import-report')['assets'] ?? []) as $asset) {
    if (!empty($asset['tileURL']) && !empty($asset['sha256']))
      $versions[trim($asset['tileURL'], '/')] = substr($asset['sha256'], 0, 16);
  }
  return $versions;
}
function ootPackIsGame($value) {
  return in_array(strtolower((string) $value), ['oot', 'ootr', '64'], true) && ootPackData('container') !== null;
}
function ootPackAppendGame($games) {
  $container = ootPackData('container');
  if (!$container) return $games;
  // Reserve both aliases for this pack, replacing any placeholder DB entry.
  $games=array_values(array_filter($games,function($game) {
    return !in_array(strtolower($game['shortName'] ?? ''),['oot','ootr'],true);
  }));
  $game = $container[0];
  $game['shortName']='OoTR';
  $games[] = array_intersect_key($game, array_flip(['id', 'shortName', 'name', 'icon']));
  return $games;
}
