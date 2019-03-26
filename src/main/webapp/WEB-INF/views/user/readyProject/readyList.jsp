<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	$('tr:gt(0)').click(function(){
		var pr_num = $(this).find('td:eq(0) input').val();
		if (pr_num == null) {
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/readyProject/projectView.do?pr_num=' + pr_num);
	})
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/readyProject/projectList.do">준비중인 프로젝트</a> 
	</span> 
</nav>


<div class="block">
	<div class="block-header block-header-default">
		<h3 class="block-title">준비중인 프로젝트 목록</h3>
	</div>
	<div class="block-content">
		<p>${fn:length(projectList) }개의 프로젝트가 준비중입니다.</p>
		<div class="text-center">
		</div>
	</div>
</div>
<!-- Table Head Default -->
       <div class="block">
<!--            <div class="block-header block-header-default"> -->
<!--                <h3 class="block-title">Table Head Default</h3> -->
<!--                <div class="block-options"> -->
<!--                    <div class="block-options-item"> -->
<!--                        <code>.thead-light</code> -->
<!--                    </div> -->
<!--                </div> -->
<!--            </div> -->
           <div class="block-content">
               <table class="table table-vcenter">
                   <thead class="thead-light">
                       <tr>
                           <th class="text-center" style="width: 50px;">No.</th>
                           <th>프로젝트명</th>
                           <th class="d-none d-sm-table-cell" style="width: 140px;">프로젝트 예산(원)</th>
                           <th class="text-center" style="width: 100px;">종료일</th>
                       </tr>
                   </thead>
                   <tbody>
                   <c:if test="${fn:length(projectList) eq 0}">
                   <tr>
                   <td class="text-center" colspan="4">준비중인 프로젝트가 없습니다.</td>
                   </tr>
                   </c:if>
                   <c:if test="${fn:length(projectList) ne 0}">
                   <c:forEach items="${projectList }" var="projectInfo">
                       <tr>
                           <td class="text-center" scope="row">${projectInfo.rnum }
                           <input type="hidden" value="${projectInfo.pr_num }"></td>
                           <td>${projectInfo.pr_title }</td>
                           <td class="d-none d-sm-table-cell text-center">
                           <span class="badge badge-success">${projectInfo.pr_payment }원</span>
                           </td>
                           <td class="text-center">${fn:substring(projectInfo.pr_end, 0 , 10) }</td>
                       </tr>
                   </c:forEach>
                   </c:if>
                   </tbody>
               </table>
               <div class="row justify-content-center text-center">
	              <form class="form-inline" action="#" method="post" onsubmit="return false;">
	                  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="example-if-password">
	                  <button type="submit" class="btn btn-sm btn-secondary">검색</button>
	              </form>
               </div>
               <p></p>
           </div>
       </div>
       <!-- END Table Head Default -->
</body>
</html>