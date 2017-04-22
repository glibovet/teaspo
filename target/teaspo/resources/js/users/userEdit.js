/**
 * Created by PANNA on 01.03.2017.
 */
var app = angular.module('user_edit',[]);
FIELDS='fields=id,nikname,email,password,active,role';
LIMIT = 20;
app.controller('user_controller',function($scope,$http){
    var params = UrlUtil.parse(angular.element('#loader').attr('src'));
    params.id = parseInt(params.id);
    if(params.id){
        $http.get('/api/users/'+params.id+ '/?'+FIELDS).then(function(response){
            if(response.data.result){
                $scope.user=response.data.result;
                $scope.roles =
                    [
                        {name: 'user', value:'user'},
                        {name: 'moderator', value:'moderator'},
                        {name: 'admin', value:'admin'}
                    ]
                $scope.actives=
                    [
                        {name:true,value:true},
                        {name:false,value:false}
                    ]
            }
        })
    }else{
        $scope.user={ };
    }
});
app.controller('user_edit_controller',function($scope,$http){
    $scope.userSave=function() {
        var _method = ($scope.user.id ? $http.post : $http.post);
        _method('/api/users/update', JSON.stringify($scope.user), {headers: HEADERS}).then(function(response){
            var data=response.data;
            if(data.result){
                if(!$scope.user.id){
                    setTimeout(function() {
                        location.href = '/web/admin/' + data.result;
                    },2000);
                    }
                }
            },function(xhr){console.log(xhr);});
        window.location.reload();
        };
});
