<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- Page JS Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-validation/additional-methods.min.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation2.js'></script>
<script src="${pageContext.request.contextPath }/assets/js/pages/be_forms_validation.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	var DuplicationCheckFlag = false;
	var idStr;
	
	$("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
	
	$('#idChk').click(function(){
		var id=$('#val-userid').val();
		if(!(id.validationID())){
			swal("", '아이디를 다시 입력해주세요.', "info");
			DuplicationCheckFlag = false;
			return false;
		}
		
		$.ajax({
			type : 'POST',
			DataType : 'JSON',
			data:{mem_id:id},
			url:'${pageContext.request.contextPath}/member/idCheck.do',
			error : function(result){
				getAlert('에러', result.message)
			},
			success : function(result){
				if(eval(result.result.flag)){
					swal("", '사용 가능한 아이디입니다.', "info");
					DuplicationCheckFlag = true;
					idStr = id;
				}else{
					swal("", '중복되는 아이디입니다. 다른 아이디를 입력해주세요.', "warning")
					DuplicationCheckFlag = false;
				}
			}
		});
	});
	 
   $('#memberForm').submit(function(){
      if(!DuplicationCheckFlag){
         swal("", 'ID중복검사를 해주세요.', "warning");
         return false;
      }
      
      var bir = $('select[name=bir1]').val() + '/' +
      			$('select[name=bir2]').val() + '/' + 
      			$('select[name=bir3]').val();
      var mtype_num = $('input:radio[name="mtype_num"]:checked').val();
      
      $('input[name=mem_id]').val($('#val-userid').val());
      $('input[name=mem_pass]').val($('#val-password').val());
      $('input[name=mem_name]').val($('#val-username').val());
      $('input[name=mem_mail]').val($('#val-email').val());
      $('input[name=mem_hp]').val($('#val-phoneus').val());
      $('input[name=mem_fax]').val($('#val-fax').val());
      $('input[name=mem_bir]').val(bir);
      $('input[name=mem_zipcode]').val($('#zip').val());
      $('input[name=mem_add1]').val($('#add1').val());
      $('input[name=mem_add2]').val($('#add2').val());
      $('input[name=mtype_num]').val(mtype_num);
      $('input[name=iden_num]').val();
      if (idStr != $('input[name=mem_id]').val()) {
    	  swal("", 'ID중복검사를 다시 해주세요.', "warning");
    	  return false;
	  }
      if(!$('input[name=mem_name]').val().validationNM()){
   		 swal("","올바른 이름을 입력해주세요.", "error");
   		 return false;
   	  }
      if(!$('input[name=mem_hp]').val().validationHP()){
   		 swal("","휴대폰 번호를 바르게 입력해주세요.('-'포함)", "error");
   		 return false;
   	  }
      if(mtype_num == null){
	 	 return false;
	  }
	  if($("input:checkbox[id='val-terms']").is(":checked") == false){
		  return false;
	  }
      
      swal("", '회원가입 성공! 로그인해주세요.', "success")
      return true;
   })
	
	$('#sub').click(function(){
		$("#myForm").validate();
	});
	
   $('#daumzip').click(function(){
      new daum.Postcode({
         oncomplete: function(data){
            var fullAddr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') {
               fullAddr = data.roadAddress;
            }else{
               fullAddr = data.jibunAddress;
            }
            if (data.userSelectedType === 'R') {
               if (data.bname !== '') {
                  extraAddr += data.bname;
               }
               if (data.buildingName !== '') {
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
               $('#zip').val(data.zonecode);
               $('#add1').val(fullAddr);
               
               $('#add2').focus();
         }
      }).open();
   })
})

