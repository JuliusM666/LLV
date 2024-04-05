<!DOCTYPE html>
<?php
require_once("php/PhpUtilities.php");
require_once("php/DatabaseConnector.php");
$util = new PhpUtilities();
try {
    $DBcon = new DatabaseConnector();
    $locations = $DBcon->getLocationsForMainPage();
} catch (PDOException $e) {
    $blank = ["id" => null, "name" => "", "image" => "main_img/blank.png"];
    $locations = [];
    for ($i = 0; $i < 4; $i++) {
        array_push($locations, $blank);
    }
    echo '<script>alert("Duomenų bazės klaida")</script>';
}
?>

<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title>Lietuvos lankytinos vietos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script defer src="scripts/SearchScript.js"> </script>

</head>

<body id="Background-Gradient">

    <div class="container">
        <div class="row justify-content-center">
            <img src="main_img//logo.png" class="w-50">
        </div>



        <nav class="navbar navbar-light bg-dark " id="RoundNavbar">
            <div class="col-lg-4 p-1">
                <span id="navbarMargin" class="d-flex justify-content-center float-start">
                    <a class="navbar-brand text-light" href="login.html" id="navbarLink">Prisijungti</a>
                    <a class="navbar-brand text-light" href="register.php" id="navbarLink">Registruotis</a>
                    <a class="navbar-brand text-light" href="rating.php" id="navbarLink">Taškai</a>
                </span>
            </div>
            <div class="col-lg-4 p-1">

                <form onsubmit="event.preventDefault();SearchMainPage();" class="justify-content-center">
                    <span class="d-flex justify-content-center">
                        <input type="search" id="search" name="search" placeholder="paieška">
                        <button type="submit" class="btn btn-light">

                            <i class="bi bi-search"></i>
                        </button>

                    </span>


                </form>
            </div>
            <div class="col-lg-4 p-1">

                <?php if (isset($_SESSION['username'])) {




                    echo "<div class='dropdown show float-end' id='navbarMargin' >
  <a class='btn btn-secondary dropdown-toggle' href='#' role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
    " . $_SESSION['username'] . "
  </a>

  <div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>
    <a class='dropdown-item' href='user.php'>Nustatymai</a>";
                    if (isset($_SESSION['admin'])) {

                        echo " <a class='dropdown-item' href='add.php'>Pridėti vietovę</a>
           <a class='dropdown-item' href='question.php'>Pridėti klausimą</a>
           <a class='dropdown-item' href='register.php'>Pridėti admin</a>
           <a class='dropdown-item' href='adminSearch.php'>Admin paieška</a>";
                    }


                    echo "
  <a class='dropdown-item' href='php/Logout.php'><i class='bi bi-box-arrow-right'></i></a>
  </div>
</div>
";
                }
                ?>
            </div>
        </nav>
        <div class="row">
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-6 " id="BlockMargin1">
                <div class="card">
                    <img class="card-img-top" id="MainImg" src="<?php echo $locations[0]['image'] ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $locations[0]['name'] ?></h5>

                        <a href="info.php?id=<?php echo $locations[0]['id']; ?>" class="btn btn-success">Daugiau...</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6" id="BlockMargin1">
                <div class="card">
                    <img class="card-img-top" id="MainImg" src="<?php echo $locations[1]['image'] ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $locations[1]['name'] ?></h5>

                        <a href="info.php?id=<?php echo $locations[1]['id']; ?>" class="btn btn-success">Daugiau...</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6" id="BlockMargin1">
                <div class="card">
                    <img class="card-img-top" id="MainImg" src="<?php echo $locations[2]['image'] ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $locations[2]['name'] ?></h5>

                        <a href="info.php?id=<?php echo $locations[2]['id']; ?>" class="btn btn-success">Daugiau...</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6" id="BlockMargin1">
                <div class="card">
                    <img class="card-img-top" id="MainImg" src="<?php echo $locations[3]['image'] ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $locations[3]['name'] ?></h5>

                        <a href="info.php?id=<?php echo $locations[3]['id']; ?>" class="btn btn-success">Daugiau...</a>
                    </div>
                </div>
            </div>
        </div>
        <?php
        require_once("footer.php")
        ?>







    </div>





</body>

</html>