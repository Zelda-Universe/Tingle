<?php
	include('../config.php');
	
	session_start("zmap");
	begin();
	
   if (!is_numeric($_POST['categoryId'])
         && !is_numeric($_POST['game'])
         && !is_numeric($_POST['lat'])
         && !is_numeric($_POST['lng'])
         && !is_numeric($_POST['userId'])
         && !is_numeric($_POST['submapId']) )
   {
		echo json_encode(array("success"=>false, "msg"=>"Not logged!"));
		exit();
	}
   
	if ($_SESSION['user_id'] != $_POST['userId']) {
		echo json_encode(array("success"=>false, "msg"=>"Not logged!"));
		exit();	
	}
	
   //----------------------------------------------------------//
   if (!isset($_POST['markerId'])) {
      $query = "insert into " . $map_prefix . "marker (
                                          id
                                        , submap_id
                                        , marker_status_id
                                        , marker_category_id
                                        , user_id
                                        , name
                                        , description
                                        , x
                                        , y
                                        , global
                                        , visible
                                        , last_updated
                                  ) VALUES (
                                          null
                                        , ".$_POST['submapId']."
                                        , 2
                                        , ".$_POST['categoryId']."
                                        , ".$_POST['userId']."
                                        , '" . addslashes(htmlentities(stripslashes($_POST['markerTitle']), ENT_QUOTES, "UTF-8")) . "'
                                        , '" . addslashes(htmlentities(stripslashes($_POST['markerDescription']), ENT_QUOTES, "UTF-8")) . "'
                                        , ".$_POST['lng']."
                                        , ".$_POST['lat']."
                                        , " . (isset($_POST['isGlobal'])?1:0) . "
                                        , 1
                                        , now()                                     
                                  )";
   } else {
      $query = "update " . $map_prefix . "marker 
                   set submap_id = ".$_POST['submapId']."
                     , marker_category_id = ".$_POST['categoryId']."
                     , name = '" . addslashes(htmlentities(stripslashes($_POST['markerTitle']), ENT_QUOTES, "UTF-8")) . "'
                     , description = '" . addslashes(htmlentities(stripslashes($_POST['markerDescription']), ENT_QUOTES, "UTF-8")) . "'
                     , x = ".$_POST['lng']."
                     , y = ".$_POST['lat']."
                     , global = " . (isset($_POST['isGlobal'])?1:0) . "
                     , last_updated = now()                                     
                 where id = " . $_POST['markerId'];
   }

	//echo $query;
   $result = @mysql_query($query); // or die(mysql_error());
   $num = mysql_affected_rows();
   
   if ($result) {
      if (!isset($_POST['markerId'])) {
         $marker_id = mysql_insert_id();
      } else {
         $marker_id = $_POST['markerId'];
         
         $query = "update " . $map_prefix . "marker_tab set visible = 0 where visible = 1 and marker_id = " . $marker_id;
         //echo $query;
			$result = @mysql_query($query); // or die(mysql_error());
      }
      
    	for ($i = 0; $i < sizeof($_POST['tabText']); $i++) {
				if (/*!isset($_POST['tabTitle'][$i]) || */!isset($_POST['tabText'][$i])) {
					continue;
				} else if (/*$_POST['tabTitle'][$i] == "" || */$_POST['tabText'][$i] == "") {
               continue;
            } else {
					$tab_id = "null";
					$tab_text = $_POST['tabText'][$i];
               
               $tab_text = preg_replace('/<p>\\s*?(<a .*?><img.*?><\\/a>|<img.*?>)?\\s*<\\/p>/s', '\1', $tab_text);
               //$tab_text = str_replace('100%px', '100%', $tab_text);
                  
				}
			
			
			//----------------------------------------------------------//
			$query = "insert into " . $map_prefix . "marker_tab (
											   marker_id
											 , marker_tab_id
											 , marker_tab_status_id
											 , user_id
											 , tab_title
											 , tab_text
											 , tab_order
											 , visible)
									   VALUES (
											   ".$marker_id."
											 , ".$tab_id."
											 , 1
											 , ".$_POST['userId']."
											 , ''
											 , '" . addslashes(htmlentities(stripslashes($tab_text), ENT_QUOTES, "UTF-8")) . "'
											 , 1
											 , 1)";	
			//echo $query;
			$result = @mysql_query($query); // or die(mysql_error());
			$num = mysql_affected_rows();										 
			
			if (!$result) {
				break;
			}
    	}
		if ($result) {
			//echo json_encode(array("success"=>true, "msg"=>"Marker inserted!", "markerId"=>$marker_id));
         //@TODO: IMPROVE THIS TO GET FROM PHP FILE
         commit();
         $_GET['newMarkerId'] = $marker_id;
         $_GET['game'] = $_POST['game'];
         
         ob_start();
         include('get_markers.php');		
         $output = ob_get_clean();
         
         echo json_encode(array("success"=>true, "action"=>(!isset($_POST['markerId'])?"ADD":"UPDATE"), "marker"=>$output));
		} else {
			echo json_encode(array("success"=>false, "msg"=>mysql_error()));
			rollback();
		}
    } else {
        echo json_encode(array("success"=>false, "msg"=>mysql_error()));
		rollback();
    }
	
	
   commit();
?>