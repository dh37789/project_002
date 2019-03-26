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
		$('tr:gt(0)').click(function(){
			var pr_num = $(this).find('td:eq(0) input').val();
			if (pr_num == null) {
				return;
			}
			$(location).attr('href', '${pageContext.request.contextPath }/projectMgn/contractPjView.do?pr_num=' + pr_num)
		})
	})
</script>
</head>
<body>
<!-- Main Container -->
 <!-- Page Content -->
 
 <nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/projectMgn/contractPjList.do">계약 중인 프로젝트</a> 
	</span>
</nav>
 
    <h2 class="content-heading">계약 중인 프로젝트 <small>contract project</small></h2>
    <div class="block-content">
    <div class="col-md-3 ml-auto row" style="padding-left: 150px;">
    <label style="margin-top: 10px;"><h6>납부 현황 : </h6></label>
    <select class="form-control pull-ri" style="height: 40px; width: 80px; margin-left: 10px;">
    	<option>전체</option>
    	<option>납부</option>
    	<option>미납</option>
    </select>
    </div>
     <table class="table table-vcenter" style="background-color: white;">
         <thead  class="thead-light" align="center">
             <tr>
                 <th class="text-center" style="width: 50px;">No.</th>
                 <th>프로젝트명</th>
                 <th>클라이언트ID</th>
                 <th>프로젝트 시작일</th>
                 <th>계약금</th>
                 <th>납부현황</th>
             </tr>
         </thead>
         <tbody>
         <c:if test="${empty projectList }">
         <tr class="text-center">
             <td class="text-center" scope="row" colspan="6">계약중인 프로젝트가 없습니다.</td>
         </tr>
         </c:if>
         <c:if test="${not empty projectList }">
		 <c:forEach items="${projectList }" var="projectInfo">
         <tr class="text-center">
             <td class="text-center" scope="row">${projectInfo.RNUM }
             <input type="hidden" value="${projectInfo.PR_NUM }"></td>
             <td>${projectInfo.PR_TITLE }</td>
             <td>${projectInfo.CLIENT }</td>
             <td>${fn:substring(projectInfo.PR_START, 0, 10) }</td>
             <td><span class="badge badge-success">${projectInfo.CONS_PAYMENT }원</span></td>
             <c:if test="${empty projectInfo.PR_CHECK }">
             <td><span class="badge badge-danger">미납부</span></td>
             </c:if>
             <c:if test="${not empty projectInfo.PR_CHECK }">
             <td><span class="badge badge-success">납부</span></td>
             </c:if>
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
      <form class="form-inline pull-right" action="${pageContext.request.contextPath }/projectMgn/contractPjList.do" method="post">
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