<%@page import="kr.or.ddit.utils.CLOBtoString"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	$('.regList').click(function(){
		var pr_num = $(this).find('input[name=pr_num]').val();
		$(location).attr('href', '${pageContext.request.contextPath}/clRegProject/regProjectView.do?pr_num=' + pr_num);
	});
});
</script>
<body> 
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/clRegProject/regProjectList.do">등록된 프로젝트</a> 
</span> 
</nav> 

<h2 class="content-heading">등록된 프로젝트 목록 </h2>

	<c:if test="${not empty noProject}">  
          
<nav class="breadcrumb bg-white push">  
		<div class="col-md-12">  
			<div class="block-content block-content-full">
				<div class="row py-20 font-size-h3 font-w600">
					<i class="fa fa-close fa-2x text-body-bg-dark"></i>&nbsp; ${noProject }
					<div class=" col-6 text-right border-r"></div>
				</div>  
			</div>  
		</div>
		</nav>
		<br>  
	</c:if>  
<!-- 	ap_status, pr_meeting, pr_start, client -->
<c:forEach items="${regPrList }" var="regist">
	<div class="col-md-12" >
		<a class="block block-link-shadow regList" >
			<div class="block-content block-content-full">
				<div class="font-size-sm font-w600 text-uppercase text-muted">${regist.RNUM }</div>
					<div class="row justify-content-center float-right ">
						<input type="hidden" name="pr_num" value="${regist.PR_NUM}">
					</div>
					<div class="row">
						<div class="col-md-11 font-size-h4 font-w700 text-primary">${regist.PR_TITLE}</div>
					</div>
					<small><i class="fa fa-krw fa-1x" ></i> 지원 금액  ${regist.PR_PAYMENT }원 </small>  | <small><i class="si si-clock fa-1x"></i> 모집 마감일 ${fn:substring(regist.PR_DEADLINE,0,10) } [ D - ${regist.DDAY } ]</small>
					<br>
					<br>
					<div class="row">
					<div class="col-md-10 ">
					<pre>
<%-- 					${regist.PR_CONTENT}") --%>
					</pre>
					<div class=" font-size-md font-700w badge badge-primary">
					&nbsp; 프로젝트 시작일 : ${fn:substring(regist.PR_START,0,10) }
					</div>
					</div>
					<br>
					<div class="col-md-2">
					<c:if test="${regist.PR_STATUS eq 0}">
					<div class="alert alert-secondary alert-dismissable"  ><i class=" si si-note fa-1x"></i> 지원 미팅 조율중</div>
					</c:if>
					<c:if test="${regist.PR_STATUS eq 1}">
					<div class="alert alert-secondary alert-dismissable "><i class=" si si-note fa-1x"></i> 지원 미팅 완료</div>
					</c:if>
					</div>
					</div>
					<br>
			</div>
		</a>
	</div>
</c:forEach>

</body>
</html>