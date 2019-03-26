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
<script type="text/javascript">
$(function(){
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
	$('#meeting').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/#');	
	})
	
});
</script>
<body>
<nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="#">Forum</a>
    <span class="breadcrumb-item active">Categories</span>
</nav>
<h2 class="content-heading">${projectInfo.pr_title } <small>${fTypeInfo.ftype_name }</small></h2>
<div class="block">
  <!-- Navigation -->
  <div class="block-content block-content-full border-b clearfix">
       <div class="btn-group btn-group-md" role="group" aria-label="btnGroup3">
           <button id="projectInfo" type="button" class="btn btn-secondary">프로젝트 정보</button>
           <button id="noticeList" type="button" class="btn btn-secondary">프로젝트 공지</button>
           <button id="workList" type="button" class="btn btn-secondary">프로젝트 일감</button>
           <button id="gantt" type="button" class="btn btn-secondary">간트차트</button>
           <button id="present" type="button" class="btn btn-secondary">프로젝트 현황</button>
           <button id="meeting" type="button" class="btn btn-secondary">미팅신청</button>
           <button id="complete" type="button" class="btn btn-secondary">프로젝트 완료신청</button>
       </div>
  </div>
  <!-- END Navigation -->

  <!-- Project -->
  <div class="block-content block-content-full">
  <div class="col-sm-12 invisible" data-toggle="appear">
              <!-- Project Info -->
              <table class="table table-striped table-borderless mt-20">
                  <tbody>
                      <tr>
                          <td class="font-w600">Client</td>
                          <td>${projectInfo.client }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">Budget</td>
                          <td>${projectInfo.pr_payment }원</td>
                      </tr>
                      <tr>
                          <td class="font-w600">Category</td>
                          <td>${fTypeInfo.ftype_name }/${cateInfo.cate_detail }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">시작일</td>
                          <td>${fn:substring(projectInfo.pr_start, 0, 10) }</td>
                      </tr>
                      <tr>
                          <td class="font-w600">종료일</td>
                          <td>${fn:substring(projectInfo.pr_deadline, 0, 10) }</td>
                      </tr>
                  </tbody>
              </table>
              <!-- END Project Info -->
          </div>
      <div class="row py-20">
         
          <div class="col-sm-12">
              <!-- Project Description -->
              <pre>
              ${projectInfo.pr_content }
              </pre>
<!--               <h3 class="mb-10">Introduction</h3> -->
<!--               <p>Dolor posuere proin blandit accumsan senectus netus nullam curae, ornare laoreet adipiscing luctus mauris adipiscing pretium eget fermentum, tristique lobortis est ut metus lobortis tortor tincidunt himenaeos habitant quis dictumst proin odio sagittis purus mi, nec taciti vestibulum quis in sit varius lorem sit metus mi.</p> -->
<!--               <h3 class="mt-20 mb-10">Research</h3> -->
<!--               <p>Dolor posuere proin blandit accumsan senectus netus nullam curae, ornare laoreet adipiscing luctus mauris adipiscing pretium eget fermentum, tristique lobortis est ut metus lobortis tortor tincidunt himenaeos habitant quis dictumst proin odio sagittis purus mi, nec taciti vestibulum quis in sit varius lorem sit metus mi.</p> -->
<!--               <p>Dolor posuere proin blandit accumsan senectus netus nullam curae, ornare laoreet adipiscing luctus mauris adipiscing pretium eget fermentum, tristique lobortis est ut metus lobortis tortor tincidunt himenaeos habitant quis dictumst proin odio sagittis purus mi, nec taciti vestibulum quis in sit varius lorem sit metus mi.</p> -->
              <!-- END Project Description -->
          </div>
           
      </div>
  </div>
  <!-- END Project -->
</div>
<h5>팀원<small>&nbsp;&nbsp; ${fn:length(memList) }명이 프로젝트를 함께 진행중 입니다.</small></h5>
<div class="row">
<c:forEach items="${memList }" var="memInfo">
<div class="col-md-4 col-xl-2">
    <a class="block block-link-pop text-center" href="javascript:void(0)">
        <div class="block-content block-content-full">
            <img class="img-avatar" src="assets/img/avatars/avatar2.jpg" alt="">
        </div>
        <div class="block-content block-content-full bg-body-light">
            <div class="font-w600 mb-5">${memInfo.PART }</div>
            <div class="font-size-sm text-muted">${memInfo.CONS_FREE_ID }</div>
        </div>
    </a>
</div>
</c:forEach>
</div>
</body>
</html>