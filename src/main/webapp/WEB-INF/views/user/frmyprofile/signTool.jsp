<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/js/drawingboard.min.css">
<script src="${pageContext.request.contextPath }/js/drawingboard.js"></script>
<script src="${pageContext.request.contextPath }/js/drawingboard.min.js"></script>
<script type="text/javascript">
$(function(){
	var myBoard = new DrawingBoard.Board('drawing',{
		controls: [
		   		{ Size: { type: 'dropdown' } },
		   		{ DrawingMode: { filler: false } },
		   		'Navigation'
		   	],
		   	size: 4,
			enlargeYourContainer: true,
			webStorage: false
		});
	$('#save').click(function(){
		var img = myBoard.getImg();
		var imgInput = (myBoard.blankCanvas == img) ? '' : img;
		img = img.replace(/^data:image\/(png|jpg);base64,/, "");
		$.ajax({
  	         type:'POST',
  	         dataType:'JSON',
  	         data:{sign_data : img,
  	        	   mem_id : '${USER_LOGININFO.mem_id}'},
  	         url:'${pageContext.request.contextPath }/sign/signView.do',
  	         error:function(result){
  	            swal("", result.message, "info");
  	         },
  	         success:function(result){
  	        	 swal({
  	           	  title: "저장되었습니다.",
  	           	  text: "확인을 누르면 창이 닫칩니다.",
  	           	  icon: "success",
  	           	})
  	           	.then(function(exit){
  	           	  if (exit) {
  	           		  window.opener.location.reload();
  	           		  window.close();
  	           	  }
  	           	});
  	         }
  	      });
	});
	$('#close').click(function(){
		window.close();
	})
})
</script>
<body>
<%-- <form id="imageForm" action="${pageContext.request.contextPath }/sign/signView.do" --%>
<!-- enctype="multipart/form-data" method="POST" style="width: 360px;"> -->
<div class="col-md-13 text-center" style="height: 35px; background-color: #ffffcc; padding-top: 5px;">
<label><strong>Sign Tool</strong></label>
</div>
<div id="drawing"></div>
<input type="hidden" name="image">
<button class="btn btn-primary btn-sm pull-right" type="button" id="save" style="margin-left: 220px;">저장하기</button>
<button class="btn btn-danger btn-sm pull-right" type="button" id="close">닫기</button>
<!-- </form> -->
</body>
<style>
 	#drawing { 
 		width: 300px; 
 		height: 300px; 
 		padding-left: 30px;
 		padding-top: 20px;
 	} 
 	#introImg {
 		width : 98%;
 	}
</style>
</html>