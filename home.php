<?php include("includes/header.php");

$qry_cat="SELECT COUNT(*) as num FROM tbl_category";
$total_category= mysqli_fetch_array(mysqli_query($mysqli,$qry_cat));
$total_category = $total_category['num'];

$qry_news="SELECT COUNT(*) as num FROM tbl_news";
$total_news = mysqli_fetch_array(mysqli_query($mysqli,$qry_news));
$total_news = $total_news['num'];

 
$qry_users="SELECT COUNT(*) as num FROM tbl_users";
$total_users = mysqli_fetch_array(mysqli_query($mysqli,$qry_users));
$total_users = $total_users['num'];
 
?>       



    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_category.php" class="card card-banner card-green-light">
        <div class="card-body"> <i class="icon fa fa-sitemap fa-4x"></i>
          <div class="content">
            <div class="title">Categorias</div>
            <div class="value"><span class="sign"></span><?php echo $total_category;?></div>
          </div>
        </div>
        </a> 
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_news.php" class="card card-banner card-yellow-light">
        <div class="card-body"> <i class="icon fa fa-film fa-4x"></i>
          <div class="content">
            <div class="title">Noticias</div>
            <div class="value"><span class="sign"></span><?php echo $total_news;?></div>
          </div>
        </div>
        </a> 
        </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_users.php" class="card card-banner card-yellow-light">
        <div class="card-body"> <i class="icon fa fa-users fa-4x"></i>
          <div class="content">
            <div class="title">Usuarios</div>
            <div class="value"><span class="sign"></span><?php echo $total_users;?></div>
          </div>
        </div>
        </a> </div> 
     
    </div>
     
     
    </div>

        
<?php include("includes/footer.php");?>       
