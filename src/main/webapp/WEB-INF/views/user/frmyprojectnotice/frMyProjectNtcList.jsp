<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#noticeBody tr').click(function(){
		var prno_num = $(this).find('td:eq(0) input').val();
		if (prno_num == "") {
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcView.do?prno_num=' + prno_num + '&pnum=${pnum}&part=${part}')
	})
	$('#noticeAdd').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/frprojectntc/frprojectntcAdd.do?pnum=${pnum}&part=${part}')
	});
	$('#projectInfo').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=${projectInfo.pr_num}')
	});
	$('#noticeList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#workList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/workList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#gantt').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/ganttChart.do');	
	});
	$('#present').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');	
	});
	$('#meeting').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingList.do');	
	})
	$('#schedule').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/scheduler/prSchedule.do?mem_id=${USER_LOGININFO.mem_id}&pr_num=${projectInfo.pr_num}')
	})
});
</script>
<style>
#schedule{
	width: 100%;
	height: 100%;
	color: #9238B9;
	background-color: #f2e6ff;
}
#schedule:hover {
	background-color: #e6ccff;
	color: #9238B9; 
}
</style>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<c:if test="${not empty USER_LOGININFO }">
		<a class="breadcrumb-item">나의 프로젝트</a> 
	</c:if>
	<c:if test="${not empty ADMIN_LOGININFO }">
		<a class="breadcrumb-item">프로젝트 관리</a> 
	</c:if>
	<span class="breadcrumb-item"> 
		<c:if test="${USER_LOGININFO.iden_num == 2}">
			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${USER_LOGININFO.iden_num == 1}">
			<a href="${pageContext.request.contextPath }/clMyProject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${not empty ADMIN_LOGININFO }">
			<a href="${pageContext.request.contextPath }/projectMgn/projectingList.do">진행중인 프로젝트</a>
		</c:if>
	</span>
	<span class="breadcrumb-item"> 
		<a>프로젝트 공지</a> 
	</span>
</nav>	

<h2 class="content-heading">프로젝트 공지사항 </h2>
<div class="block">
<!-- Bordered Table -->
 <!-- Navigation -->
	 <!-- END Navigation -->
<!--     <div class="block-header block-header-default"> -->
<!--         <h3 class="block-title">프로젝트 공지사항</h3> -->
<!--         <div class="block-options"> -->
<!--             <div class="block-options-item"> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
   <!-- Navigation -->
  <div class="block-content-full border-b clearfix">
  <div class="col-13">
  	<table style="width: 100%; height: 100%;">
  	<tr>
	  	<td style="width:14%;height: 50px;"><button id="projectInfo" type="button" class="btn btn-alt-primary" style="width: 100%;height: 100%;">프로젝트 정보</button></td>
	  	<td style="width:14%;"><button id="noticeList" type="button" class="btn btn-alt-info" style="width: 100%;height: 100%;">프로젝트 공지</button></td>
	  	<td style="width:14%;"><button id="workList" type="button" class="btn btn-alt-danger" style="width: 100%;height: 100%;">프로젝트 일감</button></td>
	  	<td style="width:14%;"><button id="gantt" type="button" class="btn btn-alt-warning" style="width: 100%;height: 100%;">간트차트</button></td>
	  	<td style="width:14%;"><button id="present" type="button" class="btn btn-alt-success" style="width: 100%;height: 100%;">프로젝트 현황</button></td>
	  	<td style="width:14%;"><button id="meeting" type="button" class="btn btn-alt-secondary" style="width: 100%;height: 100%;">미팅신청</button></td>
	  	<td style="width:14%;"><button id="schedule" type="button" class="btn">일정 관리</button></td>
  	</tr>
  	</table>
  </div>
  </div>
  <!-- END Navigation -->
    <div class="block-content">
        <table class="table table-bordered table-vcenter">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">No.</th>
                    <th>제목</th>
                    <th class="d-none d-sm-table-cell" style="width: 15%;">작성자</th>
                    <th class="text-center" style="width: 100px;">작성날짜</th>
                </tr>
            </thead>
            <tbody id="noticeBody">
            <c:if test="${fn:length(boardList) eq 0 }">
               <tr>
                   <td class="text-center" scope="row" colspan="5">게시물이 없습니다.
                   <input type="hidden" value="${boardInfo.prno_num }">
                   </td>
               </tr>
            </c:if>
            <c:if test="${fn:length(boardList) ne 0 }">
            <c:forEach items="${boardList }" var="boardInfo">
                <tr>
                    <td class="text-center" scope="row">${boardInfo.rnum }
                    <input type="hidden" value="${boardInfo.prno_num }">
                    </td>
                    <td>${boardInfo.prno_title }</td>
                    <td>
                    	${boardInfo.prno_writer }
                    </td>
                    <td class="text-center">
                    	${fn:substring(boardInfo.prno_date, 0, 10) }
                    </td>
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
             <form class="form-inline pull-right" action="${pageContext.request.contextPath }/frprojectntc/frprojectntcList.do?pnum=${pnum}&part=${part}" method="post">
               <select class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-select" name="search_code">
                   <option value="total">전체</option>
                   <option value="title">제목</option>
                   <option value="writer">글쓴이</option>
               </select>
               <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="search_data">
               <button type="submit" class="btn btn-sm btn-secondary">검색</button>&nbsp;
               <c:if test="${empty ADMIN_LOGININFO }">
               <c:choose>
               <c:when test="${part eq 'PM'}">
         	   <button type="button" id="noticeAdd" class="btn btn-sm btn-secondary pull-right">글 작성하기</button>
               </c:when>
               <c:when test="${part eq 'PL'}">
         	   <button type="button" id="noticeAdd" class="btn btn-sm btn-secondary pull-right">글 작성하기</button>
               </c:when>
               <c:when test="${USER_LOGININFO.iden_num eq '1'}">
         	   <button type="button" id="noticeAdd" class="btn btn-sm btn-secondary pull-right">글 작성하기</button>
               </c:when>
               <c:otherwise>
         	   <button type="button" class="btn btn-sm btn-secondary pull-right" disabled="disabled">글 작성하기</button>
               </c:otherwise>
               </c:choose>
               </c:if>
             </form>
             </div>
         </div>
         <p></p>
    </div>
</div>
<!-- END Bordered Table -->
</body>
</html>