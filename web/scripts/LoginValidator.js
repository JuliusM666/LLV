'use strict';
import {
    BaseValidator
} from './BaseValidator.js';


window.LoginValidation = function (event) {

    const name = document.getElementById("username").value.toString();
    const pass = document.getElementById("pass").value.toString();


    const validator = new LoginValidator(name, pass);
    validator.validateLogin();
}


class LoginValidator extends BaseValidator {

    constructor(name, pass) {
        super(name, pass);

        this.dom = document.getElementById("errors");

    }


    validateLogin() {
        this.dom.innerHTML = "";
        let x = this.validateUsername(this.dom);
        let y = this.validatePassword(this.dom);


        if (x !== false && y !== false) {
            this.dom.innerHTML = "";
            let data = new FormData();
            data.append("username", this.name);
            data.append("password", this.pass);



            fetch("php/LoginWorker.php", {
                method: "POST",

                body: data
            }).then((response) => {
                if (response.ok) {
                    return response.json();
                }
                return Promise.reject(response);

            }).then((res) => {


                
                if (res == true) {
                    this.createMessage("Sėkmingai Prisijungta", "green", this.dom);
                    window.location.replace("main.php");

                } 
                
                else if(res.hasOwnProperty('Duomenų bazės klaida')){
                        alert('Duomenų bazės klaida');
                        
                        }
                else {
                    this.createMessage("Netinkamas slapyvardis arba slaptažodis", "red", this.dom);
                }
            }).catch((error) => {
                console.error('Error:', error);
            });
        }


    }









}