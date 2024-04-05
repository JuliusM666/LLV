class commentPagination{
    
    changeCommentPage(arrow){
    
    let newPage=this.page+arrow;
    
    if(newPage>=0 && newPage<this.pages){
    
        let href = new URL(window.location.href+this.linkName);
        href.searchParams.set('id', this.id);
        href.searchParams.set('page', newPage);
        
    let windows = window.open(href, "_self");
    
    }


   

}
    async removeCommentElement(commentID) {
        let comment = document.getElementById(commentID);

        
        comment.style="border:2px solid red; borderRadius:20%;";
        
        this.count-=1;
        if(this.asyncStatus==false){
            this.asyncStatus=true;
        await new Promise(resolve => setTimeout(resolve, 1000));
            if(this.count%this.limit==0){
                this.page-=1;
            }
            
            this.updatePagination(true,window.location.href,false);
           
            this.asyncStatus=false;
        }
        
        
        
    }
    removeComment(commentID) {

        let data = new FormData();

        data.append("commentID", commentID);


        fetch("php/AdminWorker.php", {
            method: "POST",

            body: data
        }).then(function (response) {
            return response.text();
        }).then((response) => {

            let res = JSON.parse(response);
            if(res==true){
                
            this.removeCommentElement(commentID);

            }
            else{
            alert("Duomenų bazės klaida")
            }





        });

    }
    
    increaseCount(){
    this.count+=1;
    }
    updatePagination(isEdit,isUserInfo){
    
    let href = new URL(window.location.href+this.linkName);
        href.searchParams.set('id', this.id);
        href.searchParams.set('page', this.page);
        window.history.pushState('page', 'Title', href);
        
    
    this.getPagination(isEdit);
    this.getComments(isEdit,isUserInfo);
        
    }
    getPagination(isEdit)
    {
        
        
        
        
        this.pages=Math.max(Math.ceil(this.count/this.limit),1);
        let link=window.location.href+this.linkName+"?";
       
        
        let pagesBlock=document.getElementById('pages');
        pagesBlock.innerHTML='';
        
        let li=document.createElement('li');
          li.className='page-item';
          
          let html='<a class="page-link bg-dark border-dark text-light" onclick="commentPag.changeCommentPage(-1)"><i class="bi bi-arrow-left-circle"></i></a>'
            li.innerHTML=html;
          pagesBlock.appendChild(li);
        
    
                   
      
          
                   
    
    
     let count=1;
     let arr=[this.page];
          
        while(arr.length<this.limit && count<this.limit){
             if(this.page-count>=0){
             
                 arr.unshift(this.page-count);
             
             }
             if(this.page+count<this.pages){
             arr.push(this.page+count);
             
             }
             count+=1;
         
         
         
         }
         
         
         
      for(let i in arr){
          
          let tmp="page-link bg-dark border-dark text-light link-primary";
          if(arr[i]==this.page){
          tmp="page-link bg-light border-dark text-dark link-primary";
          }
          let li=document.createElement('li');
          li.className='page-item'
          let pageCount=parseInt(arr[i])+1;
          let html='<a class="'+tmp+'" href="'+this.linkName+'?id='+this.id+'&page='+arr[i]+'">'+pageCount+'</a>'
            li.innerHTML=html;
          pagesBlock.appendChild(li);
     
          }
      
    li=document.createElement('li');
          li.className='page-item';
          
           html='<a class="page-link bg-dark border-dark text-light" onclick="commentPag.changeCommentPage(1)"><i class="bi bi-arrow-right-circle"></i></a>'
            li.innerHTML=html;
          pagesBlock.appendChild(li);
    }    
    
    
    getComments(isEdit,isUserInfo) {
        

            let data = new FormData();

             data.append("limit", this.limit);
            data.append("page", this.page);
            data.append("id", this.id);
            data.append("isUserInfo", isUserInfo);
            fetch("php/commentPaginationWorker.php", {
                method: "POST",

                body: data
            }).then(function (response) {
                return response.text();
            }).then((response) => {
                let block=document.getElementById('commentBlock');
        block.innerHTML='';
                let res = JSON.parse(response);
                
                for(let i in res){
                
                this.createComment(isEdit,res[i],isUserInfo);
                }

              
            });
        }

    createComment(isEdit,e,isUserInfo){
       
    let block=document.getElementById('commentBlock');
        
        let div=document.createElement('div');
            div.className="card mt-1";
        
        if(isEdit==false){
            
           
        let html='<div class="card-body" ><div class="card-text"><div class="row"> <div class="col-8 p-1">';
        html+='<h4 class="card-title " ><a   id="navbarLink" class="btn btn-light h4 fw-bold" href="userInfo.php?id='+e['userID']+'"> '+e['username']+'</a>';
        if(isUserInfo==true){
        html+='<a id="navbarLink"  class="btn btn-light h4 fw-bold" href="info.php?id='+e['locationID']+'"> '+e['name']+'</a>';
        }
            
            
        html+='</h4></div><div class="col-4 p-1 "><h6 class="fw-normal float-end text-break">'+e['date']+'</h6></div></div><img class="card-img-top" src="'+e['image']+'" id="ProfileImage"><p class="CommentText">  '+e['comment'].replace(/(\r\n|\r|\n)/g, '<br>')+'</p></div>';
            
        div.innerHTML=html;
        
        
        
        
        }
        else if(isEdit==true){
            
            let button=''
            if(e['ban']==0){
            
            button="btn btn-dark float-end";
            }
            else{
            
            button="btn btn-success float-end"
            }
        
        
         let html='<div   id='+e['id']+' name='+e['userID']+'><div class="card mt-1"><div class="card-body"><div class="card-text"><div class="row"> <div class="col-8 p-1"><h4 class="card-title">';
         
         html+=' <a   id="navbarLink" class="btn btn-light h4 fw-bold" '
        html+='href="userInfo.php?id='+e['userID']+'"> '+e['username']+'</a></h4></div><div class="col-4 p-1"><h6 class="fw-normal float-end">'+e['date']+'</h6></div></div><img class="card-img-top" src="'+e['image']+'" id="ProfileImage"><p class="CommentText"> '+e['comment'].replace(/(\r\n|\r|\n)/g, '<br>')+'</p> </div><button class="btn btn-danger float-end"  onclick=commentPag.removeComment('+e['id']+')><i class="bi bi-trash-fill"></i></button>';
   
             
        if(e['admin']==0) {   
    html+= '<button  class="'+button+'"  onclick=banUser('+e['userID']+') ><i class="bi bi-slash-circle"></i></button>';
   
        }
          html+='</div></div>';
        
         div.innerHTML=html;
        
        }
    block.appendChild(div);
    
    
    }


}




let commentPag=new commentPagination();

function setCommentPaginationVals(limit,page,count,id,link){
commentPag.limit=limit;
commentPag.page=page;
commentPag.pages=Math.max(Math.ceil(count/limit),1);
commentPag.count=count;
    commentPag.id=id;
    commentPag.asyncStatus=false;
    commentPag.linkName=link;

}