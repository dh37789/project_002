<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('.chatDiv').hide();
	
	setInterval(function() {
	 	var mem_id = "${sessionScope.USER_LOGININFO.mem_id}";
	 	if(mem_id==''){
	 		return false;
	 	}
	 		$.ajax({
	 			type:'POST',
	 			dataType:'JSON',
	 			data:{mem_id:mem_id},
	 			url:"${pageContext.request.contextPath}/chat/accessingMember.do",
	 			error:function(result){
	 			},success:function(result){
	 					var html = '';
	 				$.each(result.projectListt, function(index, projectListt) {
	 					html += "<code>"+projectListt.PR_TITLE+"</code> <ul class='nav-users push'>";
	 					var pr_num = projectListt.CONS_PROJ_NUM;
		 				$.each(result.totalListt[pr_num], function(i, totalListt) {
		 					if (totalListt.MEM_LOGIN == 1) {
			 					html += "<li> <a href='#'> <img class='img-avatar' src='${pageContext.request.contextPath}/assets/img/avatars/avatar6.jpg'><i class='fa fa-circle text-success'></i>"+totalListt.CONS_FREE_ID+"<div class='font-w400 font-size-xs text-muted'>"+totalListt.PART+"</div></a></li>";
							}else{
			 					html += "<li> <a href='#'> <img class='img-avatar' src='${pageContext.request.contextPath}/assets/img/avatars/avatar6.jpg'><i class='fa fa-circle text-danger'></i>"+totalListt.CONS_FREE_ID+"<div class='font-w400 font-size-xs text-muted'>"+totalListt.PART+"</div></a></li>";
							}
		 				});
		 				html += "</ul>";
	 				});
	 				$('#userList').html(html);
	 				
	 			}
	 		})
	 		}, 3000);
	
});
function move(val){
	$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum='+val);
};

function show(val){
	if($('#'+val).attr('show')=='true'){
		$('#'+val).hide();
		$('#'+val).attr('show',false);
	}else{
		$('#'+val).show();
		$('#'+val).attr('show',true);
	}
};

	 var newName, n=0;

	    //팝업 창 제목 만들기 함수(다중 팝업을 위한..)    
	    function newWindow(value)
	    {
	       n = n + 1;
	       newName = value + n;     
	    }
function openWin(val){
	
	if($('#'+val).find('button[name=chatBtn]').text()=='채팅중'){
		return false;
	}else{
		$('#'+val).find('button[name=chatBtn]').text('채팅중');
		var pr_num=val;
		newWindow("MyWindow");
		window.open("${pageContext.request.contextPath}/client/wsclient/chatting.do?pr_num="+pr_num, newName,
  			 "width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no ",pr_num );  
	}
} 
function change(val){
	$('#'+val).find('button[name=chatBtn]').text('채팅방 입장');
}

