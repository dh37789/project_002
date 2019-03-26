<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function(){
	
	Codebase.blocks('#divChk', 'close');
	Codebase.blocks('#divCheck', 'close');
	Codebase.blocks('#divRepreChk', 'close');
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#btnRepre').click(function(){
		
		Codebase.blocks('#divBtn', 'close');
		Codebase.blocks('#divChk', 'open');
		Codebase.blocks('#divCheck', 'open');
		Codebase.blocks('#divRepreChk', 'open');
		Codebase.blocks('#divRepre', 'close');
		Codebase.blocks('#btnRepre', 'close');
		Codebase.blocks('#btnAdd', 'close');
		
		
	})
	
	$('#btnRepreCancle').click(function(){
		
		Codebase.blocks('#btnRepre', 'open');
		Codebase.blocks('#divBtn', 'open');
		Codebase.blocks('#divChk', 'close');
		Codebase.blocks('#divCheck', 'close');
		Codebase.blocks('#divRepreChk', 'close');
		Codebase.blocks('#divRepre', 'open');
		Codebase.blocks('#btnAdd', 'open');
	})
	
	
	$('#btnProfile').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
	});
	$('#btnAdd').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/portfolioForm.do";
	});
	
	
	
	$('#btnRepreSave').click(function(){
		swal({
	      	  title: "알림",
	      	  text: "대표 포트폴리오를 수정하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						if($(".chkboxRepre:checked").length > 3){
							swal("경고", "대표 포트폴리오는 3개까지 가능합니다.");
							return false;
						}

						$.ajax({
					         type:'POST',
					         dataType:'JSON',
					         data:{
					        	 mem_id : '${USER_LOGININFO.mem_id }'
					        	 	},
					         url:'${pageContext.request.contextPath}/freProfile/updatePortTotalRepre.do',
					         error:function(result){
					            swal("", result.message, "info");
					         },
					         async: false,
					         success:function(result){
					            if(eval(result.result.flag)){
					            	location.href = "${pageContext.request.contextPath}/freProfile/portfolioBeforeForm.do?mem_id=${USER_LOGININFO.mem_id}";
									updateChek();
					            }
					         }
					  	});
						function updateChek(){
							$(".chkboxRepre:checked").each(function() {
								  var po_num = $(this).val();
								  $.ajax({
						 		         type:'POST',
						 		         dataType:'JSON',
						 		         data:{
						 		        	 mem_id : '${USER_LOGININFO.mem_id }',
						 		        	 po_num : po_num },
						 		         url:'${pageContext.request.contextPath}/freProfile/updatePortRepre.do',
						 		         error:function(result){
						 		            swal("", result.message, "info");
						 		         },
						 		         async: false,
						 		         success:function(result){
						 		            if(eval(result.result.flag)){
						 		            	Codebase.blocks('#btnAdd', 'open');
						 		            	location.href = "${pageContext.request.contextPath}/freProfile/portfolioBeforeForm.do?mem_id=${USER_LOGININFO.mem_id}";
						 		            }
						 		         }
						 		  });
							});
						}
						
						
					}else{
						return;
					}
				});
	})
	
	
})
</script>
<body>
<div class="content">
                    <h2 class="content-heading">
					<img src="${pageContext.request.contextPath}/image/2.png" width="25px">
					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnProfile" name="btnProfile">내 프로필에서 보기</button>
								&nbsp; 포트폴리오
					</h2>
                    <!-- 대표 포트폴리오 -->
                    <h2 class="content-heading">
                        <button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnRepre" name="btnRepre">대표 포트폴리오 수정</button>
                        <i class=""></i> 대표 포트폴리오
                    </h2>
                    
                    
                    <div id="divRepreChk" class="row">
                    <c:if test="${empty checkRepre}">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
<%--                             <c:if test="${empty portList}"> --%>
									<br><br><img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/resume.png" alt="">
									<p class="portfolio-no-img-content">
										<strong>'대표 포트폴리오'</strong>가 없습니다.
									</p><br><br>
                            </div>
                        </div>
                    </c:if>
                    
                    
                    
                    <c:if test="${not empty checkRepre }">
                    	<c:forEach items="${portList }" var="portInfo">
                    	<c:if test="${portInfo.po_repre eq '0' }">
                    	<c:if test="${portInfo.pofile_status eq 'y'}">
                        <div class="col-md-6 col-xl-3">
                            <!-- Developer Plan -->
                            <a class="block block-link-pop block-rounded block-bordered text-center" href="${pageContext.request.contextPath}/freProfile/portfolioBeforeView.do?mem_id=${USER_LOGININFO.mem_id}&po_num=${portInfo.po_num}">
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
                                
                                <div id="" class="block-content block-content-full bg-gray-lighter">
                                	<input type="checkbox" name="chkboxRepre" style="width: 20px;height: 20px;" class="chkboxRepre" value="${portInfo.po_num }" <c:if test="${portInfo.po_repre eq '0'}"> checked="checked"</c:if>>
                                </div>
                                
                            </a>
                            <!-- END Developer Plan -->
                        </div>
                        </c:if>
                        </c:if>
                        </c:forEach>
                        </c:if>
                    </div>
                    
                    
                    
                    <div id="divRepre" class="row">
                    <c:if test="${empty checkRepre}">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
