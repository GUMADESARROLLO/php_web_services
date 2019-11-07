<?php include("includes/connection.php");
 	  include("includes/function.php");
 	  include("smtp_email.php");  	
	
	   //$file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';

        $file_path = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") ? "https" : "http");
        $file_path .= "://".$_SERVER['HTTP_HOST'];
        $file_path .= str_replace(basename($_SERVER['SCRIPT_NAME']),"",$_SERVER['SCRIPT_NAME']);

	  // if($settings_details['envato_buyer_name']=='' OR $settings_details['envato_purchase_code']=='' OR $settings_details['envato_purchased_status']==0) {
    if(isset($_GET['init'])){
		//$set['NEWS_APP'] = array('msg' => 'Purchase code verification failed!' );
           $set=array();
           for($i=0;$i<1;$i++){
               $set['NEWS_APP'][$i]['success']                  = 'Purchase code verification failed!';
               $set['NEWS_APP'][$i]['package_name']             = 'com.viaviapp.newsapps';
               $set['NEWS_APP'][$i]['app_developed_by']         = '';
               $set['NEWS_APP'][$i]['banner_ad_id']             = '';
               $set['NEWS_APP'][$i]['interstital_ad_id']        = '';
               $set['NEWS_APP'][$i]['banner_ad']                = '';
               $set['NEWS_APP'][$i]['interstital_ad']           = '';
               $set['NEWS_APP'][$i]['publisher_id']             = '';
               $set['NEWS_APP'][$i]['interstital_ad_click']     = '';


           }
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));

	    }else if(isset($_GET['home']))
	   {
	  
 		
 		$jsonObj4= array();	

		$query_all="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.featured='1' AND tbl_news.status='1' ORDER BY id DESC";

		$sql_all = mysqli_query($mysqli,$query_all)or die(mysqli_error());

		while($data_all = mysqli_fetch_assoc($sql_all))
		{
			$row3['id'] = $data_all['id'];
			$row3['cat_id'] = $data_all['cat_id'];
			$row3['news_type'] = $data_all['news_type'];
			$row3['news_title'] = $data_all['news_title'];
			$row3['video_url'] = $data_all['video_url'];
			$row3['video_id'] = $data_all['video_id'];
			
			if($data_all['news_type']=='image')
			{
				$row3['news_image_b'] = $file_path.'images/'.$data_all['news_image'];
				$row3['news_image_s'] = $file_path.'images/thumbs/'.$data_all['news_image'];
			}
			else
			{
				$row3['news_image_b'] = $data_all['news_image'];
				$row3['news_image_s'] = $data_all['news_image'];
			}
 
 			$row3['news_description'] = $data_all['news_description'];
 			$row3['news_date'] = date('m/d/Y',$data_all['news_date']);
 			$row3['news_views'] = $data_all['news_views'];


			$row3['cid'] = $data_all['cid'];
			$row3['category_name'] = $data_all['category_name'];			 
			$row3['category_image'] = $file_path.'images/'.$data_all['category_image'];
			$row3['category_image_thumb'] = $file_path.'images/thumbs/'.$data_all['category_image'];
	     
		  array_push($jsonObj4,$row3);

		}
		$row['featured_news']=$jsonObj4;
		
	    $jsonObj2= array(); 
	 
	    $query2="SELECT * FROM tbl_news
			LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
			WHERE tbl_news.status=1 ORDER BY tbl_news.id DESC LIMIT 10";
			
      $sql2 = mysqli_query($mysqli,$query2)or die(mysqli_error());

	    while($data2 = mysqli_fetch_assoc($sql2))
	    { 
		    $row2['id'] = $data2['id'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['news_type'] = $data2['news_type'];
			$row2['news_title'] = $data2['news_title'];
			$row2['video_url'] = $data2['video_url'];
			$row2['video_id'] = $data2['video_id'];
			
			if($data2['news_type']=='image')
			{
				$row2['news_image_b'] = $file_path.'images/'.$data2['news_image'];
				$row2['news_image_s'] = $file_path.'images/thumbs/'.$data2['news_image'];
			}
			else
			{
				$row2['news_image_b'] = $data2['news_image'];
				$row2['news_image_s'] = $data2['news_image'];
			}
 
 			$row2['news_description'] = $data2['news_description'];
 			$row2['news_date'] = date('m/d/Y',$data2['news_date']);
 			$row2['news_views'] = $data2['news_views'];


			$row2['cid'] = $data2['cid'];
			$row2['category_name'] = $data2['category_name'];
 			$row2['category_image'] = $file_path.'images/'.$data2['category_image'];
			$row2['category_image_thumb'] = $file_path.'images/thumbs/'.$data2['category_image'];

						 
	      array_push($jsonObj2,$row2);
	    
	    } 
	      $row['top_10_news'] = $jsonObj2;
		  
		   $jsonObj1= array();	
 		
	     $query1="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.status='1' ORDER BY tbl_news.id DESC LIMIT 10";

		$sql1 = mysqli_query($mysqli,$query1)or die(mysqli_error());

		while($data1 = mysqli_fetch_assoc($sql1))
		{
			$row1['id'] = $data1['id'];
			$row1['cat_id'] = $data1['cat_id'];
			$row1['news_type'] = $data1['news_type'];
			$row1['news_title'] = $data1['news_title'];
			$row1['video_url'] = $data1['video_url'];
			$row1['video_id'] = $data1['video_id'];
			
			if($data1['news_type']=='image')
			{
				$row1['news_image_b'] = $file_path.'images/'.$data1['news_image'];
				$row1['news_image_s'] = $file_path.'images/thumbs/'.$data1['news_image'];
			}
			else
			{
				$row1['news_image_b'] = $data1['news_image'];
				$row1['news_image_s'] = $data1['news_image'];
			}
 
 			$row1['news_description'] = $data1['news_description'];
 			$row1['news_date'] = date('m/d/Y',$data1['news_date']);
 			$row1['news_views'] = $data1['news_views'];


			$row1['cid'] = $data1['cid'];
			$row1['category_name'] = $data1['category_name'];
 			$row1['category_image'] = $file_path.'images/'.$data1['category_image'];
			$row1['category_image_thumb'] = $file_path.'images/thumbs/'.$data1['category_image'];

			
		array_push($jsonObj1,$row1);
		}
		
		$row['latest_news']=$jsonObj1;
		 
		 $jsonObj3= array();
		
		$cat_order=API_CAT_ORDER_BY;


		$query4="SELECT * FROM tbl_category ORDER BY tbl_category.".$cat_order." DESC LIMIT 3";
		
		$sql4 = mysqli_query($mysqli,$query4)or die(mysqli_error());

		while($data4 = mysqli_fetch_assoc($sql4))
		{
			
			$row4['cid'] = $data4['cid'];
			$row4['category_name'] = $data4['category_name'];
  			$row4['category_image'] = $file_path.'images/'.$data4['category_image'];
		    $row4['category_image_thumb'] = $file_path.'images/thumbs/'.$data4['category_image']; 

			array_push($jsonObj3,$row4);
		
		   }
         $row['category_list'] = $jsonObj3;

	     $set['NEWS_APP'] = $row;

	      header( 'Content-Type: application/json; charset=utf-8' );
	      echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	      die();
    
    }
    else if(isset($_GET['cat_list']))
 	{
 		$jsonObj= array();
		
		$cat_order=API_CAT_ORDER_BY;


		$query="SELECT cid,category_name,category_image FROM tbl_category ORDER BY tbl_category.".$cat_order."";
		$sql = mysqli_query($mysqli,$query)or die(mysql_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			 

			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
 			$row['category_image'] = $file_path.'images/'.$data['category_image'];
		    $row['category_image_thumb'] = $file_path.'images/thumbs/'.$data['category_image']; 
			 
			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 	}
	else if(isset($_GET['cat_id']))
	{
		$post_order_by=API_CAT_POST_ORDER_BY;

		$cat_id=$_GET['cat_id'];	

		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		where tbl_news.cat_id='".$cat_id."' AND tbl_news.status='1' ORDER BY tbl_news.id ".$post_order_by."";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['cat_id'] = $data['cat_id'];
			$row['news_type'] = $data['news_type'];
			$row['news_title'] = $data['news_title'];
			$row['video_url'] = $data['video_url'];
			$row['video_id'] = $data['video_id'];
			
			if($data['news_type']=='image')
			{
				$row['news_image_b'] = $file_path.'images/'.$data['news_image'];
				$row['news_image_s'] = $file_path.'images/thumbs/'.$data['news_image'];
			}
			else
			{
				$row['news_image_b'] = $data['news_image'];
				$row['news_image_s'] = $data['news_image'];
			}
 
 			$row['news_description'] = $data['news_description'];
 			$row['news_date'] = date('m/d/Y',$data['news_date']);
 			$row['news_views'] = $data['news_views'];


			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];
		    $row['category_image_thumb'] = $file_path.'images/thumbs/'.$data['category_image']; 
			 

			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

		
	}
	else if(isset($_GET['most_view_news']))
	{
		//$limit=$_GET['latest'];	
 
		$jsonObj= array();	
 
 
		$query="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.status='1' AND tbl_news.news_views > 0 ORDER BY tbl_news.news_views DESC";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['cat_id'] = $data['cat_id'];
			$row['news_type'] = $data['news_type'];
			$row['news_title'] = $data['news_title'];
			$row['video_url'] = $data['video_url'];
			$row['video_id'] = $data['video_id'];
			
			if($data['news_type']=='image')
			{
				$row['news_image_b'] = $file_path.'images/'.$data['news_image'];
				$row['news_image_s'] = $file_path.'images/thumbs/'.$data['news_image'];
			}
			else
			{
				$row['news_image_b'] = $data['news_image'];
				$row['news_image_s'] = $data['news_image'];
			}
 
 			$row['news_description'] = $data['news_description'];
 			$row['news_date'] = date('m/d/Y',$data['news_date']);
 			$row['news_views'] = $data['news_views'];


			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];
		    $row['category_image_thumb'] = $file_path.'images/thumbs/'.$data['category_image']; 
			 

			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}	 
	else if(isset($_GET['latest']))
	{
		//$limit=$_GET['latest'];	 

		$limit=API_LATEST_LIMIT;

		$jsonObj= array();	
 
 
		$query="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.status='1' ORDER BY tbl_news.id DESC LIMIT $limit";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['cat_id'] = $data['cat_id'];
			$row['news_type'] = $data['news_type'];
			$row['news_title'] = $data['news_title'];
			$row['video_url'] = $data['video_url'];
			$row['video_id'] = $data['video_id'];
			
			if($data['news_type']=='image')
			{
				$row['news_image_b'] = $file_path.'images/'.$data['news_image'];
				$row['news_image_s'] = $file_path.'images/thumbs/'.$data['news_image'];
			}
			else
			{
				$row['news_image_b'] = $data['news_image'];
				$row['news_image_s'] = $data['news_image'];
			}
 
 			$row['news_description'] = $data['news_description'];
 			$row['news_date'] = date('m/d/Y',$data['news_date']);
 			$row['news_views'] = $data['news_views'];


			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];
		    $row['category_image_thumb'] = $file_path.'images/thumbs/'.$data['category_image']; 
			 

			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	else if(isset($_GET['search']))
	{
		//$limit=$_GET['latest'];	 

 
		$jsonObj= array();	
 
 
		$query="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.status='1' AND tbl_news.news_title LIKE '%".$_GET['search']."%' ORDER BY tbl_news.news_title DESC";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['cat_id'] = $data['cat_id'];
			$row['news_type'] = $data['news_type'];
			$row['news_title'] = $data['news_title'];
			$row['video_url'] = $data['video_url'];
			$row['video_id'] = $data['video_id'];
			
			if($data['news_type']=='image')
			{
				$row['news_image_b'] = $file_path.'images/'.$data['news_image'];
				$row['news_image_s'] = $file_path.'images/thumbs/'.$data['news_image'];
			}
			else
			{
				$row['news_image_b'] = $data['news_image'];
				$row['news_image_s'] = $data['news_image'];
			}
 
 			$row['news_description'] = $data['news_description'];
 			$row['news_date'] = date('m/d/Y',$data['news_date']);
 			$row['news_views'] = $data['news_views'];


			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];
		    $row['category_image_thumb'] = $file_path.'images/thumbs/'.$data['category_image']; 
			 

			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	
	
	else if(isset($_GET['news_id']))
	{
		  
				 
		$jsonObj= array();	

		$query="SELECT * FROM tbl_news
		LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid 
		WHERE tbl_news.status='1' AND tbl_news.id='".$_GET['news_id']."'";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
		    
			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			 
			$row['id'] = $data['id'];
			$row['cat_id'] = $data['cat_id'];
			$row['news_type'] = $data['news_type'];
			$row['news_title'] = $data['news_title'];
			$row['video_url'] = $data['video_url'];
			$row['video_id'] = $data['video_id'];
			
			if($data['news_type']=='image')
			{
				$row['news_image_b'] = $file_path.'images/'.$data['news_image'];
				$row['news_image_s'] = $file_path.'images/thumbs/'.$data['news_image'];
			}
			else
			{
				$row['news_image_b'] = $data['news_image'];
				$row['news_image_s'] = $data['news_image'];
			}
 
 			$row['news_description'] = $data['news_description'];
 			$row['news_date'] = date('m/d/Y',$data['news_date']);
 			$row['news_views'] = $data['news_views'];

 			//Gallery Images
		      $qry1="SELECT * FROM tbl_news_gallery where news_id='".$_GET['news_id']."'";
		      $result1=mysqli_query($mysqli,$qry1); 

		      if($result1->num_rows > 0)
		      {
		      		while ($row_img=mysqli_fetch_array($result1)) {
 		      	
		 		      	$row1['image_name'] = $file_path.'images/'.$row_img['news_gallery_image'];

		 		      	$row['galley_image'][]= $row1;
				      }
		     
		      }
		      else
		      {	
		      		 
		      		$row['galley_image'][]= '';
		      }
 			

			 //Related News
			$query_2="SELECT * FROM tbl_news
			LEFT JOIN tbl_category ON tbl_news.cat_id= tbl_category.cid
			WHERE tbl_news.cat_id='".$data['cat_id']."' AND tbl_news.status='1' AND tbl_news.id!='".$data['id']."'";

			$sql2 = mysqli_query($mysqli,$query_2)or die(mysqli_error());
 			
 			while($data_2 = mysqli_fetch_assoc($sql2))
			{
				$row2['cid'] = $data_2['cid'];
			    $row2['category_name'] = $data_2['category_name'];
			 
			$row2['id'] = $data_2['id'];
			$row2['cat_id'] = $data_2['cat_id'];
			$row2['news_type'] = $data_2['news_type'];
			$row2['news_title'] = $data_2['news_title'];
			$row2['video_url'] = $data_2['video_url'];
			$row2['video_id'] = $data_2['video_id'];
			
			if($data['news_type']=='image')
			{
				$row2['news_image_b'] = $file_path.'images/'.$data_2['news_image'];
				$row2['news_image_s'] = $file_path.'images/thumbs/'.$data_2['news_image'];
			}
			else
			{
				$row2['news_image_b'] = $data_2['news_image'];
				$row2['news_image_s'] = $data_2['news_image'];
			}
 
 			$row2['news_description'] = $data_2['news_description'];
 			$row2['news_date'] = date('m/d/Y',$data_2['news_date']);
 			$row2['news_views'] = $data_2['news_views'];

				$related_data[]=$row2;

			}
			
			$row['related_news']=$related_data;


			//Comments
		      $qry3="SELECT * FROM tbl_comment where news_id='".$_GET['news_id']."'";
		      $result3=mysqli_query($mysqli,$qry3); 

		      if($result3->num_rows > 0)
		      {
		      		while ($row_comments=mysqli_fetch_array($result3)) {
 		      	
		 		      	$row3['news_id'] = $row_comments['news_id'];
 		 		      	$row3['user_name'] = $row_comments['user_name'];
		 		      	$row3['comment_text'] = $row_comments['comment_text'];
                        $row3['comment_date'] = $row_comments['dt_rate'];

		 		      	$row['user_comments'][]= $row3;
				      }
		     
		      }
		      else
		      {	
		       $row['user_comments'][]= '';
		      }
			  
			array_push($jsonObj,$row);
		
		}

		$view_qry=mysqli_query($mysqli,"update tbl_news set news_views=news_views+1 where id='".$_GET['news_id']."'");

 

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
 

	}	
	 else if(isset($_GET['user_register']))

	{
	
		$qry = "SELECT * FROM tbl_users WHERE email = '".$_GET['email']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);
		
		if (!filter_var($_GET['email'], FILTER_VALIDATE_EMAIL)) 
		{
			$set['NEWS_APP'][]=array('msg' => "Invalid email format!",'success'=>'0');
		}
		else if($row['email']!="")
		{
			$set['NEWS_APP'][]=array('msg' => "Email address already used!",'success'=>'0');
		}
		else
		{ 
 				$data = array(
				    'name'  => $_GET['name'],				    
					'email'  =>  $_GET['email'],
					'password'  =>  $_GET['password'],
					'phone'  =>  $_GET['phone'], 
					);		
 			 

			$qry = Insert('tbl_users',$data);									 
					 
				
			$set['NEWS_APP'][]=array('msg' => "Register successflly...!",'success'=>'1');
					
		}

	  
				 
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	
	
	}
	else if(isset($_GET['users_login']))
	{
		
	    $email = $_GET['email'];
 		$password = $_GET['password'];

	    $qry = "SELECT * FROM tbl_users WHERE  email = '".$email."' and password = '".$password."'";
	    $result = mysqli_query($mysqli,$qry);
		$num_rows = mysqli_num_rows($result);
 		$row = mysqli_fetch_assoc($result);

		
    if ($num_rows > 0)
		{ 
				if($row['status']==0)
				{
					$set['NEWS_APP'][]=array('msg' =>'Your account blocked!','success'=>'0');
				}	
				else
				{
					$set['NEWS_APP'][]=array('user_id' => $row['id'],'name'=>$row['name'],'email'=>$row['email'],'success'=>'1');
				} 
			     
 			 
		}		 
		else
		{
				 
 				$set['NEWS_APP'][]=array('msg' =>'Login failed','success'=>'0');
 		}


	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	
	}
	else if(isset($_GET['user_profile']))
	{
		
		$qry = "SELECT * FROM tbl_users WHERE id = '".$_GET['id']."'"; 
		$result = mysqli_query($mysqli,$qry);
		 
		$row = mysqli_fetch_assoc($result);
	  				 
	    $set['NEWS_APP'][]=array('user_id' => $row['id'],'name'=>$row['name'],'email'=>$row['email'],'phone'=>$row['phone'],'success'=>'1');


	

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	
	}
	else if(isset($_GET['user_profile_update']))
	{
		if($_GET['password']!="")
		{
			$user_edit= "UPDATE tbl_users SET name='".$_GET['name']."',email='".$_GET['email']."',password='".$_GET['password']."',phone='".$_GET['phone']."' WHERE id = '".$_GET['user_id']."'";	 
		}
		else
		{
			$user_edit= "UPDATE tbl_users SET name='".$_GET['name']."',email='".$_GET['email']."',phone='".$_GET['phone']."' WHERE id = '".$_GET['user_id']."'";	 
		}
   		
   		$user_res = mysqli_query($mysqli,$user_edit);	
	  				 
		$set['NEWS_APP'][]=array('msg'=>'Updated','success'=>'1');

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	
	}
	
	else if(isset($_GET['forgot_pass']))
	{
		$host = $_SERVER['HTTP_HOST'];
		preg_match("/[^\.\/]+\.[^\.\/]+$/", $host, $matches);
        $domain_name=$matches[0];
         
	 	 
		$qry = "SELECT * FROM tbl_users WHERE email = '".$_GET['email']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);

		if($row['email']!="")
		{
 
			$to = $_GET['email'];
			$recipient_name=$row['name'];
			// subject
			$subject = '[IMPORTANT] '.APP_NAME.' Forgot Password Information';
 			
			$message='<div style="background-color: #f9f9f9;" align="center"><br />
					  <table style="font-family: OpenSans,sans-serif; color: #666666;" border="0" width="600" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
					    <tbody>
					      <tr>
					        <td colspan="2" bgcolor="#FFFFFF" align="center"><img src="http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/images/'.APP_LOGO.'" alt="header" /></td>
					      </tr>
					      <tr>
					        <td width="600" valign="top" bgcolor="#FFFFFF"><br>
					          <table style="font-family:OpenSans,sans-serif; color: #666666; font-size: 10px; padding: 15px;" border="0" width="100%" cellspacing="0" cellpadding="0" align="left">
					            <tbody>
					              <tr>
					                <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0" style="font-family:OpenSans,sans-serif; color: #666666; font-size: 10px; width:100%;">
					                    <tbody>
					                      <tr>
					                        <td><p style="color: #262626; font-size: 28px; margin-top:0px;"><strong>Dear '.$row['name'].'</strong></p>
					                          <p style="color:#262626; font-size:20px; line-height:32px;font-weight:500;">Thank you for using '.APP_NAME.',<br>
					                            Your password is: '.$row['password'].'</p>
					                          <p style="color:#262626; font-size:20px; line-height:32px;font-weight:500;margin-bottom:30px;">Thanks you,<br />
					                            '.APP_NAME.'.</p></td>
					                      </tr>
					                    </tbody>
					                  </table></td>
					              </tr>
					               
					            </tbody>
					          </table></td>
					      </tr>
					      <tr>
					        <td style="color: #262626; padding: 20px 0; font-size: 20px; border-top:5px solid #52bfd3;" colspan="2" align="center" bgcolor="#ffffff">Copyright © '.APP_NAME.'.</td>
					      </tr>
					    </tbody>
					  </table>
					</div>';

			send_email($to,$recipient_name,$subject,$message);
 
			  
			$set['NEWS_APP'][]=array('msg' => "Password has been sent on your mail!",'success'=>'1');
		}
		else
		{  	 
				
			$set['NEWS_APP'][]=array('msg' => "Email not found in our database!",'success'=>'0');
					
		}

	
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
	}  	   	 
	else 
	{
		$jsonObj= array();	

		$query="SELECT * FROM tbl_settings WHERE id='1'";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['package_name'] = $data['package_name']; 
			$row['ios_bundle_identifier'] = $data['ios_bundle_identifier']; 
			$row['app_name'] = $data['app_name'];
			$row['app_logo'] = $data['app_logo'];
			$row['app_version'] = $data['app_version'];
			$row['app_author'] = $data['app_author'];
			$row['app_contact'] = $data['app_contact'];
			$row['app_email'] = $data['app_email'];
			$row['app_website'] = $data['app_website'];
			$row['app_description'] = $data['app_description'];
 			$row['app_developed_by'] = $data['app_developed_by'];

			$row['app_privacy_policy'] = stripslashes($data['app_privacy_policy']);
			
			$row['publisher_id'] = $data['publisher_id'];
			$row['interstital_ad'] = $data['interstital_ad'];
			$row['interstital_ad_id'] = $data['interstital_ad_id'];
			$row['interstital_ad_click'] = $data['interstital_ad_click'];
 			$row['banner_ad'] = $data['banner_ad'];
 			$row['banner_ad_id'] = $data['banner_ad_id'];
			
			$row['publisher_id_ios'] = $data['publisher_id_ios'];
 			$row['app_id_ios'] = $data['app_id_ios'];
			$row['interstital_ad_ios'] = $data['interstital_ad_ios'];
			$row['interstital_ad_id_ios'] = $data['interstital_ad_id_ios'];
			$row['interstital_ad_click_ios'] = $data['interstital_ad_click_ios'];
 			$row['banner_ad_ios'] = $data['banner_ad_ios'];
 			$row['banner_ad_id_ios'] = $data['banner_ad_id_ios'];

			array_push($jsonObj,$row);
		
		}

		$set['NEWS_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
	}		
	 
	 
?>