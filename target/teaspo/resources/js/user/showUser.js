/**
 * Created by PANNA on 27.03.2017.
 */

var app = angular.module('showUser',[]);
FIELDS='fields=id,nikname,email,password,active,role';
LIMIT = 20;
app.controller('user_data_controller',function($scope,$http){
    var params = UrlUtil.parse(angular.element('#loader').attr('src'));
    params.id = parseInt(params.id);
    if(params.id){
        $http.get('/api/users/'+params.id+ '/?'+FIELDS).then(function(response){
            if(response.data.result){
                $scope.user=response.data.result;
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