<?php include('includes/header.php'); 

    include('includes/function.php');
	include('language/language.php');



if(isset($_GET['news_id']))
{
    $query ="SELECT * FROM tbl_comment WHERE tbl_comment.news_id='".$_GET['news_id']."'";
    $sql   = mysqli_query($mysqli,$query)or die(mysqli_error());

}









?>


 <div class="row">
      <div class="col-xs-12">


              <?php
              $i=0;
              while($rc=mysqli_fetch_array($sql)) {?>

              <div class="card">
                  <table class='table'>
                      <thead>
                      <tr>
                          <th width="80%"><i class="material-icons inline-icon"><?php echo $rc['user_name']?></i>
                          <th width="20%" >
                              <i class="fa fa-clock-o"></i>
                              <?php echo $rc['dt_rate']?>
                          </th>
                      </tr>
                      </thead>

                      <tbody>
                      <tr class="">
                          <td> <?php echo $rc['comment_text']?></td>
                          <td></td>
                      </tr>
                      <tfooter>
                          <td width="80%"></td>
                          <td width="20%"></td>
                      </tfooter>

                      </tbody>
                  </table>
              </div>

            <?php } ?>


        </div>

    </div>     



<?php include('includes/footer.php');?>          