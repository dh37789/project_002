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
	
})

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
	
// 	x = $('.pay').text();
// 	function numberWithCommas(x) {
// 	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 	}
	
// 	numberWithCommas(x);
	
	window.onload = function() {
		var ctx1 = document.getElementById('chartEval').getContext('2d');

		window.myDoughnut = new Chart(ctx1, config);
	};
</script>
<style>
	#trTech {
		background-color: window;
	}
	#trCareer {
		background-color: window;
	}
	#trAcademic {
		background-color: window;
	}
	#trLicense {
		background-color: window;
	}

</style>
<body>

<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프리랜서</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/freelancer/freelancerList.do">리스트</a> 
	</span> 
	<span class="breadcrumb-item active"> 
		<a>상세보기</a> 
	</span> 
</nav>

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
					${memberInfo.mem_id} <i class="fa fa-star text-warning"></i>
				</h1>
				<h2 class="h5 text-white-op">
				&nbsp;
					<c:choose>
						<c:when test="${memberInfo.ftype_num=='0' }">
							&nbsp;<img src="${pageContext.request.contextPath}/image/ftype_1.png"
								width="20px">
					&nbsp;&nbsp;&nbsp;Developer
				</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/image/ftype_2.png"
								width="20px">
					&nbsp;&nbsp;&nbsp;Designer
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
                    <h2 class="content-heading">
                    <img src="${pageContext.request.contextPath}/image/1.png" width="25px">
<!-- 					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnIntroduce" name="btnIntroduce">업데이트 하기</button> -->
						&nbsp; 자기소개
					</h2>
                    <div class="row items-push">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary" style="height: 200px; padding: 30px;">
                            <c:if test="${empty memberInfo.mem_selfinfo}">
                            	<div align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/reunion.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'자기소개'</strong>가 없습니다.
									</p>
								</div>
							</c:if>
							${memberInfo.mem_selfinfo}
                            </div>
                        </div>
                    </div>
                    <!-- END 자기소개 -->
                    
                    <!-- 포트폴리오 -->
                    <h2 class="content-heading">
					<img src="${pageContext.request.contextPath}/image/2.png" width="25px">
								&nbsp; 포트폴리오
					</h2>
                    <div class="row row-deck items-push">
                    <c:if test="${empty portList}">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center" style="height: 200px; padding: 30px;" align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/resume.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'포트폴리오'</strong>가 없습니다.
									</p>
                            </div>
                        </div>
                    </c:if>
                    
                    
                    <c:if test="${not empty portList}">
                        <c:forEach items="${portList }" var="portInfo">
                        <c:if test="${portInfo.pofile_status eq 'y'}">
                        <div class="col-md-6 col-xl-3">
                            <!-- Developer Plan -->
                            <a class="block block-link-pop block-rounded block-bordered text-center" href="${pageContext.request.contextPath}/freelancer/portfolioView.do?mem_id=${memberInfo.mem_id}&po_num=${portInfo.po_num}">
<!--                                 <div class="block-header"> -->
<!--                                     <h3 class="block-title">Developer</h3> -->
<!--                                 </div> -->
                                <div class="block-content bg-gray-lighter">
                                <br>
                                    <div></div>
                                    <c:if test="${portInfo.pofile_status eq 'y' }"><img src="/files/${portInfo.pofile_save_name}" alt="pic1" width="200" height="150"></c:if>
                                    <div></div>
                                    <br>
                                </div>
                                <div class="block-content">
