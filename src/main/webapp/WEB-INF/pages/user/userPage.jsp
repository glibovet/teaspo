<%--
  Created by IntelliJ IDEA.
  User: PANNA
  Date: 27.03.2017
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<html lang="en-US">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE HTML>
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
    <link rel="stylesheet" href="/resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

    <!--JAVASCRIPT-->
    <script type="text/javascript" src="/resources/js/jquery.1.10.2.min.js"></script>
    <script type="text/javascript" src="/resources/js/user/userPage.js"></script>

    <!--BOOTSTRAP-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <!--BOOTSTRAP FROM HELPER-->
    <script type="text/javascript" src="/resources/libraries/FormHelper/js/bootstrap-formhelpers-countries.js"></script>
    <!--LESS-->
    <link rel="stylesheet/less" type="text/css" href="../../resources/less/userpageEd.less" />
    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>

    <!--ICONS-->

</head>
<body>




<div class="container col-xs-12">
    <div>

        <div class="text-center profileHeader">
            <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
            <h3 class="nickname">${profile.nikname}</h3>
            <h4><text class="city">${profile.country}</text><text class="country">, ${profile.town}</text></h4>
            <%--<span class="skillsMenu"><strong>Skills: </strong></span>--%>
            <%--<span class="label label-warning ">Football <text class="glyphicon glyphicon-remove"></text></span>--%>
            <%--<span class="label label-info">Hockey <text class="glyphicon glyphicon-remove"></text></span>--%>
            <%--<span class="label label-info">Voleyball <text class="glyphicon glyphicon-remove"></text></span>--%>
            <%--<span class="label label-success ">Basketball <text class="glyphicon glyphicon-remove"></text></span>--%>
            <%--<span class="glyphicon glyphicon-pencil" style="color:white"></span>--%>
        </div>
    </div>
    <div class="row profile">
        <div class="col-md-3">
            <div class="profile-sidebar">

                <!-- SIDEBAR MENU -->
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li onclick="showGames()">
                            <a href="#">
                                <i class="glyphicon glyphicon-home" ></i>
                                Games</a>
                        </li>
                        <li onclick="showFields()">
                            <a href="#">
                                <i class="glyphicon glyphicon-user"></i>
                                Fields </a>
                        </li>
                        <li onclick="showSettings()">
                            <a href="#">
                                <i class="glyphicon glyphicon-ok"></i>
                                Settings </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-flag"></i>
                                Help</a>
                        </li>
                    </ul>
                </div>
                <!-- END MENU -->
            </div>
        </div>
        <div class="col-md-9">
            <div class="profile-content">
                <div id="games"  style="display:none">
                    <div class="row">
                        <div class="card col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div id="container" class="cardContainer">
                                <h2 class="cardTitle">Card 1 <text class="glyphicon glyphicon-trash"></text></h2>
                                <div class="img-wrapper">
                                    <img class="img-responsive" src="http://img1.goodfon.su/wallpaper/big/8/d1/volzhskie-korshuny-amerikanskiy.jpg" >
                                </div>
                                <p class="detail">Playing game with our buddies today at Glasgow stadion</p>

                            </div>
                        </div>
                        <div class="card col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div id="container" class="cardContainer">
                                <h2 class="cardTitle">Card 2 <text class="glyphicon glyphicon-trash"></text></h2>
                                <div class="img-wrapper">
                                    <img class="img-responsive" src="https://upload.wikimedia.org/wikipedia/commons/4/4b/Ice_Hockey_sharks_ducks.jpg" >
                                </div>
                                <p class="detail">Playing game with our buddies today at Glasgow stadion</p>

                            </div>
                        </div> <div class="card col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div id="container" class="cardContainer">
                            <h2 class="cardTitle">Card 3 <text class="glyphicon glyphicon-trash"></text></h2>
                            <div class="img-wrapper">
                                <img class="img-responsive" src="http://www.hervormdbodegraven.nl/uploads/news/id1176/beach.jpg">
                            </div>
                            <p class="detail">Playing game with our buddies today at Glasgow stadion</p>

                        </div>
                    </div>

                    </div>
                </div>
                <div id="fields" onclick="showFields()" style="display:none">
                    <table class="table">
                        <thead>
                        <tr class="tableHeader">
                            <th>ID</th>
                            <th>Fieldname</th>
                            <th>City</th>
                            <th>Country</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Чемпион</td>
                            <td>Kyiv</td>
                            <td>Ukraine</td>
                            <td><a href="/userpageEd.html" class="glyphicon glyphicon-pencil"></a></td>
                            <td><a href="" class="glyphicon glyphicon-trash"></a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Plaza</td>
                            <td>Sandusky</td>
                            <td>United States</td>
                            <td><a href="/userpageEd.html" class="glyphicon glyphicon-pencil"></a></td>
                            <td><a href="" class="glyphicon glyphicon-trash"></a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>HH</td>
                            <td>Unknown</td>
                            <td>Unknown</td>
                            <td><a href="/userpageEd.html" class="glyphicon glyphicon-pencil"></a></td>
                            <td><a href="" class="glyphicon glyphicon-trash"></a></td>

                        </tr>
                        </tbody>
                    </table>
                </div>
                <jsp:include page="settings.jsp" />
            </div>
        </div>
    </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="/resources/js/utils/parse_url.js"></script>
<script src="/resources/js/user/showUser.js?id=${id}" id="loader"></script>
</body>
</html>
