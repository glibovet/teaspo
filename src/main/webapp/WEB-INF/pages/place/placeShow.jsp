<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <!---METADATA--->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale = 1.0">
  <meta name="description" content="Great resource which will help you to find your best sport team to play with" />
  <title>Teaspo.com</title>

  <!---FONTS--->
  <link href='http://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display|Roboto+Condensed|Ubuntu+Condensed" rel="stylesheet">

  <!---CSS--->
  <link rel="stylesheet" href="../../../resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

  <!--JAVASCRIPT-->
  <script type="text/javascript" src="../../../resources/js/jquery.1.10.2.min.js"></script>
      <script type="text/javascript" src="../../../resources/js/place/placeShow.js"></script>


  <!--BOOTSTRAP-->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <!--LESS-->
  <link rel="stylesheet/less" type="text/css" href="../../../resources/less/places/placeShow.less" />
  <!-- LESS JavaScript компілятор -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>   

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
  <!--ICONS-->

</head>
    <body>
<!--         <a href="javascript:history.back()">Go Back</a>-->

            <p class="teaspo"> ${place.name} </p>
<!--            <img src="../../../resources/img/logomapcut.png" class="mapfield img-responsive centered-and-cropped">-->
        <div class="information col-md-6">
            <br>
            <label>EMAIL:</label><text>${place.email}</text><br>
            <label>PHONE:</label><text>${place.phone}</text><br>
            <label>CONTACTS: </label><text>${place.contacts}</text><br>
            <label>LINK: </label><text><a href="${place.web}">${place.web}</a></text><br>
            <label>Description:</label><br><text id="description">${place.description}</text><br>
        </div>
        <div class="col-md-6">
                <script>
                    function initMap() {
                        var uluru = {lat:${place.latitude}, lng:${place.longtitude}};
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 16,
                            center: uluru
                        });
                        var marker = new google.maps.Marker({
                            position: uluru,
                            map: map
                        });
                    }</script>
                <div id="map"></div>
        </div>
        <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWIyt56lBFvS8tsH3SihrK3ID8DQsyDBg&callback=initMap">
    </script>
    </body>
</html>