<%--                                 	<c:if test="${portInfo.pofile_status eq 'y' || null}"> --%>
                                	<c:if test="${portInfo.po_repre eq '0' }"><p class="badge badge-warning">대표 포트폴리오</p></c:if>
                                    <p class="text-success">${portInfo.po_title}</p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '22'}">PhotoShop</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '23'}">CSS</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '24'}">hybridapp</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '25'}">HTML</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '26'}">Android</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '27'}">JSP</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '28'}">ORACLE</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '29'}">SQL</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '30'}">DB</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '0'}">C</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '1'}">C++</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '2'}">C#</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '3'}">Visual Basic</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '4'}">Java</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '5'}">JavaScript</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '6'}">Python</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '7'}">R</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '8'}">PHP</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '9'}">어셈블리어</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '10'}">CoffeeScript</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '11'}">ABAP</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '12'}">D</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '13'}">Prolog</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '14'}">Ruby</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '15'}">Rust</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '16'}">Scala</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '17'}">파스칼</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '18'}">Perl</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '19'}">Objective-C</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '20'}">Go</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '21'}">Forth</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '100'}">기타</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '31'}">firmware</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '32'}">HW설계</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '33'}">IOS</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '34'}">Unity</c:if></strong></p>
                                    <p><strong> <c:if test="${portInfo.po_tech eq '35'}">OpenCV</c:if></strong></p>
                                   
                                </div>
                                
                                
                                
                            </a>
                            <!-- END Developer Plan -->
                        </div>
                        </c:if>
                        </c:forEach>
                        </c:if>
                    
                    
                    
                    </div>
                    <!-- END 포트폴리오 -->
                    
                    <!-- 보유기술 -->
                    <h2 class="content-heading">
					<img src="${pageContext.request.contextPath}/image/3.png" width="25px">
						&nbsp; 보유기술
					</h2>
                    
                    <div class="row items-push">
                        <div class="col-md-8 col-xl-12">
                        
	                    	<c:if test="${empty techList}">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center" style="height: 200px; padding: 30px;" align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/team.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'보유기술'</strong>이 없습니다.
									</p>
                            </div>
                   		 	</c:if>  
                   		 	
                   		 	<div class="block-content">
                   		 	<c:if test="${not empty techList }">
							<table class="table table-bordered table-vcenter" id="tech_table">
								<thead class="table-primary">
									<tr>
										<th class="text-center" style="width: 50%;"><strong>종류</strong></th>
										<th class="text-center" style="width: 15%;"><strong>숙련도</strong></th>
										<th class="text-center" style="width: 35%;"><strong>경험</strong></th>
									</tr>
								</thead>
								<tbody id="tech_tbody">
									<c:forEach items="${techList }" var="techInfo">
									<tr id="trTech">
										<td><input type="hidden" name="tech_num" class="form-control" value="${techInfo.tech_num }"/>
											<div class="col-md-12">
		<!-- 										<input type="text" class="form-control" id="selectType" -->
		<!-- 											name="textType"> -->
													<c:if test="${techInfo.tech_type eq '22'}">PhotoShop</c:if>
													<c:if test="${techInfo.tech_type eq '23'}">CSS</c:if>
													<c:if test="${techInfo.tech_type eq '24'}">hybridapp</c:if>
													<c:if test="${techInfo.tech_type eq '25'}">HTML</c:if>
													<c:if test="${techInfo.tech_type eq '26'}">Android</c:if>
													<c:if test="${techInfo.tech_type eq '27'}">JSP</c:if>
													<c:if test="${techInfo.tech_type eq '28'}">ORACLE</c:if>
													<c:if test="${techInfo.tech_type eq '29'}">SQL</c:if>
													<c:if test="${techInfo.tech_type eq '30'}">DB</c:if>
													<c:if test="${techInfo.tech_type eq '0'}">C</c:if>
													<c:if test="${techInfo.tech_type eq '1'}">C++</c:if>
													<c:if test="${techInfo.tech_type eq '2'}">C#</c:if>
													<c:if test="${techInfo.tech_type eq '3'}">Visual Basic</c:if>
													<c:if test="${techInfo.tech_type eq '4'}">Java</c:if>
													<c:if test="${techInfo.tech_type eq '5'}">JavaScript</c:if>
													<c:if test="${techInfo.tech_type eq '6'}">Python</c:if>
													<c:if test="${techInfo.tech_type eq '7'}">R</c:if>
													<c:if test="${techInfo.tech_type eq '8'}">PHP</c:if>
													<c:if test="${techInfo.tech_type eq '9'}">어셈블리어</c:if>
													<c:if test="${techInfo.tech_type eq '10'}">CoffeeScript</c:if>
													<c:if test="${techInfo.tech_type eq '11'}">ABAP</c:if>
													<c:if test="${techInfo.tech_type eq '12'}">D</c:if>
													<c:if test="${techInfo.tech_type eq '13'}">Prolog</c:if>
													<c:if test="${techInfo.tech_type eq '14'}">Ruby</c:if>
													<c:if test="${techInfo.tech_type eq '15'}">Rust</c:if>
													<c:if test="${techInfo.tech_type eq '16'}">Scala</c:if>
													<c:if test="${techInfo.tech_type eq '17'}">파스칼</c:if>
													<c:if test="${techInfo.tech_type eq '18'}">Perl</c:if>
													<c:if test="${techInfo.tech_type eq '19'}">Objective-C</c:if>
													<c:if test="${techInfo.tech_type eq '20'}">Go</c:if>
													<c:if test="${techInfo.tech_type eq '21'}">Forth</c:if>
													<c:if test="${techInfo.tech_type eq '100'}">기타</c:if>
													<c:if test="${techInfo.tech_type eq '31'}">firmware</c:if>
													<c:if test="${techInfo.tech_type eq '32'}">HW설계</c:if>
													<c:if test="${techInfo.tech_type eq '33'}">IOS</c:if>
													<c:if test="${techInfo.tech_type eq '34'}">Unity</c:if>
													<c:if test="${techInfo.tech_type eq '35'}">OpenCV</c:if><c:if test="${techInfo.tech_repre eq '0'}"><a class="badge badge-warning">대표 보유 기술</a></c:if>
											</div>
										</td>
										
										<td>
											<div class="col-md-12" align="center">
													<c:if test="${techInfo.tech_fluent == 0}">초급</c:if> 
					 								<c:if test="${techInfo.tech_fluent == 1}">중급</c:if> 
													<c:if test="${techInfo.tech_fluent == 2}">고급</c:if> 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
												${techInfo.tech_period}
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</c:if>
						</div>
                        </div>
                    </div>
                    <!-- END 보유기술 -->
                    
                    <!-- 경력,학력,자격증 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/4.png" width="25px">
							&nbsp; 경력ㆍ학력ㆍ자격증
					</h2>
                    <c:if test="${empty careerList}">
                    	<div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="careerDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center" style="height: 200px; padding: 30px;" align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/career.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'경력'</strong>이 없습니다.
									</p>
                            </div>
                        </div>
                        </div>
                     </c:if>
                        
                   		 	
                   		 	<c:if test="${not empty careerList }">
                   		 	<div class="block-content" id="careerTable">
                   		 	<h5>경력</h5>
							<table class="table table-bordered table-vcenter" id="career_table">
								<thead class="table-warning">
									<tr>
										<th class="text-center" style="width: 25%;"><strong>회사명</strong></th>
										<th class="text-center" style="width: 25%;"><strong>근무부서</strong></th>
										<th class="text-center" style="width: 25%;"><strong>직위</strong></th>
										<th class="text-center" style="width: 15%;"><strong>근무기간</strong></th>
									</tr>
								</thead>
								<tbody id="career_tbody">
									<c:forEach items="${careerList }" var="careerInfo">
									<tr id="trCareer">
										<td><input type="hidden" id="career_num" name="career_num" class="form-control" value="${careerInfo.ca_num }"/>
											<div class="col-md-12">
													${careerInfo.ca_company }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${careerInfo.ca_department } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${careerInfo.ca_position }
											</div>
										</td>
										
										<td>
											<div class="col-md-12" align="center">
													${fn:substring(careerInfo.ca_in, 0, 7)} ~ ${fn:substring(careerInfo.ca_out, 0, 7)}
											</div>
										</td>
										
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
                        <c:if test="${empty academicList}">
                        <div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="academicDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center" style="height: 200px; padding: 30px;" align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/mortarboard.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'학력'</strong>이 없습니다.
									</p>
                            </div>
                            <br>
                   		</div>
                   		</div>
                   		</c:if>
                   		
		
						<c:if test="${not empty academicList }">
                   		 	<div class="block-content" id="academicTable">
                   		 	<h5>학력</h5>
							<table class="table table-bordered table-vcenter" id="academic_table">
								<thead class="table-danger">
									<tr>
										<th class="text-center" style="width: 11%;"><strong>분류</strong></th>
										<th class="text-center" style="width: 9%;"><strong>상태</strong></th>
										<th class="text-center" style="width: 25%;"><strong>학교명</strong></th>
										<th class="text-center" style="width: 30%;"><strong>전공</strong></th>
										<th class="text-center" style="width: 15%;"><strong>기간</strong></th>
									</tr>
								</thead>
								<tbody id="academic_tbody">
									<c:forEach items="${academicList }" var="academicInfo">
									<tr id="trAcademic">
										<td><input type="hidden" id="academic_num" name="academic_num" class="form-control" value="${academicInfo.ac_num }"/>
											<div class="col-md-12">
													${academicInfo.ac_type }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_final } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_school }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${academicInfo.ac_major }
											</div>
										</td>
										
										<td>
											<div class="col-md-12" align="center">
													${fn:substring(academicInfo.ac_in, 0, 7)} ~ ${fn:substring(academicInfo.ac_out, 0, 7)}
											</div>
										</td>
										
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
							
							
							
                        <c:if test="${empty licenseList}">
                   		<div class="row items-push">
                        <div class="col-md-8 col-xl-12" id="licenseDiv">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center" style="height: 200px; padding: 30px;" align="center">
									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/diploma.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'자격증'</strong>이 없습니다.
									</p>
                            </div>
                            <br>
                   		</div>
                   		</div>
	                   	</c:if>
                   		
                   		<c:if test="${not empty licenseList }">
                   		 	<div class="block-content" id="academicTable">
                   		 	<h5>자격증</h5>
							<table class="table table-bordered table-vcenter" id="license_table">
								<thead class="table-success">
									<tr>
										<th class="text-center" style="width: 35%;"><strong>자격증명</strong></th>
										<th class="text-center" style="width: 30%;"><strong>발급기관</strong></th>
										<th class="text-center" style="width: 25%;"><strong>발행일자</strong></th>
									</tr>
								</thead>
								<tbody id="academic_tbody">
									<c:forEach items="${licenseList }" var="licenseInfo">
									<tr id="trLicense">
										<td><input type="hidden" id="license_num" name="license_num" class="form-control" value="${licenseInfo.li_num }"/>
											<div class="col-md-12">
													${licenseInfo.li_name }
											</div>
										</td>
										
										<td>
											<div class="col-md-12">
													${licenseInfo.li_organization } 
											</div>
										</td>
										
										<td>
											<div class="col-md-12" align="center">
													${fn:substring(licenseInfo.li_date, 0, 10)}
											</div>
										</td>
										
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							</c:if>
                    <!-- END 경력,학력,자격증 -->

					<!-- 평가 -->
                    <h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/5.png" width="25px">
						&nbsp;평가
					</h2>
                    <div class="row row-deck items-push">
                    
