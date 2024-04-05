'use-strict';

class ScrollFetch {

    constructor(limit) {
        this.start = 0;
        this.limit = limit;
        this.admin = null;
        this.search = null;
        this.cat1 = null;
        this.cat2 = null;
        this.cat3 = null;
        this.cat4 = null;
        this.fullyLoaded = false;
        this.isLoading = false;


    }
    setValues(cat1, cat2, cat3, cat4, search, admin) {
        this.cat1 = cat1;
        this.cat2 = cat2;
        this.cat3 = cat3;
        this.cat4 = cat4;
        this.search = search;
        this.admin = admin;
        this.fetchData();
    }
    createSearchBlock(id, name, upVotes, downVotes) {

        let div = document.createElement("a");
        div.className = "SearchBlock";
        div.id = id;
        div.href=("info.php?" + new URLSearchParams({
        id: id,
    }))
        /*div.addEventListener("click", function () {
            openInfo(id);
        });*/
        let html = '<h4 style=" display: inline-block">' + name + '<span id="positive">' + upVotes + '</span> <span id="negative"> ' + downVotes + '</span></h4>';
        if (this.admin == 1) {
            html += '<button class="form-control btn btn-danger" type="button" style="display: flex; justify-content: center; float:right;width:5%;" onclick="searchDeleteLocation(' + id + ')" onmouseover="OverDeleteButtonHover(' + id + ')"  onmouseout="OutDeleteButtonHover(' + id + ')"> <i class="bi bi-trash-fill"></i></button>';
        }
        div.innerHTML = html;

        return div;


    }
    async fetchData() {
        
        if (this.fullyLoaded === true || this.isLoading == true || this.start>100) {
            return false;
        }
        this.isLoading = true;
        let loadElement = document.createElement("img");
        loadElement.src = "main_img/Loading_icon.gif"
        loadElement.id = "LoadingCircle";
        document.getElementById("circleFrame").appendChild(loadElement);
        await new Promise(resolve => setTimeout(resolve, 1000));
        loadElement.remove();
        let data = new FormData();
        data.append("cat1", this.cat1);
        data.append("cat2", this.cat2);
        data.append("cat3", this.cat3);
        data.append("cat4", this.cat4);
        data.append("search", this.search);
        data.append("start", this.start);
        data.append("limit", this.limit);

        fetch("php/SearchWorker.php", {
            method: "POST",

            body: data
        }).then((response) => {
            if (response.ok) {
                return response.json();
            }
            return Promise.reject(response);

        }).then((res) => {
            
            this.start += this.limit;
            
            
            let box = document.getElementById('SearchBox');
            if(res.hasOwnProperty("Duomenų bazės klaida")){
            
            return false;
            }
            else if (res.length == 0) {
                this.fullyLoaded = true;

            }
            for (let i in res) {
                box.appendChild(this.createSearchBlock(res[i]['id'], res[i]['name'], res[i]['UpVotes'], res[i]['DownVotes']))




            }
            this.isLoading = false;

            
        }).catch((error) => {
            console.error('Error:', error);
        });

    }
}
let dataFetcher = new ScrollFetch(10);
window.addEventListener('scroll', function (event) {
    let element = event.target;

    if (element.documentElement.scrollHeight - element.documentElement.scrollTop >= element.documentElement.clientHeight) {

        dataFetcher.fetchData();
    }
});