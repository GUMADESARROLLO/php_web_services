<?php include("includes/header.php");

$file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';
?>
<div class="row">
      <div class="col-sm-12 col-xs-12">
     	 	<div class="card">
		        <div class="card-header">
		          Example API urls
		        </div>
       			    <div class="card-body no-padding">
         		
         			 <pre><code class="html"><b>Home</b><br><?php echo $file_path."api.php?home"?><br><br><b>Latest News</b><br><?php echo $file_path."api.php?latest"?><br><br><b>Most View News</b><br><?php echo $file_path."api.php?most_view_news"?><br><br><b>Category List</b><br><?php echo $file_path."api.php?cat_list"?><br><br><b>News list by Cat ID</b><br><?php echo $file_path."api.php?cat_id=1"?><br><br><b>Single News</b><br><?php echo $file_path."api.php?news_id=1"?><br><br><b>Search News</b><br><?php echo $file_path."api.php?search=NASA"?><br><br><b>User Register</b><br><?php echo $file_path."api.php?user_register&name=john&email=johndeo@gmail.com&password=123456&phone=1256098765"?>
					 <br><b>User Login</b><br><?php echo $file_path."api.php?users_login&email=adminfg@gmail.com&password=admin1233"?><br><br><b>User Profile
</b><?php echo $file_path."api.php?user_profile&id=2"?><br><br><b>User Profile Update
</b><?php echo $file_path."api.php?user_profile_update&user_id=3&name=john&email=johndeo@gmail.com&password=123456&phone=1256098765"?><br><br><b>User Comment</b><br><?php echo $file_path."api_comment.php?news_id=3&user_name=admin&comment_text=test"?><br><br><b>Forgot Password</b><br><?php echo $file_path."api.php?forgot_pass&email=admin@gmail.com"?><br><br><b>App Details</b><br><?php echo $file_path."api.php"?></code></pre>
       		
       				</div>
          	</div>
        </div>
</div>
    <br/>
    <div class="clearfix"></div>
        
<?php include("includes/footer.php");?>       
