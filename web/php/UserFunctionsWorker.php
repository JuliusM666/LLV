<?php

try {
    $worker = new UserFunctionsWorker();
    if (isset($_POST['token'])) {

        $worker->changePasswordRecovery($_POST['token'], $_POST['newPass'], $_POST['comNewPass']);
    } else if (isset($_POST['newPass'])) {

        $worker->changePassword();
    } else if (isset($_POST['description'])) {

        $worker->changeDescription();
    } else if (isset($_FILES['file'])) {

        $worker->changeProfilePicture();
    } else if (isset($_POST['comment'])) {

        $worker->addComment();
    } else if (isset($_POST['vote'])) {


        $worker->setVote();
    } else if (isset($_POST['locationID'])) {

        $worker->getVote();
    } else if (isset($_POST['mail'])) {

        $worker->PasswordRecovery($_POST['mail']);
    }
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}

class UserFunctionsWorker
{

    private $DBcon;
    private $utilities;
    private $res;
    function __construct()
    {

        require_once("DatabaseConnector.php");
        require_once("PhpUtilities.php");
        $this->utilities = new PhpUtilities();
        $this->DBcon = new DatabaseConnector();
    }
    function changePassword()
    {
        require_once("PasswordWorker.php");
        $worker = new PasswordWorker($_POST['newPass'], $_POST['comNewPass']);
        $res = $worker->validatePassword();
        if ($res != false) {
            $worker->checkPassword($_POST['oldPass'], $_SESSION['id']);
        }


        echo json_encode($worker->getErrors());
    }
    function changeDescription()
    {

        $description = htmlspecialchars($_POST['description']);
        $res = [];
        if (strlen($description) > 100 or preg_match_all('/\n/', $description) > 5) {

            $res["Per ilgas aprašymas"] = "red";
        } else {

            $this->DBcon->updateDescription(htmlspecialchars($description), $_SESSION['id']);
            $_SESSION['description'] = $description;
            $res["Aprašymas atnaujintas"] = "green";
        }
        echo json_encode($res);
    }
    function addComment()
    {

        $comment = htmlspecialchars($_POST['comment']);
        $res = [];
        if (strlen($comment) > 300 or preg_match_all('/\n/', $comment) > 5) {

            $res["Per ilgas komentaras"] = "red";
        } else if (isset($_SESSION['id']) == false) {

            $res["Tik prisijungę vartotojai gali komentuoti"] = "red";
        } else if ($_SESSION['ban'] == 1) {

            $res["Jums uždrausta komentuoti"] = "red";
        } else {

            $info = $this->DBcon->addComment($_POST['id'], $comment);


            $res = $info;
        }
        echo json_encode($res);
    }
    function changeProfilePicture()
    {
        require_once("FileWorker.php");

        $res = [];
        $fileWorker = new FileWorker($_FILES['file']['name'], $_FILES['file']['tmp_name'], $_FILES['file']['size'], ["jpg", "jpeg", "png"], "C:/xampp/htdocs/kurs_1/user_img/");
        $message = $fileWorker->checkFile();
        if ($message == true) {

            $_SESSION['image'] = "/kurs_1/user_img/" . htmlspecialchars($fileWorker->getName());
            $fileWorker->Upload();
            $this->DBcon->updateProfilePicture($_SESSION['image'], $_SESSION['id']);
            $res["Sėkmingai pridėta"] = "green";
            $res["path"] = $_SESSION['image'];
        } else {

            $this->res = $message;
        }

        echo json_encode($res);
    }
    function getVote()
    {
        $res["vote"] = -1;
        if (isset($_SESSION['id'])) {
            $res = $this->DBcon->getVote($_SESSION['id'], $_POST['locationID']);
            if ($res == false) {
                $res["vote"] = -1;
            }
        }


        $voteCount = $this->DBcon->getLocation($_POST['locationID']);
        echo json_encode(array_merge($res, $voteCount));
    }

    function setVote()
    {

        $this->DBcon->setVote($_SESSION['id'], $_POST['locationID'], $_POST['vote']);
    }
    function PasswordRecovery($mail)
    {
        $res = [];
        $result = $this->DBcon->mailCheck($mail);

        if ($result == true) {
            $res["Netinkamas el.paštas"] = "red";
        } else {

            $result = $this->DBcon->checkPasswordRecovery($mail);

            if ($result == false) {
                $res["Laiškas jau buvo išsiūstas"] = "red";
            } else {
                $token = bin2hex(random_bytes(200));

                $this->DBcon->addForgotPassword($mail, $token);
                $subject = 'Slaptažodžio atkūrimas';
                $message = 'Pakeiskite slaptažodį http://localhost:8012/kurs_1/passwordRecovery.php?token=' . $token;
                $this->DBcon->addMail($mail, $subject, $message);
                pclose(popen('powershell.exe "Start-Process C:\xampp\php\php C:\xampp\htdocs\kurs_1\php\MailWorker.php -WindowStyle Hidden"', 'r'));
                $res["Laiškas išsiūstas"] = "green";
            }
        }
        echo json_encode($res);
    }
    function changePasswordRecovery($token, $newPass, $comNewPass)
    {
        require_once("PasswordWorker.php");
        $worker = new PasswordWorker($newPass, $comNewPass);
        $result = $worker->validatePassword();

        if ($result != false) {
            $id = $this->DBcon->getRecoveryUserId($token);
            if ($id == false) {

                $worker->addError("Baigėsi atkūrimo laikas", "red");
            } else {
                $worker->changePassword($newPass, $id);
            }
        }







        echo json_encode($worker->getErrors());
    }
}
