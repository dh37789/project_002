<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartjs/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/be_comp_charts.js"></script>
<script>
$(function(){
	
	$('#btnIntroduce').click(function(){
		if(eval('${empty memberInfo.mem_selfinfo}')){
	    	location.href = "${pageContext.request.contextPath}/clProfile/selfInfoBeforeForm.do";
		}else{
	    	location.href = "${pageContext.request.contextPath}/clProfile/selfInfoBeforeView.do?mem_id=${USER_LOGININFO.mem_id }";
		}
    });
	
	$('#info').click(function(){
		location.href = "${pageContext.request.contextPath}/clProfile/infoView.do?mem_id=${USER_LOGININFO.mem_id }"
	});
	
});
	
	var color = Chart.helpers.color;
	var config = {
		type: 'radar',
		data: {
			labels: [ '전문성', '만족도', '의사소통', '일정준수', '적극성' ],
			datasets: [{
				label: '세부 항목 평가',
				backgroundColor: 'rgba(66,165,245,.25)',
                borderColor: 'rgba(66,165,245,1)',
                pointBackgroundColor: 'rgba(66,165,245,1)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgba(66,165,245,1)',
				data: [
						"${evalList.get(0).getEvalVal()}", "${evalList.get(1).getEvalVal()}",
						"${evalList.get(2).getEvalVal()}", "${evalList.get(3).getEvalVal()}",
						"${evalList.get(4).getEvalVal()}"
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
		          var value = ': ' + numberWithCommas(data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString());

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
		var ctx1 = document.getElementById('chartEval').getContext('2d');

		window.myDoughnut = new Chart(ctx1, config);
	};
	
	
	
</script>
<body>
<div class="bg-gd-dusk">
		<div class="bg-black-op-5">
			<div class="content content-top content-full text-center">
				<div class="mb-20">
					<c:choose>
					<c:when test="${memberInfo.mem_picture==null }">
						<img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar-thumb" src="/files/${memberInfo.mem_picture }" width="100px"
						alt="">
					</c:otherwise>
				</c:choose>
				</div>
				
				<h1 class="h3 text-white font-w700 mb-10">
					${memberInfo.mem_id}(${memberInfo.mem_name}) <i class="fa fa-star text-warning"></i>
				</h1>
				<h2 class="h5 text-white-op">
				&nbsp;
					<c:choose>
						<c:when test="${memberInfo.ftype_num=='0' }">
							&nbsp;<img src="${pageContext.request.contextPath}/image/ftype_1.png"
								width="20px">
					&nbsp;Developer
						</c:when>
						<c:when test="${memberInfo.ftype_num==null }">
							&nbsp;<img src="${pageContext.request.contextPath}/image/444.png"
								width="20px">
					&nbsp;Client
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/image/ftype_2.png"
								width="20px">
					&nbsp;Designer
				</c:otherwise>
					</c:choose>

					&nbsp;&nbsp;|&nbsp;&nbsp;

					<c:choose>
						<c:when test="${memberInfo.mtype_num=='0' }">
							<img src="${pageContext.request.contextPath}/image/mmtype_0.png"
								width="25px">
					&nbsp;개인
				</c:when>
						<c:when test="${memberInfo.mtype_num=='1' }">
							<img src="${pageContext.request.contextPath}/image/mmtype_1.png"
								width="25px">
					&nbsp;팀
				</c:when>
						<c:when test="${memberInfo.mtype_num=='2' }">
							<img src="${pageContext.request.contextPath}/image/mtype_2.png"
								width="15px">
					&nbsp;개인사업자
				</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/image/mtype_3.png"
								width="15px">
					&nbsp;법인사업자
					
				</c:otherwise>
					</c:choose>
				</h2>
			</div>
		</div>
	</div>







<div class="content">
                    <!-- 자기소개 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/1.png" width="25px">
					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnIntroduce" name="btnIntroduce">업데이트 하기</button>
						&nbsp; 클라이언트 정보
					</h2>
                    <c:if test="${empty memberInfo.mem_selfinfo}">
					<div class="row items-push">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
									<br>
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/reunion.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'자기소개'</strong>가 없습니다.
									</p>
									<br>
									</div>
								</div>
							</div>
							</c:if>
							
		                    <c:if test="${not empty memberInfo.mem_selfinfo}">
							<div class="col-md-12">
                            <div class="block block-themed">
                            
                                <div class="block-content" style="height: 200px; padding: 30px;">
                                <p><a class="badge badge-warning">자기 소개</a>&nbsp ${memberInfo.mem_selfinfo}</p>
                            	<p><a class="badge badge-warning">홈페이지</a>&nbsp ${memberInfo.mem_url}</p>
							
							
                            </div>
                        </div>
                    </div>
                    </c:if>
                    
                    <!-- 평가 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/5.png" width="25px">
					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="" name="">업데이트 하기</button>
						&nbsp;평가
					</h2>
                    <div class="row items-push row-deck">
                        
                        
                        
                        
<!--                             <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center"> -->
<%-- 									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/medal.png" alt=""> --%>
<!-- 									<p class="portfolio-no-img-content"> -->
<!-- 										등록된 <strong>'평가'</strong>가 없습니다. -->
<!-- 									</p> -->
									
									
							<div class="col-md-6">
                            <div class="block">
                            <div class="block-header bg-gd-emerald">
                                    <h3 class="block-title" style="color: white;">활동 내역</h3>
                                    <div class="block-options">
                                    </div>
                                </div>
                                
                                <div class="block-content block-content-full">
                                    <div class="row py-20">
                                    
                                    
<!--                                         <div class="col-lg-6 text-left border-r"> -->
<%--                                            <div class="font-size-h5 font-w600">등록한 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countRegis }건</div> --%>
<%--                                            <div class="font-size-h5 font-w600">진행중 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countProjecting}건</div> --%>
<%--                                            <div class="font-size-h5 font-w600">완료한 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countEnd }건</div> --%>
<!--                                            <hr> -->
<%--                                            <div class="font-size-h7 font-w600">누적 완료 금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${totalPay }원</div> --%>
                                           
<!--                                         </div> -->
<!--                                         <div class="col-6"> -->
<!-- <!--                                             <div class="font-size-h3 font-w600"> --> 
<!-- <!--                                             	<div class="block-content block-content-full text-center"> --> 
<!-- 				                                    Radar Chart Container -->
<%-- 				                                    <canvas id="chartEval" style="width: 1px; height: 1px;"></canvas> --%>
<!-- <!-- 				                                </div> --> 
<!-- <!--                                             </div> --> 
<!--                                         </div> -->

										<div class="col-lg-6 text-left border-r row">
                                        <div class="text-left" style="margin-left: 25px; margin-top: 40px;">
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">등록한 프로젝트</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">계약중 프로젝트</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">진행중 프로젝트</div>
                                           <div class="font-size-h5 font-w600">완료한 프로젝트</div>
                                         </div>
                                         <div class="text-right " style="margin-left: 90px; margin-top: 40px;">
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">
                                           <c:if test="${countRegis eq null }">0</c:if>${countRegis }건</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">
                                           <c:if test="${countContract eq null }">0</c:if>${countContract}건</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">
                                           <c:if test="${countProjecting eq null }">0</c:if>${countProjecting}건</div>
                                           <div class="font-size-h5 font-w600">${countEnd }건
                                           <c:if test="${countEnd eq null }">0</c:if></div>
                                         </div>
                                         <div class="font-size-h7 font-w600" style="margin-left: 50px;"><hr>
                                                    누적 완료 금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         ${totalPay }원</div>
                                        </div>
                                        
                                        
                                        
                                        <div class="col-6" style="margin-left : 25px;">
		                                    <canvas id="chartEval" style="width: 1px; height: 1px;"></canvas>
                                        </div>
                                    
                                    
                                    
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="block">
                            <div class="block-header bg-gd-dusk">
                                    <h3 class="block-title" style="color: white;">평점</h3>
                                    <div class="block-options">
                                    </div>
                                </div>
                                <div class="block-content block-content-full">
                                    <div class="text-right">
                                        <i class="fa fa-fw fa-2x text-muted"></i>
                                    </div>
                                    <div class="row py-20">
                                        <div class="col-6 text-right border-r">
                                            <div class="font-size-h4 font-w600">
                                            
                                            	<div class="text-warning"><label style="color: black;">전체 평균평점</label><br>
			                                    <c:if test="${0.2 >= totalAvg && totalAvg >= 0}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.7 >= totalAvg && totalAvg >= 0.3}">
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.2 >= totalAvg && totalAvg >= 0.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.7 >= totalAvg && totalAvg >= 1.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.2 >= totalAvg && totalAvg >= 1.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.7 >= totalAvg && totalAvg >= 2.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.2 >= totalAvg && totalAvg >= 2.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.7 >= totalAvg && totalAvg >= 3.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.2 >= totalAvg && totalAvg >= 3.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.7 >= totalAvg && totalAvg >= 4.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                    </c:if>
			                                    <c:if test="${5.0 >= totalAvg && totalAvg >= 4.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                    </c:if><label style="color: black;">${totalAvg}</label>
			                           		 </div>
                                            
                                            
                                            
                                            
                                            </div>
                                            <c:if test="${countEval eq null }">
                                            <div class="font-size-sm font-w600 text-uppercase text-muted">평가 0개</div>
                                            </c:if>
                                            <c:if test="${countEval ne null }">
                                            <div class="font-size-sm font-w600 text-uppercase text-muted">평가 ${countEval}개</div>
                                            </c:if>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-success">
											<c:forEach items="${evalList }" var="evalInfo" varStatus="evalStatus">
												<div class="text-warning"><label style="color: black;">${evalInfo.eval}</label>&nbsp;
			                                    <c:if test="${0.2 >= evalInfo.evalVal && evalInfo.evalVal >= 0}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.7 >= evalInfo.evalVal && evalInfo.evalVal >= 0.3}">
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.2 >= evalInfo.evalVal && evalInfo.evalVal >= 0.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${1.7 >= evalInfo.evalVal && evalInfo.evalVal >= 1.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.2 >= evalInfo.evalVal && evalInfo.evalVal >= 1.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${2.7 >= evalInfo.evalVal && evalInfo.evalVal >= 2.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.2 >= evalInfo.evalVal && evalInfo.evalVal >= 2.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${3.7 >= evalInfo.evalVal && evalInfo.evalVal >= 3.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.2 >= evalInfo.evalVal && evalInfo.evalVal >= 3.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${4.7 >= evalInfo.evalVal && evalInfo.evalVal >= 4.3}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star-half-o"></i>
			                                    </c:if>
			                                    <c:if test="${5.0 >= evalInfo.evalVal && evalInfo.evalVal >= 4.8}">
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                        <i class="fa fa-fw fa-star"></i>
			                                    </c:if><label style="color: black;">${evalInfo.evalVal}</label><br><br>
			                           		 </div>
		                                    </c:forEach>
											
											
											
											
											</div>
                                            <div class="font-size-sm font-w600 text-uppercase text-muted">
                                            
                                            
                                            
                                            
                                            
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
									
									
									
									
									
									
									
									
									
                                    <div class="text-warning">
                                    <c:if test="${0.2 >= ev_professione && ev_professione >= 0}">
                                        <i class="fa fa-fw fa-star-o" style="height: 100em;"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${0.7 >= ev_professione && ev_professione >= 0.3}">
                                        <i class="fa fa-fw fa-star-half-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${1.2 >= ev_professione && ev_professione >= 0.8}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${1.7 >= ev_professione && ev_professione >= 1.3}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-half-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${2.2 >= ev_professione && ev_professione >= 1.8}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${2.7 >= ev_professione && ev_professione >= 2.3}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-half-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${3.2 >= ev_professione && ev_professione >= 2.8}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${3.7 >= ev_professione && ev_professione >= 3.3}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-half-o"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${4.2 >= ev_professione && ev_professione >= 3.8}">
                                        <i class="fa fa-fw fa-2x fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-o"></i>
                                    </c:if>
                                    <c:if test="${4.7 >= ev_professione && ev_professione >= 4.3}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star-half-o"></i>
                                    </c:if>
                                    <c:if test="${5.0 >= ev_professione && ev_professione >= 4.8}">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                    </c:if>${ev_professione}
                           		 </div>
                           		 
                        </div>
                    </div>
                    
                    
                    <!-- END 평가 -->
                    
                    
                    
                    
</body>
</html>