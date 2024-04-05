'use strict';
 import {
            messageCreator
        } from './messageCreator.js';


function DeleteImage(evt){

    
    
   
    if(evt.currentTarget.parentElement.id[0]!='i'){
        adValidator.removedFiles.push(evt.currentTarget.parentElement.id);
    }
    delete adValidator.files[evt.currentTarget.parentElement.id]
    evt.currentTarget.parentElement.remove();
    adValidator.total-=1;

}

window.add = function (id) {
        


            
            adValidator.setValues(id);
            
            if (adValidator.ValidateInput() == true) {
                adValidator.addWorker();
                
            }
    
        }
window.displayImages= function (id) {
        


            
            let data = new FormData();
                
               
                let doc=document.getElementsByClassName("images")[0];
                doc.innerHTML='';
                data.append("id",id);
                
                fetch("php/imageWorker.php", {
                    method: "POST",

                    body: data
                }).then(function (response) {
                    return response.text();
                }).then((response) => {
                   let res = JSON.parse(response)
                    
                    for (let i in res) {
                        
                         const blank = document.getElementById("copyImageDivElement");
                const clone = blank.cloneNode(true);
                clone.removeAttribute("hidden");
                clone.id=res[i]['id'];
               
                
                clone.getElementsByClassName("btn btn-danger")[0].addEventListener("click",DeleteImage);
                clone.getElementsByClassName("image")[0].setAttribute("src",res[i]['image']);
                
                
                doc.appendChild(clone);
                        adValidator.total+=1;

                }



                } )};
        
function handleFileSelect(event) {
    
    let files = event.target.files;
    let doc=document.getElementsByClassName("images")[0];
    
    for (let i = 0, f; f = files[i]; i++) {

        
        
        var reader = new FileReader();

        
        reader.onload = (function (theFile) {
            return function (e) {
                
                const blank = document.getElementById("copyImageDivElement");
                const clone = blank.cloneNode(true);
                clone.removeAttribute("hidden");
                clone.id="image"+adValidator.count;
               
                
                clone.getElementsByClassName("btn btn-danger")[0].addEventListener("click",DeleteImage);
                clone.getElementsByClassName("image")[0].setAttribute("src",e.target.result);
                
                
                doc.appendChild(clone);
               
                adValidator.files["image"+adValidator.count]=document.getElementById('file').files[i];
                 adValidator.count+=1;
                adValidator.total+=1;
                 
            };
        })(f);

        
        reader.readAsDataURL(f);
    }
}

document.getElementById('file').addEventListener('change', handleFileSelect, false);  
        



window.Clear = function () {
            document.getElementById("name").value = null;
            document.getElementById("textBox").value = null;
            document.getElementById('file').files = null;
            document.getElementById("file").value = null;
            document.getElementById("coord").value = null;
            document.getElementById("category").value = null;
            document.getElementById("image").setAttribute("src", "");
            document.getElementById("image").style = "";
        }




       
        class AddValidator extends messageCreator {
          
            constructor() {
                super();
                
                this.removedFiles=[];
                this.files = [];
                this.count=0;
                this.total=0;
                


            }
            setValues(id){
            this.id = id.toString();
            this.name = document.getElementById("name").value.toString();
                this.textBox = document.getElementById("textBox").value.toString();
            this.picture = document.getElementById("file").value.toString();
                this.coord = document.getElementById("coord").value.toString();
                this.category = document.getElementById("category").value.toString();
                this.dom = document.getElementById("errors");
            }
            unSetValues(){
            
           this.removedFiles=[];
                this.files = [];
                this.count=0;
                this.total=0;
            }

            ValidateInput() {

                
                this.dom.innerHTML = "";
               
                if (this.category == '' && this.id != 'none') {

                    this.category = document.getElementById('category').getAttribute("placeholder");
                    
                }
                
                if (this.name == "" ||this.total<1 ||this.textBox == "" || this.files == null || this.coord == "" || this.category == "") {
                    

                    this.createMessage("Neužpildyti laukai", "red",this.dom);
                    return false;
                } else if (this.name.lenght > 100) {
                    this.createMessage("Per ilgas pavadinimas", "red",this.dom);
                    return false;

                } else if (this.textBox.lenght > 5000) {
                    this.createMessage("Per ilgas aprašymas", "red",this.dom);
                    return false;

                } else if (this.coord.lenght > 100) {
                    this.createMessage("Per ilgos koordinatės", "red",this.dom);
                    return false;

                } else if (this.category.lenght > 100) {
                    this.createMessage("Per ilga kategorija", "red",this.dom);
                    return false;

                } else if (this.picture.replace(/^.*[\\\/]/, '').lenght > 100) {
                    this.createMessage("Per ilgas paveikslėlio pavadinimas", "red",this.dom);
                    return false;

                }
                return true;


            }
            addWorker() {
                this.dom.innerHTML = "";




                let data = new FormData();
                
                let i=0;
                for(let key in this.files){
                data.append(i,this.files[key]);
                i+=1;
                }
               
                data.append("removedFiles",this.removedFiles.join(','));
                data.append("count",i);
                data.append("name", this.name);
                data.append("textBox", this.textBox);
                data.append("coord", this.coord);
                data.append("id", this.id);
                data.append("category", this.category);

                fetch("php/addWorker.php", {
                    method: "POST",

                    body: data
                }).then(function (response) {
                    return response.text();
                }).then((response) => {
                    let res = JSON.parse(response);
                    for (let i in res) {

                        this.createMessage(i, res[i],this.dom);

                    }
                    
                    document.getElementById.placeholder=this.category;
                    displayImages(this.id);
                    this.unSetValues();
                    }



                )};
            }

let adValidator=new AddValidator();

        