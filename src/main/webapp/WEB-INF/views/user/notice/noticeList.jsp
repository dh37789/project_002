<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
<script type='text/javascript'>
	$(function(){
		$('table tr:gt(0)').click(function(){
			var rnum = $(this).find('td:eq(0)').text();
			var no_num = $(this).find('td:eq(0) input').val();
			var no_status = $(this).find('td:eq(1) input').val();
		
			if(no_status == 'n'){
				BoostrapDialog.show({
					title: '실패',
					message: '삭제된 게시글 입니다.'
				});
				return;
			}
			$(location).attr('href','${pageContext.request.contextPath}/notice/noticeView.do?no_num='+no_num+'&rnum='+rnum);
			
		});
		
		
	});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/notice/noticeList.do?currentPage=1">공지사항</a> 
	</span> 
</nav>
		
    <h2 class="content-heading">공지사항 <small>Notice</small></h2>
	
	<div id="noticeList_content">
		<table class="table table-hover table-vcenter" style="background-color: white;">
			<thead class="thead-light">
				<tr>
					<th style="width: 50px;">No</th>
					<th>제목</th>
					<th style="width: 70px;">이름</th>
					<th style="width: 15%;">작성일</th>
					<th style="width: 100px;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="notice">
				<tr>
					<td><input type="hidden" name="no_num" value="${notice.no_num }"/>${notice.rnum }</td>
					<td align="left"><input type="hidden" value="${notice.no_status }"/>
						<c:if test="${notice.no_status eq 'y'}">
						${notice.no_title }				
						</c:if>
						<c:if test="${notice.no_status eq 'n'}">
						-- 삭제된 게시글 입니다 --				
						</c:if>
					</td>
					<td>운영자</td>
					<td>${fn:substring(notice.no_date, 0, 10) }</td>
					<td>${notice.no_hit }</td>
				</tr>
				</c:forEach>				
			</tbody>
		</table>
		${paging }
	</div>
	<div>
	<form action="${pageContext.request.contextPath }/notice/noticeList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력" class="form-control"/>
		<input type="hidden" id="currentPage" name="currentPage" value="1" class="form-control"/>
		<select class="form-control" name="search_keycode">
			<option value="null">검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>	
		<button type="submit" class="btn btn-primary form-control">검색</button>
	</form>
	</div>
</body>
</html>