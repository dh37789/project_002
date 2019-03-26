<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$('#diagramAdd').click(function(){
		var url = '${pageContext.request.contextPath }/diagram/tool.do';
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=1280, height=720';
 		window.open(url, '산출물 작성 툴', options);		
	});
	$('tr:gt(0)').click(function(){
		var data_num = $(this).find('td:eq(0) input').val();
		if (data_num == "") {
			return;
		}
		var url = '${pageContext.request.contextPath }/diagram/diagramView.do?data_num=' + data_num;
 		var options = 'toolbar=no, location=no, directories=no, status=no,' + 
 					  'menubar=no, scrollbars=no, resizable=no, copyhistory=no,' + 
 					  'width=1280, height=720';
 		window.open(url, '산출물 작성 툴', options);	
	})
	$('.delete').click(function(){
		var data_num = $(this).val();
		$(location).attr('href', '${pageContext.request.contextPath }/diagram/diagramDelete.do?data_num=' + data_num);
	});
	$('#back').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/frmyprojecting/frmyprojecting.do');
	});
});
</script>
</head>
<body>
<nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="#">Forum</a>
    <span class="breadcrumb-item active">Categories</span>
</nav>
<h2 class="content-heading">Diagram Tool</h2>
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
    <div class="block-content">
        <table class="table table-hover table-vcenter">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">No.</th>
                    <th>제목</th>
                    <th class="text-center" style="width: 100px;">최종 수정자</th>
                    <th class="text-center" style="width: 160px;">변경 날짜</th>
                    <th class="text-center" style="width: 60px;">삭제</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${fn:length(diagramList) eq 0 }">
              <tr>
                  <td class="text-center" scope="row" colspan="5">게시물이 없습니다.
                  <input type="hidden" value="${diagramInfo.data_num }">
                  </td>
              </tr>
            </c:if>
            <c:if test="${fn:length(diagramList) ne 0 }">
            <c:forEach items="${diagramList }" var="diagramInfo">
                <tr>
                    <td class="text-center" scope="row">${diagramInfo.rnum }
                    <input type="hidden" value="${diagramInfo.data_num }">
                    </td>
                    <td>${diagramInfo.data_title }</td>
                    <td class="text-center">${diagramInfo.mem_id }</td>
                    <td class="text-center">
                    ${diagramInfo.data_date }
                    </td>
                    <td class="text-center" onclick="event.cancelBubble = true;">
                    <c:if test="${empty ADMIN_LOGININFO }">
                    <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                    	style="margin-bottom: 3px;" value="${diagramInfo.data_num }">
                        <i class="fa fa-times"></i>
                    </button>
                    </c:if>
                    <c:if test="${not empty ADMIN_LOGININFO }">
                    <button type="button" class="btn btn-sm btn-secondary delete" data-toggle="tooltip" title="Delete"
                    	style="margin-bottom: 3px;" value="${diagramInfo.data_num }" disabled="disabled">
                        <i class="fa fa-times"></i>
                    </button>
					</c:if>
					</td>
                </tr>
            </c:forEach>
            </c:if>
            </tbody>
        </table>
        ${htmlCode }
        <div class="row text-center">
             <div class="col-sm-3">
             </div>
             <div class="col-sm-3">
             </div>
             <div class="col-sm-6">
             <form class="form-inline pull-right" action="${pageContext.request.contextPath }/diagram/diagramList.do" method="post">
               <select class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-select" name="search_code">
                   <option value="title">제목</option>
               </select>
               <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="example-if-password" name="search_data">
               <button type="submit" class="btn btn-sm btn-secondary">검색</button>&nbsp;
               <input type="hidden" name="currentPage" value="1">
               <c:if test="${empty ADMIN_LOGININFO }">
         	   <button type="button" id="diagramAdd" class="btn btn-sm btn-secondary pull-right">작성하기</button>&nbsp;
               </c:if>
         	   <button type="button" id="back" class="btn btn-sm btn-secondary pull-right">뒤로가기</button>
             </form>
             </div>
         </div>
         <p></p>
    </div>
</div>
</body>
</html>