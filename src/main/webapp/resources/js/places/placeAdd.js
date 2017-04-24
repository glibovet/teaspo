  var map;
                        var markers = [];

                        function initMap() {
                            map = new google.maps.Map(document.getElementById('map'), {
                                center: {lat: -34.397, lng: 150.644},
                                zoom: 8
                            });
                                    var infoWindow = new google.maps.InfoWindow({map: map});

                         if (navigator.geolocation) {
                                  navigator.geolocation.getCurrentPosition(function(position) {
                                    var pos = {
                                      lat: position.coords.latitude,
                                      lng: position.coords.longitude
                                    };

                                    infoWindow.setPosition(pos);
                                    infoWindow.setContent('Location found.');
                                    map.setCenter(pos);
                                  }, function() {
                                    handleLocationError(true, infoWindow, map.getCenter());
                                  });
                                } else {
                                  // Browser doesn't support Geolocation
                                  handleLocationError(false, infoWindow, map.getCenter());
                                }

                            map.addListener('click', function(event) {
                               deleteMarkers();
                                addMarker(event.latLng);
                            });
                        }
                      
                        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                                infoWindow.setPosition(pos);
                                infoWindow.setContent(browserHasGeolocation ?
                                                      'Error: The Geolocation service failed.' :
                                                      'Error: Your browser doesn\'t support geolocation.');
                              }

                        // Adds a marker to the map and push to the array.
                        function addMarker(location) {
                            var marker = new google.maps.Marker({
                                position: location,
                                map: map
                            });
                            markers[0]=(marker);
                        }

                        // Sets the map on all markers in the array.
                        function setMapOnAll(map) {
                            for (var i = 0; i < markers.length; i++) {
                                markers[i].setMap(map);
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
