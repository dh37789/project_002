<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('form').submit(function(){
		var mem_mail = $('input[name=userMail]').val();
		var mem_name = $('input[name=userName]').val();
		
		$(location).attr('href', '${pageContext.request.contextPath}/findInfo/findId.do?mem_mail='+mem_mail + '&mem_name='+mem_mail);
	});
		
});
</script>
</head>
<body>

<form>
	<div class="col-md-4">
                            <!-- Material Login -->
                            <div class="block block-themed">
                                <div class="block-header bg-gd-dusk">
                                    <h3 class="block-title">아이디 찾기</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"><i class="si si-arrow-up"></i></button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <form action="#" method="post" onsubmit="return false;">
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userName" name="userName">
                                                    <label for="userName">이름</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="userMail" name="userMail">
                                                    <label for="userMail">이메일</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <button type="submit" id="findId" class="btn btn-alt-primary">
                                                    <i class="fa fa-arrow-right mr-5"></i> 찾기
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END Material Login -->
                        </div>
                        </form>

</body>
</html>