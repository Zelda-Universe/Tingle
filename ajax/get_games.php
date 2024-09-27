<?php
  $path = __DIR__;

  $query = "
    SELECT c.id
      , c.short_name as shortName
      , c.name
      , c.icon
    FROM ${map_prefix}container c
    WHERE
        c.visible = 1
    AND c.enabled = 1
    ORDER BY c.id
  ;";
  //echo $query;

  $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

  $res = array();

  while ($row = $result->fetch_assoc()) {
    array_push($res, $row);
  }
  echo json_encode($res);
?>
