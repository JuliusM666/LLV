<?php
require_once("PhpUtilities.php");
$util = new PhpUtilities();
try {
    if ($util->isAdmin() == true) {



        $worker = new addWorker($_POST['name'], $_POST['textBox'], $_POST['coord'], $_POST['id'], $_POST['category'], $_POST['removedFiles']);


        $worker->checkValues();
    }
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}






class addWorker
{

    private $name;
    private $textBox;
    private $coord;
    private $res;
    private $DBcon;
    private $id;
    private $category;
    private $removedFiles;
    private $imgPath;
    function __construct($name, $textBox, $coord, $id, $category, $removedFiles)
    {
        require_once("DatabaseConnector.php");


        $this->name = htmlspecialchars($name);
        $this->textBox = htmlspecialchars($textBox);
        $this->imgPath = "..\img\\";
        $this->coord = htmlspecialchars($coord);
        $this->category = htmlspecialchars($category);


        $this->DBcon = new DatabaseConnector();

        $this->removedFiles = explode(',', $removedFiles);;
        $this->id = $id;
        $this->res = [];
    }

    function updateData()
    {
        $this->DBcon->updateLocation($this->id, $this->name, $this->textBox, $this->coord, $this->category);
        $this->res["Sėkmingai atnaujinta"] = "green";
        echo json_encode($this->res);
    }

    function removeFiles()
    {

        foreach ($this->removedFiles as &$i) {
            $this->DBcon->removeFile($i);
        }
    }
    function UploadFiles($id)
    {

        for ($i = 0; $i < $_POST['count']; $i++) {
            $name = strval($i);
            $fileWorker = new FileWorker($_FILES[$name]['name'], $_FILES[$name]['tmp_name'], $_FILES[$name]['size'], ["jpg", "jpeg", "png"], $this->imgPath);
            $this->DBcon->addLocationImage($this->imgPath . $fileWorker->getName(), $id);

            $fileWorker->Upload();
        }
    }
    function checkValues()
    {

        require_once("FileWorker.php");
        $count = 1;


        for ($i = 0; $i < $_POST['count']; $i++) {
            $name = strval($i);
            $fileWorker = new FileWorker($_FILES[$name]['name'], $_FILES[$name]['tmp_name'], $_FILES[$name]['size'], ["jpg", "jpeg", "png"], $this->imgPath);
            $message = $fileWorker->checkFile();
            if ($message != true) {

                $error = [];
                $error[$count] = $message;
                $this->res = array_merge($this->res, $error);
            }

            $count += 1;
        }



        if (count($this->res) == 0) {

            if ($this->id == "none") {
                $id = $this->DBcon->addLocation($this->name, $this->textBox, $this->coord, $this->category);


                $this->UploadFiles($id);
                $this->res["Sėkmingai pridėta"] = "green";
            } else {
                $this->DBcon->updateLocation($this->id, $this->name, $this->textBox, $this->coord, $this->category);
                $this->UploadFiles($this->id);
                $this->removeFiles();
                $this->res["Sėkmingai atnaujinta"] = "green";
            }
        }



        echo json_encode($this->res);
    }
}
