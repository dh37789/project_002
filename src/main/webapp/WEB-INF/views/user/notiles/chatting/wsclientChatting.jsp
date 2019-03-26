<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" id="css-main" href="${pageContext.request.contextPath }/assets/css/codebase.min.css">
<title>Tomcat WebSocket 채팅</title>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.min.js"></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
 var ws;
 var date = new Date();
$(function(){
	// 웹소켓 서버 엔드포인트 컨넥션 및 스트리밍 관리 
	 ws = new WebSocket("wss://192.168.0.121/wschat");
	ws.onopen = function() { 
		swal("", "채팅방에 입장하셨습니다.", "success");
	};
	
	const top = $('#chatlog').prop('scrollHeight');
	$('#chatlog').scrollTop(top);
	
	// 웹소켓 서버 엔드포인트로부터 수신 이벤트 리스너 
	ws.onmessage = function(message) {
		
		// 메세지 수신(default 인코딩 타입 UTF-8 적용)
		var arr = message.data.split("/");
		var names="<br>";
		for(var ar in arr){
			if(ar>0){
				names+="<p class='badge badge-success font-size-md' style='margin-left:20px;'>"+ arr[ar]+"</p>";
			}else{
// 				$("#chatlog").text($("#chatlog").text() + arr[ar] + "\n");
				$("#chatlog").text($("#chatlog").text() + arr[ar] + "\n					 "+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+ "\n");
			}
		
			$('.nameClass').html(names);
			const top = $('#chatlog').prop('scrollHeight');
			$('#chatlog').scrollTop(top);
		}
	};
	
	$("#msg").keydown(function(key) {

		if (key.keyCode == 13) {// 엔터
			if($("#msg").val()==''){
				return false;
			}

			ws.send("${sessionScope.USER_LOGININFO.mem_id} : "+ $("#msg").val());
			$.ajax({
				type:'POST',
				dataType:'JSON',
				data:{mem_id:"${sessionScope.USER_LOGININFO.mem_id}",msg:$("#msg").val()},
				url:'${pageContext.request.contextPath}/chat/insertChat.do',
				success:function(result){
						
				},
				error:function(result){
					alert(result.status+"|"+result.responseText);
				}
					});
			$('#msg').val('')
		}
	});
});	
// 메세지 송신
function postToServer() {
	// 일반 문자열 전송(default 인코딩 타입 UTF-8 적용)
	if($("#msg").val()==''){
		return false;
	}
	
	ws.send("${sessionScope.USER_LOGININFO.mem_id} : "+ $("#msg").val());
	
	$.ajax({
		type:'POST',
		dataType:'JSON',
		data:{mem_id:"${sessionScope.USER_LOGININFO.mem_id}",msg:$("#msg").val()},
		url:'${pageContext.request.contextPath}/chat/insertChat.do',
		success:function(result){
				
		},
		error:function(result){
			alert(result.status+"|"+result.responseText);
		}
			
			});
	
	$("#msg").val("");
} 
// WebSocket Server 컨넥션 종료
function closeConnect() {  
	// // 웹소켓 서버 엔드포인트 대상 접속종료 이벤트 전파
	ws.send("${sessionScope.USER_LOGININFO.mem_id} 님이 나갔습니다.");
	window.opener.change('${pr_num}');
	ws.close();
}  
function test_Function() {
	// // 웹소켓 서버 엔드포인트 대상 접속종료 이벤트 전파 
	ws.send("${sessionScope.USER_LOGININFO.mem_id} 님이 나갔습니다.");
	window.opener.change('${pr_num}');
	ws.close();
}   
</script>
  
</head>        
<body onbeforeunload="javascript:test_Function();"> 
	<div class="row justify-content-center in row">
		<p class="col-12 badge badge-primary font-size-lg">${project.pr_title }</p>
<textarea id="chatlog" readonly="readonly" class="block block-link-pop block-rounded block-bordered "  style="height: 490px; width:350px; margin-left: 13px; margin-right:10px; margin-bottom: 10px; margin-top: -15px;">
			<c:forEach items="${chatList }" var="chat">
${chat.mem_id }:${chat.chat_content}
				         ${fn:substring(chat.chat_date,0,16) }
			</c:forEach>
		</textarea>
		<div  style="width: 100px; height: 490px; float: right; margin-top: -15px; " >
		<h5 >접속중인 사람</h5>
		<div class="nameClass" style="margin-top: -20px;"></div>
		</div>
		        
	</div>
	  
	<div class="row justify-content-center in row"  >
	<input id="msg"  type="text" style="height: 25px; width:350px; margin-left: 25px;"/>  
	<button  type="submit" class="btn btn-alt-primary" id="sendButton" style="height: 32px; margin-left: 10px; margin-right: 10px;" onClick="postToServer();">전송</button>
	<button  type="submit" class="btn btn-alt-secondary " id="sendButton" style="margin-right: 5px;" onClick="closeConnect();">나가기</button>
	</div>
</body>
</html>  
