<?php
   $path = DIRNAME(__FILE__);
   include_once("$path/../config.php");
	
	start_session("zmap");
	begin();
	
	if ($_SESSION['user_id'] != $_POST['userId']) {
      echo "<script>alert('Not logged!');</script>"; 
		echo json_encode(array("success"=>false, "msg"=>"Not logged!"));
		return;	
	}

   // If it`s an update
   if ($_SESSION['level'] < 5) {
      echo "<script>alert('You don`t have the proper permission to upload files!');</script>"; 
      echo json_encode(array("success"=>false, "msg"=>"You don`t have the proper permission to upload files!"));
      return;	
   }
   
   if (isset($_FILES)) {
      
      $image = $_FILES['image'];
      
      if($image['type'] == "image/png" || $image['type'] == "image/jpg" || $image['type'] == "image/jpeg" || $image['type'] == "image/gif" ) {
         $path = realpath(dirname(__FILE__)) . '/' . $_POST['game'] . '/';

         $tmpName = $image['tmp_name'];
         
         $name = str_replace(' ','-',$image['name']); 
         
         move_uploaded_file($tmpName, $path . '/'.$name); 
         
         $weburl = "http".(!empty($_SERVER['HTTPS'])?"s":"")."://".$_SERVER['SERVER_NAME'].str_replace('upload.php', '', $_SERVER['REQUEST_URI']).$_POST['game'] . '/'.$name; 
         
         echo "<script>top.$('.mce-btn.mce-open').parent().find('.mce-textbox').val('". $weburl ."');</script>"; 
         //echo "<script>top.$('.mce-btn.mce-open').parent().find('.mce-textbox').val('". $weburl ."').closest('.mce-window').find('.mce-primary').click();</script>"; 
      } else {
         echo "<script>alert('Please upload a valid image!');</script>"; 
      }
   }
?>