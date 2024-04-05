'use strict';
import {
    messageCreator
} from './messageCreator.js';






window.addComment = (id) => {

    commenter.comment=document.getElementById("comment").value.toString();
    commenter.id=id;
    commenter.validateComment();

}

window.getVote = (id) => {



    const voter = new Voter(id);
    voter.showVote();


}
window.setVote = (vote, id) => {



    const voter = new Voter(id);
    voter.addVote(vote);


}



class Voter {

    constructor(id) {

        this.id = id;
        this.upDom = document.getElementsByClassName("arrows")[0];
        this.downDom = document.getElementsByClassName("arrows")[1];
        this.upCounter = document.getElementById("positive");
        this.downCounter = document.getElementById("negative");
        this.upBlankImage = "main_img/up-blank.png";
        this.upFullImage = "main_img/up-full.png";
        this.downBlankImage = "main_img/down-blank.png";
        this.downFullImage = "main_img/down-full.png";
    }

    showVote() {
        this.upDom.src = this.upBlankImage;
        this.downDom.src = this.downBlankImage;
        let data = new FormData();
        data.append("locationID", this.id);
        fetch("php/UserFunctionsWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {
            let res = JSON.parse(response);
            if(res.hasOwnProperty("Duomenų bazės klaida")){
            return false;
            }
            else if (res['vote'] == 1) {
                this.upDom.src = this.upFullImage;
            } else if (res['vote'] == 0) {

                this.downDom.src = this.downFullImage;
            }
            this.upCounter.innerHTML = res['UpCount'];
            this.downCounter.innerHTML = res['DownCount'];



        });


    }

    addVote(vote) {


        let data = new FormData();
        data.append("vote", vote);
        data.append("locationID", this.id);

        fetch("php/UserFunctionsWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            this.showVote();



        });


    }

}








class Commenter extends messageCreator {


    constructor(errors, comment) {
        super()
        this.erorrs = errors;
        
        
        
        
    }
    validateComment() {
        this.erorrs.innerHTML = "";
        
       
        let newLines=this.comment.match(/\n/g);
        if(newLines!=null){
        newLines=newLines.length;
        
        }
        if (this.comment.lenght > 300 ||  newLines>5){

            this.createMessage("Per ilgas komentaras", "red", this.erorrs);
        } else if (this.comment.trim() === "") {

            this.createMessage("Tuščias komentaras", "red", this.erorrs);

        } else {

            let data = new FormData();


            data.append("comment", this.comment);
            data.append("id", this.id);

            fetch("php/UserFunctionsWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {
                let res = JSON.parse(response);

                if (res.hasOwnProperty('username')) {
                   
                    
                        
                        this.createMessage("Sėkmingai pridėta", "green", this.erorrs);
                    document.getElementById("comment").value = "";
                        
                    
                    
                    }
                    
                    
                else {
                    for (let i in res) {

                        this.createMessage(i, res[i], this.erorrs);
                    }
                }
            });
        }

    }




    createCommentElement(username, image, points,userID) {

        const blank = document.getElementById("copy");
        const clone = blank.cloneNode(true);
        const dateElement=clone.getElementsByTagName('h6')[0];
        
        const date=new Date().toLocaleString('lt-LT', { timeZone: 'Europe/Vilnius' });
        
       
        
        dateElement.innerHTML=date;
        
        clone.removeAttribute("hidden");
        
        clone.getElementsByClassName("btn btn-light h4 fw-bold")[0].innerHTML = username;
        clone.getElementsByClassName("btn btn-light h4 fw-bold")[0].href="userInfo.php?id="+userID;
        
        clone.getElementsByClassName("card-img-top")[0].src = image;
        clone.getElementsByClassName("CommentText")[0].innerHTML = this.comment.replaceAll(/\n/g,'<br>');
        document.getElementById("commentBlock").appendChild(clone);

    }
   

}
const dom = document.getElementById("errors");
    
    
    const commenter = new Commenter(dom);
