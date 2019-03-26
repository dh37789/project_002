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
	$('tr:gt(0)').click(function(){
		var pnum = $(this).find('td:eq(0) input').val();
		if (pnum == null) {
			return;
		}
		var part = $(this).find('td:eq(4)').text();
		$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=' + pnum + '&part=' + part + '&mem_id=${USER_LOGININFO.mem_id}');
	})
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item"> 
		<c:if test="${not empty USER_LOGININFO }">
			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${not empty ADMIN_LOGININFO }">
			<a href="${pageContext.request.contextPath }/projectMgn/projectingList.do">진행중인 프로젝트</a>
		</c:if>
	</span>
</nav>	
<h2 class="content-heading">진행중인 프로젝트 목록 <small>${fn:length(projectList) }개의 프로젝트를 진행중 입니다.</small></h2>
<div class="block">
    <div class="block-content">
        <table class="table table-vcenter">
            <thead class="thead-light">
                <tr>
                    <th class="text-center" style="width: 50px;">No.</th>
                    <th>프로젝트명</th>
                    <th class="text-center" style="width: 15%;">클라이언트 ID</th>
                    <th class="d-none d-sm-table-cell" style="width: 100px;">계약 금액</th>
                    <th class="text-center" style="width: 100px;">역할</th>
                    <th class="text-center" style="width: 100px;">종료일</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${fn:length(projectList) eq '0' }">
            <td class="text-center" colspan="6">
            	<br>
            	<h3>진행중인 프로젝트가 없습니다.</h3>
            	<br>
            </td>
            </c:if>
            <c:if test="${fn:length(projectList) ne '0' }">
            <c:forEach items="${projectList }" var="projectInfo">
                <tr>
                    <td class="text-center" scope="row">${projectInfo.RNUM }
                    <input type="hidden" value="${projectInfo.PR_NUM }">
                    </td>
                    <td>${projectInfo.PR_TITLE }</td>
                    <td class="text-center">${projectInfo.CLIENT }</td>
                    <td class="d-none d-sm-table-cell">
                    <span class="badge badge-success">${projectInfo.CONS_PAYMENT }원</span>
                    </td>
                    <td class="text-center">${projectInfo.PART }</td>
                    <td class="text-center">${fn:substring(projectInfo.CONS_DATE, 0, 10) }</td>
                </tr>
            </c:forEach>
            </c:if>
            </tbody>
        </table>
        <p></p>
    </div>
</div>
<!-- END Table Head Default -->
</body>
</html>