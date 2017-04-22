/**
 * Created by PANNA on 20.02.2017.
 */
var app = angular.module('all_users',[]);
FIELDS='fields=id,nikname,state,email';
LIMIT = 20;
app.controller('all_users_control',function($scope,$http){
    getUsers();

function  getUsers() {
    var query='/api/users/?';
    var offset= 0;
    query+= 'limit=' + LIMIT+ '&offset='+offset+'&'+FIELDS;

    $scope.users=[];

    $http.get(query).then(function(response){
        var data=response.data;

        if(data.result) {
            $scope.users = data.result;
        }
    });
}
});