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
		<a href="${pageContext.request.contextPath}/statsMgn/memberStats.do">회원 통계</a> 
	</span>
</nav>

	<h3 class="content-heading">
		회원 통계 <small>Member Statistics</small>
	</h3>
	
	
						<div class="row col-12">
						<div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	클라이언트 등록 프로젝트
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
                                    	<!-- 클라이언트 프로젝트 등록 관련 그래프 -->
										<div id="a">
											<canvas id="chart-area"></canvas>
										</div>
                                </div>
                            </a>
                            </div>
                            
                            <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	클라이언트 계약금
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
									<!-- 클라이언트 계약금 관련 그래프 -->
									<div id="c" class="text-center">
										<canvas id="chartjs-1" class="chartjs" style="display: block; width: 770px; height: 385px;"></canvas>
									</div>
                                </div>
                            </a>
                        </div>
                        
                            <div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	프리랜서 수익금
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
									<!-- 프리랜서 순수입 관련 그래프 -->
									<div id="b" class="text-center">
										<canvas id="chart-area2"></canvas>
									</div>
                                </div>
                            </a>
                        </div>
                        </div>
                       
                   <div class="row col-12">
						<div class="col-4">
						    <div class="block-header bg-primary-lighter">
                                    <h3 class="block-title">
                                        	프리랜서 프로젝트 참여 횟수
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
									<!-- 프리랜서 프로젝트 참여 관련 그래프 -->
									<div id="a1" class="text-center">
										<canvas id="chart-area3"></canvas>
									</div>
                                </div>
                            </a>
                            </div>
                       </div> 
	
	<script>

		var chartColors = window.chartColors;
		var color = Chart.helpers.color;
		
		var config = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [
					// 랜덤 값 설정
					'${projectCnt[0].CNT}', '${projectCnt[1].CNT}', '${projectCnt[2].CNT}', '${projectCnt[3].CNT}' ],
					backgroundColor : [
					// 랜덤 값에 색상 설정
					color(chartColors.blue).alpha(0.5).rgbString(),
					color(chartColors.green).alpha(0.5).rgbString(),
					color(chartColors.yellow).alpha(0.5).rgbString(),
					color(chartColors.orange).alpha(0.5).rgbString(),
					color(chartColors.red).alpha(0.5).rgbString(), ],
					label : 'Dataset 1'
				} ],
				labels : [ '${projectCnt[0].CLIENT}', '${projectCnt[1].CLIENT}', '${projectCnt[2].CLIENT}', '${projectCnt[3].CLIENT}' ]
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
		
		new Chart(document.getElementById("chartjs-1"), {
			"type" : "bar",
			"data" : {
				"labels" : [ '${projectPayment[0].CLIENT}', '${projectPayment[1].CLIENT}', '${projectPayment[2].CLIENT}', '${projectPayment[3].CLIENT}' ],
				"datasets" : [ {
					"label" : "원",
					"data" : [ '${projectPayment[0].SUM}', '${projectPayment[1].SUM}', '${projectPayment[2].SUM}', '${projectPayment[3].SUM}'  ],
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
		

		var color = Chart.helpers.color;
		var config2 = {
			type: 'radar',
			data: {
				labels: [ '${freeSalary[3].CONS_FREE_ID}', '${freeSalary[2].CONS_FREE_ID}',
				          '${freeSalary[1].CONS_FREE_ID}', '${freeSalary[0].CONS_FREE_ID}' ],
				datasets: [{
					label: '수익금',
					backgroundColor: color(window.chartColors.blue).alpha(0.2).rgbString(),
					borderColor: window.chartColors.blue,
					pointBackgroundColor: window.chartColors.blue,
					data: [
							"${freeSalary[3].SUM}", "${freeSalary[2].SUM}",
							"${freeSalary[1].SUM}", "${freeSalary[0].SUM}"]

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
			data: {
				datasets: [{
					data: [
							"${freeJoinProject[2].CNT}", "${freeJoinProject[1].CNT}",
							"${freeJoinProject[0].CNT}", "${freeJoinProject[3].CNT}"
					],
					backgroundColor: [
										color(chartColors.red).alpha(0.5).rgbString(),
										color(chartColors.orange).alpha(0.5).rgbString(),
										color(chartColors.yellow).alpha(0.5).rgbString(),
										color(chartColors.green).alpha(0.5).rgbString(),
										color(chartColors.blue).alpha(0.5).rgbString(),
					],
					label: 'My dataset' // for legend
				}],
				labels: [ '${freeJoinProject[2].CONS_FREE_ID}', '${freeJoinProject[1].CONS_FREE_ID}', 
				          '${freeJoinProject[1].CONS_FREE_ID}', '${freeJoinProject[3].CONS_FREE_ID}']
			},
			options: {
				responsive: true,
				legend: {
					position: 'bottom',
				},
				scale: {
					ticks: {
						beginAtZero: true
					},
					reverse: false
				},
				animation: {
					animateRotate: false,
					animateScale: true
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

			window.myDoughnut = new Chart(ctx1, config);
			window.myDoughnut2 = new Chart(ctx2, config2);
			window.myPolarArea = Chart.PolarArea(ctx3, config3);
		};


		
		
	</script>

</body>
</html>
