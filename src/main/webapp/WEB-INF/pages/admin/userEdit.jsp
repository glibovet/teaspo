<!DOCTYPE HTML>
<html lang="en-US">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html ng-app="user_edit">
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

    <!--LESS-->
    <link rel="stylesheet/less" type="text/css" href="/resources/less/userpageEd.less" />
    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>

    <!--ICONS-->

</head>
<body>
<script>
    var HEADERS = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    };

</script>
<h1 class="text-center">Account settings <br> ID: ${id}</h1>
<div id="settings" ng-controller="user_controller">

    <div ng-controller="user_edit_controller" >
    <form class="form-horizontal col-xs-offset-2 col-sm-offset-3 col-md-offset-3" ng-submit="userSave()" >
        <div class="form-group">
            <label class=" col-xs-2 col-sm-2 control-label" for="textinput">Nickname</label>
            <div class="col-xs-6 col-sm-6 col-md-5">
                <input id="textinput" name="textinput" type="text" ng-model="user.nikname"  class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-2 col-sm-2 control-label" for="textinput">Password</label>
            <div class="col-xs-6 col-sm-6 col-md-5">
                <input id="textinput" name="textinput" type="text" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class=" col-xs-2 col-sm-2 control-label" for="textinput">Email</label>
            <div class="col-xs-6 col-sm-6 col-md-5">
                <input id="textinput" name="textinput" type="text" ng-model="user.email" placeholder={{user.email}} class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class=" col-xs-2 col-sm-2 control-label" for="textinput">Role</label>
            <div class="col-xs-6 col-sm-6 col-md-5">
                <select class="form-control" ng-model="user.role">
                    <option ng-selected="user.role == item.name"
                            ng-repeat="item in roles"
                            ng-value="item.value">{{item.name}}
                    </option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class=" col-xs-2 col-sm-2 control-label" for="textinput">State</label>
            <div class="col-xs-6 col-sm-6 col-md-5">
                <select class="form-control" ng-model="user.active"  ng-selected="user.active==active.value" ng-options="active.value as active.name for active in actives">
                </select>
            </div>
        </div>
    </div>
    <input type="submit" class="saveBtn" value="SAVE"></input>
    </form>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="/resources/js/utils/parse_url.js"></script>
<script src="/resources/js/users/userEdit.js?id=${id}" id="loader"></script>
</body>
</html>