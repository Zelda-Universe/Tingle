<?php
   $path = DIRNAME(__FILE__);
   include("$path/../config.php");

	begin();

	if (!isset($_POST['currentpassword']) || !isset($_POST['newpassword'])) {
		echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
		return;
	}

  start_session("zmap");
  $user_id = $_SESSION['user_id'];
  session_write_close();

  $currentpassword = $_POST['currentpassword'];

  $query = "SELECT `password` FROM `{$map_prefix}user` WHERE `id` = '$user_id'";
  $result = $mysqli->query($query);
  $row = $result->fetch_assoc();

  if($row) {
    if (isset($row['password']) && password_verify($currentpassword, $row['password'])) {
      $newpassword = $_POST['newpassword'];
      $hash = password_hash($newpassword, PASSWORD_DEFAULT, ['cost' => 13]);

      $query = "UPDATE `{$map_prefix}user` SET `password` = '$hash' WHERE `id` = '$user_id'";
      //echo $query;
      $result = $mysqli->query($query);

      if ($result) {
        commit();
        echo json_encode(array("success"=>true, "msg"=>"Password changed."));
    	} else {
        rollback();
        echo json_encode(array("success"=>false, "msg"=>"Password not changed."));
      }
    } else {
      echo json_encode(array("success"=>false, "msg"=>"Current password is not correct."));
    }
  } else {
    echo json_encode(array("success"=>false, "msg"=>"User not found! O_o"));
  }
?>
