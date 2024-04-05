<?php

class PasswordWorker
{
    protected $password;
    protected $comPassword;
    protected $DatabaseConnector;

    function __construct($password, $comPassword)
    {

        $this->password = $password;
        $this->comPassword = $comPassword;
        $this->res = [];
        require_once('DatabaseConnector.php');
        $this->DatabaseConnector = new DatabaseConnector();
    }
    public function validatePassword()
    {

        if ($this->password != $this->comPassword) {
            $this->res["slaptažodžiai nesutampa"] = "red";
            return false;
        }
        if (strlen($this->password) < 8 or strlen($this->password) > 15) {
            $this->res["slaptažodį turi sudaryti 8-15 simboliai"] = "red";
            return false;
        }
        if (preg_match("~[!@#\$%\^\&*\)\(+=\._\-\?\~\|\\/<>\[\]\{\}]+~i", $this->password) == false) {
            $this->res["slaptažodis turi turėti bent vieną specialų simbolį"] = "red";
            return false;
        }

        $this->res["slaptažodis"] = "green";
        return true;
    }
    public function checkPassword($oldPass, $id)
    {
        if ($this->validatePassword() == true) {
            if ($this->DatabaseConnector->checkPassword($oldPass, $id) == false) {

                $this->res["slaptažodis neatintinka dabartinio slaptažodžio"] = "red";
            } else {
                $this->changePassword($this->password, $id);
            }
        }
    }
    public function changePassword($password, $id)
    {
        $this->DatabaseConnector->updatePassword($password, $id);
        $this->res["sėkmingai pakeistas slaptažodis"] = "green";
    }
    public function getErrors()
    {

        return $this->res;
    }
    public function addError($error, $color)
    {
        $this->res[$error] = $color;
    }
}
