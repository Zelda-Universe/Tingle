<?php
  $path = __DIR__;
   
  if (!isset($_GET["game"]) || empty($_GET["game"])) {
    echo json_encode(array(
      "success" => false,
      "msg"     => "Must provide the game parameter with an integer!"
    ));
    return;
  }

  if (file_exists("$path/ajax/static/categories_{$_GET["game"]}.json")) {
	  readfile("$path/ajax/static/categories_{$_GET["game"]}.json");
	  return;
  }

  $map = $_GET["game"];

	$query = "
    SELECT *
    FROM `{$map_prefix}marker_category`
    WHERE `container_id` = '$map'
    ORDER BY
      `parent_id` ASC,
      `id` ASC
    ;
  ";
  //echo $query;
  $result = @$mysqli->query($query);

	if(!$result) {
		print($mysqli->error);
		return;
	}

  $res = array();
  while($row = $result->fetch_assoc()) {
    $booleanFieldNames = [
      'default_checked',
      'visible'
    ];
    foreach($booleanFieldNames as $booleanFieldName) {
      if($row[$booleanFieldName] == '1') {
        $row[$booleanFieldName] = true  ;
      } else {
        $row[$booleanFieldName] = false ;
      }
    }
    $res[] = $row;
  }
  echo json_encode($res);
?>
