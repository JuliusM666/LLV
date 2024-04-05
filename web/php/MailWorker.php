<?php
class MailWorker
{
    private $DBcon;
    function __construct()
    {

        require_once("DatabaseConnector.php");

        $this->DBcon = new DatabaseConnector();
    }
    function sendMails()
    {

        $mail = $this->DBcon->getMail();
        while ($mail != null) {


            $this->DBcon->deleteMail($mail['id']);
            mail($mail['mail'], $mail['subject'], $mail['message']);
            $mail = $this->DBcon->getMail();
        }
    }
}
$worker = new MailWorker();
$worker->sendMails();