<!--                             <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center"> -->
<%-- 									<img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/medal.png" alt=""> --%>
<!-- 									<p class="portfolio-no-img-content"> -->
<!-- 										등록된 <strong>'평가'</strong>가 없습니다. -->
<!-- 									</p> -->
							
							<div class="col-md-6">
                            <a class="block">
                            <div class="block-header bg-gd-emerald" style="color: white;">
                                    <h3 class="block-title">활동 내역</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
                                    </div>
                                </div>
                            
                                <div class="block-content block-content-full">
                                    <div class="row py-20">

										<div class="col-lg-6 text-left border-r row">
                                        <div class="text-left" style="margin-left: 25px; margin-top: 40px;">
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">지원한 프로젝트</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;">진행중 프로젝트</div>
                                           <div class="font-size-h5 font-w600">완료한 프로젝트</div>
                                         </div>
                                         <div class="text-right " style="margin-left: 90px; margin-top: 40px;">
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;"><c:if test="${apply eq null }">0</c:if> ${apply }건</div>
                                           <div class="font-size-h5 font-w600" style="margin-bottom: 7px;"><c:if test="${projecting eq null }">0</c:if> ${projecting }건</div>
                                           <div class="font-size-h5 font-w600"><c:if test="${endProject eq null }">0</c:if> ${endProject }건</div>
                                         </div>
                                         <div class="font-size-h7 font-w600" style="margin-left: 50px;"><hr>
                                                    누적 완료 금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <c:if test="${endProject eq null }">0</c:if><span class="pay">${totalPayment }</span>원</div>
                                        </div>
                                        
