<?php
  // The order games are listed in, most played first. Games not listed here
  // follow, by id. Matches GAME_ORDER in scripts/util/general.js.
  const GAME_ORDER = ['OoT', 'TotK', 'BotW', 'EoW', 'LA'];

  // An ORDER BY clause for a container's short name column.
  // Whether a game id or short name is the Ocarina of Time remake: OoTR in
  // the database, OoT in offline downloads and older links, or its id, 64.
  // (Container 5, short name OoT, is the old N64 map; it stays hidden.)
  // Matches isOcarina() in scripts/util/general.js.
  function isOcarina($value) {
    return in_array(strtolower((string) $value), ['oot', 'ootr', '64'], true);
  }

  // OoT's database short name is OoTR (OoT is the old N64 map), so both
  // sort in OoT's place, as isOcarina() does in the browser.
  function gameOrderSql($column) {
    $order = [];
    foreach (GAME_ORDER as $name) {
      $order[] = $name;
      if ($name === 'OoT') $order[] = 'OoTR';
    }
    $names = implode(', ', array_map(function($name) { return "'" . $name . "'"; }, $order));
    return "FIELD($column, $names) = 0, FIELD($column, $names)";
  }
?>
