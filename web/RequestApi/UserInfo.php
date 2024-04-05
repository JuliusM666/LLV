<?php
if (isset($_POST['username']) and isset($_POST['password'])) {
   $userName = $_POST['username'];
   $password = $_POST['password'];

   require_once('../php/DatabaseConnector.php');
   $DatabaseConnector = new DatabaseConnector();
   if (count($DatabaseConnector->userLogin($userName, $password)) != 0) {

      if (isset($_POST['userID']) and isset($_POST['questionID'])) {

         $DatabaseConnector->setAnsweredQuestion($_POST['userID'], $_POST['questionID']);
      } elseif (isset($_POST['userID'])) {

         echo json_encode($DatabaseConnector->getAllQuestions($_POST['userID']));
      } else {
         echo json_encode($DatabaseConnector->getUserForApp($userName));
      }
   }
}
