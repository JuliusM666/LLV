'use strict';
import {
    BaseValidator
} from './BaseValidator.js';

window.RegistrationValidation = function (event) {


    const name = document.getElementById("username").value.toString();
    const pass = document.getElementById("pass").value.toString();

    const comPass = document.getElementById("comPass").value.toString();
    const email = document.getElementById("email").value.toString();

    const validator = new RegisterValidator(name, pass, comPass, email);
    validator.validateRegistration();
}







class RegisterValidator extends BaseValidator {

    constructor(name, pass, comPass, email) {
        super(name, pass);
        this.comPass = comPass;
        this.mail = email;

        this.dom = document.getElementById("errors");

    }



    validateRegistration() {
        this.dom.innerHTML = "";

        let x = this.validateUsername(this.dom);
        let y = this.registerValidatePassword();


        if (x !== false && y !== false) {
            this.dom.innerHTML = "";
            var data = new FormData();
            data.append("username", this.name);
            data.append("password", this.pass);
            data.append("comPassword", this.comPass);
            data.append("mail", this.mail);


            fetch("php/RegisterWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {

                let res = JSON.parse(response);
                let count = 0

                for (let i in res) {
                    if (res[i] == "green") {
                        count += 1;
                    }

                    this.createMessage(i, res[i], this.dom);
                }
                if (count == 3) {
                    
                   
                    location.href=("main.php");
                }



            });
        }


    }




    registerValidatePassword() {

        if (this.pass != this.comPass) {
            this.createMessage("slaptažodžiai nesutampa", "red", this.dom);


            return false;

        }

        return this.validatePassword(this.dom);
    }



}