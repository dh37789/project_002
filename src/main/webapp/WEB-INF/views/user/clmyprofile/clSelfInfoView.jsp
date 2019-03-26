<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="assets/js/pages/be_forms_plugins.js"></script>
<script type="text/javascript">
$(function() {
	$('#btnCancel').click(
		function() {
			location.href = "${pageContext.request.contextPath}/clProfile/selfInfoBeforeView.do?mem_id=${USER_LOGININFO.mem_id}";
		});
	
    $('textarea[id=mem_selfinfo]').val('${memberInfo.mem_selfinfo}');
    $('input[id=mem_url]').val('${memberInfo.mem_url}');
	
	$('#btnEdit').click(function(){
	    if($('textarea[id=mem_selfinfo]').val()==''){
	    	swal("경고","클라이언트 소개를 입력해주세요.", "error");
	    	return false;
// 	    }else{
// 			$('#form').submit();
	    }
	    
	});
    
    
})
</script>
<body>
<form class="form-horizontal" action="${pageContext.request.contextPath}/clProfile/updateSelfInfo.do" method="post" id="form">
	<div class="content">
		<!-- 자기소개 -->
		<h2 class="content-heading"><img src="${pageContext.request.contextPath}/image/1.png" width="25px">
						&nbsp; 클라이언트 정보
					</h2>
		<div class="row items-push">
			<div class="col-md-8 col-xl-12">
				<div class="block block-rounded ribbon ribbon-modern ribbon-primary text-center">
				
				<br>
				<div class="form-group row">
				<input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.USER_LOGININFO.mem_id}">
                                <label class="col-lg-2 col-form-label" for="val-password">클라이언트 소개
                                
									<span class="text-danger">*</span>
								</label>
	                            <div class="col-lg-8">
	                                <textarea class="form-control" id="mem_selfinfo" name="mem_selfinfo" rows="6" ></textarea>
	                            <span class="help-block">회사(개인)에 대해 간략하게 설명해주세요.(150자 이내)</span>
	                            </div>
                </div>
                
                <div class="form-group row">
								<label class="col-lg-2 col-form-label" for="val-userid">홈페이지
								</label>
								
								<div id="div1" class="col-lg-8">
									<input type="text" class="form-control" id="mem_url"
										name="mem_url" >
									<div class="invalid-feedback">URL 주소가 올바르지 않습니다.</div>
								</div>
								
<!-- 								<div id="div2" class="col-lg-8"> -->
<!-- 									<input type="text" class="form-control is-invalid" id="mem_url2" -->
<!-- 										name="mem_url2" > -->
<!-- 									<div class="invalid-feedback">URL 주소가 올바르지 않습니다.</div> -->
<!-- 								</div> -->
								
				</div>
				<br><br>
						<div class="btn-wrapper pull-right">
							<button type="button" class="btn btn-secondary min-width-125" id="btnCancel" name="btnCancel">취소</button>
							<button type="submit" class="btn btn-primary min-width-125" id="btnEdit" name="btnEdit">수정 완료</button>
						</div>
						<br><br><br>
				
				
				
				
<!-- 					<div class="form-group p5-form-group information-form-group" -->
<!-- 						style="margin-bottom: 20px;"> -->
<!-- 						<label class="control-label required" for="availability" -->
<!-- 							style="margin-right: 20px;"><span>*</span>자기 소개</label> -->
<!-- 						<div class="control-wrapper"> -->
<%-- 							<input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.USER_LOGININFO.mem_id}"> --%>
<!-- 							<textarea class="form-control" id="p5-description" -->
<!-- 								name="mem_selfinfo" rows="12"></textarea> -->
<!-- 						</div> -->
<!-- 						<span class="p5-form-self-introduction-information">한글 기준 -->
<!-- 							5000자 미만</span> -->
<!-- 					</div> -->
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>

