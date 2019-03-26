<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat WebSocket 채팅</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 var ws;

$(function(){
	// 웹소켓 서버 엔드포인트 컨넥션 및 스트리밍 관리 
	 ws = new WebSocket("ws://localhost/wschat");
	ws.onopen = function() { 
		swal("", "WebSocket 서버 컨넥션이 생성되었습니다.", "success");
	};
	
	// 웹소켓 서버 엔드포인트로부터 수신 이벤트 리스너 
	ws.onmessage = function(message) {
		// 메세지 수신(default 인코딩 타입 UTF-8 적용)
		$("#chatlog").text($("#chatlog").text() + message.data + "\n");
	};
});	
// 메세지 송신
function postToServer() {
	// 일반 문자열 전송(default 인코딩 타입 UTF-8 적용)
	ws.send($("#msg").val());
	$("#msg").val("");
} 
// WebSocket Server 컨넥션 종료
function closeConnect() {
	// // 웹소켓 서버 엔드포인트 대상 접속종료 이벤트 전파 
	ws.close();
}
</script>
</head>    
<body> 
	<textarea id="chatlog" readonly style="height: 800px; width:200px; margin-top: 5px;"></textarea><br/>
	<div class="row"  >
	<input id="msg" class="col-md-8" type="text" style="height: 30px; margin-left: 13px;"/>  
	<button class="col-md-3" type="submit" id="sendButton" style="height: 28px; margin-left: 3px;"  onClick="postToServer();">전송</button>
	</div>
<!-- 	<button  type="submit" id="sendButton" onClick="closeConnect();">접속종료</button> -->
</body>
</html>
