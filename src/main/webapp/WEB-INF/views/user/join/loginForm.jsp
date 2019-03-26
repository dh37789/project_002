<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.modal-title {
		color: white;
	}
</style>
 <meta name="description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
<meta name="author" content="pixelcave">
<meta name="robots" content="noindex, nofollow">

<!-- Open Graph Meta -->
<meta property="og:title" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework">
<meta property="og:site_name" content="Codebase">
<meta property="og:description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
<meta property="og:type" content="website">
<meta property="og:url" content="">
<meta property="og:image" content="">

<!-- Icons -->
<!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicons/favicon.png">
<link rel="icon" type="image/png" sizes="192x192" href="${pageContext.request.contextPath }/assets/img/favicons/favicon-192x192.png">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath }/assets/img/favicons/apple-touch-icon-180x180.png">
<!-- END Icons -->

<!-- Stylesheets -->
<!-- Codebase framework -->
<link rel="stylesheet" id="css-main" href="${pageContext.request.contextPath }/assets/css/codebase.min.css">

<!-- You can include a specific file from css/themes/ folder to alter the default color theme of the template. eg: -->
<!-- <link rel="stylesheet" id="css-theme" href="assets/css/themes/flat.min.css"> -->
<!-- END Stylesheets -->
<!-- Codebase Core JS -->
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.scrollLock.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.appear.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/jquery.countTo.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/core/js.cookie.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/codebase.js"></script>

<!-- Page JS Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>

