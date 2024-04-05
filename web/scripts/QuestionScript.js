'use strict';


window.setColor = () => {

    let questionScript = new QuestionScript();
    questionScript.setColor();
}
window.selectAnswer = (button) => {

    let questionScript = new QuestionScript();
    questionScript.selectAnswer(button);
}
window.addQuestion = () => {

    let questionScript = new QuestionScript();
    questionScript.addQuestion();
}

window.clearQuestion = () => {

    let questionScript = new QuestionScript();
    questionScript.clearQuestion();
}

import {
    messageCreator
} from './messageCreator.js';
class QuestionScript extends messageCreator {

    constructor() {
        super();
        this.question = document.getElementById("question").value.toString();
        this.a = document.getElementById("a").value.toString();
        this.b = document.getElementById("b").value.toString();
        this.c = document.getElementById("c").value.toString();
        this.aButton = document.getElementsByName("a")[0];
        this.bButton = document.getElementsByName("b")[0];
        this.cButton = document.getElementsByName("c")[0];
        this.errors = document.getElementById("errors");

    }

    clearQuestion() {
        this.question = document.getElementById("question").value = null;
        this.a = document.getElementById("a").value = null;
        this.b = document.getElementById("b").value = null;
        this.c = document.getElementById("c").value = null;
        this.setColor();
    }
    setColor() {
        this.aButton.className = "btn btn-danger mt-2";
        this.bButton.className = "btn btn-danger mt-2";
        this.cButton.className = "btn btn-danger mt-2";
        this.aButton.value = 0;
        this.bButton.value = 0;
        this.cButton.value = 0;
    }
    selectAnswer(button) {
        this.setColor();
        button.className = "btn btn-success mt-2"
        button.value = 1;
    }
    addQuestion() {


        if (this.validateInput() === false) {
            return false;
        }

        if (this.aButton.value == 1) {
            this.answer = 1;
        } else if (this.bButton.value == 1) {
            this.answer = 2;
        } else if (this.cButton.value == 1) {
            this.answer = 3;
        }
        var data = new FormData();
        data.append("question", this.question);
        data.append("a", this.a);
        data.append("b", this.b);
        data.append("c", this.c);
        data.append("answer", this.answer);



        fetch("php/QuestionWorker.php", {
            method: "POST",

            body: data
        }).then((response) => {
            if (response.ok) {
                return response.json();
            }
            return Promise.reject(response);

        }).then((res) => {
            for (let i in res) {
                this.createMessage(i, res[i], this.errors);
            }


        }).catch((error) => {
            console.error('Error:', error);
        });
    }
    validateInput() {
        this.errors.innerHTML = "";
        if (this.question.length > 500 || this.question.trim().length == 0) {
            this.createMessage("Netinkamas klausimo ilgis", "red", this.errors);
            return false;
        } else if (this.a.length > 200 || this.a.trim().length == 0 || this.b.length > 200 || this.b.trim().length == 0 || this.c.length > 200 || this.c.trim().length == 0) {
            this.createMessage("Netinkamas atsakymo ilgis", "red", this.errors);
            return false;

        } else if (this.aButton.value == 0 && this.bButton.value == 0 && this.cButton.value == 0) {
            this.createMessage("Pasirinkite atsakymą", "red", this.errors);
            return false;

        }
        return true;
    }
}