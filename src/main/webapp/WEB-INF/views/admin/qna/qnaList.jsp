<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 목록</title>
<script type='text/javascript'>
	$(function(){
		$('table tr:gt(0)').click(function(){
			var rnum = $(this).find('td:eq(0)').text();
			var qa_num = $(this).find('td:eq(0) input').val();
			var qa_status = $(this).find('td:eq(1) input').val();
			var qa_pass = $(this).find('td:eq(3) input').val();
			var mem_id = $(this).find('td:eq(2) input').val();
			
			
			$(location).attr('href','${pageContext.request.contextPath}/qna/aqnaView.do?qa_num='+qa_num+'&rnum='+rnum);
		    
		});
		
		
		
	});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> <a class="breadcrumb-item">게시판 관리</a> <span
		class="breadcrumb-item active"> <a href="${pageContext.request.contextPath }/qna/aqnaList.do?currentPage=1">Q&A</a> </span> </nav>
		
    <h2 class="content-heading">질문과 답변 <small>Q&A</small></h2>
		
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
				<c:forEach items="${qnaList }" var="qna">
				<tr>
					<td><input type="hidden" name="qa_num" value="${qna.qa_num }"/>${qna.rnum }</td>
					<td align="left"><input type="hidden" value="${qna.qa_status }"/>
						<c:forEach begin="1" end="${qna.qa_depth }" varStatus="stat">
							&nbsp;&nbsp;&nbsp;
							<c:if test="${stat.last }">
								<i class="fa fa-angle-right "></i>
							</c:if>
						</c:forEach>
						<c:if test="${(qna.qa_pass != null && qna.qa_status eq 'y') || (qna.qa_pass != null && qna.qa_status eq 'r') || (qna.qa_pass != null && qna.qa_status eq 'd') }">
						${qna.qa_title } (비밀글)
						</c:if>
						<c:if test="${(qna.qa_pass eq null && qna.qa_status eq 'y') || (qna.qa_pass eq null && qna.qa_status eq 'r') || (qna.qa_pass eq null && qna.qa_status eq 'd')  }">
						${qna.qa_title }				
						</c:if>
						<c:if test=" ${qna.qa_status eq 'n'}">
						${qna.qa_title } (삭제)
						</c:if>
						
					</td>
					<td><input type="hidden" name="qa_pass" value="${qna.mem_id }"/>${qna.mem_id }</td>
					<td><input type="hidden" name="qa_pass" value="${qna.qa_pass }"/>${fn:substring(qna.qa_date, 0, 10) }</td>
					<td>${qna.qa_hit }</td>
				</tr>
				</c:forEach>				
			</tbody>
		</table>
		${paging }
	<form action="${pageContext.request.contextPath }/qna/aqnaList.do" method="post" class="form-inline pull-right">
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
	<div>
	</div>
</body>
</html>