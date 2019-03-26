<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
   #userId {
   	font-weight: bold;
   }
   
   #replyForm {
   	background-color: #EFF2FB;
   	padding: 15px;
   }
   
</style>
<script type="text/javascript">
$(function(){
   Codebase.helpers(['ckeditor']);
    check ='${board.mem_id}'!= '${USER_LOGININFO.mem_id}';
//     check1 ='${board.mem_id}'!= '${USER_LOGININFO.mem_id}';
   
    if(check){
       $('#update').hide();
    }
//   CKEDITOR.instances['js-ckeditor-inline'].config.readOnly = true;
   $('#bo_title').text('${board.bo_title}');
   $('#mem_id').text('${board.mem_id}');
   if(eval('${empty InfoFile.bofile_name}')){
      $('#ntcFile').val('파일없음');
   }else{
      $('#ntcFile').val('${InfoFile.bofile_name}');
   }
   $('#downloadFile').click(function(){
      $(location).attr('href','${pageContext.request.contextPath}/file/BoardFileDownload.do?bo_num=${board.bo_num}');   
   })
   $('#delete').click(function(){
      swal({
           title: "경고",
           text: "글을 삭제하시겠습니까?",
           icon: "warning",
           buttons: true,
         })
       .then(function(result){ 
               if (result) {
                  $(location).attr('href','${pageContext.request.contextPath}/board/aboardDelete.do?bo_num=${board.bo_num}');   
               }else{
                  return;
               }
            });
   })
   $('.del').on("click",function(){
      var a = $(this).parent().find('input[name=bore_num]').val();
      swal({
              title: "경고",
              text: "댓글을 삭제하시겠습니까?",
              icon: "warning",
              buttons: true,
            })
          .then(function(result){ 
            if (result) {
               $(location).attr('href','${pageContext.request.contextPath}/bore/aboreDelete.do?bore_num='+a+'&bo_num=${board.bo_num}');
            }else{
               return;
            }
         });
   })
   $('#List').click(function() {
      $(location).attr('href','${pageContext.request.contextPath}/board/aboardList.do');
   });
});
</script>
<body>

<nav id="nav"  class="breadcrumb bg-white push"> 
   <a class="breadcrumb-item">게시판 관리</a> 
   <span class="breadcrumb-item"> 
      <a href="${pageContext.request.contextPath }/board/aboardList.do">자유게시판</a> 
   </span>
   <span class="breadcrumb-item">  
      <a>상세보기</a> 
   </span>
