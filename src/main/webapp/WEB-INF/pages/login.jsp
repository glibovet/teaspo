<!--
<%--
  Created by IntelliJ IDEA.
  User: mykola.dekhtiarenko
  Date: 05.04.17
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
-->
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
  <link rel="stylesheet" href="resources/libraries/font-awesome-4.7.0/css/font-awesome.min.css">

  <!--JAVASCRIPT-->
  <script type="text/javascript" src="../../resources/js/jquery.1.10.2.min.js"></script>
  <script type="text/javascript" src="resources/js/menu.js"></script>

  <!--BOOTSTRAP-->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <!--LESS-->
  <link rel="stylesheet/less" type="text/css" href="../../resources/less/signin/login.less" />
  <!-- LESS JavaScript компілятор -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.3/less.min.js"></script>

  <!--ICONS-->

</head>
<body>
    <div><a href="/" id="linkback">GO BACK</a>
</div>
<div class="col-xs-8 col-xs-offset-2 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 form">
<h1  style="text-align:center;" class="col-md-8 col-md-offset-2">LOGIN</h1>
<form name='form' class="col-md-8 col-md-offset-2" action="/login" method='POST'>
            <label>EMAIL:</label><input type='text' class="form-control " name='username' value=''>
            <label>PASSWORD:</label>
            <input type='password' class="form-control" name='password' />
            <input name="submit" class="saveBtn col-md-12 " type="submit" value="Sign In" />
</form>
</div>
</body>
</html>
