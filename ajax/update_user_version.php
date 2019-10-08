<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	start_session("zmap");
	begin();

	if (!isset($_POST['userId']) || !isset($_POST['version'])) {
		echo json_encode(array("success"=>false, "msg"=>"Ops, something went wrong..."));
		return;
	}
   $userId = $_POST['userId'];
   $version = explode(".", $_POST['version'], 3);

  $query = "
    UPDATE `{$map_prefix}user`
       set `seen_version_major` = '{$version[0]}'
         , `seen_version_minor` = '{$version[1]}'
         , `seen_version_patch` = '{$version[2]}'
     WHERE `id` = '{$userId}'
   ";
   //echo $query;
   $mysqli->query($query);
   commit();

   $_SESSION['v1'] = $version[0];
   $_SESSION['v2'] = $version[1];
   $_SESSION['v3'] = $version[2];
   $_SESSION['seen_latest_changelog'] = true;

   echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$userId));
   
?>
