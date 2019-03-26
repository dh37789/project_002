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
		if(pr_num==null){
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/projectMgn/standbyPjView.do?pr_num='+pr_num);
	})
});
</script>
<body>

<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/projectMgn/standbyPjList.do">승인 대기 프로젝트</a> 
	</span>
</nav>

<!-- Main Container -->
 <!-- Page Content -->
    <h2 class="content-heading">승인 대기 프로젝트</h2>
    <div class="block-content">
    
       <table class="table table-vcenter" style="background-color: white;">
           <thead  class="thead-light" align="center">
               <tr>
                   <th class="text-center" style="width: 50px;">No.</th>
                   <th>클라이언트 아이디</th>
                   <th>프로젝트 명</th>
                   <th>승인 상태</th>
               </tr>
           </thead>
           
           <c:if test="${fn:length(adProjectList) eq 0}" >
	           <td colspan="3" class="text-center">
	           <br><br><br><br>
	           <h5>등록된 프로젝트가 없습니다.</h5>
	           <br><br><br><br>
	           <td>
           </c:if>
           
           <c:forEach items="${adProjectList }" var="project">
           <c:if test="${adProjectList }."></c:if>
           <tbody>
               <tr class="text-center">
                   <td class="text-center" scope="row">${project.rnum }
                   <input type="hidden" value="${project.pr_num }" id="prnum"/></td>
                   <td>${project.client }</td>
                   <td>${project.pr_title }</td>
                   <td><span class="badge badge-success">미승인</span></td>
                   
               </tr>
           </tbody>
           </c:forEach>
       </table>
       <br>
       ${pagingUtil }
       <div class="row justify-content-center float-right">
		<form class="form-inline" action="${pageContext.request.contextPath}/projectMgn/standbyPjList.do" method="post">
            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search_keyword" name="search_keyword">
            <button type="submit"  class="btn btn-sm btn-secondary"><i class="fa fa-search"></i> Search</button>
        </form>  
	   </div>
	   <br><br>
	   
   </div>
                    <!-- END Table Head Default -->
 <!-- END Page Content -->
 		
</body>
</html>