<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	if("${alarm.ar_ma_project =='y'}"=="true"){
		$('input[name=ar_ma_project]').prop('checked',true);
	}
	if("${alarm.ar_ma_apply =='y'}"=="true"){
		$('input[name=ar_ma_apply]').prop('checked',true);
	}
	if("${alarm.ar_ma_con =='y'}"=="true"){
		$('input[name=ar_ma_con]').prop('checked',true);
	}
	if("${alarm.ar_ph_project =='y'}"=="true"){
		$('input[name=ar_ph_project]').prop('checked',true);
	}
	if("${alarm.ar_ph_apply =='y'}"=="true"){
		$('input[name=ar_ph_apply]').prop('checked',true);
	}
	if("${alarm.ar_ph_con =='y'}"=="true"){
		$('input[name=ar_ph_con]').prop('checked',true);
	}

	$('button[name=alarmBtn]').click(function(){
		str="";
		if($('input[name=ar_ma_project]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		if($('input[name=ar_ma_apply]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		if($('input[name=ar_ma_con]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		if($('input[name=ar_ph_project]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		if($('input[name=ar_ph_apply]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		if($('input[name=ar_ph_con]').prop('checked')){
			str+='y,';
		}else{
			str+='n,';
		}
		location.href="${pageContext.request.contextPath}/alarm/updateAlarm.do?str="+str;
	});
	
	$('#editAccount').hide();
	
	$('#btnProfile').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id}";
	});
	
	$('#btnInfoEdit').click(function(){
		location.href = "${pageContext.request.contextPath}/freProfile/infoEditForm.do?mem_id=${USER_LOGININFO.mem_id}";
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
	
	
	
	
	$('#btnRegister').click(function(){
		
		if($('select[name=ac_bank]').val() ==''){
			swal("경고","은행을 선택해주세요.", "error");
			return;
		}
		
		if($('input[name=ac_name]').val() ==''){
			swal("경고","예금주를 입력해주세요.", "error");
			return;
		}
		
		if($('input[name=ac_account]').val() ==''){
			swal("경고","계좌 번호를 입력해주세요.", "error");
			return;
		}
		
		
		swal({
	      	  title: "알림",
	      	  text: "계좌를 등록하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						
						$('#insertAccount').submit();               
					}else{
						return;
					}
				});
	});
	
	
	$('#btnBankEditEnd').click(function(){
		
		if($('select[name=ac_bank]').val() ==''){
			swal("경고","은행을 선택해주세요.", "error");
			return;
		}
		
		if($('input[name=ac_name]').val() ==''){
			swal("경고","예금주를 입력해주세요.", "error");
			return;
		}
		
		if($('input[name=ac_account]').val() ==''){
			swal("경고","계좌 번호를 입력해주세요.", "error");
			return;
		}
		
		
		swal({
	      	  title: "알림",
	      	  text: "계좌를 등록하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
		    .then(function(result){
					if (result){
						
						$('#updateAccount').submit();               
					}else{
						return;
					}
				});
	});
	
	
	
	
	
	
	
	
	
	
	$('#newStamp').click(function(){
		var mem_id = $(this).val();
		var url = '${pageContext.request.contextPath }/freProfile/signTool.do?mem_id=' + mem_id;
 		var options = 'toolbar=no, menubar=no, scrollbars=no, resizable=no,' + 
 					  'width=365, height=450';
 		window.open(url, '산출물 작성 툴', options);	
	})
	$('.deleteBtn').click(function(){
		var sign_num = $(this).val();
		var mem_id = '${USER_LOGININFO.mem_id}';
		var sign_type =  $(this).find('input').val();
		if (sign_type == 1) {
			 swal({
        	  title: "대표 사인은 삭제할 수 없습니다.",
        	  icon: "warning",
        	});
			 return;
		}
		 swal({
         	  title: "삭제하시겠습니까?",
         	  icon: "warning",
         	  buttons: true,
         	  dangerMode: true,
         	})
         	.then(function(exit){
         	  if (exit) {
				$(location).attr('href','${pageContext.request.contextPath }/sign/deleteSign.do?sign_num=' + sign_num + '&mem_id=' + mem_id);
         	  } else {
         	    return;
         	  }
         	});
	})
	$('.repBtn').click(function(){
		var sign_num = $(this).val();
		var mem_id = '${USER_LOGININFO.mem_id}';
		swal({
       	  title: "대표사인으로 지정하겠습니까?",
       	  icon: "info",
       	  buttons: true,
       	})
       	.then(function(exit){
       	  if (exit) {
				$(location).attr('href','${pageContext.request.contextPath }/sign/representSign.do?sign_num=' + sign_num + '&mem_id=' + mem_id);
       	  } else {
       	    return;
       	  }
       	});
	});
	
	$('#changePass').click(function(){
		var mem_pass = '${memberInfo.mem_pass}';
		var userPass = $('input[name=userPass]').val();
		var newPass = $('input[name=newPass]').val();
		var newPass1 = $('input[name=newPass1]').val();
		
		if(userPass == mem_pass && newPass == newPass1) {
			swal({
				title : "성공",
				text : "비밀번호 변경이 완료되었습니다.",
				icon : "success",
				button : true,
			}).then(function(result){
				if(result) {
					location.href = "${pageContext.request.contextPath}/findInfo/changePass.do?mem_pass=" + newPass + '&mem_id=' + '${USER_LOGININFO.mem_id}';
				} else {
					return;
				}
			});
		} else {
			swal("경고", "비밀번호를 확인해주세요.", "error");
		}
	});

});
</script>
</head>
<body>
	<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">	
	<div class="col-md-10 justify-content-center in row">					
						<div class="block text-center" style="width: 800px;padding : 20px;margin-left : 300px;text-align: center;">
					         <div id=profile class="block-content block-content-full bg-gd-lake">
					         <c:if test="${memberInfo.mem_picture == null }">
					             <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/nopic.png" alt="pic1"><br>
					         </c:if>
					         <c:if test="${memberInfo.mem_picture != null }">
					             <img class="img-avatar img-avatar-thumb" src="/files/${memberInfo.mem_picture}" alt="" width="200" height="150">
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
					     </div>
					     
							<div class="block block-themed" id="mem_profile2" style="width: 800px;padding: 20px;margin-left: 300px;">
                                <div class="block-header bg-gd-lake">
                                    <h3 class="block-title">상세 정보</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
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
                                                <div class="form-material" data-target="#layerpop1" data-toggle="modal">
                                                    
                                                    <input type="password" class="form-control" id="register5-pass" name="mem_pass" value="${memberInfo.mem_pass }" disabled="disabled">
                                                    <label for="register5-firstname">PASSWORD <button class="btn btn-rounded btn-noborder btn-primary btn-sm">비밀번호 변경</button></label> 
                                                </div>
                                   <div class="modal fade" id="layerpop1" >
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <!-- header -->
									      <div class="block-header bg-gd-dusk">
									        <!-- header title -->
									        <h5 class="modal-title">비밀번호 변경</h5>
									      </div>
									      <!-- body -->
									      <div class="modal-body">
									    <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="password" class="form-control" id="userPass" name="userPass">
                                                    <label for="userPass">현재 비밀번호</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="password" class="form-control" id="newPass" name="newPass">
                                                    <label for="newPass">변경할 비밀번호</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <input type="password" class="form-control" id="newPass1" name="newPass1">
                                                    <label for="newPass1">비밀번호 확인</label>
                                                </div>
                                            </div>
                                        </div>
									      </div>
									      <!-- Footer -->
									      <div class="modal-footer">
									        <button type="button" id="changePass" class="btn btn-alt-primary">변경</button>
									        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
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
                            
							<div class="block block-themed" id="mem_profile2"  style="width: 800px;padding: 20px;margin-left: 300px;">
                                <div class="block-header bg-gd-lake">
                                    <h3 class="block-title">계좌 정보</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"><i class=""></i></button>
                                    </div>
                                </div>
                                <div class="block-content">
                                
                                <div class="process-guide-box" style="margin-bottom: 25px;">
										<div class="process-guide-up-title" style="margin-bottom: 5px;">
											<img src="${pageContext.request.contextPath}/image/coin.png"
										style="margin-right: 5px;" width="25px" />[ 계좌 관리 가이드 ]</div>
										<div class="process-guide-up-content">
											프로젝트 대금의 안전한 송금을 위해 <strong>정확한 계좌번호</strong>가 필요합니다.
										</div>
								</div>
								<c:if test="${bankInfo eq null}">
								<h3>
								계좌 등록
								</h3>
								<form class="form-horizontal" id="insertAccount" role="form" method="post" action="${pageContext.request.contextPath}/freProfile/insertbankAccount.do?ac_mem=${USER_LOGININFO.mem_id}">
                                        <div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <label for="register5-firstname">은행명</label>
		                                                <select class="form-control" id="ac_bank" name="ac_bank">
		                                                	<option selected="selected" value="">은행 선택</option>
		                                                    <option value="1">한국은행</option>
		                                                    <option value="2">산업은행</option>
		                                                    <option value="3">기업은행</option>
		                                                    <option value="4">국민은행</option>
		                                                    <option value="11">농협은행</option>
		                                                    <option value="20">우리은행</option>
		                                                    <option value="23">SC제일은행</option>
		                                                    <option value="27">한국씨티은행</option>
		                                                    <option value="32">부산은행</option>
		                                                    <option value="45">새마을금고중앙회</option>
		                                                    <option value="48">신협</option>
		                                                    <option value="71">우체국</option>
		                                                    <option value="81">KEB하나은행</option>
		                                                    <option value="89">케이뱅크</option>
		                                                    <option value="90">카카오뱅크</option>
				                                        </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="ac_name" name="ac_name">
	                                                    <label for="register5-lastname">예금주</label>
	                                                </div>
	                                        </div>
                                        </div>
                                        
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="ac_account" name="ac_account">
	                                                    <label for="register5-lastname">계좌번호</label>
	                                                </div>
	                                        </div>
                                        </div>
                                       
                                <br><br>
						    	<div class="col-sm-2 col-xl-5 float-right">
						        	<button type="button" class="btn btn-rounded btn-noborder btn-success min-width-50 mb-10 freelancerList" name="btnRegister" id="btnRegister">등록 완료</button>
						        </div>
						        <br>
						        </form>
						        
						        </c:if>
						        <c:if test="${not empty bankInfo }">
								<h3>
								등록 계좌
								</h3>
								<form class="form-horizontal" id="updateAccount" role="form" method="post" action="${pageContext.request.contextPath}/freProfile/updateBank.do?ac_mem=${USER_LOGININFO.mem_id}">
								<div id="editAccount">
								<div class="form-group row">
                                            <div class="col-6">
                                                <div class="form-material">
                                                    <label for="register5-firstname">은행명</label>
		                                                <select class="form-control" id="ac_bank" name="ac_bank">
		                                                	<option selected="selected" value="">은행 선택</option>
		                                                    <option value="1">한국은행</option>
		                                                    <option value="2">산업은행</option>
		                                                    <option value="3">기업은행</option>
		                                                    <option value="4">국민은행</option>
		                                                    <option value="11">농협은행</option>
		                                                    <option value="20">우리은행</option>
		                                                    <option value="23">SC제일은행</option>
		                                                    <option value="27">한국씨티은행</option>
		                                                    <option value="32">부산은행</option>
		                                                    <option value="45">새마을금고중앙회</option>
		                                                    <option value="48">신협</option>
		                                                    <option value="71">우체국</option>
		                                                    <option value="81">KEB하나은행</option>
		                                                    <option value="89">케이뱅크</option>
		                                                    <option value="90">카카오뱅크</option>
				                                        </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="register5-date" name="ac_name" value="${bankInfo.ac_name}">
	                                                    <label for="register5-lastname">예금주</label>
	                                                </div>
	                                        </div>
                                        </div>
                                        
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="register5-date" name="ac_account" value="${bankInfo.ac_account}">
	                                                    <label for="register5-lastname">계좌번호</label>
	                                                </div>
	                                        </div>
                                        </div>
                                       
                                <br><br>
						    	<div class="col-sm-2 col-xl-5 float-right">
						        	<button type="button" class="btn btn-rounded btn-noborder btn-success min-width-50 mb-10 freelancerList" id="btnCancel" name="btnCancel">취소</button>
						        	<button type="button" class="btn btn-rounded btn-noborder btn-warning min-width-50 mb-10 btnBankEditEnd" id="btnBankEditEnd" name="btnBankEditEnd">수정 완료</button>
						        </div>
						        <br>
								</div>
								</form>
								
								<div id="beforeAccount">
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="register5-date" name="bank_name" value="${bankInfo.bank_name}" disabled="disabled">
	                                                    <label for="register5-lastname">은행명</label>
	                                                </div>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="register5-date" name="ac_name" value="${bankInfo.ac_name}" disabled="disabled">
	                                                    <label for="register5-lastname">예금주</label>
	                                                </div>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <input type="text" class="form-control" id="register5-date" name="ac_account" value="${bankInfo.ac_account}" disabled="disabled">
	                                                    <label for="register5-lastname">계좌번호</label>
	                                                </div>
	                                        </div>
                                        </div>
                                       
                                <br><br>
						    	<div class="col-sm-2 col-xl-5 float-right">
						        	<button type="button" class="btn btn-rounded btn-noborder btn-warning min-width-50 mb-10 btnBankEdit" id="btnBankEdit" name="btnBankEdit">수정</button>
						        </div>
						        </div>
						        <br>
						        </c:if>
                                </div>
                            </div>
                            
                            
                            
							<div class="block block-themed" id="mem_profile2"  style="width: 800px;padding: 20px;margin-left: 300px;">
                                <div class="block-header bg-gd-lake">
                                    <h3 class="block-title">날인 정보</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"><i class=""></i></button>
                                    </div>
                                </div>
                                <div class="block-content">
                                <div class="process-guide-box" style="margin-bottom: 25px;">
										<div class="process-guide-up-title" style="margin-bottom: 5px;">
											<img src="${pageContext.request.contextPath}/image/nalin.png"
										style="margin-right: 5px;" width="25px" />[ 날인 방법 관리 ]
										<c:if test="${fn:length(signList) < 3}">
										<button id="newStamp" class="btn btn-info pull-right" value="${memberInfo.mem_id }"><i class="fa fa-edit">&nbsp;새 인감 등록하기</i></button>
										</c:if>
										<c:if test="${fn:length(signList) eq 3}">
										<button id="newStamp" class="btn btn-info pull-right" value="${memberInfo.mem_id }" disabled="disabled"><i class="fa fa-edit">&nbsp;새 인감 등록하기</i></button>
										</c:if>
										</div>
										<div class="process-guide-up-content">
										안심계약에 사용할 날인 방법을 관리하세요.
										<p class="text-danger">※ 사인은 3개까지 등록 가능합니다.</p>
										</div>
								</div>
								<div class="col-xl-13 row" style="text-align: center;">
								<c:if test="${empty signList }">
								<c:forEach items="signList" var="signInfo" varStatus="stat">
									<h4 style="margin-left: 20px;"><i class="fa fa-close"></i>등록된 날인이 없습니다. 날인을 등록해 주세요.</h4>
								</c:forEach>
								</c:if>
								<c:if test="${not empty signList }">
								<c:forEach items="${signList }" var="signInfo" varStatus="stat">
								  <div class="col-4">
								    <div class="text-center">
								      <c:if test="${signInfo.sign_type eq '1' }">
								      <label style="padding-left: 76px;">사인 ${stat.count } <span class="badge badge-pill badge-warning"><i class="fa fa-star">대표등록</i></span></label>
								      </c:if>
								      <c:if test="${signInfo.sign_type eq '0' }">
								      <label>사인 ${stat.count }</label>
								      </c:if>
								    </div>
								    <img alt="" src="${pageContext.request.contextPath}/files/${signInfo.sign_save_name}" style="width: 200px; height: 200px; border: 1px solid black;">
								    <div class="row btn-group" style="margin-top: 10px;">
								      <button class="btn btn-danger btn-rounded deleteBtn" value="${signInfo.sign_num }">
								      <input type="hidden" value="${signInfo.sign_type }"><i class="fa fa-close">삭제</i></button>
								      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								      <c:if test="${signInfo.sign_type eq '1' }">
								      <button class="btn btn-warning btn-rounded repBtn" value="${signInfo.sign_num }" disabled="disabled"><i class="fa fa-star-o">대표</i></button>
								      </c:if>
								      <c:if test="${signInfo.sign_type eq '0' }">
								      <button class="btn btn-warning btn-rounded repBtn" value="${signInfo.sign_num }"><i class="fa fa-star-o">대표</i></button>
								      </c:if>
								    </div>
								  </div>
								</c:forEach>
								</c:if>
								</div>
                              </div>
                            </div>
                            
                            <div class="block text-center" style="width: 800px;padding : 20px;margin-left : 300px;text-align: center;">
					         	<div class="block-header bg-gd-lake">
                                    <h3 class="block-title">알림 설정</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                                            <i class="si si-refresh"></i>
                                        </button>
                                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"><i class=""></i></button>
                                    </div>
                                </div>
					         
					         
					         
					         <div class="block-content block-content-full">
					            <div class="form-group row">
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <label for="register5-lastname">MAIL</label>
	                                                </div>
														<span class="css-control-indicator"></span> 프로젝트 관련
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ma_project" class="css-control-input" style="margin-left: 10%;" >
														<span class="css-control-indicator"></span> 
													</label> 
													<br>
														<span class="css-control-indicator"></span> 지원 관련
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ma_apply" class="css-control-input" style="margin-left: 10%;" >
														<span class="css-control-indicator"></span>
													</label>
													<br> 
														<span class="css-control-indicator">계약 관련</span>
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ma_con" class="css-control-input" style="margin-left: 10%;">
														<span class="css-control-indicator"></span>
													</label> 
	                                        </div>
	                                        
	                                        <div class="col-6">
	                                                <div class="form-material">
	                                                    <label for="register5-lastname">PHONE</label>
	                                                </div>
	                                                <span class="css-control-indicator"></span> 프로젝트 관련
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ph_project" class="css-control-input" style="margin-left: 10%;" >
														<span class="css-control-indicator"></span> 
													</label> 
													<br>
														<span class="css-control-indicator"></span> 지원 관련
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ph_apply" class="css-control-input" style="margin-left: 10%;" >
														<span class="css-control-indicator"></span>
													</label>
													<br> 
														<span class="css-control-indicator">계약 관련</span>
													<label	class="css-control css-control-sm css-control-primary css-switch">
														<input type="checkbox" name="ar_ph_con" class="css-control-input" style="margin-left: 10%;" >
														<span class="css-control-indicator"></span>
													</label> 
	                                        </div>
                                        </div>
	                                        
					         </div>
					         <button type="button" class="btn btn-rounded btn-noborder btn-success min-width-50 mb-10 " name="alarmBtn">알림 설정</button>
					     </div>
                            
                            
                            
                            
                           </div>
</body>
</html>