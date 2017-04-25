<%--
  Created by IntelliJ IDEA.
  User: Andrii
  Date: 15.11.2016
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en-US">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<sec:authentication var="user" property="principal"/>
<sec:authorize var="loggedIn" access="isAuthenticated()"/>

<head>
    <!---METADATA--->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale = 1.0">
    <meta name="description" content="Great resource which will help you to find your best sport team to play with"/>
    <title>Teaspo</title>

    <!---FONTS--->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display|Roboto+Condensed|Ubuntu+Condensed"
          rel="stylesheet">

    <!---CSS--->
    <link rel="stylesheet" href="../../resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

    <!--JAVASCRIPT-->
    <script type="text/javascript" src="../../resources/js/jquery.1.10.2.min.js"></script>
    <script type="text/javascript" src="../../resources/js/menu.js"></script>

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
    <link rel="stylesheet/less" type="text/css" href="../../resources/less/main.less"/>
    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>

    <!--ICONS-->

</head>
<body>
<div id="menuBar" class=" sidenav">
    <div>
        <p class="logo" href="javascript:void(0)" onclick="closeNav()">TEASPO</p>
        <a href="/">
            <text class="glyphicon glyphicon-home"></text>
            Головна</a>
        <a href="/places">
            <text class="glyphicon glyphicon-map-marker"></text>
            Майданчики</a>
        <a href="/events">
            <text class="glyphicon glyphicon-play"></text>
            Ігри</a>
        <sec:authorize access="isAuthenticated()">
            <a href="/profile">
                <text class="glyphicon glyphicon-user"></text>
                Профіль</a>
            <a href="/myevents">
                <text class="glyphicon glyphicon-th-list"></text>
                Мої події</a>
        </sec:authorize>
        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
            <a href="web/admin/">
                <text class="glyphicon glyphicon-eye-open"></text>
                Сторінка адміна</a>
        </sec:authorize>

    </div>
</div>
<div class="container" id="main2">
    <ul id="gn-menu" class="gn-menu-main">
        <li class="  gn-icon gn-icon-menu left">
            <span onclick="openNav()" class="glyphicon glyphicon-menu-hamburger navbar-brand" id=""></span>
        </li>
        <li class="hidden-xs codrops-icon codrops-icon-prev left">
            <text style="font-size:30px;font-family:Oswald; padding:20px;" ;>TEASPO</text>
        </li>
        <c:choose>
            <c:when test="${loggedIn}">
                <li><a class="codrops-icon codrops-icon-drop" href="">
                    <text class="glyphicon glyphicon-user" style="font-size:20px;"></text>
                    <span class="hidden-xs"> ACCOUNT </span></a></li>
                   <li> <a href="/logout" class="hidden-xs right"> LOGOUT </a></li>

            </c:when>
            <c:otherwise>
                <li><a class="codrops-icon codrops-icon-drop right" href="/login">
                    <text class="glyphicon glyphicon-user" style="font-size:20px;"></text>
                    <span class="hidden-xs"> LOGIN</span></a></li>
            </c:otherwise>
        </c:choose>


    </ul>
</div><!-- /container -->

<!-- MAIN CONTAINER -->
<div id="main" href="javascript:void(0)" onclick="closeNav()">

    <div id="logoimage container">
        <div class="row ">
            <div id="mapwrapper">
                <img class="img-responsive col-xs-12 col-sm-9 bottom " id="logomapimage" onmouseover="onHoverMap()"
                     onmouseout="offHoverMap()" src="/resources/img/world-map-146505_1280.png">
            </div>

        </div>
    </div>
    <hr>
    <div id="fields container">
        <div class="row">
            <div class="textField hidden-xs col-sm-6">
                <p class="findFields">FIND
                    <text class="fieldText">fields</text>
                </p>
                <p class="findFields"> BUILD YOUR
                    <text class="fieldText"> team</text>
                </p>
                <p class="findFields"> PLAY YOUR PERFECT
                    <text class="fieldText">game</text>
                </p>
            </div>
            <div class=" col-xs-12 col-sm-6"></div>
            <div><img class="mapfield img-responsive col-xs-12 col-sm-6"
                      src="http://yava.ro/wp-content/plugins/responsive-maps-plugin/documentation/assets/images/5.png">
            </div>
        </div>
    </div>
    <hr>
    <div id="games container">
        <div class="row">

            <c:forEach var="event" items="${events}">
                <div class="card col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div id="container" class="cardContainer">
                        <h2 class="cardTitle">${event.name}</h2>
                        <div class="img-wrapper">
                            <img class="img-responsive" src="../../resources/img/football_pitch-wallpaper-1366x768.jpg">
                        </div>
                        <p class="detail"><label>Description: </label> ${event.description}</p>
                        <p class="detail"><label>Sport type: </label> ${event.type}</p>
                        <p class="detail"><label>Capacity: </label> ${event.capacity}</p>
                        <a href="/meeting/${event.id}" class="btn btn2 glyphicon glyphicon-menu-right"></a>
                    </div>
                </div>
            </c:forEach>

        </div>

    </div>
</div>
<hr>
<footer>

    <hr>
    <text class="footertext"> Teaspo.com Corporation License (c)</text>
</footer>
</div> <!-- /MAIN CONTAINER -->

</body>
</html>
