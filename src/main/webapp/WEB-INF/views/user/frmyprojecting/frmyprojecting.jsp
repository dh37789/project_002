<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <!-- Page JS Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/plugins/bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins/jquery-validation/additional-methods.min.js"></script>

<!-- Page JS Code -->
<script src="${pageContext.request.contextPath }/assets/js/pages/be_forms_wizard.js"></script>
<script type="text/javascript">
$(function(){
	if (eval('${not empty projectInfo.pr_giturl}')) {
		$('#gitUrl').val('${projectInfo.pr_giturl}')
		$('#gitMove').attr('href', '${projectInfo.pr_giturl}')
	}
	$('#requestFile').val('${requestInfo.prout_name}');
	$('#useFile').val('${useFile.prout_name}');
	$('#tableFile').val('${tableFile.prout_name}');
	$('#menuFile').val('${menuFile.prout_name}');
	$('#sceneFile').val('${sceneFile.prout_name}');
	$('#processFile').val('${processFile.prout_name}');
	$('#classFile').val('${classFile.prout_name}');
	$('.delete').click(function(){
		var prout_num = $(this).val();
		swal({
	      	  title: "알림",
	      	  text: "파일을 삭제하시겠습니까?",
	      	  icon: "info",
	      	  buttons: true,
	      	})
	      	.then(function(result){ 
					if (result) {
						$(location).attr('href','${pageContext.request.contextPath }/frmyprojecting/deleteFile.do?prout_num=' + prout_num);	
					}else{
						return;
					}
				});
	});
	$('.diagram').click(function(){
		var output_num = $(this).val();
		$(location).attr('href','${pageContext.request.contextPath }/diagram/diagramList.do?output_num=' + output_num);	
	});
	if ('${step}' == '1') {
		$('#step1').attr('class', 'nav-link active show');
		$('#wizard-simple2-step1').attr('class', 'tab-pane active show');
		$('#step2').attr('class', 'nav-link');
		$('#wizard-simple2-step2').attr('class', 'tab-pane');
		$('#step3').attr('class', 'nav-link');
		$('#wizard-simple2-step3').attr('class', 'tab-pane');
		$('#step4').attr('class', 'nav-link');
		$('#wizard-simple2-step4').attr('class', 'tab-pane');
	}else if('${step}' == '2'){
		$('#step1').attr('class', 'nav-link');
		$('#wizard-simple2-step1').attr('class', 'tab-pane');
		$('#step2').attr('class', 'nav-link active show');
		$('#wizard-simple2-step2').attr('class', 'tab-pane active show');
		$('#step3').attr('class', 'nav-link');
		$('#wizard-simple2-step3').attr('class', 'tab-pane');
		$('#step4').attr('class', 'nav-link');
		$('#wizard-simple2-step4').attr('class', 'tab-pane');
	}else if('${step}' == '3'){
		$('#step1').attr('class', 'nav-link');
		$('#wizard-simple2-step1').attr('class', 'tab-pane');
		$('#step2').attr('class', 'nav-link');
		$('#wizard-simple2-step2').attr('class', 'tab-pane');
		$('#step3').attr('class', 'nav-link active show');
		$('#wizard-simple2-step3').attr('class', 'tab-pane active show');
		$('#step4').attr('class', 'nav-link');
		$('#wizard-simple2-step4').attr('class', 'tab-pane');
	}else if('${step}' == '4'){
		$('#step1').attr('class', 'nav-link');
		$('#wizard-simple2-step1').attr('class', 'tab-pane');
		$('#step2').attr('class', 'nav-link');
		$('#wizard-simple2-step2').attr('class', 'tab-pane');
		$('#step3').attr('class', 'nav-link');
		$('#wizard-simple2-step3').attr('class', 'tab-pane');
		$('#step4').attr('class', 'nav-link active show');
		$('#wizard-simple2-step4').attr('class', 'tab-pane active show');
	}
	$('#projectInfo').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum=${projectInfo.pr_num}')
	});
	$('#noticeList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frprojectntc/frprojectntcList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#workList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/workList.do?pnum=${projectInfo.pr_num}&part=${part}');	
	});
	$('#gantt').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectWork/ganttChart.do');	
	});
	$('#present').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');	
	});
	$('#meeting').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectMeeting/meetingList.do');	
	})
	$('#schedule').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/scheduler/prSchedule.do?mem_id=${USER_LOGININFO.mem_id}&pr_num=${projectInfo.pr_num}')
	})
	$('#testForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/projectTest/projectTestForm.do');	
	});
	$('#test tr:gt(0)').click(function(){
		var test_num = $(this).find('td:eq(0) input').val();
		if (test_num == null) {
			return;
		}
		$(location).attr('href','${pageContext.request.contextPath}/projectTest/projectTestView.do?test_num=' + test_num)
	})
	$('#step1').click(function(){
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         url:'${pageContext.request.contextPath}/frmyprojecting/projectStep1.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	         }
	      });
	});
	$('#step2').click(function(){
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         url:'${pageContext.request.contextPath}/frmyprojecting/projectStep2.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	         }
	      });
	});
	$('#step3').click(function(){
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         url:'${pageContext.request.contextPath}/frmyprojecting/projectStep3.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	         }
	      });
	});
	$('#step4').click(function(){
		$.ajax({
	         type:'POST',
	         dataType:'JSON',
	         url:'${pageContext.request.contextPath}/frmyprojecting/projectStep4.do',
	         error:function(result){
	            alert(result.message);
	         },
	         success:function(result){
	         }
	      });
	});
	$('#request').click(function(){
		var output_num = $(this).val();
		var url = '${pageContext.request.contextPath }/handson/requestTable.do?output_num=' + output_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=1280, height=720';
 		window.open(url, '산출물 작성 툴', options);
	});
	$('#unit').click(function(){
		var output_num = $(this).val();
		var url = '${pageContext.request.contextPath }/handson/unitTable.do?output_num=' + output_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=1510, height=720';
 		window.open(url, '산출물 작성 툴', options);
	});
	$('#standard').click(function(){
		var output_num = $(this).val();
		var url = '${pageContext.request.contextPath }/handson/standardTable.do?output_num=' + output_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=900, height=720';
 		window.open(url, '산출물 작성 툴', options);
	});
	
	$('#word').click(function(){
		var output_num = $(this).val();
		var url = '${pageContext.request.contextPath }/handson/wordTable.do?output_num=' + output_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=900, height=720';
 		window.open(url, '산출물 작성 툴', options);
	});
	$('#material').click(function(){
		var output_num = $(this).val();
		var url = '${pageContext.request.contextPath }/handson/materialTable.do?output_num=' + output_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=1500, height=720';
 		window.open(url, '산출물 작성 툴', options);
	});
	$('.download').click(function(){
		var prout_num = $(this).val();
		$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/downloadFile.do?prout_num=' + prout_num);
	});
	var auth, authid, token, repourl, curl;
	$('#gitAdd').click(function(){
		var username = 'jns37789@naver.com';
	    var password = 'vkvldyd!1';
	    var name = $('#gitUrl').val();
	    var description = 'papillon_project';
		if (name.includes(' ')) {
	    	swal({
	        	  title: "이름 사이에 공백을 제거해주세요.",
	        	  icon: "warning"
	        	})
			return;
		}
	    if (name == '') {
	    	swal({
	        	  title: "Git 저장소 이름을 입력해 주세요.",
	        	  icon: "warning"
	        	})
			return;
		}
	    swal({
        	  title: "Git Url을 생성하시겠습니까?",
        	  icon: "info",
        	  buttons: true,
        	})
        	.then(function(exit){
        	  if (exit) {
		 	    auth = btoa(username+':'+password);
		 	    $("#results").text("계정 인증 중입니다.");
		 		$.ajax({ 
		 		    url: 'https://api.github.com/authorizations',
		 		    type: 'POST',
		 		    beforeSend: function(xhr) { 
		 		        xhr.setRequestHeader("Authorization", "Basic " + auth); 
		 		    },
		 		    data: '{"scopes":["repo"],"note":"Create Repo with Ajax"}',
		 		    error:function(result){
		 		    	$("#results").text("계정인증을 실패 했습니다. 관리자에게 문의해주세요.");
	     	 		    console.log(result);
			         },
			         success:function(response){
			        	authid = response.id;
			        	console.log(response.id);
	     	 			token = response.token;
	     	 		    $("#results").text("인증 완료.");
	     	 		    postrepo(name,description);
			         }
				});
        	  } else {
        	    return;
        	  }
        	});
	    
	 		function postrepo(name,description){

	 		 	$("#results").text("GitHub Repository를 생성중 입니다.");

	 		 	var postdata = '{"name":"'+name+'","description":"'+description+'","auto_init":true}';

	 		 	$.ajax({ 
	 		 		url: 'https://api.github.com/user/repos',
	 		 		type: 'POST',
	 		 		beforeSend: function(xhr) { 
	 		 			xhr.setRequestHeader("Authorization", "token " + token); 
	 		 		},
	 		 		data: postdata,
	 		 		success:function(response){
	 		 	 		repourl = response.html_url;
	 		 	 		console.log(curl);
	 		 	 		console.log(repourl);
	 		 	 		$('#gitUrl').val(response.html_url);
	 		 	 		updateUrl(response.html_url);
	 		 	 		$('#gitUrl').attr('disabled', 'disabled');
	 		 	 		$('#gitAdd').attr('disabled', 'disabled');
	 		 	 		$("#results").text("Repository를 생성했습니다.");
	 		 	 		setTimeout(deleteId(authid), 3000);
	 		 	 		location.reload(); 
	 		 		},
	 		 		error:function(result){
	 		 			setTimeout(deleteId(authid), 3000);
	 		 			$("#results").text("이미 존재하는 이름입니다.");
	 		 	 		console.log(result);
	 		     }
	 		 	});
	 		}
	 		function updateUrl(html_url){
	 			$.ajax({
	 		         type:'POST',
	 		         dataType:'JSON',
	 		         url:'${pageContext.request.contextPath}/frmyprojecting/updateGit.do',
	 		         data : {gitUrl : html_url,
	 		        	 	 pr_num : '${projectInfo.pr_num}'},
	 		         error:function(result){
	 		            alert(result.message);
	 		         },
	 		         success:function(result){
	 		         }
	 		      });
	 		}
	 		function deleteId(authid){
	 			$.ajax({ 
	    			url: 'https://api.github.com/authorizations/' + authid,
	    			type: 'DELETE',
	    			beforeSend: function(xhr) { 
	    				xhr.setRequestHeader("Authorization", "Basic " + auth); 
	    			}
	    		});
	 		}
	});
	$('#gitdele').click(function(){
		$.ajax({ 
 		    url: 'https://api.github.com/authorizations',
 		    type: 'GET',
 		    beforeSend: function(xhr) { 
 		        xhr.setRequestHeader("Authorization", "Basic " + auth); 
 		    },
 		    data: '{"scopes":["repo"],"note":"Create Repo with Ajax"}',
 		    error:function(result){
 		    	$("#results").text("Authorization Failed. Check console log.");
 	 		    console.log(result);
	         },
	         success:function(response){
	        	authid = response[0].id;
	        	console.log(response[0].id);
 	 			deleteGit(authid);
	         }
		});
	});
	function deleteGit(authid){
			$.ajax({ 
			url: 'https://api.github.com/authorizations/' + authid,
			type: 'DELETE',
			beforeSend: function(xhr) { 
				xhr.setRequestHeader("Authorization", "Basic " + auth); 
			}
		});
		}
});
</script>
<style>
#schedule{
	width: 100%;
	height: 100%;
	color: #9238B9;
	background-color: #f2e6ff;
}
#schedule:hover {
	background-color: #e6ccff;
	color: #9238B9; 
}
</style>
<body>
<nav class="breadcrumb bg-white push"> 
	<c:if test="${not empty USER_LOGININFO }">
		<a class="breadcrumb-item">나의 프로젝트</a> 
	</c:if>
	<c:if test="${not empty ADMIN_LOGININFO }">
		<a class="breadcrumb-item">프로젝트 관리</a> 
	</c:if>
	<span class="breadcrumb-item"> 
		<c:if test="${USER_LOGININFO.iden_num == 2}">
			<a href="${pageContext.request.contextPath }/frmyproject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${USER_LOGININFO.iden_num == 1}">
			<a href="${pageContext.request.contextPath }/clMyProject/projectList.do?mem_id=${USER_LOGININFO.mem_id }">진행중인 프로젝트</a>
		</c:if>
		<c:if test="${not empty ADMIN_LOGININFO }">
			<a href="${pageContext.request.contextPath }/projectMgn/projectingList.do">진행중인 프로젝트</a>
		</c:if>
	</span>
	<span class="breadcrumb-item"> 
		<a>프로젝트 현황</a> 
	</span>