</script>
</head>
<body>    
<!-- Side Overlay-->  
<aside id="side-overlay">
    <!-- Side Overlay Scroll Container -->
    <div id="side-overlay-scroll">  
        <!-- Side Header -->
        <div class="content-header content-header-fullrow">
            <div class="content-header-section align-parent">
                <!-- Close Side Overlay -->
                <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                <button type="button" class="btn btn-circle btn-dual-secondary align-v-r" data-toggle="layout" data-action="side_overlay_close">
                    <i class="fa fa-times text-danger"></i>
                </button>
                <!-- END Close Side Overlay -->

                <!-- User Info -->
                <div class="content-header-item">
                    <a class="img-link mr-5" href="#">
                        <img class="img-avatar img-avatar32" src="${pageContext.request.contextPath }/assets/img/avatars/avatar15.jpg" alt="">
                    </a>
                    <a class="align-middle link-effect text-primary-dark font-w600" href="#">
                    ${USER_LOGININFO.mem_id } (${USER_LOGININFO.mem_name })
					</a>
                </div>  
                <!-- END User Info -->
            </div>
        </div>
        <!-- END Side Header -->

        <!-- Side Content -->
        <div class="content-side">
            <!-- Search -->
            <div class="block pull-t pull-r-l">
                <div class="block-content block-content-full block-content-sm bg-body-light">
                    <form action="#" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" id="side-overlay-search" name="side-overlay-search" placeholder="Search..">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary px-10">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- END Search -->

            <!-- Mini Stats -->
            <div class="block pull-r-l">
                <div class="block-content block-content-full block-content-sm bg-body-light">
                    <div class="row">
                        <div class="col-4">
                            <div class="font-size-sm font-w600 text-uppercase text-muted text-center">진행중인<br>프로젝트</div>
                            <div class="font-size-h4 text-center"><span class="badge badge-success">${frproing }${proing }건</span></div>
                        </div>
                        <div class="col-4">
                            <div class="font-size-sm font-w600 text-uppercase text-muted text-center">완료한<br>프로젝트</div>
                            <div class="font-size-h4 text-center"><span class="badge badge-success">${frendPro }${endPro }건</span></div>
                        </div>
                        <div class="col-4">
                        <c:if test="${USER_LOGININFO.iden_num eq '1' }">
                            <div class="font-size-sm font-w600 text-uppercase text-muted text-center">프로젝트<br>진행 비용</div>
                        </c:if>
                        <c:if test="${USER_LOGININFO.iden_num eq '2' }">
                            <div class="font-size-sm font-w600 text-uppercase text-muted text-center">프로젝트<br>수입</div>
                        </c:if>
                            <div class="text-center"><span class="badge badge-success" style="margin-top: 10px;">₩${frproMoney }${proMoney }</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Mini Stats -->
            <!-- Friends -->
            <c:if test="${USER_LOGININFO.iden_num eq '2' }">
            <div class="block pull-r-l">
                <div class="block-header bg-body-light">
                    <h3 class="block-title"><i class="fa fa-fw fa-users font-size-default mr-5"></i>접속자</h3>
                    <div class="block-options">
                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                            <i class="si si-refresh"></i>
                        </button>
                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
                    </div>
                </div>
                <div class="block-content "id="userList">
                    <ul class="nav-users push">
                       
                        
                    </ul>
                </div>
            </div>
            </c:if>
            <!-- END Friends -->

            <!-- Activity -->
            <c:if test="${not empty sessionScope.USER_LOGININFO }">
            <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 1 || sessionScope.USER_LOGININFO.iden_num eq 2}">
            <div class="block pull-r-l "style="height: auto;">
                <div class="block-header bg-body-light">
                    <h3 class="block-title">
                        <i class="fa fa-wechat font-size-default mr-5"></i>채팅
                    </h3>
                    <div class="block-options">
                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
                            <i class="si si-refresh"></i>
                        </button>
                        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
                    </div>
                </div>
                <input type="hidden" id="interop">
                <div class="block-content">
                    <ul class="list list-activity">  
	                    <c:forEach items="${sessionScope.PROJECTLIST}" var="project">
	                        <li class="list list-activity">
	                        	<input type="hidden" name="pr_num" value="${project.PR_NUM}">
	                        	<div class="row" style="margin-left: -35px;" >
	                            <i class="si si-check text-muted" style="margin-right: 10px;"></i>
	                            <div class="font-w600 "  onclick="show('${project.PR_NUM}');">${project.PR_TITLE }</div>
	                            </div>
	                            <div class="font-w400 font-size-xs text-muted " style="text-align: right; " onclick="move('${project.PR_NUM}');">이동하기</div>
	                        	<div class="chatting chatDiv justify-content-center in row" id="${project.PR_NUM }" style="margin-left: -25px;">
	                            	<button type="button" name="chatBtn" class="btn btn-alt-info min-width-125 js-click-ripple-enabled "  onclick="javascript:openWin('${project.PR_NUM}');" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;">채팅방 입장</button> 
	                        	</div>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>
            </div>
            </c:if>  
            </c:if>
            <!-- END Activity -->

   
        </div>
        <!-- END Side Content -->
    </div>
    <!-- END Side Overlay Scroll Container -->
</aside>
<!-- END Side Overlay -->
</body>
</html>