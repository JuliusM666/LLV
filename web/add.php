<!DOCTYPE html>
<?php
require_once("php/PhpUtilities.php");
require_once("php/DatabaseConnector.php");
require_once("dotenvLoad.php");
$util = new PhpUtilities();
$util->AdminAccess();

try {
    $DBcon = new DatabaseConnector();
    $categories = $DBcon->getCategories();
} catch (PDOException $e) {
    $categories = null;
    echo '<script>alert("Duomenų bazės klaida")</script>';
}
?>
<html lang="en">

<head>
    <meta name="description" />
    <meta charset="utf-8">
    <title>Pridėti</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script defer type="module" src="scripts/AddValidator.js"> </script>
    <script defer src="scripts/Mapbox.js"> </script>

    <!--Mapbox-->
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.css' rel='stylesheet' />
    <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.min.js'></script>
    <link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.css' type='text/css' />
    <!--Mapbox-->
</head>

<body id="Background-Gradient" onload="map.setAcessToken('<?php echo $_ENV['MAP_BOX_ACCESS_TOKEN'] ?>'),map.getCoordinates(null);map.mapClickEvent()">
    <div class="container">
        <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>

        <div class="row justify-content-center">
            <div class="col-7">

                <form id="form" onsubmit="event.preventDefault()"> <label for="name" class="form-label" id="editName">Pavadinimas</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas">
                    <label class="form-label" id="editName">Kategorija</label>
                    <input list="ShowDataList" id="category" class="form-control" placeholder="Kategorija">

                    <datalist id="ShowDataList">
                        <?php

                        while ($categories != null and $res = $categories->fetch(PDO::FETCH_ASSOC)) {
                            echo '<option value="' . $res['category'] . '">';
                        }

                        ?>
                    </datalist>
                    <label for="upload" class="form-label" id="editName">Paveikslėlis</label>

                    <div class="input-group">
                        <label id="upload" for="file" class="btn btn-light btn-block btn-outlined w-100 rounded">
                            <i class="bi bi-card-image h4"></i> Pasirinkti failą
                        </label>
                        <input type="file" class="form-control d-none" id="file" name="file" accept=".jpg,.jpeg,.png" multiple>
                    </div>







                    <div class="images">

                    </div>



                    <label for="textBox" class="form-label" id="editName">Tekstas</label>
                    <textarea class="form-control rounded" id="textBox" name="textBox" maxlength="5000" placeholder="Tekstas"></textarea>
                    <label for="cord" class="form-label" id="editName">Koordinatės</label>
                    <input oninput="map.updateMap()" type="text" class="form-control" id="coord" name="coord" placeholder="x,y">
                    <div class="form-group">

                    </div>


                </form>





            </div>
            <div class="col-sm-7 col-12">
                <div id='map' class="MapBox"></div>
            </div>
            <div class="col-7">
                <div class="input-group ">
                    <button onclick="add('none');map.getCoordinates(null);" class="form-control btn btn-success" type="button"><i class="bi bi-plus-circle"></i> </button>
                    <button class="btn btn-primary w-50" type="button" onclick="Clear();"> <i class="bi bi-arrow-repeat"></i> </button>
                </div>



                <div id="errors">
                </div>
            </div>



        </div>



    </div>
    <div class="copyImageDiv" id="copyImageDivElement" hidden>
        <img class="image">
        <button class="btn btn-danger" type="button" id="ImageDeleteButton">
            <i class="bi bi-x-square"></i>
        </button>
    </div>



</body>

</html>