<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat WebSocket 채팅</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="assets/js/pages/be_comp_chat.js"></script>
<script type="text/javascript">
	$(function() {
		
		

		$("#msg").keydown(function(key) {

			if (key.keyCode == 13) {// 엔터
				if($("#msg").val()==''){
					return false;
				}
					
				$('#chatContent').append("<div	class='rounded font-w600 p-10 mb-10 animated fadeIn ml-50 bg-primary-lighter text-primary-darker'>"+$('#msg').val()+"</div>");
				$.ajax({
					type:'POST',
					dataType:'JSON',
					data:{msg:$("#msg").val()},
					url:'${pageContext.request.contextPath}/chat/selectChattingBot.do',
					success:function(result){
						$('#chatContent').append("<div class='rounded font-w600 p-10 mb-10 animated fadeIn mr-50 bg-body-light'>"+result.answer+"</div>");
					},
					error:function(result){
						alert(result.status+"|"+result.responseText);
					}
						
						});
		
				$('#msg').val('')

			}

		});
	});
</script>
</head>
<body>  
	<div class="col-md-6"  >  
		<!-- Single Chat #6 -->
		<div class="block block-rounded block-themed"   >
			<!-- Chat Header -->  
			<div        
				class="js-chat-head block-content block-content-full block-sticky-options text-center bg-image"
				style="background-color: #FFF0F0;">
				<div class="block-options">
					<button type="button" class="btn-block-option"
						data-toggle="block-option" data-action="state_toggle"	data-action-mode="demo">
						<i class="si si-refresh"></i>
					</button>  
				</div>
				<img class="img-avatar img-avatar-thumb"
					src="${pageContext.request.contextPath }/image/bot.png" alt="">
				<div class="font-w600 mt-15 mb-5 text-black">
					papi Bot <span class="font-italic text-black-op">Chatting Bot</span>
				</div>
			</div>
			<!-- END Chat Header -->   
    
			<!-- Messages (demonstration messages are added with JS code at the bottom of this page) -->
			<div id="chatContent2" >
			<div
				class="js-chat-talk block-content block-content-full text-wrap-break-word overflow-y-auto"
				data-chat-id="6" style="height: 598px; overflow:scroll;" id="chatContent">
				<div
					class="font-size-sm font-italic text-muted text-center mt-20 mb-10">Do you have any questions?</div>
					<div class="rounded font-w600 p-10 mb-10 animated fadeIn mr-50 bg-body-light">안녕하세요, 온라인 IT 아웃소싱 플랫폼 파피용입니다!</div>
			</div>

			<!-- Chat Input -->
			<div
				class="js-chat-form block-content block-content-full block-content-sm bg-body-light">
					<input id="msg" class="js-chat-input form-control" type="text"
						data-target-chat-id="6"
						placeholder="Type your message and hit enter..">
			</div>
			</div>  
			<!-- END Chat Input -->
		</div>
		<!-- END Single Chat #6 -->
	</div>
</body>
</html>