<%--                             <c:if test="${empty portList}"> --%>
									<br><br><img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/resume.png" alt="">
									<p class="portfolio-no-img-content">
										<strong>'대표 포트폴리오'</strong>가 없습니다.
									</p><br><br>
                            </div>
                        </div>
                    </c:if>
                    
                    
                    
                    <c:if test="${not empty checkRepre }">
                    	<c:forEach items="${portList }" var="portInfo">
                    	<c:if test="${portInfo.po_repre eq '0' }">
                    	<c:if test="${portInfo.pofile_status eq 'y' }">
                        <div class="col-md-6 col-xl-3">
                            <!-- Developer Plan -->
                            <a class="block block-link-pop block-rounded block-bordered text-center" href="${pageContext.request.contextPath}/freProfile/portfolioBeforeView.do?mem_id=${USER_LOGININFO.mem_id}&po_num=${portInfo.po_num}">
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
                        </c:if>
                        </c:forEach>
                        </c:if>
                    </div>
                    <!-- END 자기소개 -->
                    
                    
                    
                    
                    
                    
                    
                    <h2 class="content-heading">
                        <button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnAdd" name="btnAdd">추가 하기</button>
                        <i class=""></i> 포트폴리오
                    </h2>
                    <div id="divBtn" class="row">
                    <c:if test="${not empty portList}">
                        <c:forEach items="${portList }" var="portInfo">
                        <c:if test="${portInfo.po_repre eq '1' }">
                        <c:if test="${portInfo.pofile_status eq 'y'}">
                        <div class="col-md-6 col-xl-3">
                            <!-- Developer Plan -->
                            <a class="block block-link-pop block-rounded block-bordered text-center" href="${pageContext.request.contextPath}/freProfile/portfolioBeforeView.do?mem_id=${USER_LOGININFO.mem_id}&po_num=${portInfo.po_num}">
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
                        </c:if>
                        </c:forEach>
                        </c:if>
                    </div>
                    
                    
                    
                    
                    
                    
                    <div id="divChk" class="row">
                    <c:if test="${not empty portList}">
                        <c:forEach items="${portList }" var="portInfo">
                                                <c:if test="${portInfo.po_repre eq '1' }">
                        <c:if test="${portInfo.pofile_status eq 'y'}">
                        <div class="col-md-6 col-xl-3">
                            <!-- Developer Plan -->
                            <a class="block block-link-pop block-rounded block-bordered text-center" href="${pageContext.request.contextPath}/freProfile/portfolioBeforeView.do?mem_id=${USER_LOGININFO.mem_id}&po_num=${portInfo.po_num}">
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
                                
                                <div id="" class="block-content block-content-full bg-gray-lighter">
                                	<input type="checkbox" name="chkboxRepre" style="width: 20px;height: 20px;" class="chkboxRepre" value="${portInfo.po_num }" <c:if test="${portInfo.po_repre eq '0'}"> checked="checked"</c:if>>
                                </div>
                                
                            </a>
                            <!-- END Developer Plan -->
                        </div>
                        </c:if>
                        </c:if>
                        </c:forEach>
                        </c:if>
                    </div>
                    
                    
                    
                    
                    
                    <!-- 포트폴리오 -->
                    <c:if test="${empty portList}">
                    <div class="row items-push">
                        <div class="col-md-8 col-xl-12">
                            <div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
									<br><br><img class="img-introduction" src="${pageContext.request.contextPath}/assets/img/icon/resume.png" alt="">
									<p class="portfolio-no-img-content">
										등록된 <strong>'포트폴리오'</strong>가 없습니다.
									</p><br><br>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <!-- END 포트폴리오 -->
                    <div id="divCheck" class="form-group p5-form-group p5-profile-manage-btn-group">
						<div class="btn-wrapper pull-right">
						    <button type="button" class="btn btn-secondary" id="btnRepreCancle" name="btnRepreCancle">취소</button>
                            <button type="button" class="btn btn-alt-primary" id="btnRepreSave" name="btnRepreSave">수정 완료</button>
						</div>
					</div>
          </div>
</body>
</html>