<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="description" content="Projektas" />
  <meta charset="utf-8">
  <title>Lietuvos lankytinos vietos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="">
  <link rel="stylesheet" href="css/MainStyle.css?v=1.1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <!--Ikonos-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>

</head>

<body id="Background-Gradient">

  <div class="container">

    <h1> <a class="bi bi-caret-left" id="Fixed" href="main.php"></a> </h1>



    <div class="row justify-content-center">
      <?php

      require_once("php/DatabaseConnector.php");
      try {
        $DBCon = new DatabaseConnector();
        $data = $DBCon->getTopRank();
      } catch (PDOException $e) {
        echo '<script>alert("Duomenų bazės klaida")</script>';
        $data = null;
      }
      $count = 0;
      while ($data != null and $res = $data->fetch(PDO::FETCH_ASSOC)) {
        $count += 1;
        echo '<div class="col-7 mt-2" >
              <div class="card" id="row' . $count . '">
  
  <div class="card-body" >
    
    <div class="card-text">
         <h5 class="card-title">' . $count . '. <a   id="navbarLink" class="btn bg-transparent  h4 fw-bold" href="userInfo.php?id=' . $res['id'] . '"> 
         ' . $res['username'] . '
         </a>
          <span class="float-end">
         ' . $res["points"] . '</span>
         <span class="float-end"><i  class="bi bi-star-fill"></i></span>
         
         </h5>
        <img class="card-img-top" src="' . $res["image"] . '" id="ProfileImage">
        
        <p class="text-center">  ' . $res["description"] . '</p>
     
      
      </div>
    
  </div>
</div>
         </div>';
      }

      ?>




    </div>

  </div>

</body>

</html>