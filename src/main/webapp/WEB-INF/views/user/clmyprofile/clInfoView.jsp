<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#editAccount').hide();
	
	$('#btnProfile').click(function(){
		location.href = "${pageContext.request.contextPath}/clProfile/clMyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
	});
	
	$('#btnInfoEdit').click(function(){
		location.href = "${pageContext.request.contextPath}/clProfile/infoEditForm.do?mem_id=${USER_LOGININFO.mem_id}";
	});	
	
	$('#btnCancel').click(function(){
		$('#editAccount').hide();
		$('#beforeAccount').show();
		
	})
	
	$('select[name=ac_bank]').val("${bankInfo.ac_bank}");
	
	$('#btnBankEdit').click(function(){
		
		$('#beforeAccount').hide();
		$('#editAccount').show();
	});
	
	$('#btnBankEditEnd').click(function(){
		
	})
	
});
</script>
<style type="text/css">
	.mem_profile {
		width: 800px;
		padding : 20px;
		margin-left : 300px;
		text-align: center;
	}
	
	#mem_profile2 {
		width: 800px;
		padding: 20px;
		margin-left: 300px;
	}
	
	.btn{
		margin-left: 40px;
	}
	
</style>
</head>
<body>
	<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">						
						<a class="block text-center mem_profile" href="#)">
					         <div id=profile class="block-content block-content-full bg-gd-lake">
					         <c:if test="${memberInfo.mem_picture == null }">
					             <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/nopic.png" alt="pic1"><br>
					         </c:if>
					         <c:if test="${memberInfo.mem_picture != null }">
					             <img src="/files/${memberInfo.mem_picture}" alt="" width="200" height="150"><br>
					         </c:if>
					         <c:if test="${memberInfo.status_num == '2' }" >
					         	 <span class="badge badge-danger">블랙리스트</span>
					         	 <input type="hidden" name="status_num" value="${memberInfo.status_num }">
					         </c:if>					             
					         </div>
					         
					         <div class="block-content block-content-full">
					             <div class="font-w600 mb-5">${memberInfo.mem_id }</div>
					             <div class="font-size-sm text-muted">${memberInfo.mem_name }</div>
					         </div>
					         <div class="block-content block-content-full block-content-sm bg-body-light">
					             <span class="font-w600 font-size-sm text-success">${memberInfo.mem_mail }</span>
					         </div>
					     </a>
					     
							<div class="block block-themed" id="mem_profile2">
                                <div class="block-header bg-gd-lake">
                                    <h3 class="block-title">상세 정보</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-reclsh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"><i class="si si-arrow-up"></i></button>
                                    </div>
                                </div>
                                <div class="block-content">
                                        <div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-id" name="mem_id" value="${memberInfo.mem_id }" disabled="disabled">
                                                    <input type="hidden" class="form-control" id="register5-id" value="${memberInfo.mem_id }" disabled="disabled">
                                                    <label for="register5-firstname">ID</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-name" name="mem_name" value="${memberInfo.mem_name }" disabled="disabled">
                                                    <label for="register5-lastname">NAME</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-mail" name="mem_mail" value="${memberInfo.mem_mail }" disabled="disabled">
                                                    <label for="register5-firstname">E-MAIL</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-date" name="mem_date" value="${memberInfo.mem_date }" disabled="disabled">
                                                    <label for="register5-lastname">가입일</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-zipcode" name="mem_zipcode" value="${memberInfo.mem_zipcode }" disabled="disabled">
                                                    <label for="register5-firstname">ZIPCODE</label>
                                                </div>
                                            </div>
                                        </div>                                        
										<div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-add1" name="mem_add1" value="${memberInfo.mem_add1 }" disabled="disabled">
                                                    <label for="register5-firstname">ADD</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-add2" name="mem_add2" value="${memberInfo.mem_add2 }" disabled="disabled">
                                                    <label for="register5-lastname">DETAIL ADD</label>
                                                </div>
                                            </div>
                                          </div>
                                          
                   						<div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-hp" name="mem_hp" value="${memberInfo.mem_hp }" disabled="disabled">
                                                    <label for="register5-firstname">PH</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-fax" name="mem_fax" value="${memberInfo.mem_fax }" disabled="disabled">
                                                    <label for="register5-lastname">FAX</label>
                                                </div>
                                            </div>
                                        </div>
                    					<div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-bir" name="mem_bir" value="${memberInfo.mem_bir }" disabled="disabled">
                                                    <label for="register5-firstname">BIRTHDAY</label>
                                                </div>
                                            </div>
                                         <c:if test="${memberInfo.iden_num == '1' }">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-iden" value="클라이언트" disabled="disabled">
                                                    <label for="register5-lastname">TYPE</label>
                                                </div>
                                            </div>
                                         </c:if>
                                         <c:if test="${memberInfo.iden_num == '2' }">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="register5-iden" value="프리랜서" disabled="disabled">
                                                    <label for="register5-lastname">TYPE</label>
                                                </div>
                                            </div>
                                         </c:if>
                                        </div>
                                        <br><br>
		                        <div class="col-sm-2 col-xl-5 float-right">
						        	<button type="button" class="btn btn-rounded btn-noborder btn-success min-width-50 mb-10 btnProfile" id="btnProfile" name="btnProfile">목록</button>
						        	<button type="button" class="btn btn-rounded btn-noborder btn-warning min-width-50 mb-10 btnInfoEdit" id="btnInfoEdit" name="btnInfoEdit">수정</button>
						        </div>
	                            <br>
                                </div>
                            </div>
                            
                            
                            
</body>
</html>