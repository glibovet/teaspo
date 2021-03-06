<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en-US">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<sec:authentication var="user" property="principal"/>
<sec:authorize var="loggedIn" access="isAuthenticated()"/>
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
    <link rel="stylesheet" href="resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

    <!--JAVASCRIPT-->
    <script type="text/javascript" src="../../../resources/js/jquery.1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/menu.js"></script>

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
    <link rel="stylesheet/less" type="text/css" href="../../../resources/less/common/eventList.less"/>
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
        <li class=" gn-icon gn-icon-menu left">
            <span onclick="openNav()" style="font-size: 40px;
    position: relative;
    left: 15px;" class="glyphicon glyphicon-menu-hamburger navbar-brand" id=""></span>
        </li>
        <li class="hidden-xs codrops-icon codrops-icon-prev left">
            <text style="font-size:30px;font-family:Oswald; padding:20px;" ;>TEASPO</text>
        </li>
        <c:choose>
            <c:when test="${loggedIn}">
                <li><a href="/logout" class="hidden-xs right"> LOGOUT </a></li>

                <li><a class="codrops-icon codrops-icon-drop right" href="">
                    <text class="glyphicon glyphicon-user" style="font-size:20px;"></text>
                    <span class="hidden-xs"> Профіль </span></a></li>
            </c:when>
            <c:otherwise>
                <li><a class="codrops-icon codrops-icon-drop right" href="/login">
                    <text class="glyphicon glyphicon-user" style="font-size:20px;"></text>
                    <span class="hidden-xs"> Увійти</span></a></li>
            </c:otherwise>
        </c:choose>


    </ul>
</div><!-- /container -->
<div id="main" href="javascript:void(0)" onclick="closeNav()">
    <p id="events">EVENTS</p>
<div id="games container">
    <c:forEach var="event" items="${events}">
        <div class="card col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div id="container" class="cardContainer">
                <h2 class="cardTitle">${event.name}</h2>
                <div class="img-wrapper">
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
                </div>
                <a href="/events/${event.id}" class="btn glyphicon glyphicon-menu-right"></a>
                <p class="detail"><label>Description: </label> ${event.description}</p>
                <p class="detail"><label>Sport type: </label> ${event.type}</p>
                <p class="detail"><label>Capacity: </label> ${event.capacity}</p>

            </div>
        </div>
    </c:forEach>
</div>

<a href="/events/create" class="btn2 glyphicon glyphicon-plus"></a>
</div>
</body>
</html>