<%--
  Created by IntelliJ IDEA.
  User: PANNA
  Date: 29.03.2017
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="/resources/libraries/FormHelper/dist/css/bootstrap-formhelpers.min.css">
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
    <script type="text/javascript" src="/resources/libraries/FormHelper/dist/js/bootstrap-formhelpers.min.js"></script>

    <!--LESS-->
    <link rel="stylesheet/less" type="text/css" href="/resources/less/userpageEd.less" />
    <!-- LESS JavaScript компілятор -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>

    <!--ICONS-->

</head>
<body>
<div id="settings"  style="display:none">
    <form class="form-horizontal">
        <h1 class="text-center">Account settings</h1>


        <!-- Form Name -->
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Change nickname</label>
            <div class="col-md-4">
                <input id="textinput" name="textinput" type="text" placeholder="Your new nickname " class="form-control input-md">
            </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="passwordinput">New password</label>
            <div class="col-md-4">
                <input id="passwordinput" name="passwordinput" type="password" placeholder="New password" class="form-control input-md">

            </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="passwordinput">Repeat password</label>
            <div class="col-md-4">
                <input id="passwordinput" name="passwordinput" type="password" placeholder="Repeat password" class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Set security question</label>
            <div class="col-md-4">
                <select id="selectbasic" name="selectbasic" class="form-control">
                    <option value="1">What is the name of your pet?</option>
                    <option value="2">What is your first teacher's name?</option>
                    <option value="3">What is your favourite dish?</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="passwordinput">Answer</label>
            <div class="col-md-4">
                <input id="passwordinput"  type="text" placeholder="Answer for your security question" class="form-control input-md">

            </div>
        </div>
        <hr>
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Your country</label>
            <div class="col-md-4">
                <select id="selectbasic" name="selectbasic" class="form-control bfh-countries" data-country="UA">
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Your city</label>
            <div class="col-md-4">
                <select id="selectbasic" name="selectbasic" class="form-control">
                    <option value="1">Lviv</option>
                    <option value="2">Kyiv</option>
                    <option value="3">Sandusky</option>
                </select>
            </div>
        </div>
        <!-- Button -->

        <!-- Multiple Checkboxes -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="checkboxes">Skills</label>
            <div class="col-md-4">
                <div class="checkbox">
                    <label for="checkboxes-0">
                        <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                        Basketball
                    </label>
                </div>
                <div class="checkbox">
                    <label for="checkboxes-1">
                        <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                        Football
                    </label>
                </div>
                <div class="checkbox">
                    <label for="checkboxes-2">
                        <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                        Voleyball
                    </label>
                </div>
                <div class="checkbox">
                    <label for="checkboxes-3">
                        <input type="checkbox" name="checkboxes" id="checkboxes-3" value="4">
                        Hockey
                    </label>
                </div>
            </div>
        </div>

        <!-- Select Multiple -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectmultiple">Language</label>
            <div class="col-md-4">
                <select id="selectbasic" name="selectbasic" class="form-control">
                    <option value="1">Ukrainian</option>
                    <option value="2">Deutsch</option>
                    <option value="3">English</option>
                </select>
            </div>
        </div>

        <button  class=" saveBtn">save</button>



    </form>

</div>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="/resources/js/utils/parse_url.js"></script>
<script src="/resources/js/user/showUser.js?id=${id}" id="loader"></script>
</body>
</html>
