<?php
if (isset($_POST['limit']) and isset($_POST['page']) and isset($_POST['id'])) {

    require_once("DatabaseConnector.php");
    $DBcon = new DatabaseConnector();





    if ($_POST['isUserInfo'] == 'true') {

        echo json_encode($DBcon->getUserComments($_POST['id'], $_POST['limit'] * $_POST['page'], $_POST['limit']));
    } else {

        echo json_encode($DBcon->getComments($_POST['id'], $_POST['limit'] * $_POST['page'], $_POST['limit']));
    }
}