<!-- Page JS Code -->
<script src="${pageContext.request.contextPath }/assets/js/pages/op_auth_signin.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/jsbn.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/rsa.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/prng4.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/rng.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/cookieControl.js'></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type="text/javascript">
$(function(){
    if(eval('${!empty param.message}')) alert('${param.message}');
    
    $("input").keydown(function(evt) { 
		if (evt.keyCode == 13) return false; 
	});
    
    if(Get_Cookie('saveID')){
        $('input[name=mem_id]').val(Get_Cookie('saveID'));
        $('input[type=checkbox]').attr('checked', true);
     }
    
	$('#loginBtn').click(function(){
		login();
	});
	$("#mem_id").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			login();
		}
	});
	$("#mem_pass").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			login();
		}
	});
	
	$('#findId').click(function(){
		var mem_name = $('#userName').val();
		var mem_mail = $('#userMail').val();
		if(!$('#userName').val()){
			swal("", "이름을 정확히 입력하세요.", "warning");
			return;
		}
		if(!$('#userMail').val()){
			swal("", "이메일을 정확히 입력하세요.", "warning");
			return;
		}
		$.ajax({
			type : 'POST',
			dataType : 'json',
			data : {mem_name : mem_name,
					mem_mail : mem_mail},
			url : '${pageContext.request.contextPath}/findInfo/findId.do',
			success : function(res){
				if(eval(res.flag)){
					swal("", '회원님의 ID 는 ' + res.MemberId + ' 입니다.', "info");
					$('#layerpop').modal("hide");
				} else{
					swal("", '존재하지 않는 회원 정보입니다.', "warning");
				}
			}
		});
		var mem_name = $('#userName').val(null);
		var mem_mail = $('#userMail').val(null);
		
		
		
	});
	
	$('#findPass').click(function(){
		var mem_id = $('#userId1').val();
		var mem_name = $('#userName1').val();
		var mem_mail = $('#userMail1').val();
		if(!$('#userId1').val()){
			swal("경고","아이디를 정확히 입력하세요.", "error");
			return;
		}
		if(!$('#userName1').val()){
			swal("경고","이름을 정확히 입력하세요.", "error");
			return;
		}
		if(!$('#userMail1').val()){
			swal("경고","이메일을 정확히 입력하세요.", "error");
			return;
		}
		$.ajax({
			type : 'POST',
			dataType : 'json',
			data : {mem_id : mem_id,
					mem_name : mem_name,
					mem_mail : mem_mail},
			url : '${pageContext.request.contextPath}/findInfo/findPass.do',
			success : function(res){
				if(eval(res.flag)){
					swal("정보확인","회원님의 이메일로 임시번호가 발송되었습니다.", "success");
					$('#layerpop1').modal("hide");
				}else {
					swal("경고","회원 정보를 다시 확인하세요.", "error");
				}
			}
		});
		var mem_id = $('#userId1').val(null);
		var mem_name = $('#userName1').val(null);
		var mem_mail = $('#userMail1').val(null);
	});
})
function login(){
	if($('input[name=mem_id]').val() == ''){
        swal("", '아이디를 입력해주세요', "warning");
        return false;
     }
     if($('input[name=mem_pass]').val() == ''){
        swal("", '패스워드를 입력해주세요', "warning");
        return false;
     }
     
     if($('input[name=saveID]').is(':checked')){
         Set_Cookie('saveID', $('input[name=mem_id]').val(), 1, '/');
      } else {
         Delete_Cookie('saveID', '/');
      }
     
	var mem_id = $('input[name=mem_id]').val();
	var mem_pass = $('input[name=mem_pass]').val();
	
	var rsaObj = new RSAKey();
	rsaObj.setPublic('${publicKeyMap["modulus"]}', '${publicKeyMap["exponent"]}')
	
	mem_id = rsaObj.encrypt(mem_id);
	mem_pass = rsaObj.encrypt(mem_pass);
	
	$frm = $('<form action="${pageContext.request.contextPath }/join/loginCheck.do" method="post"/>');
    $frm.append('<input type="hidden" name="mem_id" value="' + mem_id +'"/>')
    $frm.append('<input type="hidden" name="mem_pass" value="' + mem_pass +'"/>')
    $(document.body).append($frm);
    $frm.submit();
}
</script>
<body>
<div id="page-container" class="main-content-boxed">
   <!-- Main Container -->  
   
       <!-- Page Content -->
       <div class="bg-body-dark bg-pattern" style="background-image: url('${pageContext.request.contextPath }/assets/img/various/bg-pattern-inverse.png');">
           <div class="row mx-0 justify-content-center">
               <div class="hero-static col-lg-6 col-xl-4">
                   <div class="content content-full overflow-hidden">
                       <!-- Header -->
                       <div class="py-30 text-center">
                           <a class="link-effect font-w700" href="${pageContext.request.contextPath}/main/hello.do">
                           	<img src="${pageContext.request.contextPath}/image/butterfly.png" width="20px"></img>
                               <span class="font-size-xl text-primary-dark">Pap</span><span class="font-size-xl">illon</span>
                           </a>
                           <h1 class="h3 font-w700 mt-30 mb-10">Login</h1>
                           <h2 class="h5 font-w400 text-muted mb-0">Papillon에 오신것을 환영합니다!</h2>
                       </div>
                       <!-- END Header -->

                       <!-- Sign In Form -->
                       <!-- jQuery Validation (.js-validation-signin class is initialized in js/pages/op_auth_signin.js) -->
                       <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
                       <form class="js-validation-signin" action="#" method="post">
                           <div class="block block-themed block-rounded block-shadow">
                               <div class="block-header bg-gd-dusk">
                                   <h3 class="block-title">아직 회원이 아니신가요?</h3>
                                   <a class="link-effect text-white mr-10 mb-5 d-inline-block" href="${pageContext.request.contextPath}/member/selectCF.do">
                                           <i class="fa fa-plus mr-5"></i> 회원가입
                                       </a>
                               </div>
                               <div class="block-content">
                                   <div class="form-group row">
                                       <div class="col-12">
                                           <label for="mem_id">ID</label>
                                           <input type="text" class="form-control" id="mem_id" name="mem_id">
                                       </div>
                                   </div>
                                   <div class="form-group row">
                                       <div class="col-12">
                                           <label for="mem_pass">Password</label>
                                           <input type="password" class="form-control" id="mem_pass" name="mem_pass">
                                       </div>
                                   </div>
                                   <div class="form-group row mb-0">
                                       <div class="col-sm-6 d-sm-flex align-items-center push">
                                           <div class="custom-control custom-checkbox mr-auto ml-0 mb-0">
                                               <input type="checkbox" class="custom-control-input" id="saveID" name="saveID">
                                               <label class="custom-control-label" for="saveID">ID 저장</label>
                                           </div>
                                       </div>
                                       
											
                                       <div class="col-sm-6 text-sm-right push ">
                                           <button type="button" id="loginBtn" class="btn btn-alt-primary">
                                               <i class="si si-login "></i> 로그인
                                           </button>
                                       </div>
                                       
