<?php
if (isset($_POST['start'])) {
    try {
        $worker = new SearchWorker($_POST['cat1'], $_POST['cat2'], $_POST['cat3'], $_POST['cat4'], $_POST['search']);
        $worker->search($_POST['start'], $_POST['limit']);
    } catch (PDOException $e) {

        $erorrMessage["Duomenų bazės klaida"] = "red";
        echo json_encode($erorrMessage);
    }
}
class SearchWorker
{
    private $cat1;
    private $cat2;
    private $cat3;
    private $cat4;

    private $search;
    private $DBcon;
    private $utilities;
    function __construct($cat1, $cat2, $cat3, $cat4, $search)
    {
        require_once("PhpUtilities.php");
        require_once("DatabaseConnector.php");
        $this->DBcon = new DatabaseConnector();
        $this->utilities = new PhpUtilities();
        $this->cat1 = htmlspecialchars($cat1);
        $this->cat2 = htmlspecialchars($cat2);
        $this->cat3 = htmlspecialchars($cat3);
        $this->cat4 = htmlspecialchars($cat4);
        $this->search = htmlspecialchars($search);
    }


    function getCategories()
    {
        return $this->DBcon->getCategories();
    }
    function search($start, $limit)
    {



        $count = [];
        $query = "SELECT locations.*,COALESCE(UpVotes,0) AS UpVotes,COALESCE(DownVotes,0) AS DownVotes FROM locations LEFT JOIN(SELECT COUNT(*) AS UpVotes ,locationID FROM
        votes WHERE vote=1 GROUP BY locationID) AS tmp1 ON locations.id=tmp1.locationID 
       LEFT JOIN(SELECT COUNT(*) AS DownVotes ,locationID FROM
        votes WHERE vote=0 GROUP BY locationID) AS tmp2 ON locations.id=tmp2.locationID WHERE ";
        if (isset($_SESSION['id'])) {
            switch ($this->cat3) {
                case "Com":
                    $query .= "locations.id IN (SELECT comments.locationID FROM comments WHERE comments.userID=?) AND";
                    array_push($count, 'userID');
                    break;
                case "noCom":
                    $query .= "locations.id NOT IN (SELECT comments.locationID FROM comments WHERE comments.userID=?) AND";
                    array_push($count, 'userID');
                    break;
            }
        }

        if ($this->cat4 != "") {

            $query .= " categoryID=(SELECT id FROM categories WHERE category='" . $this->cat4 . "' LIMIT 1) AND";
        }
        array_push($count, 'like');
        switch ($this->cat1) {
            case "Pavadinimas":

                $query .= " name LIKE ?";
                break;
            case "Aprašymas":
                $query .= " description LIKE ?";
                break;
            case "Pavadinimas/Aprašymas":
                $query .= " description LIKE ? OR name LIKE ?";
                array_push($count, 'like');
                break;
        }

        switch ($this->cat2) {
            case "upAbc":

                $query .= " ORDER BY name ASC";

                break;
            case "downAbc":
                $query .= " ORDER BY name DESC";
                break;
            case "upVotes":
                $query .= " ORDER BY UpVotes DESC";
                break;
            case "downVotes":
                $query .= " ORDER BY UpVotes ASC";
                break;
        }



        $query .= " LIMIT " . $start . "," . $limit;

        echo json_encode($this->DBcon->locationSearch($query, $this->search, $count));
    }
}
