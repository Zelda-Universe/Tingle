<?php
  $path = __DIR__;

	start_session("zmap");
	begin();

	if (!isset($_SESSION['user_id']) || !isset($_SESSION['username']) || !isset($_SESSION['level'])) {
		session_destroy();
		echo json_encode(array("success"=>false, "msg"=>"Session - Not Logged!"));
		return;
	};

	   {
         $query = "
            SELECT CONCAT(
              `version_major`, '.',
              `version_minor`, '.',
              `version_patch`
            ) AS `version`
            FROM changelog
            ORDER BY
              `version_major` DESC,
              `version_minor` DESC,
              `version_patch` DESC
            LIMIT 1;
         ";

         $result = @$mysqli->query($query);

         if(!$result) {
           print($mysqli->error);
           return;
         }

         $lastestVersion = '0.0.0';
         while($row = $result->fetch_assoc()) {
            $lastestVersion = $row['version'];
         }
//         echo $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
         if ($lastestVersion > $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3']) {
            $user['seen_version'] = '0.0.0';
            $_SESSION['v1'] = 0;
            $_SESSION['v2'] = 0;
            $_SESSION['v3'] = 0;
         } else {
            $user['seen_version'] = $_SESSION['v1'] . '.' . $_SESSION['v2'] . '.' . $_SESSION['v3'];
         }

         $user['id'] = $_SESSION['user_id'];
         $user['username'] = $_SESSION['username'];
         $user['level'] = $_SESSION['level'];
         $emailQuery = $mysqli->prepare("SELECT email FROM `{$map_prefix}user` WHERE id = ?");
         $emailQuery->bind_param('i', $user['id']);
         $emailQuery->execute();
         $emailQuery->bind_result($accountEmail);
         $emailQuery->fetch();
         $emailQuery->close();
         $user['email'] = $accountEmail;
         $profileQuery = "
           SELECT `profile_picture` AS `profilePicture`
           FROM `{$map_prefix}user`
           WHERE `id` = " . (int) $user['id'] . "
           LIMIT 1
         ";
         $user['profilePicture'] = null;
         $profileColumnResult = $mysqli->query(
           "SHOW COLUMNS FROM `{$map_prefix}user` LIKE 'profile_picture'"
         );
         if ($profileColumnResult && $profileColumnResult->num_rows > 0) {
           $profileResult = $mysqli->query($profileQuery);
           if ($profileResult && ($profileRow = $profileResult->fetch_assoc())) {
             $user['profilePicture'] = $profileRow['profilePicture'];
           }
         }
         if (!$user['profilePicture']) {
           $profileFiles = glob(
             dirname(__DIR__) . '/uploads/profile-pictures/' . (int) $user['id'] . '-*.webp'
           );
           if ($profileFiles) {
             usort($profileFiles, function($a, $b) {
               return filemtime($b) <=> filemtime($a);
             });
             $user['profilePicture'] = 'uploads/profile-pictures/' . basename($profileFiles[0]);
           }
         }
         session_write_close();
         $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));

         $uquery = "update " . $map_prefix . "user set ip = '" . $ip . "', last_login=now() where id = " . $user['id'];
         //echo $uquery;
         $mysqli->query($uquery);
         commit();

         echo json_encode(array("success"=>true, "msg"=>"Success!", "user"=>$user));
		}
?>
