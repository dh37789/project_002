<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 목록</title>
<script type='text/javascript'>
	$(function(){
		$('table tr:gt(0)').click(function(){
			var rnum = $(this).find('td:eq(0)').text();
			var bo_num = $(this).find('td:eq(0) input').val();
			var bo_status = $(this).find('td:eq(1) input').val();
			var mem_id = $(this).find('td:eq(2) input').val();
			
			$(location).attr('href','${pageContext.request.contextPath}/board/boardView.do?bo_num='+bo_num+'&rnum='+rnum);
		});
		
		$('#new').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath}/board/boardForm.do');
		});
		
	});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/board/boardList.do?currentPage=1">자유게시판</a> 
	</span> 
</nav>
		
    <h2 class="content-heading">자유게시판 <small>Freeboard</small></h2>
	
	<div id="boardList_content">
		<table class="table table-hover table-vcenter" style="background-color: white;">
			<thead class="thead-light">
				<tr>
					<th style="width: 50px;">No</th>
					<th>제목</th>
					<th style="width: 100px;">이름</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 100px;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board">
				<tr>
					<td><input type="hidden" name="bo_num" value="${board.bo_num }"/>${board.rnum }</td>
					<td align="left"><input type="hidden" value="${board.bo_status }"/>
						<c:if test="${board.bo_status eq 'y'}">
						${board.bo_title }				
						</c:if>
						
					</td>
					<td><input type="hidden" name="mem_id" value="${board.mem_id }"/>${board.mem_id }</td>
					<td>${fn:substring(board.bo_date, 0, 10) }</td>
					<td>${board.bo_hit }</td>
				</tr>
				</c:forEach>				
			</tbody>
		</table>
		<c:if test="${not empty sessionScope.USER_LOGININFO }">
			<button type="button" id="new" class="btn btn-primary">글 작성</button>
		</c:if>
		${paging }
	</div>
	<div>
	<form action="${pageContext.request.contextPath }/board/boardList.do" method="post" class="form-inline pull-right">
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