</nav>

   <div class="col-md-12">
                         <form action="#" method="post" onsubmit="return false;">
                             <div class="block block-rounded block-themed">
                                 <div class="block-header bg-gd-primary">
                                     <h3 class="block-title">글 내용</h3>
                                     <div class="block-options">
                                     </div>
                                 </div>
                                 <div class="block-content block-content-full">
                                     <div class="form-group row">
                                         <label class="col-12" for="ecom-product-name">제목</label>
                                         <div class="col-12">
                                             <input type="text" class="form-control" id="bo_title" name="bo_title" value="${board.bo_title }">
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-12" for="ecom-product-name">작성자</label>
                                         <div class="col-12">
                                             <input type="text" class="form-control" id="mem_id" name="mem_id" value="${board.mem_id }">
                                         </div>
                                     </div>
            <div class="form-group row">
                <div class="col-12">
                    <!-- CKEditor Container -->
                    <textarea id="js-ckeditor" name="ckeditor" readOnly>${board.bo_content }</textarea>
                </div>
            </div>
                      
                      
            <div class="form-group row">
                 <label class="col-12" for="example-file-input">첨부파일</label>
                 <div class="col-sm-6">
                  	<div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-fw fa-archive"></i>
                        </span>
                     </div>
                 <input type="text" class="form-control" id="ntcFile" name="ntcFile" disabled="disabled">
              <c:if test="${not empty InfoFile.bofile_name}">
              <button id="downloadFile" class="btn btn-secondary mr-5 mb-5">다운로드</button>
              </c:if>
                  </div>
        	 	</div>
            </div>
           
       <br>
       <label>댓글</label>
       
       
       <div id="replyForm">
         <table id="table" class="col-md-12">
            <tbody>
            <c:forEach items="${boreList }" var="bore">
            <tr>
               <c:if test="${bore.bo_num eq board.bo_num && bore.bore_status eq 'y' || bore.bore_status == 'n' }">
               <c:set var="aa" value="0"></c:set>
               <c:set var="bb" value="0"></c:set>
               <c:if test="${bore.bore_status == 'n' }">
                  <c:forEach items="${boreList }" var="boreInfo">
                     <c:if test="${bore.bore_group == boreInfo.bore_group && boreInfo.bore_status == 'y' && aa <= 0 &&bore.bore_depth == 0}">
                        <c:set var="aa" value="${aa + 1}"></c:set>
                     <td style="width: 300px">   삭제된 댓글입니다.</td>
                     </c:if>
                  </c:forEach>
               </c:if>
               <c:if test="${bore.bore_status == 'n' && bore.bore_depth >= 1}">
                  <c:forEach items="${boreList }" var="boreInfo">
                     <c:if test="${bore.bore_group == boreInfo.bore_group && boreInfo.bore_status == 'y' && bb <= 0 &&boreInfo.bore_depth > 1}">
                        <c:set var="bb" value="${bb + 1}"></c:set>
                     <td style="width: 300px">   
                     <c:forEach begin="1" end="${bore.bore_depth }" varStatus="stat">
                        &nbsp;&nbsp;&nbsp;
                        <c:if test="${stat.last }">
                           <i class="fa fa-angle-right "></i>
                        </c:if>
                     </c:forEach> &nbsp
                          	삭제된 댓글입니다.</td>
                     </c:if>
                  </c:forEach>
               </c:if>
               <c:if test="${bore.bore_status == 'y'}">
               <td id="userId" style="width: 100px;"><input type="hidden" name="mem_id" value="${bore.mem_id }"/>
                  <c:forEach begin="1" end="${bore.bore_depth }" varStatus="stat">
                     &nbsp;&nbsp;&nbsp;
                     <c:if test="${stat.last }">
                        <i class="fa fa-angle-right "></i>
                     </c:if>
                  </c:forEach>
               &nbsp&nbsp ${bore.mem_id } &nbsp&nbsp ${bore.bore_date }
               </td>
               <input type="hidden" name="bore_num" value="${bore.bore_num }"/>
                <td class="del"style="width: 50px;">삭제</td>
               </tr>
               
               <td id="cont"class="con" style="width: 1000px;"><input type="hidden" name="bore_content" value="${bore.bore_content }"/>
                  <c:forEach begin="1" end="${bore.bore_depth }" varStatus="stat">
                     &nbsp;&nbsp;&nbsp;
                     <c:if test="${stat.last }">
                     </c:if>
                  </c:forEach>
                      &nbsp&nbsp&nbsp&nbsp ${bore.bore_content }
               <hr></td>
               
               
               <input type="hidden" value="${bore.bore_status }"/>
               <input type="hidden" name="bore_group" value="${bore.bore_group}"/>
               <input type="hidden" name="bore_seq" value="${bore.bore_seq}"/>
               <input type="hidden" name="bore_depth" value="${bore.bore_depth}"/>
               </c:if>
               </c:if>
            </tr>
            </c:forEach>
            </tbody>
         </table>
         </div>
                                        
			<br>                 
                     <button type="button" id="List" class="btn btn-sm btn-alt-primary">
                        	목록
                     </button>
                     <button type="button" id="delete" class="btn btn-sm btn-alt-warning">
                           	삭제
                     </button>
             </div>
         </div>
     </form>
 </div>

</body>
</html>