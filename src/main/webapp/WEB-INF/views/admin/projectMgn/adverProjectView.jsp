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
	$('#adverEnd').click(function(){
		swal({
        	  title: "모집을 종료하시겠습니까?",
        	  text: "프로젝트 모집을 종료합니다.",
        	  icon: "success",
        	  buttons: true,
        	})
        	.then(function(result){
        	  if (result) {
				$(location).attr('href','${pageContext.request.contextPath}/projectMgn/adverEndProject.do?pr_num=' + pr_num);
        	  } else {
        	    return;
        	  }
        	});
	})
	$('#listBtn').click(function(){
		$(location).attr('href','${pageContext.request.contextPath }/projectMgn/adverProjectList.do');
	})
	$('#deleteBtn').click(function(){
		swal({
      	  title: "삭제하시겠습니까?",
      	  text: "프로젝트를 삭제하겠습니다.",
      	  icon: "warning",
      	  buttons: true,
      	  dangerMode: true,
      	})
      	.then(function(result){
      	  if (result) {
				$(location).attr('href','${pageContext.request.contextPath}/projectMgn/advprojectDelete.do?pr_num=' + pr_num);
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
		<a href="${pageContext.request.contextPath}/projectMgn/adverProjectList.do">모집 중인 프로젝트</a> 
	</span>
	<span class="breadcrumb-item"> 
		<a>상세보기</a> 
	</span>
</nav>

<h2 class="content-heading font-w400">${projectInfo.pr_title }<small>&nbsp;${fn:length(appList) }명이 지원했습니다.</small>
<button id="adverEnd" class="btn btn-alt-success btn-md pull-right" style="margin-right: 170px;">모집 종료</button>
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
		</p>
		<hr>
		<p class="font-size-sm text-muted" style="width: 90%;">프로젝트 등록일 : <span class="badge badge-info">${fn:substring(projectInfo.pr_date,0,10) }</span></p>
	</td>
	</tr>
 </tbody>
 </table>
<h2 class="content-heading">Freelancer</h2>
<c:if test="${empty appList }">
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
   <tbody>
   <tr>
	<td style="height: 200px;vertical-align: middle;">
		<i class="fa fa-close fa-3x" style="padding-left: 20px;"></i>
		<i class="fa fa-2x" style="padding-left: 5px;">&nbsp;지원한 프리랜서가 없습니다.</i>
	</td>
   </tr>	
   </tbody>
 </table>
 </c:if>
<c:if test="${not empty appList }">
 <table class="table bg-white " height="auto" style="border: 1px dotted #d2e7f5" >
<c:forEach items="${appList }" var="appInfo">
   <tbody>
	<tr>
	<td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
	<input type="hidden" value="${appInfo.MEM_ID }">
	<input type="hidden" value="${appInfo.AP_PROJECT }">
		<div class="mb-10">
			<a href="#"> 
			<c:choose>
					<c:when test="${appInfo.MEM_PICTURE eq null }">
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:when>
					<c:otherwise>
						<img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/files/${appInfo.MEM_PICTURE }" width="100px"
						alt="" style="border: 1px solid #e1e1e1">
					</c:otherwise>
				</c:choose>
			</a>
		</div> 
		${appInfo.MEM_ID }
		<br>
		<small>
			<c:choose>
				<c:when test="${appInfo.FTYPE_NUM == '0' }">
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
				<c:when test="${appInfo.MTYPE_NUM=='0' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
					개인
				</c:when>
				<c:when test="${appInfo.MTYPE_NUM=='1' }">
					<img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
					팀
				</c:when>
				<c:when test="${appInfo.MTYPE_NUM=='2' }">
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
		지원금액 : <span class="badge badge-success">${appInfo.AP_PAYMENT }원</span>
		<c:if test="${appInfo.AP_STATUS eq '0' || appInfo.AP_STATUS eq '1' }">
		<button class="btn btn-hero btn-alt-primary text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">미팅 협의중</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq '2' }">
		<button class="btn btn-hero btn-alt-warning text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">미팅 중</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq 'y' }">
		<button class="btn btn-hero btn-alt-success text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">미팅 완료</button>
		</c:if>
		<c:if test="${appInfo.AP_STATUS eq 'n' }">
		<button class="btn btn-hero btn-alt-danger text-uppercase pull-right" onclick="event.cancelBubble=true;" style="margin-top: 60px;">거절됨</button>
		</c:if>
		</p>
		<hr>
		<p class="font-size-sm text-muted" style="width: 90%;">지원 일정 : <span class="badge badge-info">${fn:substring(appInfo.AP_DATE,0,10) }</span></p>
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