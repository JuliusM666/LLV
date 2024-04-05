<!DOCTYPE html>
<?php
require_once("php/DatabaseConnector.php");
require_once("dotenvLoad.php");

if ($_GET['id'] == null) {
    header("Location:main.php");
}
try {
    $DBcon = new DatabaseConnector();
    $info = $DBcon->getLocation($_GET['id']);


    $images = $DBcon->getImages($_GET['id']);


    $limit = 5;
    $page = isset($_GET['page']) ? $_GET['page'] : 0;
    $commentCount = $DBcon->getCommentCount($_GET['id'])['count'];





    $commentPlaceholder = isset($_SESSION['id']) ? "komentaras" : "komentuoti gali tik registruoti vartotojai";

    if ($info == null) {
        throw new PDOException();
    }
} catch (PDOException $e) {
    $info = array(
        "name" => "", "category" => "", "description" => "", "coordinates" => "", "image" => "", "UpCount" => "0", "DownCount" => "0",
        "id" => ""
    );
    $images = null;

    echo '<script>alert("Duomenų bazės klaida")</script>';
}
?>
<html lang="en">

<head>



    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title><?php echo $info['name']; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/MainStyle.css">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <!--Mapbox-->
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.css' rel='stylesheet' />
    <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.min.js'></script>
    <link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.css' type='text/css' />
    <!--Mapbox-->
    <script defer type="module" src="scripts/InfoScript.js"> </script>
    <script defer src="scripts/Mapbox.js"> </script>
    <script defer src="scripts/SearchScript.js"> </script>
    <script defer src="scripts/commentPagination.js"> </script>

</head>


<body id="Background-Gradient" onload="map.setAcessToken('<?php echo $_ENV['MAP_BOX_ACCESS_TOKEN'] ?>'),getVote(<?php echo $_GET['id'] ?>),map.getCoordinates(<?php echo $_GET['id'] ?>),setCommentPaginationVals(<?php echo $limit ?>,<?php echo $page ?>,<?php echo $commentCount ?>,<?php echo $_GET['id'] ?>,'info.php'),commentPag.updatePagination(false,false)">

    <div class="container">


        <h1> <a id="Fixed" class="bi bi-caret-left" href="main.php"></a> </h1>

        <?php if (isset($_SESSION['admin'])) {
            echo  '
            
             <h2>  <a id="Fixed"  class="FixedSecond" onclick="openInfoAdmin(' . $_GET['id'] . ');"> 
            <i class="bi bi-gear " ></i>
            </a>  </h2>';
        } ?>
        <div class="row justify-content-center mt-3 ">
            <div class="col-7">
                <div class="row justify-content-center mb-3">
                    <div class="col-md-6">

                        <h1 class="text-center"> <?php echo $info['name'] ?> </h1>
                    </div>
                    <div class="col-md-6">
                        <h1 class="text-center">

                            <span id="upvoteBlock">

                                <input onclick="<?php if (isset($_SESSION['id'])) {
                                                    echo "setVote(1," . $_GET['id'] . ")";
                                                } ?>" id="arrow" class="arrows" type=image src="main_img/up-blank.png" value="0">
                                <span id="positive"> <?php echo $info['UpCount'] ?> </span>

                                <input onclick="<?php if (isset($_SESSION['id'])) {
                                                    echo "setVote(0," . $_GET['id'] . ")";
                                                } ?>" id="arrow" class="arrows" type=image src="main_img/down-blank.png" value="0">

                                <span id="negative"> <?php echo $info['DownCount'] ?></span>

                            </span>




                        </h1>
                    </div>

                </div>




                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">


                    <div class="carousel-inner">
                        <?php while ($images != null and $res = $images->fetch(PDO::FETCH_ASSOC)) {
                            echo '
              <div class="carousel-item active">
      <img src="' . $res['image'] . '" class="rounded">
    </div>';
                        }
                        ?>


                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <p class="font-italic" id="textBlock"> <?php echo nl2br($info['description']); ?></p>
            </div>
            <div class="col-sm-7 col-12">
                <div id='map' class="MapBox"></div>

            </div>

            <div class="col-7">

                <form onsubmit="event.preventDefault();">
                    <div class="form-group">
                        <textarea id="comment" name="comment" rows="5" cols="10" class="form-control rounded" maxlength="300" placeholder="<?php echo $commentPlaceholder; ?>"></textarea>

                        <div class="input-group ">
                            <button onclick="<?php if (isset($_SESSION['id'])) {
                                                    echo "addComment('" . $info['id'] . "')";
                                                } ?>,commentPag.increaseCount(),commentPag.updatePagination(false)" class="form-control btn btn-success" type="button"><i class="bi bi-chat-left-text"></i> </button>
                        </div>

                    </div>
                </form>


                <div id="errors">
                </div>

                <div id="commentBlock">

                </div>
                <nav class="my-2">
                    <ul class="pagination justify-content-center " id="pages">

                    </ul>
                </nav>






                <div class="card mt-1" id="copy" hidden>

                    <div class="card-body">

                        <div class="card-text">

                            <div class="row">
                                <div class="col-8 p-1">
                                    <h4 class="card-title">

                                        <a id="navbarLink" class="btn btn-light h4 fw-bold" href="">

                                        </a>
                                    </h4>
                                </div>
                                <div class="col-4 p-1">
                                    <h6 class="fw-normal float-end text-break">

                                    </h6>


                                </div>
                            </div>
                            <img class="card-img-top" src="" id="ProfileImage">



                            <p class="CommentText"> </p>




                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>




</body>

</html>