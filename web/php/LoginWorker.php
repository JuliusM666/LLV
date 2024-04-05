
<?php

try {


    $worker = new LoginWorker($_POST['username'], $_POST['password']);

    $worker->checkLogin();
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}
class LoginWorker
{
    private $utilities;
    private $username;
    private $password;
    private $res;
    private $DatabaseConnector;


    function __construct($username, $password)
    {
        require_once('DatabaseConnector.php');
        require_once("PhpUtilities.php");

        $this->utilities = new PhpUtilities();
        $this->DatabaseConnector = new DatabaseConnector();
        $this->username = $username;
        $this->password = $password;
        $this->res = false;
    }
    function checkLogin()
    {

        $result = $this->DatabaseConnector->userLogin($this->username, $this->password);
        if (count($result) == 0) {
            $this->res = false;
        } else {
            $this->utilities->sessionDestroy();
            $this->res = true;
            $_SESSION["id"] = $result['id'];
            $_SESSION["username"] = $result['username'];

            $_SESSION["description"] = $result['description'];
            $_SESSION["image"] = $result['image'];

            $_SESSION["ban"] = $result['ban'];
            if ($result["admin"] == 1) {
                $_SESSION["admin"] = $result['admin'];
            }
        }
        echo json_encode($this->res);
    }
}


?>