</script>
<body>
	<div class="content">
		<!-- Bootstrap Forms Validation -->
		<h2 class="content-heading">Client 회원가입</h2>
		<div class="block">
			<div class="block-content">
				<div class="row justify-content-center py-20">
					<div class="col-xl-7">
						<!-- jQuery Validation (.js-validation-bootstrap class is initialized in js/pages/be_forms_validation.js) -->
						<!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
						<form id="memberForm" class="js-validation-bootstrap" action='${pageContext.request.contextPath }/member/insertMember.do' method="post">
							<div id="idVal" class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-userid">아이디
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="val-userid"
										name="val-userid" placeholder="4~12글자의 아이디를 입력해주세요.">
									<input type="hidden" name="mem_id">
								</div>
									<button type="button" id="idChk" class="btn btn-alt-success">&nbsp;중복검사&nbsp;</button>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-password">비밀번호
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="password" class="form-control" id="val-password"
										name="val-password" placeholder="5글자 이상의 비밀번호를 입력해주세요.">
									<input type="hidden" name="mem_pass">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label"
									for="val-confirm-password">비밀번호 확인<span
									class="text-danger">*</span></label>
								<div class="col-lg-6">
									<input type="password" class="form-control"
										id="val-confirm-password" name="val-confirm-password"
										placeholder="비밀번호를 확인해주세요.">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-username">이름
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="val-username"
										name="val-username" placeholder="2글자 이상의 이름을 입력해주세요.">
									<input type="hidden" name="mem_name">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-email">Email
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="val-email"
										name="val-email" placeholder="메일을 입력해주세요.">
									<input type="hidden" name="mem_mail">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-phoneus">HP
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="val-phoneus"
										name="val-phoneus" placeholder="전화번호를 입력해주세요.">
									<input type="hidden" name="mem_hp">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-fax">Fax</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="val-fax"
										name="val-fax" placeholder="팩스번호를 입력해주세요.">
									<input type="hidden" name="mem_fax">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="val-bir">생년월일
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<select class="year" id="bir1" name="bir1">
										<c:forEach begin="1930" end="2018" step="1" var="y">
											<option value="${y }">${y}</option>
										</c:forEach>
									</select>
									<select class="month" id="bir2" name="bir2">
										<c:forEach begin="1" end="12" step="1" var="m">
											<option value="${m}">${m}</option>
										</c:forEach>
									</select>
									<select class="day" id="bir3" name="bir3">
										<c:forEach begin="1" end="31" step="1" var="d">
											<option value="${d}">${d}</option>
										</c:forEach>
									</select>
									<input type="hidden" name="mem_bir">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="zip">주소
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="zip" placeholder="우편번호" name='zip'>
									<input type="hidden" name="mem_zipcode">
								</div>
								<button id="daumzip" type="button" class="btn btn-alt-danger btn-md">우편번호 검색</button>							
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="zip"></label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="add1" placeholder="주소" name='add1'>
									<input type="hidden" name="mem_add1">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="zip"></label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="add2" placeholder="상세주소" name='add2'>
									<input type="hidden" name="mem_add2">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-lg-4 col-form-label" for="mtype_num">사업자 유형
									<span class="text-danger">*</span>
								</label>
								<div class="col-lg-6">
									<input type="radio" name="mtype_num" value="0" id="pro"/> 개인
									<input type="radio" name="mtype_num" value="1" id="design"/> 팀
									<input type="radio" name="mtype_num" value="2" id="pro"/> 개인사업자
									<input type="radio" name="mtype_num" value="3" id="design"/> 법인사업자
								</div>
							</div>
							
							<input type="hidden" class="form-control" id="iden_num" name="iden_num" value="1">
							
							<div class="form-group row ">
								<div class="col-md-11 justify-content-center in row">
									<label class="css-control css-control-primary css-checkbox"
										for="val-terms"> <input type="checkbox"
										class="css-control-input" id="val-terms" name="val-terms"
										value="1"> <span class="css-control-indicator"></span>
										개인정보 제공에 동의합니다.
									</label>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-7 ml-auto">
									<button id="sub" class="btn btn-alt-primary">가입하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap Forms Validation -->

	</div>
</body>
</html>