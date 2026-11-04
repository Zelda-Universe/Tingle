<?php
  // The order games are listed in, most played first. Games not listed here
  // follow, by id. Matches GAME_ORDER in scripts/util/general.js.
  const GAME_ORDER = ['TotK', 'BotW', 'EoW', 'LA'];

  // An ORDER BY clause for a container's short name column.
  function gameOrderSql($column) {
    $names = implode(', ', array_map(function($name) { return "'" . $name . "'"; }, GAME_ORDER));
    return "FIELD($column, $names) = 0, FIELD($column, $names)";
  }
?>
