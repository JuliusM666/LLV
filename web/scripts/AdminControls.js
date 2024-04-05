'use strict';

function resizeTextArea(){
    let textArea=document.getElementById("textBox");
    textArea.style.height = textArea.scrollHeight + "px";


}

function banUser(userID) {

    event.stopPropagation();
    let controls = new AdminControls();
    controls.ban(userID);

}

function searchDeleteLocation(locationID) {
    
    event.preventDefault();
    event.stopPropagation();
    if (deleteConfirmation() == true) {
        let controls = new AdminControls();
        controls.searchDeleteLocation(locationID);
    }
}
    

function deleteLocation(locationID) {
    if (deleteConfirmation() == true) {
        let controls = new AdminControls();
        controls.deleteLocation(locationID);
    }
}

function deleteQuestion(questionID) {
    event.stopPropagation();

    if (deleteConfirmation() == true) 
    {let controls = new AdminControls();
    controls.deleteQuestion(questionID);
                                      }
}

function deleteConfirmation() {

    let confirmation = confirm("Ar tikrai norite ištrinti?");
    return confirmation;

}

function setAnswer(id, answer) {

    let controls = new AdminControls();
    controls.setAnswer(id, answer);


}

function OverDeleteButtonHover(id) {
    
    
    document.getElementById(id).style="background: linear-gradient(to top, #ff0844 0%, #ffb199 100%)";
     
}

function OutDeleteButtonHover(id) {

    document.getElementById(id).style.removeProperty("background");
}
class AdminControls {




    constructor() {



    }
    ban(userID) {

        let data = new FormData();

        data.append("banID", userID);


        fetch("php/AdminWorker.php", {
            method: "POST",

            body: data
        }).then((response) => {
            if (response.ok) {
                return response.json()
            };
        }).then((res) => {


            this.UpdateBanButtons(userID, res);
        });









    }
    deleteLocation(locationID) {
        let data = new FormData();
        data.append("locationID", locationID);


        fetch("php/AdminWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            let res = JSON.parse(response);
            if (res['status'] == true) {

                alert("Sėkmingai ištrinta");
                window.location.replace("search.php");

            } else {
                alert("Klaida ištrinant");
            }

        });









    }
    searchDeleteLocation(locationID) {
        let data = new FormData();
        data.append("locationID", locationID);


        fetch("php/AdminWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            let res = JSON.parse(response);
            if (res['status'] == true) {
                let seacrhBlock = document.getElementById(locationID);
                seacrhBlock.remove();


            } else {
                alert("Klaida ištrinant");
            }

        });









    }
    deleteQuestion(questionID) {
        let data = new FormData();
        data.append("deleteQuestionID", questionID);


        fetch("php/AdminWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            
            document.getElementById('q' + questionID).remove();
            document.getElementById('a' + questionID).remove();
        });









    }
    UpdateBanButtons(userID, res) {
        let comments = document.getElementsByName(userID)

        let value = res === 0 ? "btn btn-dark float-end" : "btn btn-success float-end";

        for (let i = 0; i < comments.length; i++) {
            let element=comments[i].getElementsByTagName("button")[1]
            if(element==null){
            element=comments[i].getElementsByTagName("button")[0]
            }
            element.className = value;

        }

    }
    
    setAnswer(id, answer) {

        document.getElementsByName('A' + id)[0].style = "background-color:red";
        document.getElementsByName('B' + id)[0].style = "background-color:red";
        document.getElementsByName('C' + id)[0].style = "background-color:red";
        if (answer == 1) {
            document.getElementsByName('A' + id)[0].style = "background-color:green";
        } else if (answer == 2) {
            document.getElementsByName('B' + id)[0].style = "background-color:green";
        } else if (answer == 3) {
            document.getElementsByName('C' + id)[0].style = "background-color:green";
        }
    }

}