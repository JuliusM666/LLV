<?php
if (isset($_POST['id'])) {
    $imgWorker = new ImageWorker($_POST['id']);
    $imgWorker->getImages();
}
class imageWorker
{
    private $id;
    private $DBcon;
    function __construct($id)
    {
        require_once("DatabaseConnector.php");



        $this->DBcon = new DatabaseConnector();
        $this->id = $id;
    }
    function getImages()
    {

        $res = $this->DBcon->getImages($this->id)->fetchAll(PDO::FETCH_ASSOC);


        echo json_encode($res);
    }
}
