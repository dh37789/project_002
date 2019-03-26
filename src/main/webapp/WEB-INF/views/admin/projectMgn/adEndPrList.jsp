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
		$(location).attr('href','${pageContext.request.contextPath}/projectMgn/adEndPrView.do?pr_num='+pr_num);
	})
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">프로젝트 관리</a> 
	<span class="breadcrumb-item"> 
		<a href="${pageContext.request.contextPath}/projectMgn/adEndPrList.do">완료 프로젝트</a> 
	</span>
</nav>


<h2 class="content-heading">완료된 프로젝트</h2>
   <div class="block-content">
       <table class="table table-vcenter" style="background-color: white;">
           <thead class="thead-light" align="center">
               <tr>
                   <th class="text-center" style="width: 100px;">No.</th>
                   <th>프로젝트명</th>
                   <th class="d-none d-sm-table-cell" style="width: 150px;">계약 금액</th>
                   <th class="text-center" style="width: 150px;">종료일</th>
               </tr>
           </thead>
           
           <c:if test="${fn:length(adEndPrList) eq 0}" >
      <td colspan="3" class="text-center">
      <br><br><br><br>
      <tr class="text-center">
             <td class="text-center" scope="row" colspan="6">완료된 프로젝트가 없습니다.</td>
         </tr>
      <br><br><br><br>
      <td>
     </c:if>
           <c:forEach items="${adEndPrList }" var="endProject">
           <tbody align="center">
               <tr>
                   <td class="text-center" scope="row">${endProject.rnum }
                   <input type="hidden" value="${endProject.pr_num }" id="prnum"/></td>
                   <td>${endProject.pr_title }</td>
                   <td class="d-none d-sm-table-cell">
                   <span class="badge badge-success">${endProject.pr_payment }원</span>
                   </td>
                   <td class="text-center">${endProject.pr_end }</td>
               </tr>
           </tbody>
           </c:forEach>
       </table>
       <br>
       ${pagingUtil }
       <div class="row justify-content-center float-right">
		<form class="form-inline" action="${pageContext.request.contextPath}/projectMgn/adEndPrList.do" method="post">
            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search_keyword" name="search_keyword">
            <button type="submit"  class="btn btn-sm btn-secondary"><i class="fa fa-search"></i> Search</button>
        </form>  
	   </div>
	   <br><br>
	   
   </div>
<!-- END Table Head Default -->


</body>
</html>