</nav>	

<h2 class="content-heading">프로젝트 현황</h2>
<div class="block">
<!-- Bordered Table -->
 <!-- Navigation -->
	 <!-- END Navigation -->
<!--     <div class="block-header block-header-default"> -->
<!--         <h3 class="block-title">프로젝트 일감</h3> -->
<!--         <div class="block-options"> -->
<!--             <div class="block-options-item"> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
     <!-- Navigation -->
	  <!-- Navigation -->
  <div class="block-content-full border-b clearfix">
  <div class="col-13">
  	<table style="width: 100%; height: 100%;">
  	<tr>
	  	<td style="width:14%;height: 50px;"><button id="projectInfo" type="button" class="btn btn-alt-primary" style="width: 100%;height: 100%;">프로젝트 정보</button></td>
		<td style="width:14%;"><button id="noticeList" type="button" class="btn btn-alt-info" style="width: 100%;height: 100%;">프로젝트 공지</button></td>
		<td style="width:14%;"><button id="workList" type="button" class="btn btn-alt-danger" style="width: 100%;height: 100%;">프로젝트 일감</button></td>
		<td style="width:14%;"><button id="gantt" type="button" class="btn btn-alt-warning" style="width: 100%;height: 100%;">간트차트</button></td>
		<td style="width:14%;"><button id="present" type="button" class="btn btn-alt-success" style="width: 100%;height: 100%;">프로젝트 현황</button></td>
		<td style="width:14%;"><button id="meeting" type="button" class="btn btn-alt-secondary" style="width: 100%;height: 100%;">미팅신청</button></td>
		<td style="width:14%;"><button id="schedule" type="button" class="btn">일정 관리</button></td>
  	</tr>
  	</table>
  </div>
  </div>
  <!-- END Navigation -->
	  <!-- END Navigation -->
    <div class="block-content">
    <div class="col-md-12">
             <!-- Simple Wizard 2 -->
             <div class="js-wizard-simple block">
                 <!-- Step Tabs -->
                 <ul class="nav nav-tabs nav-tabs-alt nav-fill" role="tablist">
                     <li class="nav-item">
                         <a class="nav-link" id="step1" href="#wizard-simple2-step1" data-toggle="tab">1. 분석</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" id="step2" href="#wizard-simple2-step2" data-toggle="tab">2. 설계</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" id="step3" href="#wizard-simple2-step3" data-toggle="tab">3. 구현</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link" id="step4" href="#wizard-simple2-step4" data-toggle="tab">4. 테스트</a>
                     </li>
                 </ul>
                 <!-- END Step Tabs -->

                     <!-- Steps Content -->
                     <div class="block-content block-content-full tab-content" style="min-height: 267px;">
                         <!-- Step 1 -->
                         <div class="tab-pane" id="wizard-simple2-step1" role="tabpanel">
                         	<br>
                         	<table class="table table-vcenter">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 50px;">No.</th>
                                        <th>산출물 목록</th>
                                        <th class="text-center" style="width: 400px;">파일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th class="text-center" scope="row">1</th>
                                        <td>일정 관리</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                            <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
                                                <c:if test="${not empty requestInfo}">
                                                <input id="requestFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${requestInfo.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${requestInfo.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
                                                </c:if>
                                                <c:if test="${empty requestInfo}">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="0">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
                                           		</c:if>
                                                </c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">2</th>
                                        <td>요구사항 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" id="request" class="btn btn-sm btn-secondary" 
                                                data-toggle="tooltip" title="Edit" value="1">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">3</th>
                                        <td>유스케이스 다이어그램</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <button type="button" class="btn btn-sm btn-secondary diagram" 
                                               data-toggle="tooltip" title="Edit" value="2">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">4</th>
                                        <td>유스케이스 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
											<c:if test="${not empty useFile }">
                                                <input id="useFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${useFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${useFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
											</c:if>
											<c:if test="${empty useFile }">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="3">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
												</c:if>
											</c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">5</th>
                                        <td>단위 업무 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button id="unit" type="button" class="btn btn-sm btn-secondary" 
                                                data-toggle="tooltip" title="Edit" value="4">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">6</th>
                                        <td>용어 사전</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" id="word" class="btn btn-sm btn-secondary" 
                                                data-toggle="tooltip" title="Edit" value="5">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">7</th>
                                        <td>표준 단어</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" id="standard" class="btn btn-sm btn-secondary" 
                                                data-toggle="tooltip" title="Edit" value="6">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">8</th>
                                        <td>자료 사전</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button id="material" type="button" class="btn btn-sm btn-secondary" 
                                                data-toggle="tooltip" title="Edit" value="7">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                         </div>
                         <!-- END Step 1 -->

                         <!-- Step 2 -->
                         <div class="tab-pane" id="wizard-simple2-step2" role="tabpanel">
                            <br>
                         	<table class="table table-vcenter">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 50px;">No.</th>
                                        <th>산출물 목록</th>
                                        <th class="text-center" style="width: 400px;">파일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th class="text-center" scope="row">1</th>
                                        <td>ERD</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <button type="button" class="btn btn-sm btn-secondary diagram"
                                                data-toggle="tooltip" title="Edit"  value="8">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">2</th>
                                        <td>테이블 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
											<c:if test="${not empty tableFile }">
                                                <input id="tableFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${tableFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${tableFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
											</c:if>
											<c:if test="${empty tableFile}">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="9">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
												</c:if>
											</c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">3</th>
                                        <td>메뉴 구조도</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
											<c:if test="${not empty menuFile }">
                                                <input id="menuFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${menuFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${menuFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
											</c:if>
											<c:if test="${empty menuFile }">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="10">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
												</c:if>
											</c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">4</th>
                                        <td>화면 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                 <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
											<c:if test="${not empty sceneFile }">
                                                <input id="sceneFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${sceneFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${sceneFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
											</c:if>
											<c:if test="${empty sceneFile }">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="11">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
												</c:if>
											</c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">5</th>
                                        <td>프로세스 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
											<c:if test="${not empty processFile }">
                                                <input id="processFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${processFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${processFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
											</c:if>
											<c:if test="${empty processFile}">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="12">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
												</c:if>
											</c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">6</th>
                                        <td>프로세스 흐름도</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <button type="button" class="btn btn-sm btn-secondary diagram" 
                                               data-toggle="tooltip" title="Edit" value="13">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">7</th>
                                        <td>클래스 정의서</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                               <form class="form" action="${pageContext.request.contextPath }/frmyprojecting/requestFile.do" method="post"
											enctype="multipart/form-data">
                                            <c:if test="${not empty classFile }">
                                                <input id="classFile" type="text" disabled="disabled" style="width: 150px;">
                                                <c:if test="${empty ADMIN_LOGININFO }">
                                                <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                                                	style="margin-bottom: 3px;" value="${classFile.prout_num }">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                </c:if>
                                                  <button type="button" class="btn btn-sm btn-secondary download" data-toggle="tooltip" title="Download"
                                                	style="margin-bottom: 3px;" value="${classFile.prout_num }">
                                                    <i class="si si-cloud-download"></i>
                                                </button>
                                            </c:if>
                                            <c:if test="${empty classFile }">
                                           		<input type="file" name="files" style="width: 200px;">
                                           		<input type="hidden" name="ouput_num" value="14">
                                           		<input type="hidden" name="mem_id" value="${USER_LOGININFO.mem_id}">
                                           		<c:if test="${empty ADMIN_LOGININFO }">
                                           		<button type="submit" class="btn btn-sm btn-secondary" style="margin-bottom: 3px;"><i class="si si-cloud-upload"></i></button>
                                            	</c:if>
                                            </c:if>
                                            </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" scope="row">8</th>
                                        <td>클래스 다이어그램</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary diagram" 
                                                data-toggle="tooltip" title="Edit" value="15">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                         </div>
                         <!-- END Step 2 -->
						 <!-- Step 3 -->
                         <div class="tab-pane" id="wizard-simple2-step3" role="tabpanel" align="center">
                            <br>
                             <img src="${pageContext.request.contextPath}/image/github.png" style="width : 100px; margin-right: 15px;" ></img><br><br>
                              <div class="form-group row">
		                         <div class="col-4" >
		                        </div>
		                        <div class="col-5 justify-content-center in" >
		                        <div class="row">
		                        <c:if test="${USER_LOGININFO.iden_num eq '1'}">
		                        <c:if test="${empty projectInfo.pr_giturl }">
		                         <input id="gitUrl" type="text" class="form-control" style="width: 320px; padding-right: 20px; margin-left: 40px;">
		                         <button id="gitAdd" class="btn btn-alt-primary" style="margin-left: 10px;">&nbsp;Git생성&nbsp;</button>
		                         <button id="gitdele" class="btn btn-alt-warning" style="margin-left: 10px;">&nbsp;초기화&nbsp;</button>
		                        </c:if>
		                        </c:if>
		                        <c:if test="${not empty ADMIN_LOGININFO}">
		                        <c:if test="${empty projectInfo.pr_giturl }">
		                         <input id="gitUrl" type="text" class="form-control text-center" disabled="disabled" placeholder="주소 입력" style="width: 320px; padding-right: 50px;" value="Git 미생성">
		                        </c:if>
		                        </c:if>
		                        <c:if test="${USER_LOGININFO.iden_num eq '2'}">
		                        <c:if test="${empty projectInfo.pr_giturl }">
		                         <input id="gitUrl" type="text" class="form-control" disabled="disabled"  style="width: 320px; margin-left: 75px;" value="Git Url이 등록되지 않았습니다.">
		                        </c:if>
		                        </c:if>
		                        <c:if test="${not empty projectInfo.pr_giturl }">
		                         <input id="gitUrl" type="text" disabled="disabled" class="form-control" placeholder="주소 입력" style="width: 320px; padding-right: 20px; margin-left: 50px;">
		                         <a id="gitMove" target="_blank"><button class="btn btn-alt-primary" style="margin-left: 10px;">Git 열기</button></a>
		                        </c:if>
		                        </div>
		                        <br>
		                         <label class="pull-left" id="results" style="margin-left: 90px;"></label>
		                        </div>
		                        <div class="col-4" >
		                        </div>
		                     </div>
                         </div>
                  <!-- END Step 3 -->
                         <!-- Step 4 -->
                         <div class="tab-pane" id="wizard-simple2-step4" role="tabpanel">
                         <h6>테스트 게시판</h6>
                          <table id="test" class="table table-bordered table-vcenter">
				            <thead>
				                <tr>
				                    <th class="text-center" style="width: 50px;">No.</th>
				                    <th class="text-center" style="width: 80px;">유형</th>
				                    <th>제목</th>
				                    <th class="d-none d-sm-table-cell" style="width: 15%;">작성자</th>
				                    <th class="text-center" style="width: 100px;">수정된 날짜</th>
				                    <th class="text-center" style="width: 100px;">상태</th>
				                </tr>
				            </thead>
				            <tbody>
				            <c:if test="${empty testList }">
				                <tr>
				                    <td class="text-center" scope="row" colspan="6">
				                    	게시물이 존재하지 않습니다.
				                    </td>
				                </tr>
				            </c:if>
				            <c:if test="${not empty testList }">
				            <c:forEach items="${testList}" var="testInfo">
				                <tr>
				                    <td class="text-center" scope="row">${testInfo.rnum}
				                    <input type="hidden" value="${testInfo.test_num}">
				                    </td>
				                    <c:if test="${testInfo.test_type eq 0}">
				                    <td class="text-center">버그</td>
				                    </c:if>
				                    <c:if test="${testInfo.test_type eq 1}">
				                    <td class="text-center">테스트</td>
				                    </c:if>
				                    <td>${testInfo.test_title }
				                    </td>
				                    <td>
				                    ${testInfo.mem_id }
				                    </td>
				                    <td class="text-center">
				                    ${fn:substring(testInfo.test_date, 0, 10) }
				                    </td>
				                   <c:if test="${testInfo.test_status eq 0}">
				                    <td class="text-center">발견</td>
				                    </c:if>
				                   <c:if test="${testInfo.test_status eq 1}">
				                    <td class="text-center">수정 중</td>
				                    </c:if>
				                   <c:if test="${testInfo.test_status eq 2}">
				                    <td class="text-center">테스트 중</td>
				                    </c:if>
				                   <c:if test="${testInfo.test_status eq 3}">
				                    <td class="text-center">완료</td>
				                    </c:if>
				                </tr>
				            </c:forEach>
				            </c:if>
				            </tbody>
				         </table>
				         ${htmlCode }
				          <div class="row text-center">
				             <div class="col-sm-4">
				             </div>
				             <div class="col-sm-4">
				             </div>
				             <div class="col-sm-4">
				             <form class="form-inline pull-right" action="${pageContext.request.contextPath }/frmyprojecting/frmyprojecting.do" method="post">
				               <select class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-select" name="search_code">
				                   <option value="total">전체</option>
				                   <option value="title">제목</option>
				                   <option value="writer">작성자</option>
				               </select>
				               <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="search_data">
				               <button type="submit" class="btn btn-sm btn-secondary">검색</button>&nbsp;
				         	   <input type="hidden" name="currentPage" value="1">
				         	   <c:if test="${empty ADMIN_LOGININFO }">
				         	   <button type="button" id="testForm" class="btn btn-sm btn-secondary pull-right">글 작성하기</button>
				         	   </c:if>
				             </form>
				             </div>
					         </div>
					         <p></p>
                         </div>
                         <!-- END Step 4 -->
                     </div>
                     <!-- END Steps Content -->

<!--                      Steps Navigation -->
<!--                      <div class="block-content block-content-sm block-content-full bg-body-light"> -->
<!--                          <div class="row"> -->
<!--                              <div class="col-6"> -->
<!--                                  <button type="button" class="btn btn-alt-secondary" data-wizard="prev"> -->
<!--                                      <i class="fa fa-angle-left mr-5"></i> Previous -->
<!--                                  </button> -->
<!--                              </div> -->
<!--                              <div class="col-6 text-right"> -->
<!--                                  <button type="button" class="btn btn-alt-secondary" data-wizard="next"> -->
<!--                                      Next <i class="fa fa-angle-right ml-5"></i> -->
<!--                                  </button> -->
<!--                                  <button type="submit" class="btn btn-alt-primary d-none" data-wizard="finish"> -->
<!--                                      <i class="fa fa-check mr-5"></i> Submit -->
<!--                                  </button> -->
<!--                              </div> -->
<!--                          </div> -->
<!--                      </div> -->
                     <!-- END Steps Navigation -->
                     </div>
             </div>
             <!-- END Simple Wizard 2 -->
         </div>
     </div>
     <!-- END Simple Wizards -->
</body>
</html>