<!--                                        <div id="google_id_login" style="text-align: center;  " class="col-md-12 justify-content-center in row"> -->
<!-- <!-- 									    <button type="button" class="btn text-white mr-10 mb-5 btn-alt-danger min-width-100 mr-12 mb-12"> -->
<!-- 									    <button type="button" class="btn text-white col-12 btn-alt-danger ml-12 mb-12"> -->
<%-- 										    <img src="${pageContext.request.contextPath}/image/google.png" width="20px"></img> --%>
<%-- 										    &nbsp;<a href="${google_url}" class="text-muted"> --%>
<!-- 										      Google 로그인 -->
<!-- 										    </a> -->
<!-- 									    </button> -->
<!-- 									    <br> -->
<!-- 									    <br> -->
<!-- 									  </div> -->
                                       
                                   </div>
                               </div>
                               <div class="block-content bg-body-light">



                                <div class="form-group text-center">
                                   <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="#" data-target="#layerpop" data-toggle="modal">
                                   	<img src="${pageContext.request.contextPath}/image/q2.png" width="20px"></img> 아이디 찾기
<!--                                    	<i class="fa fa-warning mr-5" style="color: #E591A1;"></i> 아이디 찾기 -->
                                   </a>
									<div class="modal fade" id="layerpop" >
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <!-- header -->
									      <div class="block-header bg-gd-dusk">
									        <!-- header title -->
									        <h5 class="modal-title" id="titleFont">아이디 찾기</h5>
									      </div>
									      <!-- body -->
									      <div class="modal-body">
									    <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userName" name="userName" placeholder="ex). 홍길동">
                                                    <label for="userName">이름</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userMail" name="userMail" placeholder="ex). a001@naver.com">
                                                    <label for="userMail">이메일</label>
                                                </div>
                                            </div>
                                        </div>
									      </div>
									      <!-- Footer -->
									      <div class="modal-footer">
									        <button type="button" id="findId" class="btn btn-alt-primary">찾기</button>
									        <button type="button" id="close1"class="btn btn-default" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
									
									
                                   <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="#" data-target="#layerpop1" data-toggle="modal">
								   <img src="${pageContext.request.contextPath}/image/q2.png" width="20px"></img> 비밀번호 찾기
<!--                                    	<i class="fa fa-warning mr-5" style="color: #815FC8;"></i> 비밀번호 찾기 -->
                                   </a>
									<div class="modal fade" id="layerpop1" >
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <!-- header -->
									      <div class="block-header bg-gd-dusk">
									        <!-- header title -->
									        <h5 class="modal-title">비밀번호 찾기</h5>
									      </div>
									      <!-- body -->
									      <div class="modal-body">
									    <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userId1" name="userId1" placeholder="ex). a001">
                                                    <label for="userId">아이디</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userName1" name="userName1" placeholder="ex). 홍길동">
                                                    <label for="userName">이름</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userMail1" name="userMail1" placeholder="ex). a001@naver.com">
                                                    <label for="userMail">이메일</label>
                                                </div>
                                            </div>
                                        </div>
									      </div>
									      <!-- Footer -->
									      <div class="modal-footer">
									        <button type="button" id="findPass" class="btn btn-alt-primary">찾기</button>
									        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
                                  
                                   </div>
                                   
                                   



                                   
                               </div>
                           </div>
                       </form>
                       <!-- END Sign In Form -->
                   </div>
               </div>
           </div>
       </div>
       <!-- END Page Content -->
</div>
<!-- END Page Container -->
</body>
</html>