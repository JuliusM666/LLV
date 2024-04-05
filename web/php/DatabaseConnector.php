<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/dotenvLoad.php');
class DatabaseConnector
{
    private $pdo;
    private $utilities;
    private $errors;
    function __construct()
    {
        require_once("PhpUtilities.php");
        $this->utilities = new PhpUtilities();
        $this->errors = [];


        $this->pdo = new PDO($_ENV['DB_TYPE'] . ':dbname=' . $_ENV['DB_NAME'] . ';host=' . $_ENV['DB_HOST'], $_ENV['DB_USERNAME'], $_ENV['DB_PASS']);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);
        date_default_timezone_set($_ENV['TIME_ZONE']);
    }

    function getRecoveryUserId($token)
    {
        $res = $this->pdo->prepare("SELECT * FROM password_recovery WHERE token=?");
        $res->execute([$token]);
        $row = $res->fetch(PDO::FETCH_ASSOC);
        $date = new DateTime(date('y-m-d H:i:s'));
        $date->sub(new DateInterval('PT' . 10 . 'M'));
        $res = $this->pdo->prepare("DELETE  FROM password_recovery  WHERE token=? ");
        $res->execute([$token]);
        if ($row == null or $date > new DateTime($row['date'])) {

            return false;
        } else {
            return $row["userID"];
        }
    }
    function removeQuestion($questionID)
    {
        $res = $this->pdo->prepare("DELETE FROM quiz WHERE id=?");

        $res->execute([$questionID]);
    }
    function checkPasswordRecovery($mail)
    {

        $res = $this->pdo->prepare("SELECT * FROM password_recovery WHERE userID=(SELECT id FROM users WHERE mail=?) LIMIT 1");
        $res->execute([$mail]);
        $row = $res->fetch(PDO::FETCH_ASSOC);
        $date = new DateTime(date('y-m-d H:i:s'));
        $date->sub(new DateInterval('PT' . 10 . 'M'));
        if ($row == null) {

            return true;
        } else if ($date > new DateTime($row['date'])) {

            $res = $this->pdo->prepare("DELETE  FROM password_recovery WHERE userID=(SELECT id FROM users WHERE mail=?) ");
            $res->execute([$mail]);
            return true;
        } else {
            return false;
        }
    }
    function addForgotPassword($mail, $token)
    {
        $date = new DateTime(date('y-m-d H:i:s'));
        $res = $this->pdo->prepare("INSERT INTO password_recovery (userID,token,date) VALUES((SELECT id FROM users WHERE mail=?),?,?)");
        $res->execute([$mail, $token, date('y-m-d H:i:s')]);
    }
    function getUsers($search)
    {

        $res = $this->pdo->prepare("SELECT *,COALESCE(points,0) AS points FROM users LEFT JOIN (SELECT COUNT(*) as points ,userID FROM answered_questions GROUP BY userID ) AS tmp ON tmp.userId=users.id  WHERE username LIKE ? AND admin=0");
        $res->bindValue(1, "%$search%", PDO::PARAM_STR);
        $res->execute();

        return $res;
    }
    function getUser($id)
    {

        $res = $this->pdo->prepare("SELECT users.* ,COALESCE(points,0) AS points FROM users LEFT JOIN (SELECT COUNT(*) as points ,userID FROM answered_questions GROUP BY userID ) AS tmp ON tmp.userId=users.id  WHERE users.id=? ");

        $res->execute([$id]);

        return $res->fetch(PDO::FETCH_ASSOC);
    }
    function getUserForApp($username)
    {

        $res = $this->pdo->prepare("SELECT users.* ,COALESCE(points,0) AS points FROM users LEFT JOIN (SELECT COUNT(*) as points ,userID FROM answered_questions GROUP BY userID ) AS tmp ON tmp.userId=users.id  WHERE users.username=? ");

        $res->execute([$username]);

        return $res->fetch(PDO::FETCH_ASSOC);
    }
    function getAllQuestions($userID)
    {

        $res = $this->pdo->prepare("SELECT * FROM quiz  WHERE quiz.id NOT IN (SELECT quizID FROM answered_questions WHERE userID=?)
LIMIT 100");

        $res->execute([$userID]);

        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    function setAnsweredQuestion($userID, $questionID)
    {

        $res = $this->pdo->prepare("INSERT INTO answered_questions (userID,quizID) VALUES(?,?)");
        $res->execute([$userID, $questionID]);
    }

    function getQuestions($search)
    {

        $res = $this->pdo->prepare("SELECT *,quiz.id AS quizID,users.username,COALESCE(tmp.count,0) AS count FROM quiz  LEFT JOIN users ON users.id=quiz.creator 
LEFT JOIN (SELECT COUNT(*) AS count,quizID FROM answered_questions GROUP BY quizID) AS tmp ON tmp.quizID=quiz.id
WHERE question LIKE ?");
        $res->bindValue(1, "%$search%", PDO::PARAM_STR);
        $res->execute();

        return $res;
    }
    function addQuestion($creator, $question, $a, $b, $c, $answer)
    {
        $res = $this->pdo->prepare("INSERT INTO quiz (creator,question,A,B,C,answer) VALUES(?,?,?,?,?,?)");
        $res->execute([$creator, $question, $a, $b, $c, $answer]);
    }
    function usernameCheck($username)
    {

        $res = $this->pdo->prepare("SELECT username FROM users WHERE username=?");
        $res->execute([$username]);
        if ($res->rowCount() == 0) {
            return true;
        } else {
            false;
        }
    }
    function getCoordinates()
    {
        $res = $this->pdo->prepare("SELECT coordinates,name,id FROM locations");
        $res->execute();
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }
    function mailCheck($mail)
    {

        $res = $this->pdo->prepare("SELECT mail FROM users WHERE mail=?");
        $res->execute([$mail]);
        if ($res->rowCount() == 0) {
            return true;
        } else {
            false;
        }
    }
    function addUser($username, $password, $mail)
    {

        $hashedPassword = password_hash($password, PASSWORD_BCRYPT, [12]);
        $res = $this->pdo->prepare("INSERT INTO users (username,password,mail,admin,ban,description,image) VALUES (?,?,?,?,?,?,?)");
        $admin = $this->utilities->isAdmin() ? 1 : 0;
        $res->execute([$username, $hashedPassword, $mail, $admin, 0, '', 'user_img/basic.png']);
    }
    function userLogin($username, $password)
    {


        $res = $this->pdo->prepare("SELECT * FROM users WHERE username=?");
        $res->execute([$username]);
        $row = $res->fetch(PDO::FETCH_ASSOC);
        if ($res->rowCount() == 1 and password_verify($password, $row['password']) == true) {

            return $row;
        } else {
            return [];
        }
    }

    function updatePassword($password, $id)
    {

        $res = $this->pdo->prepare("UPDATE users SET password=? WHERE id=?");
        $res->execute([password_hash($password, PASSWORD_BCRYPT, [12]), $id]);
    }
    function checkPassword($password, $id)
    {


        $res = $this->pdo->prepare("SELECT * FROM users WHERE id=?");
        $res->execute([$id]);
        $row = $res->fetch(PDO::FETCH_ASSOC);
        if ($res->rowCount() == 1 and password_verify($password, $row['password']) == true) {

            return true;
        }
        return false;
    }

    function addLocationImage($path, $locationID)
    {
        $res = $this->pdo->prepare("INSERT INTO images (locationID,image) VALUES (?,?)");
        $res->execute([$locationID, $path]);
    }
    function addCategory($category)
    {
        $categoryID = $this->pdo->prepare("SELECT * FROM categories WHERE category=? LIMIT 1");
        $categoryID->execute([$category]);
        $categoryID = $categoryID->fetch(PDO::FETCH_ASSOC);
        if ($categoryID == null) {
            $insertCategory = $this->pdo->prepare("INSERT INTO categories (category) VALUES (?)");
            $insertCategory->execute([$category]);
        }
    }
    function addLocation($name, $textBox, $coord, $category)
    {
        $this->addCategory($category);
        $res = $this->pdo->prepare("INSERT INTO locations (name,description,coordinates,categoryID) VALUES (?,?,?,(SELECT id FROM categories WHERE category=? LIMIT 1))");
        $res->execute([$name, $textBox, $coord, $category]);
        return   $this->pdo->lastInsertId();
    }

    function removefile($id)
    {
        $res = $this->pdo->prepare("DELETE FROM images WHERE id=?");
        $res->execute([$id]);
    }
    function updateLocation($id, $name, $textBox, $coord, $category)
    {
        $this->addCategory($category);
        $res = $this->pdo->prepare("UPDATE  locations SET name=?,description=?,coordinates=?,categoryID=(SELECT id
    FROM categories WHERE category=? LIMIT 1) WHERE id=?");
        $res->execute([$name, $textBox, $coord, $category, $id]);
    }


    function getTopRank()
    {

        $res = $this->pdo->prepare("SELECT id,username,description,image,COALESCE(points,0) AS points FROM users LEFT JOIN (SELECT COUNT(*) as points ,userID FROM answered_questions GROUP BY userID ) AS tmp ON tmp.userId=users.id ORDER BY points DESC LIMIT 100");
        $res->execute();
        return $res;
    }


    function updateDescription($description, $id)
    {

        $res = $this->pdo->prepare("UPDATE users SET description=? WHERE id=?");
        $res->execute([$description, $id]);
    }
    function updateProfilePicture($path, $id)
    {

        $res = $this->pdo->prepare("UPDATE users SET image=? WHERE id=?");
        $res->execute([$path, $id]);
    }
    function locationSearch($query, $search, $count)
    {

        $res = $this->pdo->prepare($query);

        for ($i = 0; $i < count($count); $i++) {

            if ($count[$i] == "userID") {
                $res->bindValue($i + 1, $_SESSION['id'], PDO::PARAM_INT);
            } else {
                $res->bindValue($i + 1, "%$search%", PDO::PARAM_STR);
            }
        }



        $res->execute();
        $row = $res->fetchAll(PDO::FETCH_ASSOC);
        return $row;
    }
    function getLocationsForMainPage()
    {

        $res = $this->pdo->prepare("SELECT locations.id,name,images.image FROM locations INNER JOIN images ON locations.id=images.locationID GROUP BY id 
ORDER BY RAND()
LIMIT 4");
        $res->execute();
        $locations = [];
        $blank = ["id" => null, "name" => "", "image" => "main_img/blank.png"];
        for ($i = 0; $i < 4; $i++) {
            $loc = $res->fetch(PDO::FETCH_ASSOC);
            array_push($locations, is_bool($loc) ? $blank : $loc);
        }

        return $locations;
    }
    function getLocation($id)
    {

        $res = $this->pdo->prepare("SELECT locations.id,name,description,coordinates,categories.category,tmp1.UpCount,tmp2.DownCount FROM locations INNER JOIN (SELECT COUNT(*) AS Upcount FROM votes WHERE locationID=? AND vote=1 )
AS tmp1 ON locations.id=? INNER JOIN 
(  SELECT COUNT(*) AS DownCount FROM votes WHERE locationID=? AND vote=0 )
AS tmp2 ON locations.id=? INNER JOIN categories ON categoryID=categories.id");
        $res->execute([$id, $id, $id, $id]);
        $row = $res->fetch(PDO::FETCH_ASSOC);
        return $row;
    }
    function getComments($id, $start, $limit)
    {


        $res = $this->pdo->prepare("SELECT comments.id,comments.userID,ban,admin,date,comment,username,image,COALESCE(points,0) AS points FROM comments  INNER JOIN users ON users.id=comments.userID 
LEFT JOIN(SELECT COUNT(*) AS points,userID FROM answered_questions GROUP BY userID) AS tmp ON tmp.userID=comments.userID

WHERE locationID=? ORDER BY date LIMIT ?,?");
        $res->execute([$id, $start, $limit]);
        $res = $res->fetchAll(PDO::FETCH_ASSOC);

        return $res;
    }
    function getCommentCount($id)
    {

        $res = $this->pdo->prepare("SELECT COUNT(*) AS count FROM comments WHERE locationID=?");
        $res->execute([$id]);
        $res = $res->fetch(PDO::FETCH_ASSOC);

        return $res;
    }
    function getUserComments($id, $start, $limit)
    {


        $res = $this->pdo->prepare("SELECT comments.id,comments.userID,comments.locationID,locations.name,ban,admin,date,comment,username,image FROM comments  INNER JOIN users ON users.id=comments.userID 
LEFT JOIN locations ON locations.id=comments.locationID

WHERE userID=? ORDER BY date ASC LIMIT ?,?");
        $res->execute([$id, $start, $limit]);
        $res = $res->fetchAll(PDO::FETCH_ASSOC);;
        return $res;
    }
    function getUserCommentsCount($id)
    {
        $res = $this->pdo->prepare("SELECT COUNT(*) AS count FROM comments  INNER JOIN users ON users.id=comments.userID 
LEFT JOIN locations ON locations.id=comments.locationID

WHERE userID=? ");
        $res->execute([$id]);
        $res = $res->fetch(PDO::FETCH_ASSOC);
        return $res;
    }
    function addComment($id, $comment)
    {



        $res = $this->pdo->prepare("INSERT INTO comments (userID,locationID,comment,date) VALUES(?,?,?,?)");
        $res->execute([$_SESSION['id'], $id, $comment, date('y-m-d H:i:s')]);

        $infoAboutUser = $this->pdo->prepare("SELECT id,username,image,COALESCE(points,0) AS points FROM users LEFT JOIN (SELECT COUNT(*) as points ,userID FROM answered_questions GROUP BY userID ) AS tmp ON tmp.userId=users.id WHERE id=?");
        $infoAboutUser->execute([$_SESSION['id']]);
        $row = $infoAboutUser->fetch(PDO::FETCH_ASSOC);
        return $row;
    }
    function getVote($userID, $locID)
    {


        $res = $this->pdo->prepare("SELECT vote FROM votes  WHERE userID=? AND locationID=?");
        $res->execute([$userID, $locID]);

        $row = $res->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    function setVote($userID, $locID, $vote)
    {

        $currentVote = $this->getVote($userID, $locID);
        if (is_bool($currentVote) == false) {
            $currentVote = $currentVote['vote'];
        } else {
            $currentVote = -1;
        }
        $this->removeVote($locID, $userID);
        if ($currentVote != $vote) {
            $res = $this->pdo->prepare("INSERT INTO votes (userID,locationID,vote) VALUES (?,?,?)");
            $res->execute([$userID, $locID, $vote]);
        }
    }
    function removeVote($locID, $userID,)
    {

        $res = $this->pdo->prepare("DELETE FROM votes WHERE userID=? AND locationID=? LIMIT 1");
        $res->execute([$userID, $locID]);
    }
    function removeComment($commentID)
    {

        $res = $this->pdo->prepare("DELETE FROM comments WHERE id=? LIMIT 1");
        $res->execute([$commentID]);
    }
    function ban($userID)
    {

        $check = $this->pdo->prepare("SELECT ban FROM users WHERE id=? AND admin=0");
        $check->execute([$userID]);
        $check = $check->fetch(PDO::FETCH_ASSOC);
        if ($check['ban'] == 0) {
            $value = 1;
        } else {
            $value = 0;
        }
        $res = $this->pdo->prepare("UPDATE users SET ban=? WHERE id=? AND admin=0");
        $res->execute([$value, $userID]);
        return $value;
    }
    function deleteLocation($locationID)
    {


        $this->pdo->prepare("DELETE FROM comments WHERE locationID=?")->execute([$locationID]);
        $this->pdo->prepare("DELETE FROM votes WHERE locationID=?")->execute([$locationID]);
        $this->pdo->prepare("DELETE FROM images WHERE locationID=?")->execute([$locationID]);
        $this->pdo->prepare("DELETE FROM locations WHERE id=?")->execute([$locationID]);


        return ["status" => true];
    }
    function getCategories()
    {


        $res = $this->pdo->prepare("SELECT category FROM categories");
        $res->execute();

        return $res;
    }
    function addMail($mail, $subject, $message)
    {
        $this->pdo->prepare("INSERT INTO mails (userID,subject,message) VALUES((SELECT id FROM users WHERE mail=?),?,?)")
            ->execute([$mail, $subject, $message]);
    }
    function getMail()
    {
        $res = $this->pdo->prepare("SELECT mails.*,users.mail FROM mails INNER JOIN users ON users.id=mails.userID LIMIT 1");
        $res->execute();
        $res = $res->fetch(PDO::FETCH_ASSOC);
        return $res;
    }
    function deleteMail($id)
    {
        $this->pdo->prepare("DELETE FROM mails WHERE id=?")->execute([$id]);
    }
    function getImages($id)
    {
        $res = $this->pdo->prepare("SELECT id,image FROM images WHERE locationID=?");
        $res->execute([$id]);
        return $res;
    }
}
