
var map;
var i=0;
var service;
var infowindow;
var marker = new Array();
marker[0] = {
    position : null
    }


function initialize() {
    var myLatlng = new google.maps.LatLng(37.56614736343462, 126.98483002764897);

    var myOptions = {
        zoom: 16,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(event.latLng);
        });

    var input = document.getElementById('mapSearch');
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
        } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);
        }

    placeMarker(place.geometry.location, place.name);

});

}

function placeMarker(location,name) {
    if(name){
        marker[i] = new google.maps.Marker({
        position: location,
        map: map,
        draggable:true,
        title: name
        //animation: google.maps.Animation.DROP,
        });
        i++;
    }else{
        marker[i] = new google.maps.Marker({
            position: location,
            map: map,
            draggable:true
            //animation: google.maps.Animation.DROP,
        });
        i++;
    }
    map.setCenter(location);
}


function sendMap(){

    var mapPosition = map.center.toString();
    var mapXposition = mapPosition.slice(1,mapPosition.indexOf(','));
    var mapYposition = mapPosition.slice(mapPosition.indexOf(',')+2,mapPosition.indexOf(')'));

    if(marker[0].position != null){

    var markerUrl;

    for(j in marker){
    var markerPosition = marker[j].position.toString();
    var markerXposition = markerPosition.slice(1,markerPosition.indexOf(','));
    var markerYposition = markerPosition.slice(markerPosition.indexOf(',')+2,markerPosition.indexOf(')'));

    markerUrl = markerUrl + "&markers=" + "color:red%7C" + markerXposition + "," + markerYposition;
    }

    var mapUrl = "http://maps.google.com/maps/api/staticmap"
    + "?center=" + mapXposition + "," + mapYposition
    + "&zoom=" + map.zoom
    + "&size=" + "500x300"
    + "&maptype=" + "roadmap"
    + markerUrl
    + "&sensor=false";

    }else{

        var mapUrl = "http://maps.google.com/maps/api/staticmap"
        + "?center=" + mapXposition + "," + mapYposition
        + "&zoom=" + map.zoom
        + "&size=" + "500x300"
        + "&maptype=" + "roadmap"
        + "&sensor=false";

        }

    makeShortUrl(mapUrl);

}


function makeShortUrl(imgUrl){
    //Setting
    var bit = {
    version:  "2.0.1",
    login:    "bungubbang",
    apiKey:   "R_9792ab521176c15d58572de48b97d3f3"
    };


    //Url Setting
    var bitlyapiCallUrl= "http://api.bit.ly/shorten?"
    + "version=" + bit.version
    + "&login=" + bit.login
    + "&apiKey=" + bit.apiKey
    + "&callback=?"
    + "&longUrl=" + encodeURIComponent(imgUrl);

    $.getJSON(
        bitlyapiCallUrl,
            function  (data) {
                if(data.statusCode == "OK"){
                    var sUrl = data.results[imgUrl].shortUrl;
                    if(window.intent) {
                    window.intent.postResult(sUrl);
                }

                if (POP) {
                    window.close();
                    POP.Activity.stopActivity();
                    }

                }
            }
        );
}