<%--                                         ${totalPayment } --%>
                                        
                                        <div class="col-6" style="margin-left : 25px;">
<!--                                             <div class="font-size-h3 font-w600"> -->
<!--                                             	<div class="block-content block-content-full text-center"> -->
				                                    <!-- Radar Chart Container -->
				                                    <canvas id="chartEval" style="width: 1px; height: 1px;"></canvas>
<!-- 				                                </div> -->
<!--                                             </div> -->
                                        </div>
											
											</div>
                                    </div>
                               
                               
                                </div>
                            </a>
                        
                        
                        
                        <div class="col-md-6">
                            <a class="block">
                            <div class="block-header bg-gd-dusk">
                                    <h3 class="block-title" style="color: white;">평점</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
                                    </div>
                                </div>
                                <div class="block-content block-content-full">
                                    <div class="row py-20">
                                        <div class="col-6 text-right border-r">
                                            <div class="font-size-h4 font-w600">
                                            
                                            	<div class="text-warning"><label style="color: black;">전체 평균평점</label><br>
			                                    <c:if test="${totalAvg eq null}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.2 >= totalAvg && totalAvg > 0}">
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
                                            <div class="font-size-sm font-w600 text-uppercase text-muted">등록된 평가<c:if test="${countEval eq null }"> 0</c:if> ${countEval}개</div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-success">
											<c:forEach items="${evalList }" var="evalInfo" varStatus="evalStatus">
												<div class="text-warning"><label style="color: black;">${evalInfo.eval}</label>&nbsp;
			                                    <c:if test="${evalInfo.evalVal eq null}">
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                        <i class="fa fa-fw fa-star-o"></i>
			                                    </c:if>
			                                    <c:if test="${0.2 >= evalInfo.evalVal && evalInfo.evalVal > 0}">
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
			                                    </c:if><label style="color: black;"><c:if test="${evalInfo.evalVal eq null}">0.0</c:if>${evalInfo.evalVal}</label><br><br>
			                           		 </div>
		                                    </c:forEach>
											
											
											
											
											</div>
                                            <div class="font-size-sm font-w600 text-uppercase text-muted">
                                            
                                            
                                            
                                            
                                            
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
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
                    </div>
                    <!-- END 평가 -->

                </div>


</body>
</html>