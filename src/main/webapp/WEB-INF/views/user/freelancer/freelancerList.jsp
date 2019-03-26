<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
   $('tr').click(function(){
      var mem_id = $(this).find('td:eq(1) p:eq(0)').text();
      $(location).attr('href','${pageContext.request.contextPath}/freelancer/freelancerView.do?mem_id='+mem_id)
   })
});

function IconClick(val,flag){
   event.stopPropagation();
   var freelancer =val;
   
   if(eval(flag)){
      var v1=freelancer;
      var v2=val;
      
         $.ajax({
            type:'POST',
            dataType:'JSON',
            data:{free:val},
            url:'${pageContext.request.contextPath}/interest/insertfree.do',
            success:function(result){
               if(eval(result.flag)){
                  $('i[id='+val+']').attr('class','fa fa-heart text-pulse fa-2x');
                  $('i[id='+val+']').attr('onclick','IconClick("'+val+'","false");');
                  $('i[id='+val+']').find("input[name=infr_num]").val(result.infr_num);
               }else{
                  swal("", 'insert 아오', "error");
               }
               
            },
            error:function(result){
               swal("", result.status+"|"+result.responseText, "info");
            }
            
               });
      
   }else{
      var v1=freelancer;
      var v2=val;
      
      $.ajax({
         type:'POST',
         dataType:'JSON',
         data:{free:val},
         url:'${pageContext.request.contextPath}/interest/deletefree.do',
         success:function(result){
            if(eval(result.flag)){
               $('i[id='+val+']').attr('class','si si-heart fa-2x');
               $('i[id='+val+']').attr('onclick','IconClick("'+val+'","true");');
               
            }else{
               swal("", 'delete 아오', "info");
            }
            
         },
         error:function(result){
            swal("", result.status+"|"+result.responseText, "info");
         }
         
      });
   }
   
};
</script>
<body>
   <nav class="breadcrumb bg-white push"> <a class="breadcrumb-item"
      href="#">프리랜서</a> <span
      class="breadcrumb-item active">리스트</span> </nav>
      <div class="row">
         <div class="col-md-9">
            <h2 class="content-heading">프리랜서 목록<small> ${totalCount}명의 프리랜서와 함께하고 있습니다.</small></h2>  
         </div>
         <div class="col-md-3 row justify-content-center float-right">
         
      <form class="form-inline" action="/freelancer/freelancerList.do" method="post">
            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search_keyword" name="search_keyword">
            <button type="submit" class="btn btn-sm btn-secondary"><i class="fa fa-search"></i> Search</button>
        </form>  
        
         </div>
      </div>
<div class="col-md-12 row">
<div class="col-md-1">
</div>
<div class="col-md-10">
<c:forEach items="${freeList }" var="free">
 <table class="table bg-white " height="250px" style="border: 1px dotted #d2e7f5" >
   <tbody>
   <tr>  
   <td class="d-none d-sm-table-cell text-center " style="width: 140px;" >
   <div class="font-size-sm font-w600 text-uppercase text-muted  float-left">${free.rnum }</div>
      <div class="mb-10">
         <a> 
         <c:choose>
               <c:when test="${free.mem_picture==null }">
                  <img class="img-avatar img-avatar96" src="${pageContext.request.contextPath}/image/nopic.png" width="100px"
                  alt="" style="border: 1px solid #e1e1e1">
               </c:when>  
               <c:otherwise>  
                  <img class="img-avatar img-avatar96" src="/files/${free.mem_picture}" width="100px"
                  alt="" style="border: 1px solid #e1e1e1">
               </c:otherwise>
            </c:choose>
         </a>
      </div> 
      <small>
         <c:choose>  
            <c:when test="${free.ftype_num=='0' }">
               <img src="${pageContext.request.contextPath}/image/ftype_1.png" width="20px">
               개발자
            </c:when>
            <c:otherwise>
               <img src="${pageContext.request.contextPath}/image/ftype_2.png" width="20px">
               디자이너
            </c:otherwise>
         </c:choose>
      </small>
       <br>
      <small>
         <c:choose>
            <c:when test="${free.mtype_num=='0' }">
               <img src="${pageContext.request.contextPath}/image/mmtype_0.png" width="25px">
               개인
            </c:when>
            <c:when test="${free.mtype_num=='1' }">
               <img src="${pageContext.request.contextPath}/image/mmtype_1.png" width="25px">
               팀
            </c:when>
            <c:when test="${free.mtype_num=='2' }">
               <img src="${pageContext.request.contextPath}/image/mtype_2.png" width="15px">
               개인사업자
            </c:when>
            <c:otherwise>
               <img src="${pageContext.request.contextPath}/image/mtype_3.png" width="15px">
               법인사업자
            </c:otherwise>
         </c:choose>
      </small>
   </td>
   <td>
      <div class="row">
      <div class="col-md-10" style="height: 30px;">
      <p class="font-size-xl">${free.mem_id }</p>
      </div>
      <div class=" col-md-1 justify-content-right float-right " style="padding-left: 75px; padding-top: 10px;">
                  <div class="col-md-1 iconDiv">
                     <c:if test="${not empty sessionScope.USER_LOGININFO }">
                     <c:if test="${sessionScope.USER_LOGININFO.iden_num eq 1 }">
                        <i id="${free.mem_id }"  class="si si-heart fa-2x" onclick="IconClick('${free.mem_id }','true');">
                        <input type="hidden" name="infr_num">
                        </i>
                     </c:if>
                     </c:if>
                     <c:forEach items="${interestList}" var="interestt">
                        <script type="text/javascript" >
                           $(document).ready(function(){
                              $('input[name=infr_num]').val('${interestt.infr_num}');
                           });
                        </script>
                        <c:if test="${interestt.infr_free == free.mem_id}">
                           <script type="text/javascript"> 
                              $(document).ready(function() {
                                 $('i[id=${free.mem_id}]').attr('class','fa fa-heart text-pulse fa-2x');
                                 $('i[id=${free.mem_id}]').attr('onclick','IconClick("${free.mem_id}","false");');
                                 
                              }); 
                           </script>
                        </c:if>
                     </c:forEach>  
                  </div>
               </div>
   </div>
      <hr>
      <p class="font-size-sm text-muted" style="width: 90%; height: 100px;">${free.mem_selfinfo }</p>
      <hr>
      <div class="col-md-10" style="height: 20px;">
      <p class="font-size-xs text-muted" style="height: 20px;">대표기술&nbsp;:
      <c:if test="${empty free.techList}">
	      &nbsp;
	      <span class="badge badge-danger font-size-sm">
	      대표 기술 없음
		  </span>
		  &nbsp;
      </c:if>
      <c:if test="${not empty free.techList}">
      <c:forEach items="${free.techList}" var="tech">&nbsp;
	      <span class="badge badge-primary font-size-sm">
	       ${tech.lan_name} 
		  </span>
	  </c:forEach> 
      </c:if>
      </p>
	  </div>
   </td>
   </tr>
 </tbody>
 </table>
</c:forEach>
</div>
<div class="col-md-1">
</div>
</div>
 
${paging}

</body>
</html>