<?php
  // debug_log("get_container_name START");

  $path = __DIR__;

   if (file_exists("$path/ajax/static/container_name_" . $_GET["game"] . ".json")) {
	   readfile("$path/ajax/static/container_name_" . $_GET["game"] . ".json");
	   return;
   }
   

	if(empty($_GET["game"])) {
    print(json_encode(array(
      "success" => false,
      "result"  => 'No game parameter given.'
    )));

		return 1;
  } else {
    $game = $_GET["game"];
    // debug_log("game: $game");
	}

  $query = "
    SELECT `name`
    FROM `${map_prefix}container` `c`
    WHERE (
            `c`.`id`          = '$game'
        OR  `c`.`short_name`  = '$game'
      ) AND `c`.`visible`     = '1'
    ;
  ";
  // debug_log("query: $query");

  $result = @$mysqli->query($query);
  // debug_log('mysqli info: '.@$mysqli->info); // Not helpful..

	if(!$result) {
		print($mysqli->error);
		return 2;
	}

  $row = $result->fetch_array();
  // debug_log("empty(row): ".empty($row));
  // debug_log("row: ".var_export($row, 1));
  // debug_log("row num_rows: ${$row->num_rows}");
  if(empty($row)) {
    print(json_encode(array(
      "success" => false,
      "result"  => 'No visible game container found.'
    )));

    return 3;
  }

  print(json_encode(array(
    "success" => true,
    "name"    => $row['name']
  )));

  // debug_log("get_container_name END");
?>
