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
			var mem_id = $(this).find('td:eq(2) input').val();
			var qa_pass = $(this).find('td:eq(3) input').val();
			
			if(qa_pass != ""){
				var check = qa_pass != '${USER_LOGININFO.mem_id}'; 
// 				var check1 = mem_id != '${USER_LOGININFO.mem_id}'; 
		 		if(!check){
		 			$(location).attr('href','${pageContext.request.contextPath}/qna/qnaView.do?qa_num='+qa_num+'&rnum='+rnum);
		 		}
		 		else{
		 			swal("경고","다른 사람의 비밀글 입니다.", "error");
		    		return false;
		 		}
		    }else{
				$(location).attr('href','${pageContext.request.contextPath}/qna/qnaView.do?qa_num='+qa_num+'&rnum='+rnum);
		    }
		});
		
		$('#new').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath}/qna/qnaForm.do');
		});
		
	});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push"> 
	<a class="breadcrumb-item">게시판</a> 
	<span class="breadcrumb-item active"> 
		<a href="${pageContext.request.contextPath }/qna/qnaList.do?currentPage=1">Q&A</a> 
	</span> 
</nav>
		
    <h2 class="content-heading">질문과 답변 <small>Q&A</small></h2>
	
	<div id="qnaticeList_content">
		<table class="table table-hover table-vcenter" style="background-color: white;">
			<thead class="thead-light">
				<tr>
					<th style="width: 50px;">No</th>
					<th>제목</th>
					<th style="width: 70px;">이름</th>
					<th style="width: 15%;">날짜</th>
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
						<c:forEach items="${qnaList }" var="qna2">
							<c:if test="${qna.qa_group eq qna2.qa_num }">
								${qna2.mem_id }님의 비밀글 입니다.
							</c:if>
						</c:forEach>
						</c:if>
						<c:if test="${(qna.qa_pass eq null && qna.qa_status eq 'y') || (qna.qa_pass eq null && qna.qa_status eq 'r') || (qna.qa_pass eq null && qna.qa_status eq 'd')  }">
						${qna.qa_title }				
						</c:if>
					</td>
					<td><input type="hidden" name="mem_id" value="${qna.mem_id }"/>${qna.mem_id }</td>
					<td><input type="hidden" name="qa_pass" value="${qna.qa_pass }"/>${fn:substring(qna.qa_date, 0, 10) }</td>
					<td>${qna.qa_hit }</td>
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
	<form action="${pageContext.request.contextPath }/qna/qnaList.do" method="post" class="form-inline pull-right">
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

<%-- 		<c:if test="${not empty sessionScope.CLIENT_LOGININFO }"> --%>
<!-- 		<button type="button" id="new" class="btn btn-sm btn-secondary pull-right">글 작성하기</button> -->
<%-- 		</c:if> --%>
	</form>
	</div>
</body>
</html>