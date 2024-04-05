'use strict';
import {
    BaseValidator
} from './BaseValidator.js';

window.changePassword = function (event) {

    const UserFunc = new UserFunctions();
    const oldPass = document.getElementById("pass").value.toString();
    const newPass = document.getElementById("newPass").value.toString();
    const comNewPass = document.getElementById("ComNewPass").value.toString();

    UserFunc.validatePassword(newPass, comNewPass, oldPass);

}
window.changeDescription = function (event) {

    const UserFunc = new UserFunctions();
    const description = document.getElementById("textBox").value.toString();


    UserFunc.validateDescription(description);

}
window.changeProfilePicture = function (event) {

    const UserFunc = new UserFunctions();
    const file = document.getElementById('file').files[0];


    UserFunc.validaProfilePicture(file);

}
window.showImage = function (input) {
    let reader = new FileReader();
    reader.onload = function (e) {

        document.getElementsByClassName('image')[0].setAttribute("src", e.target.result);
    };


    reader.readAsDataURL(input.files[0]);

}
class UserFunctions {

    constructor() {
        this.domPassword = document.getElementById("errorsPassword");
        this.domDescription = document.getElementById("errorsDescription");
        this.domPicture = document.getElementById("errorsPicture");
        this.BaseValidator = new BaseValidator("", "");
    }

    validatePassword(newPass, comNewPass, oldPass) {
        this.domPassword.innerHTML = "";
        this.BaseValidator.setPass(newPass);
        if (newPass != comNewPass) {

            this.BaseValidator.createMessage("Slaptažodžiai nesutampa", "red", this.domPassword);

        } else if (this.BaseValidator.validatePassword(this.domPassword) == true) {
            this.domPassword.innerHTML = "";
            var data = new FormData();


            data.append("newPass", newPass);
            data.append("comNewPass", comNewPass);
            data.append("oldPass", oldPass);

            fetch("php/UserFunctionsWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {

                let res = JSON.parse(response);
                for (let i in res) {
                    this.BaseValidator.createMessage(i, res[i], this.domPassword);
                }


            });
        }


    }
    validateDescription(description) {
        if (description.lenght > 100) {

            this.BaseValidator.createMessage("Per ilgas aprašymas", "red", this.domDescription);
        } else {
            this.domDescription.innerHTML = "";
            var data = new FormData();


            data.append("description", description);


            fetch("php/UserFunctionsWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {

                let res = JSON.parse(response);
                if (res.hasOwnProperty("Aprašymas atnaujintas")) {

                    document.getElementById("descriptionText").innerHTML = description.replaceAll(/\n/g,'<br>');
                }
                for (let i in res) {

                    this.BaseValidator.createMessage(i, res[i], this.domDescription);
                }


            });


        }




    }

    validaProfilePicture(file) {
        this.domDescription.innerHTML = "";
        var data = new FormData();


        data.append("file", file);

        fetch("php/UserFunctionsWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            let res = JSON.parse(response);
            if (res.hasOwnProperty("path")) {

                document.getElementById("ProfileImageRound").src = res["path"];
                delete res["path"];
            }
            for (let i in res) {

                this.BaseValidator.createMessage(i, res[i], this.domPicture);
            }


        });


    }



}