<?php
   use Doctrine\DBAL\Exception\UniqueConstraintViolationException;

   $path = __DIR__;

   if (!isset($_POST['user']) || !isset($_POST['password']) || !isset($_POST['name']) || !isset($_POST['email'])) {
     echo json_encode(array("success"=>false, "msg"=>"Must fill all the form fields"));
     return;
   }

   $username = trim((string) $_POST['user']);
   if (!preg_match('/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/D', $username)) {
     echo json_encode(array('success' => false, 'msg' => 'Use 3–45 letters, numbers, periods, underscores, or hyphens.'));
     return;
   }
   $name     = (string) $_POST['name'];
   $email    = (string) $_POST['email'];
   $ip       = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));
   $hash     = password_hash((string) $_POST['password'], PASSWORD_DEFAULT, ['cost' => 13]);

   try {
     $db->executeStatement("
       INSERT INTO {$map_prefix}user (
           username
         , password
         , name
         , email
         , created
         , ip
         , last_login
         , level
         , visible
       ) VALUES (?, ?, ?, ?, now(), ?, now(), 1, 1)
     ", [$username, $hash, $name, $email, $ip]);
   } catch (UniqueConstraintViolationException $e) {
     // username and email are both unique keys.
     echo json_encode(array("success"=>false, "msg"=>"User already exists!"));
     return;
   }

   echo json_encode(array("success"=>true, "msg"=>"Success! User created!"));
?>
