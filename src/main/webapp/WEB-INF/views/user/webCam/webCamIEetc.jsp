<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 화상회의</title>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">나의 프로젝트</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/apply/applyList.do">지원한 프로젝트</a> 
	</span> 
</nav>  
<h1 class="content-heading">1:1 화상미팅 <button class="btn btn-primary pull-right" onclick="streamClose();">채팅 종료</button></h1>
<div class="row">
<div style="position: relative; width: 98%;  height:700px;">
	<canvas style="width: 300px;height: 200px;position:absolute; border: solid 1px #eaeaea; z-index: 1" ></canvas>
	<img id="ddd" alt="" src="${pageContext.request.contextPath }/image/noimage.png" style="width:100%; height:700px;border: solid 1px #eaeaea;">
</div>
</div>
	<div id="video">
		<video></video>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/webcamIEetc.js"></script>
<script type="text/javascript">
window.onbeforeunload = function(){
	isClose = true;
	socket.close();
};
function streamClose(){
	swal({
    	  title: "나가시겠습니까?",
    	  icon: "warning",
    	  buttons: true,
    	  dangerMode: true,
    	})
    	.then(function(exit){
    	  if (exit) {
			socket.close();
			$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingView.do?mt_num=${MEET_INFO.mt_num}');
    	  } else {
    	    return;
    	  }
    	});
}
$(function(){
	$('#video').hide()
});
</script>
</html>

