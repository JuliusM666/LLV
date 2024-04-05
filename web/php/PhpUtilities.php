
<?php
class PhpUtilities
{
    function __construct()
    {
        $this->startSession();
    }
    function startSession()
    {

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }
    function isAdmin()
    {
        if (isset($_SESSION['admin'])) {
            return $_SESSION['admin'] == 1 ? true : false;
        }
        return false;
    }
    function AdminAccess()
    {
        if ($this->isAdmin() == false) {
            header("Location: main.php");
        }
    }
    function sessionDestroy()
    {
        session_destroy();
        session_start();
    }
}

?>