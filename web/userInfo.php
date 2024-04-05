<?php
try {
    require_once("php/DatabaseConnector.php");
    $DBCon = new DatabaseConnector();
    $userInfo = $DBCon->getUser($_GET['id']);
    $limit = 5;
    $page = isset($_GET['page']) ? $_GET['page'] : 0;

    $commentCount = $DBCon->getUserCommentsCount($_GET['id'])['count'];
} catch (PDOException $e) {
    echo '<script>alert("Duomenų bazės klaida")</script>';
    $userInfo = array("username" => "", "image" => "", "points" => "", "description" => "");

    $comments = null;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title><?php echo $userInfo["username"]; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script defer type="module" src="scripts/UserFunctions.js"> </script>
    <script defer src="scripts/commentPagination.js"> </script>
</head>

<body id="Background-Gradient" onload="setCommentPaginationVals(<?php echo $limit ?>,<?php echo $page ?>,<?php echo $commentCount ?>,<?php echo $_GET['id'] ?> ,'userInfo.php'),commentPag.updatePagination(false,true)">
    <div class="container">
        <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>

        <div class="row justify-content-center">

            <div class="col-7">
                <div class="row justify-content-center">
                    <img src="<?php echo $userInfo["image"]; ?>" id="ProfileImageRound">
                </div>

            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col-7 py-2" id="ProfileDescription">
                <h5 class="card-title"><?php echo $userInfo["username"]; ?>
                    <span>
                        <span><i class="bi bi-star-fill"></i></span>
                        <?php echo $userInfo["points"]; ?></span>


                </h5>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-7 py-2" id="ProfileDescription">
                <p id="descriptionText"> <?php echo nl2br($userInfo["description"]) ?></p>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-7">



                <div id="commentBlock">

                </div>
                <nav class="my-2">
                    <ul class="pagination justify-content-center" id="pages">


                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>


</html>