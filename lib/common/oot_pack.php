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
    // Hyrule first (the first map is the default), then the dungeons in the
    // order they're played. Map IDs stay as imported: links and markers use them.
    $playOrder = [
      '65000', // Hyrule
      '64028', // Inside the Deku Tree
      '64023', // Dodongo's Cavern
      '64027', // Inside Jabu-Jabu's Belly
      '64025', // Forest Temple
      '64024', // Fire Temple
      '64026', // Ice Cavern
      '64031', // Water Temple
      '64022', // Bottom of the Well
      '64029', // Shadow Temple
      '64030', // Spirit Temple
    ];
    $rank = function($map) use ($playOrder) {
      $index = array_search((string) $map['id'], $playOrder, true);
      return $index === false ? count($playOrder) : $index;
    };
    usort($data, function($a, $b) use ($rank) {
      return $rank($a) <=> $rank($b) ?: strcmp((string) $a['id'], (string) $b['id']);
    });
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
