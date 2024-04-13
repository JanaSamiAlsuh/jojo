<?php
session_start();
if (!isset($_SESSION['client_logged'])) {
    header("location:index.php");
}
require_once('includes/connection.php');
include("includes/header.php");
include('includes/functions.php');
?>

    <!-- Main content -->
    <section class="content">
        <div class="col-12 col-sm-12">
            <div class="info-box bg-light">
                <div class="info-box-content">
                    <?php
                    $id = $_SESSION['client_id'];
                    $allCats = getCategories($conn);
                    $client = getMyClient($id, $conn);

                    ?>
                    <div class="card card-primary card-outline">

                        <div class="alert alert-success" style="display:
none" id="success" role="alert">
                        </div>
                        <div class="card-body box-profile">


                            <h3 class="profile-username text-center">Welcome <?php echo
                                    $client['firstName'] . ' ' . $client['lastName']; ?>!</h3>


                            <h3 class="profile-username text-center"><?php echo
                                $client['emailAdress']; ?></h3>
                        </div>
                        <!-- /.card-body -->
                    </div>

                </div>
            </div>
        </div>
        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Designers</h3>

                <div class="card-tools">

                    <i class="fas fa-minus"></i></button>

                </div>
            </div>
            <div class="card-body p-5">
                <form action="" method="post">
                    <div class="float-right">
                        <select name="category" class="custom-select" style="width: auto;">
                            <option value=""> All Categories</option>
                            <?php foreach ($allCats as $cat) { ?>
                                <option value="<?php echo $cat['id']; ?>"><?php echo $cat['category']; ?></option>
                            <?php } ?>
                        </select>
                        <button class="btn btn-success" type="submit" name="submit">Filter</button>
                    </div>
                </form>
                <table class="table table-striped reqs mb-15">
                    <thead>
                    <tr class="bg-warning">
                        <th style="width: 1%">
                            #
                        </th>
                        <th style="width: 20%">
                            Designers
                        </th>


                    </tr>
                    </thead>

                    <thead>
                    <tr class="bg-primary">
                        <th>
                            #
                        </th>
                        <th>
                            Designer Brand
                        </th>

                        <th>
                            Designer Speciality
                        </th>
                        <th>
                            Consult
                        </th>

                    </tr>
                    </thead>
                    <tbody>
                    <?php

                    if ($_SERVER['REQUEST_METHOD']=='GET') {
                        $all_designers = getAllDesigners($conn);
                    }
                   else if ($_SERVER['REQUEST_METHOD']=='POST'&& !empty($_POST) && isset($_POST['submit'])) {

                        $category = isset($_POST['category']) ? $_POST['category'] : '';

                        if ($category != '') {
                            $all_designers= getDesignersByCategory($category, $conn);

                        }
                        else{
                            $all_designers = getAllDesigners($conn);
                        }
                    }

                    if (($all_designers != null)) {
                        foreach ($all_designers as $key => $designer) {
                            ?>
                            <tr>
                                <td>
                                    <?php echo $key ?>
                                </td>
                                <td>
                                    <div class="user-block">
                                        <a href="designer_portfolio.php?designer=<?php echo $designer['id']; ?>">
                                        <img class="img-circle img-bordered-sm"
                                             src="uploads/<?php echo $designer['logoImgFileName']; ?>" alt="User Image">
                                        <span class="username">
                          <?php echo $designer['brandName'] . ' '; ?>
                        </span></a>

                                    </div>


                                </td>


                                <td>
                                    <?php echo $designer['category']; ?>

                                </td>
                                <td>
                                    <a class="btn btn-success btn-sm"
                                       href="request_add.php?designer=<?php echo $designer['id']; ?>">
                                        <i class="fas fa-fingerprint">
                                        </i>
                                        Consult Me
                                    </a>
                                </td>


                            </tr>

                        <?php }
                    } ?>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->


        </div>
        <!-- /.card -->

    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<?php

include('includes/footer.php'); ?>

