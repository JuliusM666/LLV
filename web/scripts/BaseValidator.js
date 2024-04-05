'use strict';
import {messageCreator} from './messageCreator.js';
export class BaseValidator extends messageCreator{

constructor(name,pass){
    super();
    this.name=name;
    this.pass=pass;
    


}
    
  
 
    setPass(val){
    
    this.pass=val;
    
    }
     validateUsername(dom){
         
        
        if(this.name.length<6 || this.name.length>15){
            
            this.createMessage("slapyvardį turi sudaryti 6-15 simboliai","red",dom)
           
            return false;
        
        }
        const re = new RegExp('^[A-Z0-9]{6,15}$',"i");
        let matching=this.name.match(re)
        
        if(matching===null){
       
            this.createMessage("slapyvardį turi sudaryti tik raidės ir skaičiai","red",dom);
           return false;
        
        }
        
        return true;
    
    }
    validatePassword(dom){
      
    
    if(this.pass.length<8 || this.pass.length>15 ){
        this.createMessage("slaptažodį turi sudaryti 8-15 simboliai","red",dom);
      
           
            return false;
    
    }
        const re = new RegExp(/[!@#\$%\^\&*\)\(+=\._\-\?~\|\\\/<>\[\]\{\}]+/,"g");
    
    let matching=this.pass.match(re);
       
        if(matching===null){
       
            this.createMessage("slaptažodis turi turėti bent vieną specialų simbolį","red",dom);
            return false;
        
        }
    
    return true;
    }

}