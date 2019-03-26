<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/join/loginForm.do');
	});
	
	$('#joinBtn').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/member/selectCF.do');
	});

	setInterval(function() {
	var mem_id = "${sessionScope.USER_LOGININFO.mem_id}";
	if(mem_id==''){
		return false;
	}
		$.ajax({
			type:'POST',
			dataType:'JSON',
			data:{mem_id:mem_id},
			url:"${pageContext.request.contextPath}/alarm/countAlarm.do",
			error:function(result){
			},success:function(result){
				$('.spanSetIn').text(result.count);
			}
		})
		}, 3000);
	
	setInterval(function() {
	var mem_id = "${sessionScope.USER_LOGININFO.mem_id}";
	if(mem_id==''){
		return false;
	}
		$.ajax({
			type:'POST',
			dataType:'JSON',
			data:{mem_id:mem_id},
			url:"${pageContext.request.contextPath}/message/countMessage.do",
			error:function(result){
			},success:function(result){
				$('.messageSetIn').text(result.count);
			}
		})
		}, 3000);
});
	

function alarmModal(){
	var mem_id = "${sessionScope.USER_LOGININFO.mem_id}";
		
	$.ajax({
         type:'POST',
         dataType:'JSON',
         data:{mem_id : mem_id},
         url:'${pageContext.request.contextPath}/alarm/selectAlarm.do',
         error:function(result){
            alert(result.message);
         },
         success:function(result){
			$('#modal-fadein').modal('show');
			$('#alarmDiv').html('');
			var str="";
			$.each(result.msgList, function(index, msgList) {
				$('#alarmDiv').append("<p><small><span class='badge badge-primary'>"+(parseInt(index)+1)+"</span>&nbsp;"+msgList.armsg_content+"</small>&nbsp;&nbsp;&nbsp;<a class='badge badge-danger' href='javascript:checkArmsg("+msgList.armsg_num+");'>delete</a></p>");
			});
         }
      });
};

function Message(val){
	window.open("${pageContext.request.contextPath}/message/messageList.do?mem_id="+val, "메세지 창",
 			 "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=no ");  
};

function checkArmsg(val){
	var armsg_num=val;
	$.ajax({
		type:'POST',
		dataType:'JSON',
		data:{armsg_num:val},
		url:'${pageContext.request.contextPath}/alarm/checkArmsg.do',
		error:function(result){
            alert(result.message);
         },
         success:function(result){
        	 alarmModal();
         }
         
	});
};
</script>
<body>
<!-- Header -->
<header id="page-header">
    <!-- Header Content -->
    <div class="content-header">
        <!-- Left Section -->
        <div class="content-header-section">
            <!-- Toggle Sidebar -->
            <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
            <button type="button" class="btn btn-circle btn-dual-secondary" data-toggle="layout" data-action="sidebar_toggle">
                <i class="fa fa-navicon"></i>
            </button>
            <!-- END Toggle Sidebar -->
        </div>
        <!-- END Left Section -->

        <!-- Right Section -->
        <div class="content-header-section">
        <c:if test="${empty sessionScope.USER_LOGININFO }">  
        <c:if test="${empty sessionScope.ADMIN_LOGININFO }">
        <div class="btn-group" role="group">
        	<button id="loginBtn" data-toggle="click-ripple" class="btn btn-noborder btn-rounded btn-primary min-width-100 mb-12">로그인</button>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<button id="joinBtn" data-toggle="click-ripple" class="btn btn-noborder btn-rounded btn-success min-width-100 mb-12">회원가입</button>
        </div>
        </c:if>
        </c:if>
<!-- 클라이언트 로그인 후 프로필 -->
            <!-- User Dropdown -->
            <c:if test="${not empty sessionScope.ADMIN_LOGININFO}">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-rounded btn-dual-secondary" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.ADMIN_LOGININFO.mem_name }
								<i class="fa fa-angle-down ml-5"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right min-width-150" aria-labelledby="page-header-user-dropdown">                                <a class="dropdown-item" href="${pageContext.request.contextPath }/join/logOut.do">
                                    <i class="si si-logout mr-5"></i> Sign Out
                                </a>
                            </div>
                        </div>
            <!-- END User Dropdown -->

            <!-- Toggle Side Overlay -->
            <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
<!-- 로그인 후 알림센터 -->
                  </c:if>
            <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 1 }">
                        <div class="btn-group" role="group">
						<i class="fa fa-bell-o fa-3x btn btn-circle btn-dual-secondary" onclick="javascript:alarmModal();"></i><span class="badge badge-warning spanSetIn"  style="height: 18px; margin-top: 8px;"></span>
                            <button type="button" class="btn btn-rounded btn-dual-secondary" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.USER_LOGININFO.mem_name }
								<i class="fa fa-angle-down ml-5"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right min-width-150" aria-labelledby="page-header-user-dropdown">
                                 <a class="dropdown-item" href="${pageContext.request.contextPath}/clProfile/clMyProfileList.do?mem_id=${USER_LOGININFO.mem_id }">
                                    <i class="si si-user mr-5"></i> Profile
                                </a>
                                <a class="dropdown-item d-flex align-items-center justify-content-between" href="javascript:Message('${sessionScope.USER_LOGININFO.mem_id}');">
                                    <span><i class="si si-envelope mr-5"></i> Message</span>
                                    <span class="badge badge-primary messageSetIn"></span>
                                </a>
                                
                                <div class="dropdown-divider"></div>

