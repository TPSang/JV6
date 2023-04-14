app.controller("authority-ctrl",function($scope,$http,$location){
    $scope.roles = [];
    $scope.admins = [];
    $scope.authorities = [];
    
    $scope.initialize = function(){
		//load all roles
		$http.get("/rest/roles").then(resp=>{
			$scope.roles = resp.data;
		});
		
		//load staffs and directors (administrators)
		$http.get("/rest/accounts?admin=true").then(resp=>{
			$scope.admins = resp.data;
		})
		
		//load authorities of staffs and directors
		$http.get("/rest/authorities?admin=true").then(resp=>{
			$scope.authorities = resp.data;
			console.log(resp.data);
		}).catch(err=>{
			$location.path("/unauthorized");
		})
		
		$scope.authority_of = function(acc,role){
			if($scope.authorities){
				return $scope.authorities.find(ur => ur.account.username == acc.username && ur.role.id == role.id)
			}
		}
		
		$scope.authority_changed = function(acc,role){
			
			var authority = $scope.authority_of(acc,role);
			console.log("role: "+JSON.stringify(authority));
			if(authority){//đã cấp quyền => thu hồi quyền (xoá)
				$scope.revoke_authority(authority);
			}else{//chưa cấp quyền => cấp quyền mới
				authority = {account:acc,role:role};
				$scope.grant_authority(authority);
			}
		}
	}
	//Thêm mới authority
	$scope.grant_authority = function(authority){
		$http.post(`/rest/authorities`,authority).then(resp=>{
			$scope.authorities.push(resp.data);
			alert("Cấp quyền sử dụng thành công!");
		}).catch(err=>{
			console.log("Error ",err);
			alert("Cấp quyền sử dụng thất bại!");
		})
	}
	
	//Xoá authority
	$scope.revoke_authority = function(authority){
		$http.delete(`/rest/authorities/${authority.id}`).then(resp=>{
			var index = $scope.authorities.findIndex(a => a.id == authority.id);
			$scope.authorities.splice(index,1);
			alert("Thu hồi quyền sử dụng thành công!");
		}).catch(err=>{
			console.log("Error ",err);
			alert("Thu hồi quyền sử dụng thất bại!");
		})
	}
	
	$scope.initialize();
})