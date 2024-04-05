<!DOCTYPE html>
<?php
require_once("php/SearchWorker.php");
require_once("php/PhpUtilities.php");
$util = new PhpUtilities();
$admin = $util->isAdmin();


$search = isset($_GET['search']) ? $_GET['search'] : "";
$cat1 = isset($_GET['cat1']) ? $_GET['cat1'] : "Pavadinimas";
$cat2 = isset($_GET['cat2']) ? $_GET['cat2'] : "upAbc";
$cat3 = isset($_GET['cat3']) ? $_GET['cat3'] : "";
$cat4 = isset($_GET['cat4']) ? $_GET['cat4'] : "";
try {
    $worker = new SearchWorker($cat1, $cat2, $cat3, $cat4, $search);
    $categories = $worker->getCategories();
} catch (PDOException $e) {

    echo '<script>alert("Duomenų bazės klaida")</script>';
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title>Paieška</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <script defer src="scripts/SearchScript.js"> </script>
    <script defer src="scripts/AdminControls.js"> </script>
    <script defer src="scripts/ScrollFetch.js"> </script>



</head>

<body id="Background-Gradient" onload="setValues('<?php echo $cat1 ?>','<?php echo $cat2 ?>','<?php echo $cat3 ?>','<?php echo $cat4 ?>','<?php echo $search ?>');dataFetcher.setValues('<?php echo $cat1 ?>','<?php echo $cat2 ?>','<?php echo $cat3 ?>','<?php echo $cat4 ?>','<?php echo $search ?>','<?php echo $admin ?>')">

    <div class="container">


        <div class="row">

            <nav class="navbar navbar-light bg-dark m-1 " id="RoundNavbar">



                <form onsubmit="event.preventDefault(); Search()">
                    <div class="row">
                        <div class="col-lg-3 my-2 px-4 ">

                            <span class="d-flex justify-content-center">
                                <a class="btn btn-light" href="main.php">

                                    <i class="bi bi-caret-left"></i>
                                </a>

                                <input type='search' id='search' name='searchVar' placeholder='paieška'>



                                <button type="submit" class="btn btn-light">

                                    <i class="bi bi-search"></i>
                                </button>
                            </span>

                        </div>
                        <div class="col-lg-2 my-2 px-4 ">
                            <select class="form-select w-100 " id="SearchMarginSelect" name="category1">
                                <option selected value="Pavadinimas"> Pavadinimas </option>
                                <option value="Aprašymas">Aprašymas</option>
                                <option value="Pavadinimas/Aprašymas">Pavadinimas/Aprašymas</option>

                            </select>
                        </div>
                        <div class="col-lg-2 my-2 px-4">
                            <select class="form-select w-100 " id="SearchMarginSelect" name="category2">
                                <option selected value="upAbc">&#128314 abc</option>
                                <option value="downAbc">&#128315 abc</option>
                                <option value="upVotes">&#128314 balsai</option>
                                <option value="downVotes">&#128315 balsai</option>
                            </select>

                        </div>
                        <div class="col-lg-2 my-2 px-4">
                            <select class="form-select w-100 " id="SearchMarginSelect" name="category3">
                                <option selected value=""></option>

                                <option value="Com">&#x2705 komentuota</option>
                                <option value="noCom">&#x274C nekomentuota</option>

                            </select>
                        </div>
                        <div class="col-lg-2 my-2 px-4 ">
                            <input list="ShowDataList" id="SearchMarginSelect" class="form-select w-100 " placeholder="Kategorija" name="category4">

                            <datalist id="ShowDataList">
                                <?php
                                while ($res = $categories->fetch(PDO::FETCH_ASSOC)) {
                                    echo '<option value="' . $res['category'] . '">';
                                }
                                ?>


                            </datalist>
                        </div>
                    </div>
                </form>





            </nav>

        </div>
        <div class="row justify-content-center mt-1" id="SearchBox">


        </div>
        <div class="row justify-content-center">
            <div class="col-1" id="circleFrame">

            </div>

        </div>
    </div>

</body>

</html>