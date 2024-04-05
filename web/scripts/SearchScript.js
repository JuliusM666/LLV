'use strict';

function openUserInfo(id){


   let link = "userInfo.php?";


    let windows = window.open((link + new URLSearchParams({
        id: id,
    })), "_self");

}
function SearchMainPage() {

    const searchData = document.getElementById("search").value.toString();
    const Searcher = new SearchScript("Pavadinimas", "upAbc", "", "", searchData);
    Searcher.startSearch();

}

function Search() {

    const cat1 = document.getElementsByName("category1")[0].value.toString();
    const cat2 = document.getElementsByName("category2")[0].value.toString();
    const cat3 = document.getElementsByName("category3")[0].value.toString();
    const cat4 = document.getElementsByName("category4")[0].value.toString();
    const searchData = document.getElementById("search").value.toString();
    const Searcher = new SearchScript(cat1, cat2, cat3, cat4, searchData);
    Searcher.startSearch();
}

function setValues(cat1, cat2, cat3, cat4, search) {

    cat1 = (cat1 === "") ? "Pavadinimas" : cat1;
    cat2 = (cat2 === "") ? "upAbc" : cat2;
    cat3 = (cat3 === "") ? "" : cat3;
    cat4 = (cat4 === "") ? "" : cat4;
    document.getElementsByName("category1")[0].value = cat1;
    document.getElementsByName("category2")[0].value = cat2;
    document.getElementsByName("category3")[0].value = cat3;
    document.getElementsByName("category4")[0].value = cat4;
    document.getElementById("search").value = search;


}

function openInfo(id) {
    let link = "info.php?";


    let windows = window.open((link + new URLSearchParams({
        id: id,
    })), "_self");

}

function openInfoAdmin(id) {
    let link = "edit.php?";


    let windows = window.open((link + new URLSearchParams({
        id: id,
    })), "_self");

}

class SearchScript {

    constructor(cat1, cat2, cat3, cat4, search) {

        this.cat1 = cat1;
        this.cat2 = cat2;
        this.cat3 = cat3;
        this.cat4 = cat4;
        this.search = search;

    }
    startSearch() {



        window.open(('search.php?' + new URLSearchParams({
            cat1: this.cat1,
            cat2: this.cat2,
            cat3: this.cat3,
            cat4: this.cat4,
            search: this.search,
        })), "_self");



    }

}