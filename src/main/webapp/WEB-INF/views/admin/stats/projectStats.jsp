<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>Doughnut Chart</title>
<script src="/js/Chart.bundle.js"></script>
<script src="/js/utils.js"></script>

<style>

canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

.block-title {
	font-weight: bold;
}

</style>
</head>

<body>

<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">통계</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/statsMgn/projectStats.do">매출, 프로젝트 통계</a> 
	</span>
</nav>

	<h3 class="content-heading">
		매출 통계 <small>Sales Statistics</small>
	</h3>


						<div class="row col-12">
						<div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	월별 총 매출
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 총매출 관련 그래프 -->
									<div id="a" class="text-center">
										<canvas id="chart-area"></canvas>
									</div>
                                </div>
                            </a>
                            </div>
                            
                            <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	월별 순수입
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 순수입 관련 그래프 -->
									<div id="b" class="text-center">
										<canvas id="chart-area2"></canvas>
									</div>
                                </div>
                            </a>
                        </div>
                        
							                            <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	분야별 통계
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 분야별 통계 그래프 -->
									<div id="c" class="text-center">
										<canvas id="chartjs-1" class="chartjs" style="display: block; width: 770px; height: 385px;"></canvas>
									</div>
                                </div>
                            </a>
                        </div>								                        
					</div>
					
						<div class="row col-12">
						<div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	프로젝트 분류
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 프로젝트 분류(개발, 디자인) 관련 그래프 -->
									<div id="a2" class="text-center">
										<canvas id="chart-area4"></canvas>
									</div>
                                </div>
                            </a>
                            </div>
                            
                           <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	프로젝트 상태
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 프로젝트 상태 관련 그래프 -->
									<div id="a1" class="text-center">
										<canvas id="chart-area3"></canvas>
									</div>
                                </div>
                            </a>
                        </div>
                        
                            <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	지역별 통계
                                    </h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option">
                                            <i class="si si-wrench"></i>
                                        </button>
                                    </div>
                                </div>
                            <a class="block block-link-shadow text-center">
                                <div class="block-content block-content-full clearfix">
									<!-- 지역별 통계 그래프 -->
									<div id="c1" class="text-center">
										<canvas id="chartjs-2" class="chartjs" style="display: block; width: 770px; height: 385px;"></canvas>
									</div>
                                </div>
                            </a>
                        </div>
                        </div>

	<script>
		var sales = '${totalMoney}';
		var pureSales = '${pureMoney}';

		var chartColors = window.chartColors;
		var color = Chart.helpers.color;
		
		var config = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [
					// 랜덤 값 설정
							"${totalSales.WEB}", "${totalSales.APP}",
							"${totalSales.GAME}", "${totalSales.PUBLISHING}",
							"${totalSales.ETC}" ],
					backgroundColor : [
					// 랜덤 값에 색상 설정
					color(chartColors.red).alpha(0.5).rgbString(),
					color(chartColors.orange).alpha(0.5).rgbString(),
					color(chartColors.yellow).alpha(0.5).rgbString(),
					color(chartColors.green).alpha(0.5).rgbString(),
					color(chartColors.blue).alpha(0.5).rgbString(), ],
					label : 'Dataset 1'
				} ],
				labels : [ '웹', '어플리케이션', '게임', '퍼블리싱', '기타' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'bottom',
				},
				animation : {
					animateScale : true,
					animateRotate : true
				},
				tooltips: {
				      callbacks: {
				        // this callback is used to create the tooltip label
				        label: function(tooltipItem, data) {
				          // get the data label and data value to display
				          // convert the data value to local string so it uses a comma seperated number
				          var dataLabel = data.labels[tooltipItem.index];
				          var value = ': ' + numberWithCommas(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()) + ' 원';

				          // make this isn't a multi-line label (e.g. [["label 1 - line 1, "line 2, ], [etc...]])
				          if (Chart.helpers.isArray(dataLabel)) {
				            // show value on first line of multiline label
				            // need to clone because we are changing the value
				            dataLabel = dataLabel.slice();
				            dataLabel[0] += value;
				          } else {
				            dataLabel += value;
				          }

				          // return the text to display on the tooltip
				          return dataLabel;
				        }
				      }
				    }
			}
		};
		
		var color = Chart.helpers.color;
		var config2 = {
			type: 'radar',
			data: {
				labels: [ '웹', '어플리케이션', '게임', '퍼블리싱', '기타' ],
				datasets: [{
					label: '분야',
					backgroundColor: color(window.chartColors.blue).alpha(0.2).rgbString(),
					borderColor: window.chartColors.blue,
					pointBackgroundColor: window.chartColors.blue,
					data: [
							"${pureSales.WEB}", "${pureSales.APP}",
							"${pureSales.GAME}", "${pureSales.PUBLISHING}",
							"${pureSales.ETC}"
					]

				}]
			},
			options: {
				legend: {
					position: 'bottom',
				},
				scale: {
					ticks: {
						beginAtZero: true
					}
				},
			tooltips: {
			      callbacks: {
			        // this callback is used to create the tooltip label
			        label: function(tooltipItem, data) {
			          // get the data label and data value to display
			          // convert the data value to local string so it uses a comma seperated number
			          var dataLabel = data.labels[tooltipItem.index];
			          var value = ': ' + numberWithCommas(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()) + ' 원';

			          // make this isn't a multi-line label (e.g. [["label 1 - line 1, "line 2, ], [etc...]])
			          if (Chart.helpers.isArray(dataLabel)) {
			            // show value on first line of multiline label
			            // need to clone because we are changing the value
			            dataLabel = dataLabel.slice();
			            dataLabel[0] += value;
			          } else {
			            dataLabel += value;
			          }

			          // return the text to display on the tooltip
			          return dataLabel;
			        }
			      }
			    }
			}
		};

		var config3 = {
				type : 'doughnut',
				data : {
					datasets : [ {
						data : [
								// 랜덤 값 설정
								"${pjCondition.WAIT}", "${pjCondition.REGI}",
								"${pjCondition.CONT}", "${pjCondition.ING}",
								"${pjCondition.COMPL}" ],
						backgroundColor : [
						// 랜덤 값에 색상 설정
						color(chartColors.red).alpha(0.5).rgbString(),
						color(chartColors.orange).alpha(0.5).rgbString(),
						color(chartColors.yellow).alpha(0.5).rgbString(),
						color(chartColors.green).alpha(0.5).rgbString(),
						color(chartColors.blue).alpha(0.5).rgbString(), ],
						label : 'Dataset 1'
					} ],
					labels : [ '접수대기', '등록', '계약 중', '진행 중', '완료' ]
				},
				options : {
					responsive : true,
					legend : {
						position : 'bottom',
					},
					animation : {
						animateScale : true,
						animateRotate : true
					},
					tooltips: {
					      callbacks: {
					        // this callback is used to create the tooltip label
					        label: function(tooltipItem, data) {
					          // get the data label and data value to display
					          // convert the data value to local string so it uses a comma seperated number
					          var dataLabel = data.labels[tooltipItem.index];
					          var value = ': ' + numberWithCommas(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()) + ' 건';

					          // make this isn't a multi-line label (e.g. [["label 1 - line 1, "line 2, ], [etc...]])
					          if (Chart.helpers.isArray(dataLabel)) {
					            // show value on first line of multiline label
					            // need to clone because we are changing the value
					            dataLabel = dataLabel.slice();
					            dataLabel[0] += value;
					          } else {
					            dataLabel += value;
					          }

					          // return the text to display on the tooltip
					          return dataLabel;
					        }
					      }
					    }
				}
			};
		
		var config4 = {
			type : 'pie',
			data : {
				datasets : [ {
					data : [
					// 랜덤 값 설정
							"${pjCategory.DEVELOPMENT}", "${pjCategory.DESIGN}"],
					backgroundColor : [
					// 랜덤 값에 색상 설정
							color(chartColors.green).alpha(0.5).rgbString(), color(chartColors.yellow).alpha(0.5).rgbString(), ],
					label : 'Dataset 1'
				} ],
				labels : [ '개발', '디자인' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'bottom',
				},
				animation : {
					animateScale : true,
					animateRotate : true
				},
				tooltips: {
				      callbacks: {
				        // this callback is used to create the tooltip label
				        label: function(tooltipItem, data) {
				          // get the data label and data value to display
				          // convert the data value to local string so it uses a comma seperated number
				          var dataLabel = data.labels[tooltipItem.index];
				          var value = ': ' + numberWithCommas(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()) + ' 건';

				          // make this isn't a multi-line label (e.g. [["label 1 - line 1, "line 2, ], [etc...]])
				          if (Chart.helpers.isArray(dataLabel)) {
				            // show value on first line of multiline label
				            // need to clone because we are changing the value
				            dataLabel = dataLabel.slice();
				            dataLabel[0] += value;
				          } else {
				            dataLabel += value;
				          }

				          // return the text to display on the tooltip
				          return dataLabel;
				        }
				      }
				    }
			}
		};
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		window.onload = function() {
			var ctx1 = document.getElementById('chart-area').getContext('2d');
			var ctx2 = document.getElementById('chart-area2').getContext('2d');
			var ctx3 = document.getElementById('chart-area3').getContext('2d');
			var ctx4 = document.getElementById('chart-area4').getContext('2d');

			window.myDoughnut = new Chart(ctx1, config);
			window.myDoughnut2 = new Chart(ctx2, config2);
			window.myDoughnut3 = new Chart(ctx3, config3);
// 			window.myDoughnut4 = new Chart(ctx4, config4);
			window.mypie = new Chart(ctx4, config4);
		};

		new Chart(document.getElementById("chartjs-1"), {
			"type" : "bar",
			"data" : {
				"labels" : [ "웹", "어플리케이션", "게임", "퍼블리싱", "기타" ],
				"datasets" : [ {
					"label" : "count",
					"data" : [ '${categoryList.WEB}', '${categoryList.APP}',
							'${categoryList.GAME}',
							'${categoryList.PUBLISHING}',
							 '${categoryList.ETC}' ],
					"fill" : false,
					
					"backgroundColor" : [ "rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
					                      "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
					                      "rgba(54, 162, 235, 0.2)"],
					                      
					"borderColor" : [ "rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
				                      "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
				                      "rgba(54, 162, 235, 0.2)"],
				                      
					"borderWidth" : 1
				} ]
			},
			"options" : {
				"scales" : {
					"yAxes" : [ {
						"ticks" : {
							"beginAtZero" : true
						}
					} ]
				}
			}
		});
		
		new Chart(document.getElementById("chartjs-2"), {
			"type" : "bar",
			"data" : {
				"labels" : [ "서울경기권", "충청권", "경상권", "전라권", "강원도", "제주도" ],
				"datasets" : [ {
					"label" : "count",
					"data" : [ '${pjRegion.SEOUL}', '${pjRegion.CHUNG}',
							'${pjRegion.GYEONG}',	'${pjRegion.JEON}',
							'${pjRegion.KANG}', '${pjRegion.JEJU}'],
					"fill" : false,
					"backgroundColor" : ["rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)",
										 "rgba(255, 205, 86, 0.2)", "rgba(255, 99, 132, 0.2)",
										 "rgba(54, 162, 235, 0.2)",	"rgba(255, 159, 64, 0.2)"],
										 
					"borderColor" : ["rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)",
									 "rgba(255, 205, 86, 0.2)", "rgba(255, 99, 132, 0.2)",
									 "rgba(54, 162, 235, 0.2)",	"rgba(255, 159, 64, 0.2)"],
								 	 
					"borderWidth" : 1,
				} ]
			},
			"options" : {
				"scales" : {
					"yAxes" : [ {
						"ticks" : {
							"beginAtZero" : true
						}
					} ]
				}
			}
		});
		
	</script>


</body>
</html>
