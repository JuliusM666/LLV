<?php
require_once("php/PhpUtilities.php");
$util = new PhpUtilities();

if (isset($_SESSION['username']) == false) {

    header('Location: main.php');
}

try {
    require_once("php/DatabaseConnector.php");
    $DBCon = new DatabaseConnector();
    $userInfo = $DBCon->getUser($_SESSION['id']);
} catch (PDOException $e) {
    echo '<script>alert("Duomenų bazės klaida")</script>';
    $userInfo = array("username" => "", "image" => "", "points" => "", "description" => "");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title><?php echo $_SESSION['username'] ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script defer type="module" src="scripts/UserFunctions.js"> </script>
</head>

<body id="Background-Gradient">
    <div class="container">
        <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>

        <div class="row justify-content-center">

            <div class="col-7">
                <div class="row justify-content-center">
                    <img src="<?php echo $_SESSION['image'] ?>" id="ProfileImageRound">
                </div>

            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col-7 py-2" id="ProfileDescription">
                <h5 class="card-title"><?php echo $_SESSION["username"]; ?>
                    <span>
                        <span><i class="bi bi-star-fill"></i></span>
                        <?php echo $userInfo["points"]; ?></span>


                </h5>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-7 py-2" id="ProfileDescription">
                <p id="descriptionText"> <?php echo nl2br($_SESSION['description']) ?></p>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-7" id="ChangeUserInfo">
                <h1> Pakeisti slaptažodį</h1>
                <form onsubmit="event.preventDefault(); changePassword()">

                    <label for="pass" class="form-label">senas slaptažodis</label>
                    <input type="password" class="form-control" id="pass" name="pass" placeholder="Slaptažodis" required>

                    <label for="compass" class="form-label">naujas slaptažodis</label>
                    <input type="password" class="form-control" id="newPass" name="compass" placeholder="naujas slaptažodis" required>
                    <label for="newpass" class="form-label">pakartoti naują slaptažodį</label>
                    <input type="password" class="form-control" id="ComNewPass" name="newpass" placeholder="pakartoti naują slaptažodį" required>


                    <input class="form-control btn btn-success my-2" type="submit" value="Pakeisti slaptažodį" s>
                </form>
            </div>

            <div class="col-7" id="errorsPassword">
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-7" id="ChangeUserInfo">
                <h1> Pakeisti profilio aprašymą</h1>
                <form onsubmit="event.preventDefault(); changeDescription()">


                    <label for="textBox" class="form-label">Naujas aprašas</label>
                    <textarea class="form-control" id="textBox" name="textBox" maxlength="100">  </textarea>


                    <input class="form-control btn btn-success my-2" type="submit" value="Pakeisti aprašą">
                </form>
            </div>

            <div class="col-7" id="errorsDescription">
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-7" id="ChangeUserInfo">
                <h1> Pakeisti profilio paveikslėlį</h1>
                <form onsubmit="event.preventDefault(); changeProfilePicture()">





                    <div class="input-group">
                        <label id="upload" for="file" class="btn btn-light btn-block btn-outlined w-100 rounded">
                            <i class="bi bi-card-image h4"></i> Pasirinkti failą
                        </label>
                        <input type="file" class="form-control d-none" id="file" name="file" accept=".jpg,.jpeg,.png" onchange="showImage(this)">
                    </div>
                    <img class="image">

                    <input class="form-control btn btn-success my-2 " type="submit" value="Pakeisti paveikslėlį">
                </form>



            </div>
            <div class="col-7">
                <div id="errorsPicture"> </div>

            </div>
        </div>
    </div>
</body>


</html>