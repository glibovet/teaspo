var map;
var markers = [];
markers[0] = "default";

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 50.46422477192736, lng: 30.518689155578613},
        zoom: 8
    });

    map.addListener('click', function(event) {
        deleteMarkers();
        addMarker(event.latLng);
    });
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
    console.log(marker);
    markers[0]= marker;
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
    if(markers[0]!="default"){
        markers[0].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
    setMapOnAll(map);
}

function deleteMarkers() {
    clearMarkers();
    markers = [];
}