'use strict';

import {
    BaseValidator
} from './BaseValidator.js';

window.validateRecovery = () => {

 let mail=document.getElementById("email").value.toString();
    let forgotPassword=new ForgotPassword();
    forgotPassword.validateMail(mail);

}
window.validatePassword = (token) => {

     
    const newPass = document.getElementById("newPass").value.toString();
    const comNewPass = document.getElementById("ComNewPass").value.toString();
 let forgotPassword=new ForgotPassword();
    forgotPassword.RecoveryValidatePassword(newPass,comNewPass,token);

}

class ForgotPassword extends BaseValidator{

constructor() {
super();
this.dom=document.getElementById("errors");

}

    validateMail(mail){
        this.dom.innerHTML="";
          let data = new FormData();
            data.append("mail", mail);
            



            fetch("php/UserFunctionsWorker.php", {
                method: "POST",

                body: data
            }).then((response) => {
                if (response.ok) {
                    return response.json();
                }
                return Promise.reject(response);

            }).then((res) => {

                
                for(let i in res){
                
                this.createMessage(i,res[i],this.dom);
                }
                
            }).catch((error) => {
                console.error('Error:', error);
            });
    
    
    }
    RecoveryValidatePassword(newPass, comNewPass,token) {
        this.dom.innerHTML = "";
        this.pass=newPass;
        if (newPass != comNewPass) {

            this.createMessage("Slaptažodžiai nesutampa", "red", this.dom);

        } else if (this.validatePassword(this.dom) == true) {
            
            var data = new FormData();


            data.append("newPass", newPass);
            data.append("comNewPass", comNewPass);
            data.append("token", token);
                
            fetch("php/UserFunctionsWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {

                let count=0;
                let res = JSON.parse(response);
                for (let i in res) {
                    if(res[i]=='green'){
                    count+=1;
                    }
                    this.createMessage(i, res[i], this.dom);
                }
                        if(count==2){
                    
                    window.location.replace("main.php");
                    
                    }


            });
        }


    }
}