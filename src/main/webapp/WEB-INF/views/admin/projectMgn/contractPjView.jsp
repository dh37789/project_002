<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var pr_num = '${projectInfo.pr_num}';
	$('#conBtn').click(function(){
		swal({
        	  title: "계약하시겠습니까?",
        	  text: "프로젝트 진행에 승인합니다.",
        	  icon: "success",
        	  buttons: true,
        	})
        	.then(function(result){
        	  if (result) {
				$(location).attr('href','${pageContext.request.contextPath}/projectMgn/contractProject.do?pr_num=' + pr_num);
        	  } else {
        	    return;
        	  }
        	});
	})
	$('.conDownload').click(function(){
		var cons_num = $(this).val();
		swal({
        	  title: "계약서를 다운받으시겠습니까?",
        	  icon: "info",
        	  buttons: true,
        	})
        	.then(function(result){
        	  if (result) {
				$(location).attr('href','${pageContext.request.contextPath}/projectMgn/contractDownload.do?cons_num=' + cons_num);
        	  } else {
        	    return;
        	  }
        	});
	})
	$('#listBtn').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMgn/contractPjList.do');
	})
	$('#deleteBtn').click(function(){
		swal({
      	  title: "삭제하시겠습니까?",
      	  text: "프로젝트를 삭제하겠습니다.",
      	  icon: "error",
      	  buttons: true,
      	  dangerMode: true,
      	})
      	.then(function(result){
      	  if (result) {
				$(location).attr('href','${pageContext.request.contextPath}/projectMgn/projectDelete.do?pr_num=' + pr_num);
      	  } else {
      	    return;
      	  }
      	});
	})
});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/projectMgn/contractPjList.do">계약 중인 프로젝트</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>상세보기</a> 
	</span>
</nav>

<h2 class="content-heading font-w400">${projectInfo.pr_title }<small>&nbsp;${fn:length(conList) }명이 계약중 입니다.</small>
<c:if test="${empty projectInfo.pr_check }">
<button class="btn btn-alt-success btn-md pull-right" style="margin-right: 170px;" disabled="disabled">계약 완료</button>
</c:if>
<c:if test="${not empty projectInfo.pr_check }">
<button id="conBtn" class="btn btn-alt-success btn-md pull-right" style="margin-right: 170px;">계약 완료</button>
</c:if>
</h2>
<div class="col-md-12 row">
<div class="col-md-1">
</div>
<div class="col-md-10">
<h2 class="content-heading">Client</h2>
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
		<div class="mb-10">
		<c:choose>
				<c:when test="${memberInfo.mem_picture eq null }">
					<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
					alt="" style="border: 1px solid #e1e1e1">
				</c:when>
				<c:otherwise>
					<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/files/${memberInfo.mem_picture }" width="100px"
					alt="" style="border: 1px solid #e1e1e1">
				</c:otherwise>
			</c:choose>
		</div> 
		${memberInfo.mem_id }
		<br>
		<small>
			<img src="${pageContext.request.contextPath}/image/mtype_3.png" width="20px">
			클라이언트
		</small>
	    <br>
	</td>
	<td>
		<br>
		<p class="font-size-md">
		프로젝트 예산 : <span class="badge badge-primary">${projectInfo.pr_payment }원</span>
		<c:if test="${empty projectInfo.pr_check}">
		<span class="badge badge-danger pull-right" style="margin-right: 10px;">미입금</span>
		</c:if>
		<c:if test="${not empty projectInfo.pr_check}">
		<span class="badge badge-success pull-right" style="margin-right: 10px;">입금</span>
		</c:if>
		</p>
		<hr>
		<p class="font-size-sm text-muted" style="width: 90%;">프로젝트 시작일 : <span class="badge badge-info">${fn:substring(projectInfo.pr_start,0,10) }</span></p>
	</td>
	</tr>
 </tbody>
 </table>
<h2 class="content-heading">Freelancer</h2>
<c:if test="${empty conList }">
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
   <tbody>
   <tr>
	<td style="height: 200px;vertical-align: middle;">
		<i class="fa fa-close fa-3x" style="padding-left: 20px;"></i>
		<i class="fa fa-2x" style="padding-left: 5px;">&nbsp;계약중인 프리랜서가 없습니다.</i>
	</td>
   </tr>	
   </tbody>
 </table>
 </c:if>
