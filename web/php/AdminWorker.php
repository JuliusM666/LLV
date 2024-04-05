<?php
try {
    $worker = new AdminWorker();
    require_once("PhpUtilities.php");
    $util = new PhpUtilities();
    if ($util->isAdmin() == true) {
        if (isset($_POST['commentID'])) {
            $worker->deleteComment($_POST['commentID']);
        } else if (isset($_POST['banID'])) {
            $worker->ban($_POST['banID']);
        } else if (isset($_POST['locationID'])) {
            $worker->deleteLocation($_POST['locationID']);
        } else if (isset($_POST['deleteQuestionID'])) {
            $worker->deleteQuestion($_POST['deleteQuestionID']);
        }
    }
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";

    echo json_encode($erorrMessage);
}
class AdminWorker
{

    private $DBcon;
    function __construct()
    {


        require_once("DatabaseConnector.php");
        $this->DBcon = new DatabaseConnector();
    }


    function deleteComment($commentID)
    {
        $this->DBcon->removeComment($commentID);
        echo json_encode(true);
    }
    function ban($userID)
    {
        echo json_encode($this->DBcon->ban($userID));
    }

    function deleteLocation($locationID)
    {

        echo json_encode($this->DBcon->deleteLocation($locationID));
    }
    function deleteQuestion($questionID)
    {
        $this->DBcon->removeQuestion($questionID);
    }
}
