<?php
try {
    $worker = new MapWorker();
    $worker->getCoordinates();
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}
class MapWorker
{
    private $DBcon;
    function __construct()
    {
        require_once("DatabaseConnector.php");
        $this->DBcon = new DatabaseConnector();
    }
    function getCoordinates()
    {

        echo json_encode($this->DBcon->getCoordinates());
    }
}
