<html>
<head>
    <!---METADATA--->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale = 1.0">
    <meta name="description" content="Great resource which will help you to find your best sport team to play with"/>
    <title>Teaspo.com</title>

    <!---FONTS--->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display|Roboto+Condensed|Ubuntu+Condensed"
          rel="stylesheet">

    <!---CSS--->
    <link rel="stylesheet" href="../../../resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

    <!--JAVASCRIPT-->
    <script type="text/javascript" src="../../../resources/js/jquery.1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/event/createEvent.js"></script>

    <!--BOOTSTRAP-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <!--LESS-->
    <link rel="stylesheet/less" type="text/css" href="../../../resources/less/common/eventCreate.less"/>

    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <!--ICONS-->

</head>
<body>
<script>
    var HEADERS = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    };

</script>
<div class="container-fluid">
<a href="/" id="linkBack">GO BACK</a>
<p>CREATE EVENT</p>
<form action="javascript:void(0);">
    <div class="row">
        <div class="col-md-6">
            <div class="col-md-6">
                <label> NAME </label><input id="name" class="form-control col-md-3" required type="text"
                                            placeholder="Name of your event"></div>
            <div class="col-md-6">
                <label> DATE </label>
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' id="datetime" required class="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#datetimepicker1').datetimepicker({
                            format: 'YYYY-MM-DD HH:mm'
                        });
                    });
                </script>
            </div>
            <div class="col-md-12">
                <label> DESCRIPTION </label>
                <textarea id="description" rows="10" class="form-control" required placeholder="Description"></textarea>
            </div>
            <div class="col-md-3">
                <label>CAPACITY</label>
                <input id="capacity" class="form-control" type="text" required placeholder="amount">
            </div>
            <div class="col-md-6">
                <label> SPORT TYPE </label>
                <select id="type" class="form-control" type="text" placeholder="Sport type">
                    <option>Basketball</option>
                    <option>Football</option>
                    <option>Volleyball</option>
                    <option>Tenis</option>
                    <option>Hockey</option>
                </select>
            </div>
        </div>
        <div id="addPlace" class="col-md-6">
            <div class="create-event-map" >
                <div id="map">
                    <script>
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
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="col-xs-0 col-md-4"></div>
        <div class="col-xs-12 col-md-4">
            <input id="submit" type="submit" value="CREATE" class="saveBtn">
        </div>
        <div class="col-xs-0 col-md-4"></div>

    </div>
</form>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWIyt56lBFvS8tsH3SihrK3ID8DQsyDBg&callback=initMap"
        async defer></script>
</div>
</body>

</html>