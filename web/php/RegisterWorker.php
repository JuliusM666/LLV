<?php
require_once("PasswordWorker.php");
class RegisterWorker extends PasswordWorker
{

    protected $username;
    protected $mail;
    protected $res;
    protected $message;
    protected $subject;


    function __construct($username, $password, $comPassword, $mail)
    {
        $this->username = htmlspecialchars($username);
        $this->password = $password;
        $this->comPassword = $comPassword;
        $this->mail = $mail;
        $this->res = [];
        require_once('DatabaseConnector.php');
        $this->DatabaseConnector = new DatabaseConnector();
        $this->message = ' Sėkmingai užsiregistravote Lietuvos Lankytinos Vietos sistemoje.';
        $this->subject = 'Sėkmingai užsiregistravote';
    }
    function validate()
    {
        $usernameIsValid = $this->validateUsername();
        $passwordIsValid = $this->validatePassword();
        $mailIsValid = $this->validateMail();
        if ($usernameIsValid == true and $passwordIsValid == true and $mailIsValid == true) {
            $this->DatabaseConnector->addUser($this->username, $this->password, $this->mail);
            $this->DatabaseConnector->addMail($this->mail, $this->subject, $this->message);
            pclose(popen('powershell.exe "Start-Process C:\xampp\php\php C:\xampp\htdocs\kurs_1\php\MailWorker.php -WindowStyle Hidden"', 'r'));
        }
        echo json_encode($this->res);
    }
    function validateUsername()
    {
        if (strlen($this->username) < 6 or strlen($this->username) > 15) {
            $this->res["slapyvardį turi sudaryti 6-15 simboliai"] = "red";
            return false;
        }
        if ($this->username != strip_tags($this->username)) {
            $this->res["Netinkamas Slapyvardis"] = "red";
            return false;
        }
        if (preg_match("/\A[A-Z0-9]{6,15}\Z/i", $this->username) == false) {
            $this->res["slapyvardį turi sudaryti tik raidės ir skaičiai"] = "red";
            return false;
        }

        if ($this->DatabaseConnector->usernameCheck($this->username) == false) {
            $this->res["slapyvardis  užimtas"] = "red";
            return false;
        }
        $this->res["slapyvardis"] = "green";
        return true;
    }

    function validateMail()
    {

        if (filter_var($this->mail, FILTER_VALIDATE_EMAIL) == false) {
            $this->res["netinkas elektroninis paštas"] = "red";
            return false;
        }
        if ($this->DatabaseConnector->mailCheck($this->mail) == false) {
            $this->res["elektroninis paštas užimtas"] = "red";
            return false;
        }
        $this->res["elektronis paštas"] = "green";
        return true;
    }
}
try {
    $worker = new RegisterWorker($_POST['username'], $_POST['password'], $_POST['comPassword'], $_POST['mail']);
    $worker->validate();
} catch (PDOException $e) {

    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}
