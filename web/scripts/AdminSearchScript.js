'use strict';

function SearchUser() {
    let link = "adminSearch.php?";


    let windows = window.open((link + new URLSearchParams({
        search: document.getElementById("UserSearch").value.toString(),
        switch: "user",
    })), "_self");

}

function SearchQuestion() {
    let link = "adminSearch.php?";


    let windows = window.open((link + new URLSearchParams({
        search: document.getElementById("QuestionSearch").value.toString(),
        switch: "question",
    })), "_self");

}

function setValues(search, switchCode) {

    if (switchCode == "user") {
        document.getElementById("UserSearch").value = search;
        document.getElementById("userTab").className = "nav-link active";
        document.getElementById("questionTab").className = "nav-link";
        document.getElementById("userTabPane").className = "tab-pane fade show active";
        document.getElementById("questionTabPane").className = "tab-pane fade";
    } else if (switchCode == "question") {

        document.getElementById("QuestionSearch").value = search;
        document.getElementById("questionTab").className = "nav-link active";
        document.getElementById("userTab").className = "nav-link";
        document.getElementById("userTabPane").className = "tab-pane fade";
        document.getElementById("questionTabPane").className = "tab-pane fade show active";
    }

}