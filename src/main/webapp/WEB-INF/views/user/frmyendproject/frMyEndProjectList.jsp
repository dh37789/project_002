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
		var pr_num = $(this).find('#prnum').val();
		if(pr_num==null){
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/frmyendproject/frEndProjectView.do?pr_num='+pr_num);
	})
})
</script>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/frmyendproject/frMyEndProjectList.do">완료된 프로젝트</a> 
	</span> 
</nav>  

<h2 class="content-heading">완료된 프로젝트</h2>
   <div class="block-content">
       <table class="table table-vcenter" style="background-color: white;">
           <thead class="thead-light">
               <tr>
                   <th class="text-center" style="width: 50px;">No.</th>
                   <th>프로젝트명</th>
                   <th class="text-center" style="width: 15%;">클라이언트 ID</th>
                   <th class="d-none d-sm-table-cell" style="width: 100px;">계약 금액</th>
                   <th class="text-center" style="width: 100px;">종료일</th>
               </tr>
           </thead>
           
           <c:if test="${fn:length(endProjectList) eq 0}" >
      <td colspan="3" class="text-center">
      <br><br><br><br>
      <h5>완료된 프로젝트가 없습니다.</h5>
      <br><br><br><br>
      <td>
     </c:if>
           <c:forEach items="${endProjectList }" var="endPrList">
           <tbody>
               <tr>
                   <td class="text-center" scope="row">${endPrList.RNUM }
                   <input type="hidden" value="${endPrList.PR_NUM }" id="prnum"/></td>
                   <td>${endPrList.PR_TITLE }</td>
                   <td class="text-center">${endPrList.CLIENT }</td>
                   <td class="d-none d-sm-table-cell">
                   <span class="badge badge-success">${endPrList.PR_PAYMENT }원</span>
                   </td>
                   <td class="text-center">${endPrList.PR_END }</td>
               </tr>
           </tbody>
           </c:forEach>
       </table>
       <br>
       ${pagingUtil }
<!--        <div class="row justify-content-center text-center"> -->
<%--        <form action="${pageContext.request.contextPath }/frmyendproject/frMyEndProjectList.do" method="post" class="form-inline pull-right"> --%>
<!--            <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력" class="form-control"/> -->
<!--            <input type="hidden" id="currentPage" name="currentPage" value="1" class="form-control"/> -->
<!--            <select class="form-control" name="search_keycode"> -->
<!--            	<option value="null">검색조건</option> -->
<!-- 				<option value="TOTAL">전체</option> -->
<!-- 				<option value="TITLE">제목</option> -->
<!-- 				<option value="CONTENT">내용</option> -->
<!-- 				<option value="WRITER">작성자</option> -->
<!-- 			</select>	 -->
<!--            <button type="submit" class="btn btn-sm btn-secondary">검색</button> -->
<!--        </form> -->
<!--        </div> -->
       
       <div class="row justify-content-center float-right">
		<form class="form-inline" action="${pageContext.request.contextPath}/frmyendproject/frMyEndProjectList.do" method="post">
            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search_keyword" name="search_keyword">
            <button type="submit"  class="btn btn-sm btn-secondary"><i class="fa fa-search"></i> Search</button>
        </form>  
	   </div>
	   <br><br> 
   </div>
<!-- END Table Head Default -->
</body>
</html>