<c:if test="${not empty conList }">
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
<c:forEach items="${conList }" var="conInfo">
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
	<input type="hidden" value="${conInfo.MEM_ID }">
	<input type="hidden" value="${conInfo.AP_PROJECT }">
		<div class="mb-10">
			<a href="#"> 
			<c:choose>
					<c:when test="${conInfo.MEM_PICTURE eq null }">
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/files/${conInfo.MEM_PICTURE }" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:otherwise>
				</c:choose>
			</a>
		</div> 
		${conInfo.MEM_ID }
		<br>
		<small>
			<c:choose>
				<c:when test="${conInfo.FTYPE_NUM == '0' }">
					<img src="${pageContext.request.contextPath}/image/ftype_1.png" width="20px">
					개발자
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/ftype_2.png" width="20px">
					디자이너
				</c:otherwise>
			</c:choose>
		</small>
	    <br>
		<small>
			<c:choose>
				<c:when test="${conInfo.MTYPE_NUM=='0' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
					개인
				</c:when>
				<c:when test="${conInfo.MTYPE_NUM=='1' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
					팀
				</c:when>
				<c:when test="${conInfo.MTYPE_NUM=='2' }">
					<img src="${pageContext.request.contextPath}/image/mtype_2.png" width="15px">
					개인사업자
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/mtype_3.png" width="15px">
					법인사업자
				</c:otherwise>
			</c:choose>
		</small>
	</td>
	<td>
		<br>
		<p class="font-size-md">
		<c:if test="${not empty conInfo.CONS_PAYMENT }">
		계약금액 : <span class="badge badge-success">${conInfo.CONS_PAYMENT }원</span>
		</c:if>
		<c:if test="${empty conInfo.CONS_PAYMENT }">
		계약금액 : <span class="badge badge-danger">미계약</span>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq '0' }">
		<button class="btn btn-hero btn-alt-primary text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">계약 정보 입력 중</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq '1' }">
		<button class="btn btn-hero btn-alt-warning text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">프리랜서 날인 중</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq '2' }">
		<button class="btn btn-hero btn-alt-warning text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">클라이언트 날인 중</button>
		</c:if>
		<c:if test="${conInfo.CONS_STATUS eq 'y' }">
		<button class="btn btn-alt-secondary text-uppercase pull-right conDownload" onclick="event.cancelBubble=true;" style="margin-top: 60px; margin-left: 5px; width: 50px; height: 46px;" data-toggle="tooltip" 
		data-placement="top" title="계약서 다운로드" value="${conInfo.CONS_NUM }"><i class="si si-cloud-download" style="width: 10px;"></i></button>
		&nbsp;<button class="btn btn-hero btn-alt-success text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">계약 완료</button>
		</c:if>
		</p>
		<hr>
		<c:choose>
		<c:when test="${conInfo.PART_NUM eq '0'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">PM</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '1'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">PL</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '2'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">TA</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '3'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">DA</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '4'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">AA</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '5'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">BA</span></p>
		</c:when>
		<c:when test="${conInfo.PART_NUM eq '6'}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-info">UA</span></p>
		</c:when>
		<c:when test="${empty conInfo.PART_NUM}">
		<p class="font-size-md text-muted" style="width: 90%;">역할 : <span class="badge badge-danger">미계약</span></p>
		</c:when>
		</c:choose>
		<c:if test="${not empty conInfo.CONS_PERIOD }">
		<p class="font-size-sm text-muted" style="width: 90%;">게약일정 : <span class="badge badge-info">${conInfo.CONS_PERIOD }일</span>
		</p>
		</c:if>
		<c:if test="${empty conInfo.CONS_PERIOD }">
		<p class="font-size-sm text-muted" style="width: 90%;">게약일정 : <span class="badge badge-danger">미계약</span></p>
		</c:if>
		<c:if test="${not empty conInfo.CONS_DATE }">
		<p class="font-size-sm text-muted" style="width: 90%;">게약일정 : <span class="badge badge-info">${fn:substring(conInfo.CONS_DATE,0,10) }</span>
		</p>
		</c:if>
		<c:if test="${empty conInfo.CONS_DATE }">
		<p class="font-size-sm text-muted" style="width: 90%;">게약일정 : <span class="badge badge-danger">미계약</span></p>
		</c:if>
	</td>
	</tr>
 </tbody>
	</c:forEach>
 </table>
 </c:if>
 <br>
 <br>
<button id="deleteBtn" class="btn btn-alt-danger btn-md pull-right" style="margin-right: 10px;" value="${projectInfo.pr_num }">삭제</button>
<button id="listBtn" class="btn btn-alt-info btn-md pull-right" style="margin-right: 10px;">목록</button>
</div>
<div class="col-md-1">
</div>
</div>
<!-- Fade In Modal -->
</body>
</html>