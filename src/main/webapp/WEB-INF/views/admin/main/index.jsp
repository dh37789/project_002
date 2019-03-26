<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.tech{  
  overflow: hidden; 
  text-overflow: ellipsis; 
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical; 
  width:300px;
}
.content{  
  overflow: hidden; 
  text-overflow: ellipsis; 
  display: -webkit-box;
  -webkit-line-clamp: 7;
  -webkit-box-orient: vertical; 
  width:300px;
}
</style>
</head>
<script type="text/javascript">
function stList(){
	$(location).attr('href','${pageContext.request.contextPath}/projectMgn/standbyPjList.do');
};

function stView(val){
	event.stopPropagation();
	$(location).attr('href','${pageContext.request.contextPath}/projectMgn/standbyPjView.do?pr_num='+val);
};

function prList(){
	$(location).attr('href','${pageContext.request.contextPath}/projectMgn/projectingList.do');
};

function prView(val){
	event.stopPropagation();
	$(location).attr('href','${pageContext.request.contextPath}/frmyproject/projectView.do?pnum='+val);
}
</script>
<body>
<img src="${pageContext.request.contextPath}/image/adminMain.PNG" width="100%" ></img>	
<br>
<br>
<div align="center" style="margin-left: 80px; margin-right: 80px; padding-top: 15px;">
	<br>
	<div class="font-size-h5 font-w600">
	<img src="${pageContext.request.contextPath}/image/hourglass.png" width="30px" ></img>
	&nbsp;승인 대기 프로젝트</div>
</div>
<input type="hidden" name="image">
<br>


<div class="row row-deck" style="margin-left: 80px; margin-right: 80px; padding-top: 10px;">
<c:forEach items="${stbyProList }" var="projectList">
    <div class="col-md-6 col-xl-3" onclick="stView(${projectList.pr_num});">
        <a class="block block-link-pop block-rounded block-bordered text-center">
            <div class="block-content">
                <div class="title font-size-h5 font-w700" style="color: #C3597A;">${projectList.pr_title }</div>
                <input type="hidden" name="pr_num" value="${projectList.pr_num}">
                <small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectList.pr_payment }원 |  
                <i class="fa fa-clock-o fa-1x"></i> 예상기간 ${projectList.pr_ex_period }일 <br> 
                <em>등록일자 ${projectList.pr_date }</em></small>
                <p class="content">${projectList.pr_content }</p>
            	<p class="tech" style="padding-left: 40px; padding-right: 30px; overflow: hidden">
            	<c:forEach items="${projectList.techList}" var="tech"><span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;</c:forEach>
            	</p>
            </div>
        </a>
    </div>
 </c:forEach>
 <div id="stList" onclick="stList()">
	 <img src="${pageContext.request.contextPath}/image/next1.png" style="width: 100px; height: 100px; 
	 margin-left: 130px; margin-top: 95px;" >
	 <h5 style="margin-left: -75px; margin-top: 200px;">더보기</h5>
 </div>
</div>

<br>
<div align="center" style="margin-left: 80px; margin-right: 80px; padding-top: 15px;">
	<br>
	<div class="font-size-h5 font-w600">
	<img src="${pageContext.request.contextPath}/image/hourglass.png" width="30px" ></img>
	&nbsp;진행중인 프로젝트</div>
</div>
<input type="hidden" name="image">
<br>


<div class="row row-deck" style="margin-left: 80px; margin-right: 80px; padding-top: 10px;">

<c:forEach items="${projectingList }" var="projectList">
    <div class="col-md-6 col-xl-3" onclick="prView(${projectList.pr_num});">
        <a class="block block-link-pop block-rounded block-bordered text-center">
            <div class="block-content">
                <div class="title font-size-h5 font-w700" style="color: #0C8CAC;">${projectList.pr_title }</div>
                <input type="hidden" name="pr_num" value="${projectList.pr_num}">
                <small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectList.pr_payment }원 |  
                <i class="fa fa-clock-o fa-1x"></i> 예상기간 ${projectList.pr_ex_period }일 <br> 
                <em>등록일자 ${projectList.pr_date }</em></small>
                <p class="content">${projectList.pr_content }</p>
            	<p class="tech" style="padding-left: 40px; padding-right: 30px; overflow: hidden">
            	<c:forEach items="${projectList.techList}" var="tech"><span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;</c:forEach>
            	</p>
            </div>
        </a>
    </div>
 </c:forEach>
 <div id="prList" onclick="prList()">
	 <img src="${pageContext.request.contextPath}/image/next2.png" style="width: 100px; height: 100px; 
	 margin-left: 130px; margin-top: 95px;" >
	 <h5 style="margin-left: -75px; margin-top: 200px;">더보기</h5>
 </div>
</div>
</body>
</html>