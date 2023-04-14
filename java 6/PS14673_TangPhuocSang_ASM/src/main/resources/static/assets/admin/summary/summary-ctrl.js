app.controller("summary-ctrl", function($scope, $http, $location,$filter) {
	$scope.firstRow = [];
	
	//2nd row content
	$scope.secondRowRevenueByDate = [];
	$scope.secondRowRevenueByRevenue = [];
	$scope.secondRowCateName = [];
	$scope.secondRowNumberOfProduct= [];
	//2nd row content edge
	
	//3rd row content
	$scope.thirdRowCateName = [];
	$scope.thirdRowPercentageByCate = [];
	$scope.thirdRowCateName2 = [];
	$scope.thirdRowAvailable = [];
	$scope.thirdRowUnAvailable = [];
	//3rd row content edge
	
	//4th row content
	$scope.fourthRowProductName = [];
	$scope.fourthRowQuantity = []; 
	//4th row content edge
	
	//5th row content
	$scope.fifRowContent = [];
	//5th row content edge
	$scope.initialize = function() {
		//getFirstRow Content
		$http.get("/rest/summary/firstRow").then(resp=> {
			$scope.firstRow = resp.data;
		})
		//getSecondRow Content
		$http.get("/rest/summary/secondRow").then(resp=>{
			//revenue last 7days
			resp.data.revenueLast7Days.forEach(e=>{
				$scope.secondRowRevenueByDate.push($filter('date')(e[0],'dd-MM-yyyy'));
				$scope.secondRowRevenueByRevenue.push(e[1]);
			})
			//product sold by categories
			resp.data.productSoldByCate.forEach(e=>{
				$scope.secondRowCateName.push(e[0]);
				$scope.secondRowNumberOfProduct.push(e[1]);
			})
			//line chart for Revenue last 7 days
			var dateListRevenue = $scope.secondRowRevenueByDate
			var revenueListByDays = $scope.secondRowRevenueByRevenue
			var lineRevenueChart = document.getElementById('myLineChartRevenue').getContext('2d');
			var myChart = new Chart(lineRevenueChart, {
		        type: 'line',
		        data: {
		            labels: dateListRevenue,
		            datasets: [{
		                // label: 'User By Roles',
		                data: revenueListByDays,
		                backgroundColor: [
		                'rgb(54, 162, 235,0.7)',//blue
		                'rgb(201, 203, 207,0.7)',//gray
		                'rgb(255, 205, 86,0.7)',//yellow
		                'rgb(75, 192, 192)',//green
		                'rgb(255, 99, 132)',//red
		                ],
		                borderColor: ['rgb(54, 162, 235,1)'],//green
		                fill: true,
		                lineTension:0,
		                borderWidth: 3
		            }]
		        },
		        options: {
		            indexAxis: 'x',
		            scales: {
		
		            },
		            responsive: true,
		            plugins: {
		                title: {
		                    display: false,
		                    // text: 'Number of Registered Users By Roles',
		                    padding: {
		                        bottom: 30,
		                    },
		                    font:{
		                        size:20
		                    }
		                },
		                legend: {
		                display:false
		                },
					
			        },
		        }
		    });
		    //bar chart for category by number of product sold
		    var productTypeList = $scope.secondRowCateName;
		    var numberSoldByType = $scope.secondRowNumberOfProduct;
		    var barChartSoldByType = document.getElementById('myBarChartSoldByType').getContext('2d');
		    var gradient = barChartSoldByType.createLinearGradient(0, 0, 600, 0);
		    	gradient.addColorStop(0, 'rgba(123,149,198,1)');
		        gradient.addColorStop(1, 'rgba(255,0,212,0.7)');   
		    var myChart = new Chart(barChartSoldByType, {
		        type: 'bar',
		        data: {
		            labels: productTypeList,
		            datasets: [{
		                // label: '# of Votes',
		                data: numberSoldByType,
		                // backgroundColor: colorArrays1,
		                // borderColor: colorArrays1,
		
		                backgroundColor  : gradient,
		                strokeColor : "#ff6c23",
		                pointColor : "#fff",
		                pointStrokeColor : "#ff6c23",
		                pointHighlightFill: "#fff",
		                pointHighlightStroke: "#ff6c23",
		
		                borderWidth: 1
		            }]
		        },
		        options: {
		            indexAxis: 'y',
		            scales: {
		                y: {
		                    beginAtZero: true
		                }
		            },
		            responsive: true,
		            plugins: {
		                title: {
		                    display: false,
		                    text: 'Payment status last 7 days',
		                    padding: {
		                        bottom: 10,
		                    },
		                    font:{
		                        size:20
		                    }
		                },
		                legend: {
		                    display:false,
		                },
					
			        },
		        }
		    });
		})
		//getThirdRow Content
		$http.get("/rest/summary/thirdRow").then(resp=>{
			//product sold by categories
			resp.data.percentSoldByCate.forEach(e=>{
				$scope.thirdRowCateName.push(e[0]);
				$scope.thirdRowPercentageByCate.push(e[1]);
			})
			resp.data.productAvailableRate.forEach(e=>{
				$scope.thirdRowCateName2.push(e[0]);
				$scope.thirdRowAvailable.push(e[1]);
				$scope.thirdRowUnAvailable.push(e[2]);
			})
			//pie chart for number of product sold by cate
			var cateName = $scope.thirdRowCateName;
			var numberOfProductSold = $scope.thirdRowPercentageByCate;
			var pieChart = document.getElementById('myBarChartProductByCateAvailable').getContext('2d');
		    var myChart = new Chart(pieChart, {
		        type: 'pie',
		        data: {
		            labels: cateName,
		            datasets: [{
		                label: 'Percentage Of Product Sold By Categories',
		                data: numberOfProductSold,
		                backgroundColor: [
		                'rgb(54, 162, 235,0.7)',//blue
		                'rgb(201, 203, 207,0.7)',//gray
		                'rgb(255, 205, 86,0.7)',//yellow
		                'rgb(75, 192, 192)',//green
		                'rgb(255, 99, 132)',//red
		                'rgb(170, 60, 253,0.7)',//purple
		                'rgb(123, 213, 243,1)',//blue sky
		                'rgb(255, 169, 0,1)',//yellow
		                ],
		            }]
		        },
		        options: {
		            // cutout : 150,
		            indexAxis: 'x',
		            scales: {
		
		            },
		            responsive: true,
		            plugins: {
		                title: {
		                    display: false,
		                    text: 'Percentage Of Product Sold By Categories',
		                    padding: {
		                        bottom: 30,
		                    },
		                    font:{
		                        size:20
		                    }
		                },
		                legend: {
		                display:true
		                },
					
			        },
		        }
		    });
		    //bar chart for category by number of product sold
		    var cateName = $scope.thirdRowCateName2;
		    var available = $scope.thirdRowAvailable;
		    var unavailable = $scope.thirdRowUnAvailable;
		    var barChartAvailableRate = document.getElementById('myBarChartAvailableRate').getContext('2d');  
		    var myChart = new Chart(barChartAvailableRate, {
		        type: 'bar',
		        data: {
		            labels: cateName,
		            datasets: [
						{
			                label: 'Available',
			                data: available,
			                backgroundColor: ['rgb(255, 205, 86,0.7)'],
			                borderColor: ['rgb(255, 205, 86,1)'],
			                borderWidth: 1,
			                type:"bar"
			            },
			            {
			                label: 'Available',
			                data: available,
			                backgroundColor: ['rgb(75, 192, 192)'],
			                borderColor: ['rgb(75, 192, 192)'],
			                borderWidth: 1,
			                type:'line',
			                stack:'combined',
			                lineTension: 0.3,
			            },
			            {
			                label: 'Unavailable',
			                data: unavailable,
			                backgroundColor: ['rgb(255, 99, 132,0.7)'],
			                borderColor: ['rgb(255, 99, 132)'],
			                borderWidth: 1,
			                type:"bar"
			            },
			            
			            {
			                label: 'Unavailable',
			                data: unavailable,
			                backgroundColor: ['rgb(54, 162, 235,0.7)'],
			                borderColor: ['rgb(54, 162, 235,0.7)'],
			                borderWidth: 1,
			                type:'line',
			                stack:'combined',
			                lineTension: 0.3,
			            },
		            ]
		        },
		        options: {
		            indexAxis: 'x',
		            scales: {
		                y: {
		                    beginAtZero: true
		                }
		            },
		            responsive: true,
		            plugins: {
		                title: {
		                    display: false,
		                    text: 'Number of products Available By Categories',
		                    padding: {
		                        bottom: 10,
		                    },
		                    font:{
		                        size:20
		                    }
		                },
		                legend: {
		                    display:false,
		                },
					
			        },
		        }
		    });
		})
		$http.get("/rest/summary/fourthRow").then(resp=>{
			resp.data.top10SoldProduct.forEach(e=>{
				$scope.fourthRowProductName.push(e[0]);
				$scope.fourthRowQuantity.push(e[1]);
			})
			var top10ProductName = $scope.fourthRowProductName;
			var quantitySold = $scope.fourthRowQuantity;
			var barChartTop10Product = document.getElementById('myBarChartTop10Product').getContext('2d');
			var gradient = barChartTop10Product.createLinearGradient(0, 0, 800, 0);
				gradient.addColorStop(0, 'rgba(1,133,251,1)');
		    	gradient.addColorStop(0.3, 'rgba(34,207,207,1)');
		    	gradient.addColorStop(1, 'rgba(249,49,84,0.7)');
		    var myChart = new Chart(barChartTop10Product, {
		        type: 'bar',
		        data: {
		            labels: top10ProductName,
		            datasets: [
						{
			                label: 'Total sold quantity',
			                data: quantitySold,
			                backgroundColor  : gradient,
			                strokeColor : "#ff6c23",
			                pointColor : "#fff",
			                pointStrokeColor : "#ff6c23",
			                pointHighlightFill: "#fff",
			                pointHighlightStroke: "#ff6c23",
			
			                borderWidth: 1
				        }
		            ]
		        },
		        options: {
		            indexAxis: 'y',
		            scales: {
		                y: {
		                    beginAtZero: true
		                }
		            },
		            responsive: true,
		            plugins: {
		                title: {
		                    display: false,
		                    text: 'Number of products Available By Categories',
		                    padding: {
		                        bottom: 10,
		                    },
		                    font:{
		                        size:20
		                    }
		                },
		                legend: {
		                    display:false,
		                },
					
			        },
		        }
		    });
		})
		$http.get("/rest/summary/fifthRow").then(resp=>{
			$scope.fifRowContent = resp.data.topCustomer;
			angular.element(document).ready(function () {
                dTable = $('#tableTopCustomer')
                dTable.DataTable({
                    "pageLength": 5,
                    "lengthMenu": [
                        [5, 16, 24, -1],
                        [5, 16, 24, "All"]
                    ],
                    "language": {
                        "paginate": {
                            'previous': '<i class="fas fa-backward"></i>',
                            'next': '<i class="fas fa-forward"></i>'
                        }
                    }
                });
            });
		})
	}
	
	//load dữ liệu thống kê
	$scope.initialize();
})
