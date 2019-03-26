<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link href='${pageContext.request.contextPath }/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath }/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/fullcalendar/fullcalendar.min.js'></script>
<script>
$(function() {
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
/* /* 	text-align: center; */ */
 } 

   #calendar { 
/*     	 background-color : white;  */
     max-width: 900px; 
 	 margin: 0 auto; 
   } 
  #h1 {
    text-align: center;
  } 
/* .modal { */
/* 	text-align: center; */
/* 	padding: 0!important; */
/* } */

/* .modal:before { */
/* 	content: ''; */
/* 	display: inline-block; */
/* 	height: 100%; */
/* 	vertical-align: middle; */
/* 	margin-right: -4px; */
/* } */

/* .modal-dialog { */
/* 	display: inline-block; */
/* 	text-align: left; */
/* 	vertical-align: middle; */
/* } */
</style>
</head>
<body>
<div class="content">
<h2 id="h1" style="color: #058677"><img src="${pageContext.request.contextPath}/image/s.png" width="45px"></img>&nbsp;&nbsp;&nbsp;프로젝트 일정</h2>
  <br>
  <div id='calendar'></div>
  <br><br>
  </div>
<!-- <div id='controller'> -->
<!-- 	<button id="newSchedule" >새 일정 추가</button> -->
<!-- </div> -->

<!-- <div id="myModal" role="dialog" class="modal fade"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" data-dismiss="modal" class="close">&times;</button> -->
<!-- 				<h3 class="modal-title">프로젝트 일정 관리</h3> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body"> -->
<!-- 				<form id="addSchedule"> -->
<!-- 					<label>일정: </label> -->
<!-- 					<input type="text" id="title" name="title"> -->
<!-- 					<br> -->
<!-- 					<label>시작일: </label> -->
<!-- 					<input type="date" id="start" name="start"> -->
<!-- 					<br> -->
<!-- 					<label>종료일: </label> -->
<!-- 					<input type="date" id="end" name="end"> -->
<!-- 					<br> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-default" id="insert">입력</button> -->
<!-- 				<button type="button" class="btn btn-default" id="update">수정</button> -->
<!-- 				<button type="button" class="btn btn-default" id="delete">삭제</button> -->
<!-- 				<button type="button" data-dismiss="modal" class="btn btn-default">Close</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
</body>
</html>