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
function DivClick(val){
	event.stopPropagation();
	$(location).attr('href','${pageContext.request.contextPath}/project/projectView.do?pr_num='+val);
};
function IconClick(val){
	event.stopPropagation();
	
	location.href="${pageContext.request.contextPath}/interest/deleteProject2.do?pr_num="+val;
	
	
};

</script>
<body>  
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item" href="${pageContext.request.contextPath }/interest/projectList.do">관심 프로젝트</a> 
</nav>

<h2 class="content-heading">관심 등록한 프로젝트 목록 </h2>
    
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
	
<c:forEach items="${projectList }" var="projectInfo">
	<div class="col-md-12" onclick="DivClick(${projectInfo.pr_num});" >
		<a class="block block-link-shadow" >
			<div class="block-content block-content-full">
				<div class="font-size-sm font-w600 text-uppercase text-muted">${projectInfo.rnum }</div>
					<div class="col-md-1 row justify-content-center float-right ">
			<input type="hidden" name="pr_numm" value="${projectInfo.pr_num}">


						<i id="${projectInfo.pr_num }" class="fa fa-heart text-pulse fa-2x" onclick="IconClick(${projectInfo.pr_num});"></i>
					</div>

					<div class="row">
						<div class="col-md-11 font-size-h4 font-w700 text-primary">${projectInfo.pr_title}</div>
						
					</div>
					<small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectInfo.pr_payment }원 </small>  |  <small><i class="fa fa-calendar-check-o fa-1x"></i> 예상기간   ${projectInfo.pr_ex_period }일</small> | <small> <em>등록일자   ${projectInfo.pr_date }</em></small>
					<br>
					<br>
					<div class="row">
					<c:if test="${fn:length(projectInfo.pr_content) < 500 }">
					<div class="col-md-10 ">${projectInfo.pr_content}</div><br>
					</c:if>
					<c:if test="${fn:length(projectInfo.pr_content) > 500 }">
					<div class="col-md-10 ">${fn:substring(projectInfo.pr_content, 0 , 500) } ...</div><br>
					</c:if>
					<div class="col-md-2"><div class="alert alert-secondary alert-dismissable"><i class="si si-clock fa-1x"></i> 마감 ${projectInfo.dday}일 전</div>
					<div class="alert alert-secondary alert-dismissable"><i class=" si si-note fa-1x"></i> 지원자 ${projectInfo.applicant }명</div></div>
					</div>
					<br>
					<div>${projectInfo.category} > ${projectInfo.cate_Detail }  &nbsp;|&nbsp;   관련 기술 <c:forEach items="${projectInfo.techList}" var="tech">&nbsp;<span class="badge badge-secondary"> ${tech.lan_name} </span>&nbsp;</c:forEach> </div>
			</div>
		</a>
	</div>
</c:forEach>

${pagingUtil.getPageHtmls() }
</body>
</html>