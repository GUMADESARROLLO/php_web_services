<?php include("includes/connection.php"); 
	include('includes/function.php');


		$data = array(
  	    'news_id'  => $_GET['news_id'],
 	    'user_name'  => $_GET['user_name'],
		'comment_text'  =>  $_GET['comment_text']
		);		
 		
		$qry = Insert('tbl_comment',$data);									 
					 
		$set['NEWS_APP'][]=array('msg' => "Comment post successflly...!",'success'=>'1');
		 
	 	 header( 'Content-Type: application/json; charset=utf-8');
	     $json = json_encode($set);				
		 echo $json;
		 exit;
	 
?>