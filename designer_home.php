<?php
session_start();
if (!isset($_SESSION['designer_logged'])) {
    header("location:index.php");
}
require_once('includes/connection.php');
include("includes/header.php");
include('includes/functions.php');
 ?>


<!-- Main content -->
<section class="content">
    <div class="col-12 col-sm-12">
        <div>
            <div class="info-box-content">
                <?php
                $id = $_SESSION['designer_id'];
                $designer = getMyDesigner($id, $conn);
                $decline_request = isset($_GET['action']) ? $_GET['action'] : "";
                $reqId = isset($_GET['reqId']) ? $_GET['reqId'] : 0;
                if ($decline_request == "decline") {
                    $declineReq = declineRequest($reqId, $conn);
                    if ($declineReq) {
                        echo '
<script>
document.getElementById("success").style.display="block";
document.getElementById("success").innerText="The Request Declined Successfully!"; 
 setTimeout(function(){
     window.location.href="designer_home.php"; 
}, 3000);
</script>';
                    }
                }

                ?>
                <div class="card card-primary card-outline">

                    <div class="alert alert-success" style="display:
none" id="success" role="alert">
                    </div>
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle"
                                 src="<?php echo 'uploads/' . $designer['logoImgFileName']; ?>"
                                 alt="<?php echo
                                     $designer['firstName'] . ' ' . $designer['lastName']; ?>">
                        </div>

                        <h3 class="profile-username text-center"><?php echo
                                $designer['firstName'] . ' ' . $designer['lastName']; ?>!</h3>

                        <p class="text-muted text-center"><?php echo $designer['brandName']; ?></p>

                        <h3 class="profile-username text-center"><?php echo
                            $designer['emailAdress']; ?></h3>
                    </div>
                    <!-- /.card-body -->
                </div>


            </div>
        </div>
    </div>
    <!-- Default box -->
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">MY Projects</h3>


            <div class="card-header">

                <a  class="btn btn-success float-right" href="project_add.php"><i class="far fa-plus"></i>
                    Add new Project
                </a>

            </div>
        </div>
        <div class="card-body p-5">
            <table class="table table-striped reqs mb-15">
                <thead>
                <tr class="bg-warning">
                    <th style="width: 1%">
                        #
                    </th>
                    <th style="width: 20%" colspan="3">
                        Projects
                    </th>


                </tr>
                </thead>

                <thead>
                <tr class="bg-primary">
                    <th style="width: 1%">
                        #
                    </th>
                    <th style="width: 30%">
                        Name
                    </th>

                    <th>
                        image
                    </th>
                    <th>
                        Design category
                    </th>

                    <th>
                        Description
                    </th>

                    <th>
                        Edit
                    </th>
                    <th>
                        Delete
                    </th>


                </tr>
                </thead>
                <tbody>
                <?php
                $all_projects = getAllprojects($id, $conn);
                if (($all_projects != null)) {
                    foreach ($all_projects as $key => $project) {
                        ?>
                        <tr>
                            <td>
                                <?php echo $key ?>
                            </td>
                            <td>
                                <?php echo $project['projectName']; ?>
                                <br/>

                            </td>
                            <td>
                                <div class="col-sm-6">
                                    <img class="img-fluid mb-3"
                                         src="   <?php echo 'uploads/' . $project['projectImgFileName']; ?>"
                                         alt="   <?php echo $project['projectName']; ?>">

                                </div>


                            </td>
                            <td>
                                <?php echo $project['category']; ?>
                                <br/>

                            </td>
                            <td>
                                <?php echo $project['description']; ?>

                            </td>
                            <td>
                                <a class="btn btn-success btn-sm" href="project_edit.php?project_id=<?php echo $project['id']; ?>">
                                    <i class="fas fa-check">
                                    </i>
                                    Edit
                                </a>
                            </td>


                            <td class="project-actions text-right">

<form action="" method="post">
    <input type="hidden" name="project_id" value="<?php echo $project['id']; ?>">
    <input type="hidden" name="action" value="delete">
    <button class="btn btn-danger btn-sm" name="submit">
        <i class="fas fa-cross">
        </i>
        Delete
    </button>
</form>


                            </td>
                        </tr>

                    <?php }
                } ?>
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->

        <div class="card-body p-5">
            <table class="table table-striped reqs mb-15">
                <thead>
                <tr class="bg-info">
                    <th style="width: 1%">
                        #
                    </th>
                    <th style="width: 20%" colspan="3">
                        Consultation Requests
                    </th>


                </tr>
                </thead>

                <thead>
                <tr class="bg-primary">
                    <th >
                        #
                    </th>
                    <th >
                        Client Name
                    </th>

                    <th >
                        Room Type
                    </th>
                    <th >
                        Room Dimensions
                    </th>
                    <th>
                        Design Category
                    </th>
                    <th>
                        Color Preferences
                    </th>
                    <th>
                        Date
                    </th>

                    <th style="width: 30%">
                        Action
                    </th>


                </tr>
                </thead>
                <tbody>
                <?php
                $all_requests = getAllRequests($id, $conn);
                if (($all_requests != null)) {
                    foreach ($all_requests as $Dkey => $design_request) {
                        ?>
                        <tr>
                        <td>
                            <?php echo $Dkey ?>
                        </td>
                        <td>
                            <?php echo $design_request['firstName'] . ' ' . $design_request['lastName']; ?>
                            <br/>

                        </td>
                        <td>
                            <?php echo $design_request['type']; ?>

                        </td>
                        <td>
                            <?php echo $design_request['roomLength']; ?>
                            <br/>

                        </td>
                        <td>
                            <?php echo $design_request['category']; ?>

                        </td>
                        <td>
                            <?php //echo $design_request['colorPreferences']; ?>
                            <label style="background-color:<?php echo $design_request['colorPreferences']; ?> "><?php echo $design_request['colorPreferences']; ?></label>


                        </td>
                        <td>
                            <?php echo $design_request['date']; ?>

                        </td>

                        <td>

                        <?php /*if ($design_request['statusID'] == 1 || $design_request['statusID'] == 2) {*/
                            ?>
                            <a class="btn btn-success"
                               href="designConsultationPage.php?action=provide&reqId=<?php echo $design_request['id'] ?>">
                                Provide</a>
                            <?php
//                        } if ($design_request['statusID'] == 1 || $design_request['statusID'] == 3) {
                            ?>
                            <a class="btn btn-danger"
                               href="designer_home.php?action=decline&reqId=<?php echo $design_request['id'] ?>">
                                Decline</a>
                            <?php
                      //  }
                    } ?>

                    </td>



                    </tr>

                <?php }
                ?>
                </tbody>
            </table>
        </div>
    </div>
    <!-- /.card -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php

include('includes/footer.php'); ?>

<?php

if (!empty($_POST) && isset($_POST['action'])) {

    $action = isset($_POST['action']) ? $_POST['action'] : '';
    $projectId = isset($_POST['project_id']) ? $_POST['project_id'] : '';
    if ($action == 'delete') {
        $delete_project = deleteProject($projectId, $conn);
        if($delete_project){
            echo '<script>
    window.location="designer_home.php";</script>';
        }
    }
}
    ?>
