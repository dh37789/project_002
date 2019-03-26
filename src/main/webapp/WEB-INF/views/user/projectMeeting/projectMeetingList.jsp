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
	$('#tbody tr').click(function(){
		var mt_num = $(this).find('td:eq(0) input').val();
		if (mt_num == "") {
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingView.do?mt_num=' + mt_num);
	})
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
	$('#schedule').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/scheduler/prSchedule.do?mem_id=${USER_LOGININFO.mem_id}&pr_num=${projectInfo.pr_num}')
	})
	$('#meetingAdd').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingForm.do?cons_free_id=${USER_LOGININFO.mem_id}');	
	});
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
		<a>프로젝트 미팅</a> 
	</span>
</nav>	

<h2 class="content-heading">프로젝트 미팅</h2>
<div class="block">
<!-- Bordered Table -->
 <!-- Navigation -->
	 <!-- END Navigation -->
<!--     <div class="block-header block-header-default"> -->
<!--         <h3 class="block-title">프로젝트 일감</h3> -->
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
        <!-- Intro Category -->
	    <table class="table table-striped table-borderless table-vcenter">
	        <thead class="thead-light">
	            <tr>
	                <th >미팅 신청 목록</th>
	                <th style="width: 180px;">신청자</th>
	                <th class="d-none d-md-table-cell text-center" style="width: 180px;">상태</th>
	            </tr>
	        </thead>
	        <tbody id="tbody">
	        	<c:if test="${fn:length(boardList) eq 0 }">
	            <tr>
	                <td>
	                    <p class="font-size-h5 font-w600" >&nbsp;&nbsp;신청된 미팅이 없습니다.</p>
	                    <input type="hidden" value="">
	                    <div class="text-muted my-5"><br></div>
	                    <div class="font-size-sm text-muted">
	                        <em style="padding: 30px;"><strong class="font-w600" ></strong></em>
	                    </div>
	                </td>
	                <td class="d-none d-md-table-cell">
	                    <span class="font-size-sm"><br><em></em></span>
	                </td>
	                <td class="text-center">
	                </td>
<!-- 	                <td class="text-center" style="width: 65px;"> -->
<!-- 	                    <i class="si si-check fa-2x"></i> -->
<!-- 	                </td> -->
	            </tr>
	        	</c:if>
	        	<c:if test="${fn:length(boardList) ne 0 }">
	        	<c:forEach items="${boardList }" var="boardInfo">
	            <tr>
	                <td>
	                    <p class="font-size-h5 font-w600" >&nbsp;&nbsp;${boardInfo.mt_reason }</p>
	                    <input type="hidden" value="${boardInfo.mt_num }">
	                    <div style="padding-left: 30px;"><strong class="font-w600" >대상자:</strong> ${boardInfo.mt_to }</div>
	                    <div class="font-size-sm text-muted">
	                        <br>
	                    </div>
	                </td>
	                <td class="d-none d-md-table-cell">
	                    <span class="font-size-sm">${boardInfo.mt_from }<br>on <em>${fn:substring(boardInfo.mt_date, 0, 10) }</em></span>
	                </td>
	                <c:if test="${boardInfo.mt_to_accept eq 0 }">
	                <td class="text-center">
	                    <i class="fa fa-question fa-3x"></i>
	                </td>
	                </c:if>
	                <c:if test="${boardInfo.mt_to_accept eq 1 }">
	                <td class="text-center" style="width: 65px;">
	                    <i class="si si-check fa-2x"></i>
	                </td>
	                </c:if>
	                <c:if test="${boardInfo.mt_to_accept eq 2 }">
	                <td class="text-center" style="width: 65px;">
	                    <i class="si si-ban fa-2x"></i>
	                </td>
	                </c:if>
	            </tr>
	        	</c:forEach>
	        	</c:if>
	        </tbody>
	    </table>
	    ${htmlCode }
	    <!-- END Intro Category -->
        <div class="row text-center">
             <div class="col-sm-4">
             </div>
             <div class="col-sm-4">
             </div>
             <div class="col-sm-4">
             <form class="form-inline pull-right" action="${pageContext.request.contextPath }/projectMeeting/meetingList.do" method="post">
               <select class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-select" name="search_code">
                   <option value="title">제목</option>
                   <option value="to">당담자</option>
               </select>
               <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="search_data">
               <button type="submit" class="btn btn-sm btn-secondary">검색</button>&nbsp;
               <input type="hidden" name="currentPage" value="1">
               <c:if test="${empty ADMIN_LOGININFO}">
         	   <button type="button" id="meetingAdd" class="btn btn-sm btn-secondary pull-right">글 작성하기</button>
               </c:if>
             </form>
             </div>
         </div>
         <p></p>
    </div>
</div>
</body>
</html>