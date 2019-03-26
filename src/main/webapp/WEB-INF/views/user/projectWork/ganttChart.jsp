<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
      data.addColumn('string', 'Resource');
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');

      data.addRows([${jsCode}]);

      var options = {
        height: ${size}
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    $(function(){
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
		<a>간트 차트</a> 
	</span>
</nav>	

<h2 class="content-heading">간트 차트</h2>
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
    <c:if test="${empty jsCode }">
    <div class="col-md-12">  
		<div class="block-content block-content-full">
			<div class="row py-20 font-size-h3 font-w600">
				<i class="fa fa-close fa-2x text-body-bg-dark"></i>&nbsp; 일감이 존재하지 않습니다.
			</div>  
		</div>  
	</div>
    </c:if>
    <c:if test="${not empty jsCode }">
	<div id="chart_div"></div>
    </c:if>
    </div>
</div>
</body>
</html>