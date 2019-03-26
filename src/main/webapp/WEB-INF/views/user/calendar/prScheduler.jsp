<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='${pageContext.request.contextPath }/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath }/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/fullcalendar/fullcalendar.min.js'></script>
<script>
$(function() {
	
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
	
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title today',
			right : 'next'
		},
		navLinks: false, // can click day/week names to navigate views
		editable: false,
		eventLimit: false, // allow "more" link when too many events
		selectable : false,
		locale : 'ko',
		events: ${scList},
		eventClick:  function(event, jsEvent, view) {
			
			
			var startDate = new Date(event.start);
			var sYear = startDate.getFullYear();
			var sMonth = startDate.getMonth()+1;
			var sDate = startDate.getDate();
			if(sMonth < 10){
				sMonth = '0'+sMonth;
			}
			if(sDate < 10){
				sDate = '0'+sDate;
			}
			var startDateFormat = sYear + '-' + sMonth + '-' + sDate;
			
			var endDate = new Date(event.end);
			var eYear = endDate.getFullYear();
			var eMonth = endDate.getMonth()+1;
			var eDate = endDate.getDate();
			if(eMonth < 10){
				eMonth = '0'+eMonth;
			}
			if(eDate < 10){
				eDate = '0'+eDate;
			}
			var endDateFormat = eYear + '-' + eMonth + '-' + eDate;
			
			$('#title').val(event.title);
			$('#start').val(startDateFormat);
			$('#end').val(endDateFormat);
			$('#update').show();
			$('#delete').show();
			$('#insert').hide(); //메소드가 끝난 후 show()상태로 바꿔야함
	    }
	});
   
	$('#newSchedule').on('click', function(){
		$('#title').val('');
		$('#start').val('');
		$('#end').val('');
		$('#insert').show();
		$('#update').hide();//메소드가 끝난 후 show()상태로 바꿔야함
		$('#delete').hide();//메소드가 끝난 후 show()상태로 바꿔야함
	})
	
	
	$('#insert').on('click', function(){
		if($('#start').val() > $('#end').val()){
	    	swal("","종료일이 시작일보다 빠를 수 없습니다.", "warning");
		}else if($('#title').val() ==''){
	    	swal("","일정 제목을 입력하세요!", "warning");
		}else if($('#details').val() == ''){
	    	swal("","일정 내용을 입력하세요!", "warning");
		}
	})
	
	
	
});
</script>
<style>
 body {
 	padding: 0; 
	font-size: 14px; 
 } 
  #calendar { 
     max-width: 900px; 
 	 margin: 0 auto; 
   } 
  #h1 {
    text-align: center;
  }
  #spanWork {
	background-color: rgb(252, 247, 230);
  }
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
		<a>일정 관리</a> 
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
  <br>
   <p>
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	     <strong>미팅 관련 : </strong>&nbsp; <button type="button" class="btn btn-sm btn-alt-warning" disabled="disabled">&nbsp;&nbsp;&nbsp;</button><br><br>
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	     
	     <strong>일감 관련 : </strong>&nbsp; <button type="button" class="btn btn-sm btn-alt-info" disabled="disabled">&nbsp;&nbsp;&nbsp;</button>
	     <button type="button" class="btn btn-sm btn-alt-success" disabled="disabled">&nbsp;&nbsp;&nbsp;</button>
	     <button type="button" class="btn btn-sm btn-alt-danger" disabled="disabled">&nbsp;&nbsp;&nbsp;</button>
   </p>

  <h1 id="h1">일감 및 미팅 일정</h1>
  <div id='calendar'></div>
  <br><br><br>
</div>
<!-- END Bordered Table -->
</body>
</html>