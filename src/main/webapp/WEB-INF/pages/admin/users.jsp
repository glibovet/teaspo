<%--
  Created by IntelliJ IDEA.
  User: PANNA
  Date: 20.02.2017
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html ng-app="all_users">
<head>
</head>
<table class="table" ng-controller="all_users_control">
    <thead>
    <tr class="tableHeader">
        <th>ID</th>
        <th>Nickname</th>
        <th>City</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>

    <tr ng-repeat="user in users">

        <td>{{user.id}}</td>
        <td><a href="/web/admin/{{user.id}}/show">{{user.nikname}}</a></td>
        <td>{{user.state}}</td>
        <td>{{user.email}}</td>
        <td><a href="/web/admin/{{user.id}}/edit" class="glyphicon glyphicon-pencil"></a></td>
        <td><a href="" class="glyphicon glyphicon-trash"></a></td>
    </tr>

    </tbody>
</table>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="/resources/js/admin.js"></script>
<script src="/resources/js/users/all_users.js"></script>
</html>