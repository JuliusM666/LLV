<?php
require_once("php/PhpUtilities.php");
$util = new PhpUtilities();
$util->AdminAccess();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Projektas" />
    <meta charset="utf-8">
    <title>Pridėti kalusimą</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/MainStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!--Ikonos-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script defer type="module" src="scripts/QuestionScript.js"> </script>
</head>

<body id="Background-Gradient" onload="setColor()">

    <div class="container">
        <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>

        <div class="text-center">

            <i class="bi bi-question-circle" id="QuestionIcon"> </i>

        </div>

        <div class="row justify-content-center mt-2">
            <div class="col-7">

                <form id="form" onsubmit="event.preventDefault();addQuestion();">
                    <label for="question" class="form-label" id="editName">Klausimas</label>
                    <textarea class="form-control" id="question" name="question" maxlength="500">  </textarea>

                    <button type="button" name="a" value=0 onclick="selectAnswer(this)">A: </button>
                    <textarea class="form-control rounded " id="a" name="a" maxlength="200">  </textarea>
                    <button type="button" name="b" value=0 onclick="selectAnswer(this)">B: </button>
                    <textarea class="form-control rounded" id="b" name="b" maxlength="200">  </textarea>
                    <button type="button" name="c" value=0 onclick="selectAnswer(this)">C: </button>
                    <textarea class="form-control rounded" id="c" name="c" maxlength="200">  </textarea>
                    <div class="input-group">
                        <button class="form-control btn btn-success mt-2" type="submit" value="Pridėti"><i class="bi bi-plus-circle"></i> </button>
                        <button class="btn btn-primary w-50 mt-2" type="button" onclick="clearQuestion();"><i class="bi bi-arrow-repeat"></i> </button>
                    </div>

                </form>










                <div id="errors">
                </div>

            </div>

        </div>
    </div>
</body>

</html>