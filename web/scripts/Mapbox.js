'use-struct';




class MapBox {



    constructor() {
        
        
        
        

    }
    setAcessToken(acessToken){
        this.acessToken=acessToken;
        this.currentMarker = new mapboxgl.Marker();
        this.map = this.createMap();
        this.map.addControl(this.createGeocoder());
        this.markers = [];
    }
    createGeocoder() {


        return new MapboxGeocoder({

            accessToken: this.acessToken,
            mapboxgl: mapboxgl,
            marker: false,
            placeholder: 'Ieškokite veitovės',
            bbox: [20, 53, 27, 58],
            proximity: {
                longitude: -100,
                latitude: 100,
            }
        });

    }

    createMap() {
        mapboxgl.accessToken = this.acessToken;
        return new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [23.876584680927113, 55.27399820166478],
            zoom: 15,
        });
    }
    mapClickEvent() {
        this.map.on('click', (e) => {

            this.currentMarker.remove();
            this.marker = new mapboxgl.Marker();
            let x = e.lngLat.wrap();
            this.marker.setLngLat(x).addTo(this.map);
            this.currentMarker = this.marker;
            document.getElementById('coord').value = x.lat + "," + x.lng;
        });
    }




    updateMap() {
        const coords = document.getElementById("coord").value.toString();

        const coordinates = coords.split(",");

        if (coordinates.length == 2) {
            this.currentMarker.remove();
            this.marker = new mapboxgl.Marker().setPopup(
                new mapboxgl.Popup({
                    offset: 25
                })
                .setHTML(
                    "<p>" + document.getElementById("name").value.toString() + "</p>"
                ));;
            let tmp = coordinates[0];
            coordinates[0] = coordinates[1];
            coordinates[1] = tmp;
            this.marker.setLngLat(coordinates).addTo(this.map);
            this.currentMarker = this.marker;
            this.map.flyTo({
                center: coordinates,
                essential: true
            });


        }
    }
    getCoordinates(id) {

        for (let i in this.markers) {

            this.markers[i].remove()
        }
        fetch("php/MapWorker.php", {
            method: "POST",


        }).then(function (response) {
            return response.text();
        }).then((response) => {
            let res = JSON.parse(response);
            if(res.hasOwnProperty("Duomenų bazės klaida")){
            
            return false;
            }

            for (let i in res) {
                let color = "green";
                let coordinates = res[i]['coordinates'].split(",");
                let tmp = coordinates[0];
                coordinates[0] = coordinates[1];
                coordinates[1] = tmp;

                if (res[i]['id'] === id) {
                    color = "red";
                    this.map.flyTo({
                        center: coordinates,
                        essential: true
                    });
                }

                let marker = new mapboxgl.Marker({
                    color: color
                }).setPopup(
                    new mapboxgl.Popup({
                        offset: 25
                    })
                    .setHTML(
                        "<p>" + res[i]['name'] + "</p><a class='btn btn-success'  href='info.php?" + new URLSearchParams({
                            id: res[i]['id'],
                        }) + "'>Daugiau...</a>"
                    ));





                marker.setLngLat(coordinates).addTo(this.map);
                this.markers.push(marker);


            }

        });

    }
}
let map = new MapBox();
