<?php
require_once("php/PhpUtilities.php");
$utilities = new PhpUtilities();
$utilities->startSession();
$mode = $utilities->isAdmin() ? "Pridėti administratorių" : "Registracija";
$modeValue = $utilities->isAdmin() ? "Pridėti administratorių" : "Registruotis";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title><?php echo $mode ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script defer type="module" src="scripts/RegisterValidator.js"> </script>
</head>

<body id="Background-Gradient">

    <div class="container">

        <h1> <a id="Fixed" class="bi bi-caret-left" href="main.php"></a> </h1>

        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="col-sm-6 col-10" id="block">
                <h1 class="text-center"> <?php echo $mode ?></h1>
                <form name="registerForm" id="RegistrationForm" class="text-white" onsubmit="event.preventDefault(); RegistrationValidation()">

                    <label for="username" class="form-label">Slapyvardis</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Slapyvardis" required>

                    <label for="pass" class="form-label">Slaptažodis</label>
                    <input type="password" name="pass" id="pass" class="form-control" placeholder="Slaptažodis" required>

                    <label for="comPass" class="form-label">Patvirtinti Slaptažodį</label>
                    <input type="password" name="comPass" id="comPass" class="form-control" placeholder="Patvirtinti Slaptažodį" required>

                    <label for="email" class="form-label">El. paštas</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="El. paštas" required>


                    <input class="form-control btn btn-success mt-2" type="submit" value="<?php echo $modeValue ?>">

                </form>
                <a class="form-control btn btn-light mt-2" href="login.html"> Prisijungti </a>
                <div class="row justify-content-center" id="errors">
                </div>
            </div>
        </div>
    </div>


</body>

</html>