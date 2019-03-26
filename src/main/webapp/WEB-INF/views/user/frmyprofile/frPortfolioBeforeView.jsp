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
<script>
$(function(){
	
	$('#btnBefore').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/portfolioBeforeForm.do?mem_id=${USER_LOGININFO.mem_id }";
	})
	
	$('#btnEdit').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/portfolioView.do?mem_id=${USER_LOGININFO.mem_id }&po_num=${portInfo.po_num}";

	});
	$('#btnDel').click(function(){
		var po_num = $(this).val();
		
		swal({
	      	  title: "알림",
	      	  text: "포트폴리오를 삭제하시겠습니까?",
	      	  icon: "warning",
	      	  buttons: true,
	      	})
		    .then(function(result){ 
					if (result) {
						$.ajax({
					         type:'POST',
					         dataType:'JSON',
					         data:{
					        	 mem_id : '${USER_LOGININFO.mem_id }',
					        	 po_num : po_num },
					         url:'${pageContext.request.contextPath}/freProfile/deletePortfolio.do',
					         error:function(result){
					            swal("", result.message, "info");
					         },
					         success:function(result){
					            if(eval(result.result.flag)){
					            	location.href = "${pageContext.request.contextPath}/freProfile/portfolioBeforeForm.do?mem_id=${USER_LOGININFO.mem_id }";
					            }
					         }
					      });
						
					}else{
						return;
					}
				});
		
	});
	
})
</script>
<body>
<div class="content">
                    <h2 class="content-heading">
					<img src="${pageContext.request.contextPath}/image/2.png" width="25px">
					<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right" id="btnBefore" name="btnBefore">이전 단계로</button>
								&nbsp; 포트폴리오
					</h2>
                    
                    <div class="col-md-12">
                            <div class="block block-themed">
                                <div class="block-header bg-elegance-darker">
                                    <h3 class="block-title">${portInfo.po_title }</h3>
                                    <div class="block-options">
                                    </div>
                                </div>
                                <div class="block-content">
                                    <p> <img src="/files/${portInfo.pofile_save_name}" alt="pic1" width="500" height="450"></p>
                                    <p>&nbsp&nbsp<a class="badge badge-warning">카테고리</a>&nbsp <c:if test="${portInfo.po_cate_num eq '1' }">웹</c:if>
																                  <c:if test="${portInfo.po_cate_num eq '2' }">어플리케이션</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '3' }">워드프레스</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '4' }">퍼블리싱</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '5' }">일반 소프트웨어</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '6' }">커머스, 쇼핑몰</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '7' }">게임</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '8' }">임베디드</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '9' }">기타</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '10' }">웹</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '11' }">어플리케이션</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '12' }">제품</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '13' }">프레젠테이션</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '14' }">인쇄물</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '15' }">커머스, 쇼핑몰</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '16' }">로고</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '17' }">그래픽</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '18' }">영상</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '19' }">게임</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '20' }">기타</c:if> 
																                  <c:if test="${portInfo.po_cate_num eq '21' }">임베디드</c:if></p>
                                    <p>&nbsp&nbsp<a class="badge badge-warning">설명</a>&nbsp ${portInfo.po_content }</p>
                                    <p>&nbsp&nbsp<a class="badge badge-warning">참여 기간</a>&nbsp ${fn:substring(portInfo.po_start, 0, 7)} ~ ${fn:substring(portInfo.po_end, 0, 7)}</p>
                                    <p>&nbsp&nbsp<a class="badge badge-warning">참여율</a>&nbsp ${portInfo.po_percent }%</p>
<!--                                     <p><a class="badge badge-primary"">이미지</a>  -->
									<p>&nbsp&nbsp<a class="badge badge-warning">관련기술</a>&nbsp<c:if test="${portInfo.po_tech eq '22'}">PhotoShop</c:if> 
																				<c:if test="${portInfo.po_tech eq '23'}">CSS</c:if> 
																				<c:if test="${portInfo.po_tech eq '24'}">hybridapp</c:if> 
																				<c:if test="${portInfo.po_tech eq '25'}">HTML</c:if> 
																				<c:if test="${portInfo.po_tech eq '26'}">Android</c:if> 
																				<c:if test="${portInfo.po_tech eq '27'}">JSP</c:if> 
																				<c:if test="${portInfo.po_tech eq '28'}">ORACLE</c:if> 
																				<c:if test="${portInfo.po_tech eq '29'}">SQL</c:if> 
																				<c:if test="${portInfo.po_tech eq '30'}">DB</c:if> 
																				<c:if test="${portInfo.po_tech eq '0'}">C</c:if> 
																				<c:if test="${portInfo.po_tech eq '1'}">C++</c:if> 
																				<c:if test="${portInfo.po_tech eq '2'}">C#</c:if>
																				<c:if test="${portInfo.po_tech eq '3'}">Visual Basic</c:if> 
																				<c:if test="${portInfo.po_tech eq '4'}">Java</c:if> 
																				<c:if test="${portInfo.po_tech eq '5'}">JavaScript</c:if> 
																				<c:if test="${portInfo.po_tech eq '6'}">Python</c:if> 
																				<c:if test="${portInfo.po_tech eq '7'}">R</c:if> 
																				<c:if test="${portInfo.po_tech eq '8'}">PHP</c:if> 
																				<c:if test="${portInfo.po_tech eq '9'}">어셈블리어</c:if> 
																				<c:if test="${portInfo.po_tech eq '10'}">CoffeeScript</c:if> 
																				<c:if test="${portInfo.po_tech eq '11'}">ABAP</c:if> 
																				<c:if test="${portInfo.po_tech eq '12'}">D</c:if>
																				<c:if test="${portInfo.po_tech eq '13'}">Prolog</c:if> 
																				<c:if test="${portInfo.po_tech eq '14'}">Ruby</c:if> 
																				<c:if test="${portInfo.po_tech eq '15'}">Rust</c:if> 
																				<c:if test="${portInfo.po_tech eq '16'}">Scala</c:if> 
																				<c:if test="${portInfo.po_tech eq '17'}">파스칼</c:if> 
																				<c:if test="${portInfo.po_tech eq '18'}">Perl</c:if> 
																				<c:if test="${portInfo.po_tech eq '19'}">Objective-C</c:if> 
																				<c:if test="${portInfo.po_tech eq '20'}">Go</c:if> 
																				<c:if test="${portInfo.po_tech eq '21'}">Forth</c:if> 
																				<c:if test="${portInfo.po_tech eq '100'}">기타</c:if> 
																				<c:if test="${portInfo.po_tech eq '31'}">firmware</c:if> 
																				<c:if test="${portInfo.po_tech eq '32'}">HW설계</c:if> 
																				<c:if test="${portInfo.po_tech eq '33'}">IOS</c:if> 
																				<c:if test="${portInfo.po_tech eq '34'}">Unity</c:if> 
																				<c:if test="${portInfo.po_tech eq '35'}">OpenCV</c:if></p>
                                </div>
                                
                                <div id="" class="form-group p5-form-group p5-profile-manage-btn-group">
									<div class="btn-wrapper pull-right"><br>
									    <button type="button" class="btn btn-secondary" id="btnDel" name="btnDel" value="${portInfo.po_num }">삭제</button>
			                            <button type="button" class="btn btn-alt-primary" id="btnEdit" name="btnEdit" value="${portInfo.po_num }">수정</button>
									</div>
								</div>
                    </div>
</div>
                    
                    
                    
</div>
</body>
</html>