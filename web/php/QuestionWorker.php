<?php
try {
    $worker = new QuestionWorker($_POST['question'], $_POST['a'], $_POST['b'], $_POST['c'], $_POST['answer']);
    $worker->addQuestion();
} catch (PDOException $e) {
    $erorrMessage["Duomenų bazės klaida"] = "red";
    echo json_encode($erorrMessage);
}
class QuestionWorker
{
    private $question;
    private $a;
    private $b;
    private $c;
    private $answer;
    private $res;
    private $DBcon;
    private $util;
    function __construct($question, $a, $b, $c, $answer)
    {
        require_once("DatabaseConnector.php");
        require_once("PhpUtilities.php");
        $this->question = htmlspecialchars($question);
        $this->a = htmlspecialchars($a);
        $this->b = htmlspecialchars($b);
        $this->c = htmlspecialchars($c);
        $this->answer = htmlspecialchars($answer);
        $this->res = [];
        $this->DBcon = new DatabaseConnector();
        $this->util = new PhpUtilities();
    }

    function addQuestion()
    {
        if ($this->validateInput() == true) {
            $this->DBcon->addQuestion($_SESSION['id'], $this->question, $this->a, $this->b, $this->c, $this->answer);
            $this->res["Sėkmingai pridėta"] = "green";
        }
        echo json_encode($this->res);
    }
    function validateInput()
    {
        if (strlen(trim($this->question)) == 0 or strlen($this->question) > 500) {
            $this->res["Netinkamo ilgio klausimas"] = "red";
            return false;
        } else if (strlen(trim($this->a)) == 0 or strlen($this->a) > 300 or strlen(trim($this->b)) == 0 or strlen($this->b) > 300 or strlen(trim($this->c)) == 0 or strlen($this->c) > 200) {
            $this->res["Netinkamo ilgio atsakymas"] = "red";
            return false;
        }

        return true;
    }
}
