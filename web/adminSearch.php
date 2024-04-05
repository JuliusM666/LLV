<?php
require_once("php/PhpUtilities.php");
require_once("php/DatabaseConnector.php");

$util = new PhpUtilities();
$util->AdminAccess();


$search = isset($_GET['search']) ? $_GET['search'] : "";
$switch = isset($_GET['switch']) ? $_GET['switch'] : "";
$userSearch = '';
$questionSearch = '';
if ($switch == 'user') {

    $userSearch = $search;
} else if ($switch == 'question') {

    $questionSearch = $search;
}
try {
    $DBcon = new DatabaseConnector();
    $users = $DBcon->getUsers($userSearch);
    $questions = $DBcon->getQuestions($questionSearch);
} catch (PDOException $e) {
    echo '<script>alert("Duomenų bazės klaida")</script>';
    $users = null;
    $questions = null;
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>



    <script defer src="scripts/AdminControls.js"> </script>
    <script defer src="scripts/AdminSearchScript.js"> </script>
</head>

<body id="Background-Gradient" onload="setValues('<?php echo $search ?>','<?php echo $switch ?>')">

    <div class="container">

        <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>
        <div class="row justify-content-center">
            <div class="col-9">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="nav-item">
                        <a href="#userTabPane" class="nav-link active text-black" data-bs-toggle="tab" id="userTab">Vartotojai</a>
                    </li>
                    <li class="nav-item">
                        <a href="#questionTabPane" class="nav-link text-black" data-bs-toggle="tab" id="questionTab">Klausimai</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="userTabPane">
                        <form onsubmit="event.preventDefault(); SearchUser()">
                            <div class="input-group">

                                <span class="d-flex">


                                    <input type='search' id='UserSearch' name='searchVar' placeholder='paieška'>



                                    <button type="submit" class="btn btn-light">

                                        <i class="bi bi-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>

                        <div class="row m-1">

                            <?php

                            while ($users != null and $res = $users->fetch(PDO::FETCH_ASSOC)) {
                                $value = $res['ban'] == 0 ? "btn btn-dark float-end" : "btn btn-success float-end";
                                echo '
       
       <div  data-toggle="collapse" data-target="#u' . $res['id'] . '" aria-expanded="false" aria-controls="u' . $res['id'] . '" class="SearchBlock"  name="' . $res['id'] . '"> ' . $res['username'] . '<button class="' . $value . '"  onclick=banUser(' . $res['id'] . ')><i class="bi bi-slash-circle"></i></button>
       
       
       </div>
        
        <div class="collapse px-0" id="u' . $res['id'] . '" name="u' . $res['id'] . '">
  <div class="card card-body">
  
  
  <div class="row my-1">
  <div class="col-sm-6 d-flex align-items-center">
  
  <p id="editName" >profilio paveikslėlis: </p>
  </div>
  <div class="col-sm-6 d-flex align-items-center" >
  <img id="ProfileImageRoundAdmin" src="' . $res['image'] . '" >
  </div>
</div>


  <div class="row my-1">
  <div class="col-sm-6 d-flex align-items-center">
  
  <p id="editName" >e.paštas: </p>
  </div>
  <div class="col-sm-6 d-flex align-items-center">
  <p >' . $res['mail'] . '</p>
  </div>
</div>
  
  <div class="row my-1">
  <div class="col-sm-6 d-flex align-items-center">
  
  <p id="editName" >taškai: </p>
  </div>
  <div class="col-sm-6 d-flex align-items-center">
  <p >' . $res['points'] . '</p>
  </div>
</div>
 
 <div class="row my-1">
  <div class="col-sm-6 d-flex align-items-center">
  
  <p id="editName" >aprašas: </p>
  </div>
  <div class="col-sm-6 d-flex align-items-center">
  <p >' . $res['description'] . '</p>
  </div>
</div>


 
 
   
   
  </div>
</div>';
                            } ?>



                        </div>

                    </div>
                    <div class="tab-pane fade" id="questionTabPane">
                        <form onsubmit="event.preventDefault(); SearchQuestion()">
                            <div class="input-group">

                                <span class="d-flex">


                                    <input type='search' id='QuestionSearch' name='searchVar' placeholder='paieška'>



                                    <button type="submit" class="btn btn-light">

                                        <i class="bi bi-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                        <div class="row m-1">

                            <?php

                            while ($questions != null and  $res = $questions->fetch(PDO::FETCH_ASSOC)) {

                                echo '<div  onclick="setAnswer(' . $res['quizID'] . ',' . $res['answer'] . ')" data-toggle="collapse" data-target="#a' . $res['quizID'] . '" aria-expanded="false" aria-controls="a' . $res['quizID'] . '" class="SearchBlock"  id="q' . $res['quizID'] . '"> 
        <div class="row">
        <div class="col-10">
        <p>
        ' . $res['question'] . '
        </p>
        </div>
        <div class="col-2 align-self-center">
        <button class="btn btn-danger float-end"  onclick="deleteQuestion(' . $res['quizID'] . ')" 
        
        onmouseover="OverDeleteButtonHover(\'q' . $res['quizID'] . '\')"
        onmouseout="OutDeleteButtonHover(\'q' . $res['quizID'] . '\')"><i class="bi bi-trash-fill"></i></button>
        </div>
        </div>
        </div>
        <div class="collapse px-0" id="a' . $res['quizID'] . '" >
  <div class="card card-body" >
  
  
  <div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" >kūrėjas: </p>
  </div>
  <div class="col-sm-6 d-flex">
  <p >' . $res['username'] . '</p>
  </div>
</div>

   
  <div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" >kartų atsakyta: </p>
  </div>
  <div class="col-sm-6 d-flex">
  <p >' . $res['count'] . '</p>
  </div>
</div>


 <div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" >klausimas: </p>
  </div>
  <div class="col-sm-6 d-flex">
  <p >' . $res['question'] . '</p>
  </div>
</div>


   
 <div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" name="A' . $res['quizID'] . '">A:</p>
  </div>
  <div class="col-sm-6 d-flex">
  <p id="A">' . $res['A'] . '</p>
  </div>
</div>

   
<div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" name="B' . $res['quizID'] . '">B:</p>
  </div>
  <div class="col-sm-6 d-flex">
  <p id="B">' . $res['B'] . '</p>
  </div>
</div>

<div class="row">
  <div class="col-sm-6 d-flex align-items-start">
  
  <p id="editName" name="C' . $res['quizID'] . '">C:</p>
  </div>
  <div class="col-sm-6 d-flex">
  <p id="C">' . $res['C'] . '</p>
  </div>
</div>





  </div>
</div>';
                            } ?>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

</body>

</html>