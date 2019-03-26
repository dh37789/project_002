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
<body>
<script type="text/javascript">
	$(function(){
		$('tr:gt(0)').click(function(){
			var pr_num = $(this).find('td:eq(0) input').val();
			if (pr_num == null) {
				return;
			}
			$(location).attr('href', '${pageContext.request.contextPath }/projectMgn/adverProjectView.do?pr_num=' + pr_num)
		})
	})
</script>
<!-- Main Container -->
 <!-- Page Content -->
 <nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="/projectMgn/adverProjectList.do">모집 중인 프로젝트</a> 
	</span>
</nav>
 
    <h2 class="content-heading">모집 중인 프로젝트 <small>project</small></h2>
    <div class="block-content">
     <table class="table table-vcenter" style="background-color: white;">
         <thead class="thead-light" align="center">
             <tr>
                 <th class="text-center" style="width: 50px;">No.</th>
                 <th>프로젝트명</th>
                 <th>클라이언트ID</th>
                 <th>프로젝트 등록일</th>
                 <th>프로젝트 모집일</th>
                 <th>지원자 수</th>
             </tr>
         </thead>
         <tbody>
         <c:if test="${fn:length(projectList) ne '0' }">
         <c:forEach items="${projectList }" var="projectInfo">
         <tr class="text-center">
             <td class="text-center" scope="row">${projectInfo.RNUM }
             <input type="hidden" value="${projectInfo.PR_NUM }"></td>
             <td>${projectInfo.PR_TITLE }</td>
             <td>${projectInfo.CLIENT }</td>
             <td><span class="badge badge-primary">${fn:substring(projectInfo.PR_DATE,0,10) }</span></td>
             <td><span class="badge badge-success">${fn:substring(projectInfo.PR_DEADLINE,0,10) }</span></td>
             <td><span class="badge badge-warning">${projectInfo.APNUM }명 지원중</span></td>
         </tr>
         </c:forEach>
         </c:if>
         </tbody>
      </table>
      ${htmlCode }
      <div class="row text-center">
      <div class="col-sm-4">
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-4">
      <form class="form-inline pull-right" action="${pageContext.request.contextPath }/projectMgn/adverProjectList.do" method="post">
        <select class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-select" name="search_code">
            <option value="total">전체</option>
            <option value="title">프로젝트명</option>
            <option value="writer">클라이언트ID</option>
        </select>
        <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="search_data">
        <input type="hidden" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="currentPage">
        <button type="submit" class="btn btn-sm btn-secondary">검색</button>&nbsp;
      </form>
      </div>
  </div>
</div>
<!-- END Table Head Default -->
<!-- END Page Content -->
</body>
</html>