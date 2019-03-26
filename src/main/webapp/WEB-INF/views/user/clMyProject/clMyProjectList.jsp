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
		$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=' + pnum +'&mem_id=${USER_LOGININFO.mem_id}');
	})
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/clMyProject/projectList.do">진행중인 프로젝트</a> 
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
                    <th class="text-center" style="width: 100px;">종료일</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${empty projectList }">
            <tr>
            <td class="text-center" colspan="4">진행중인 프로젝트가 없습니다.</td>
            </tr>
            </c:if>
            <c:if test="${not empty projectList }">
            <c:forEach items="${projectList }" var="projectInfo">
                <tr>
                    <td class="text-center" scope="row">${projectInfo.rnum }
                    <input type="hidden" value="${projectInfo.pr_num }">
                    </td>
                    <td>${projectInfo.pr_title }</td>
                    <td class="text-center">${fn:substring(projectInfo.pr_end, 0, 10) }</td>
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