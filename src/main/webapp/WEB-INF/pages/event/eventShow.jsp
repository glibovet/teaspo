<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet/less" type="text/css" href="../../../resources/less/common/eventShow.less"/>
    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <!--ICONS-->

</head>
<body>
<p class="teaspo">${event.name}</p>
<div class="information col-md-6">
    <br>
    <label>When:</label>
    <text>${event.datetime}</text>
    <br>
    <label>Sport type:</label>
    <text>${event.type}</text>
    <br>
    <label>Capacity:</label>
    <text>${event.capacity}</text>
    <br>
    <label>Description:</label><br>
    <text id="description"> ${event.description}</text>
    <br>
    <button class="saveBtn">GET INVOLVED</button>
</div>
<div class="col-md-6">

    <c:choose>
        <c:when test="${empty event.latitude}">
            <c:choose>
                <c:when test="${event.type=='Football'}">
                    <img class="img-responsive"
                         src="../../resources/img/football.jpg">
                </c:when>
                <c:when test="${event.type=='Basketball'}">
                    <img class="img-responsive"
                         src="../../resources/img/basketball.jpg">
                </c:when>
                <c:when test="${event.type=='Hockey'}">
                    <img class="img-responsive"
                         src="../../resources/img/hockey.jpg">
                </c:when>
                <c:when test="${event.type=='Tennis'}">
                    <img class="img-responsive"
                         src="../../resources/img/tennis.jpg">
                </c:when>
                <c:when test="${event.type=='Voleyball'}">
                    <img class="img-responsive"
                         src="../../resources/img/volleyball.jpg">
                </c:when>
            </c:choose>
        </c:when>
        <c:otherwise>
            <div id="map">
                <script>
                    function initMap() {
                        var uluru = {lat:${event.latitude}, lng: ${event.longitude}};
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 15,
                            center: uluru
                        });
                        var marker = new google.maps.Marker({
                            position: uluru,
                            map: map
                        });
                    }
                </script>
            </div>

        </c:otherwise>
    </c:choose>

</div>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWIyt56lBFvS8tsH3SihrK3ID8DQsyDBg&callback=initMap">
</script>
</body>
</html>