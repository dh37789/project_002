<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function() {
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#btnCancel').click(
		function() {
			location.href = "${pageContext.request.contextPath}/freProfile/selfInfoBeforeForm.do";
		});
	

})
</script>
<body>
<form class="form-horizontal" action="${pageContext.request.contextPath}/freProfile/updateSelfInfo.do" method="post">
	<div class="content">
		<!-- 자기소개 -->
		<h2 class="content-heading">
			<i class="si si-briefcase mr-5"></i> 자기소개 등록
		</h2>
		<div class="row items-push">
			<div class="col-md-8 col-xl-12">
				<div
					class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
					<div class="form-group p5-form-group information-form-group"
						style="margin-bottom: 20px;">
						<label class="control-label required" for="availability"
							style="margin-right: 20px;"><span>*</span>자기 소개</label>
						<div class="control-wrapper">
							<input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.USER_LOGININFO.mem_id}">
							<textarea class="form-control" id="p5-description"
								name="mem_selfinfo" rows="12"></textarea>
						</div>
						<span class="p5-form-self-introduction-information">한글 기준
							5000자 미만</span>
					</div>
					<div class="form-group p5-form-group p5-profile-manage-btn-group">
						<div class="btn-wrapper pull-right">
							<button type="button" class="btn btn-secondary min-width-125" id="btnCancel" name="btnCancel">취소</button>
							<button type="submit" class="btn btn-primary min-width-125">등록 완료</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>

