<?php
// Read-only asset preview. Existing database-backed games are unchanged.
function ootPackData($kind) {
  if (!in_array($kind, ['container', 'maps', 'categories', 'markers', 'import-report'], true)) return null;
  $file = dirname(__DIR__, 2) . '/data/OoT/' . $kind . '.json';
  if (!is_file($file)) return null;
  return json_decode(file_get_contents($file), true, 512, JSON_THROW_ON_ERROR);
}
function ootPackIsGame($value) {
  return in_array((string) $value, ['OoT', '64'], true) && ootPackData('container') !== null;
}
function ootPackAppendGame($games) {
  $container = ootPackData('container');
  if (!$container) return $games;
  foreach ($games as $game) if (($game['shortName'] ?? '') === 'OoT') return $games;
  $game = $container[0];
  $games[] = array_intersect_key($game, array_flip(['id', 'shortName', 'name', 'icon']));
  return $games;
}