<!--                                 Toggle Side Overlay -->
<!--                                 Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/freProfile/infoView.do?mem_id=${USER_LOGININFO.mem_id }" data-toggle="" data-action="">
                                    <i class="si si-wrench mr-5"></i> Edit Info
                                </a>
<!--                                 END Side Overlay -->
                                <div class="dropdown-divider"></div>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/scheduler/frScheduler.do?mem_id=${USER_LOGININFO.mem_id }"; data-toggle="" data-action="">
                                    <i class="si si-calendar mr-5"></i> Calendar
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath }/join/logOut.do">
                                    <i class="si si-logout mr-5"></i> Sign Out
                                </a>
                            </div>
                        </div>
            <!-- END User Dropdown -->

            <!-- Toggle Side Overlay -->
            <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
<!-- 로그인 후 알림센터 -->
                        <button type="button" class="btn btn-circle btn-dual-secondary" data-toggle="layout" data-action="side_overlay_toggle">
                            <i class="fa fa-tasks"></i>
                        </button>
                  </c:if>
                  
<!-- 프리랜서 로그인 후 프로필 -->
            <!-- User Dropdown -->
            <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 2 }">
                        <div class="btn-group" role="group">
<!--                         <i class="fa fa-bell fa-2x text-warning"></i> -->  
<!--                             <i class="si si-envelope-letter fa-2x"></i> -->
						<!-- 메신저 역할 -->
                        <i class="fa fa-bell-o fa-3x btn btn-circle btn-dual-secondary" onclick="javascript:alarmModal();" ></i><span class="badge badge-warning spanSetIn"  style="height: 18px; margin-top: 8px;"></span>
                            <button type="button" class="btn btn-rounded btn-dual-secondary" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.USER_LOGININFO.mem_name }
								<i class="fa fa-angle-down ml-5"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right min-width-150" aria-labelledby="page-header-user-dropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/freProfile/frmyProfileList.do?mem_id=${USER_LOGININFO.mem_id }">
                                    <i class="si si-user mr-5"></i> Profile
                                </a>
								<a class="dropdown-item d-flex align-items-center justify-content-between" href="javascript:Message('${sessionScope.USER_LOGININFO.mem_id}');">
                                    <span><i class="si si-envelope mr-5"></i> Message</span>
                                    <span class="badge badge-primary messageSetIn"></span>
                                </a>
<!--                                 Toggle Side Overlay -->
<!--                                 Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/freProfile/infoView.do?mem_id=${USER_LOGININFO.mem_id }" data-toggle="" data-action="">
                                    <i class="si si-wrench mr-5"></i> Edit Info
                                </a>
<!--                                 END Side Overlay -->
                                <div class="dropdown-divider"></div>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/scheduler/frScheduler.do?mem_id=${USER_LOGININFO.mem_id }"; data-toggle="" data-action="">
                                    <i class="si si-calendar mr-5"></i> Calendar
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath }/join/logOut.do">
                                    <i class="si si-logout mr-5"></i> Sign Out
                                </a>
                            </div>
                            
                        </div>
            <!-- END User Dropdown -->

            <!-- Toggle Side Overlay -->
            <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
<!-- 로그인 후 알림센터 -->
                        <button type="button" class="btn btn-circle btn-dual-secondary" data-toggle="layout" data-action="side_overlay_toggle">
                            <i class="fa fa-tasks"></i>
                        </button>
                  </c:if>
            <!-- END Toggle Side Overlay -->
        </div>
        <!-- END Right Section -->
    </div>
    <!-- END Header Content -->

    <!-- Header Search -->
    <div id="page-header-search" class="overlay-header">
        <div class="content-header content-header-fullrow">
            <form action="#" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!-- Close Search Section -->
                        <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                        <button type="button" class="btn btn-secondary" data-toggle="layout" data-action="header_search_off">
                            <i class="fa fa-times"></i>
                        </button>
                        <!-- END Close Search Section -->
                    </div>
                    <input type="text" class="form-control" placeholder="Search or hit ESC.." id="page-header-search-input" name="page-header-search-input">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- END Header Search -->

    <!-- Header Loader -->
    <!-- Please check out the Activity page under Elements category to see examples of showing/hiding it -->
    <div id="page-header-loader" class="overlay-header bg-primary">
        <div class="content-header content-header-fullrow text-center">
            <div class="content-header-item">
                <i class="fa fa-sun-o fa-spin text-white"></i>
            </div>
        </div>
    </div>
    <!-- END Header Loader -->
</header>
<!-- END Header -->

	<div class="modal" id="modal-fadein" tabindex="-1" role="dialog" aria-labelledby="modal-fadein" aria-hidden="true"  >
            <div class="modal-dialog " role="document"  >
                <div class="modal-content" style="width: 110%;">
                    <div class="block block-themed block-transparent mb-0">
                        <div class="block-header p-10 bg-primary">
                            <h3 class="block-title">알림</h3>
                            <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                            </div>
                        </div>
                        <div class="block-content" id="alarmDiv" >
                            <p></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



</body>
</html>