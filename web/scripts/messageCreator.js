'use strict';
export class messageCreator {
    constructor() {

    }
    createMessage(text, color, dom) {

        let tmp = document.createElement("div");
        tmp.style.color = color;
        if (color == "red") {
            text = "&#10060 " + text;
        } else {
            text = "&#x2705 " + text;
        }
        tmp.innerHTML = text;
        dom.appendChild(tmp);

    }

}