<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<title></title>
<script src="/js/jquery.countTo.min.js"></script>
<style type="text/css">
/* .content{ */
/*   overflow: hidden;  */
/*   text-overflow: ellipsis; */
/*   white-space: nowrap;  */
/*   width: 500px; */
/*   height: 100px; */
/* } */
/* .content{ */
/*   display: -webkit-box;  */
/*   display: -ms-flexbox;  */
/*   display: box;  */
/*   margin-top:1px;  */
/*   max-height:50px;  */
/*   overflow:hidden;  */
/*   vertical-align:top;  */
/*   text-overflow: ellipsis;  */
/*   word-break:break-all;  */
/*   -webkit-box-orient:vertical;  */
/*   -webkit-line-clamp:3 */
/* } */
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
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical; 
  width:300px;
}

.crawlingDiv{
	height:60px;
	overflow:hidden;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
</head>

<script type="text/javascript">
var imgArray = new Array();
imgArray[0] = "${pageContext.request.contextPath}/image/main1.PNG" 
imgArray[1] = "${pageContext.request.contextPath}/image/main2.PNG"
imgArray[2] = "${pageContext.request.contextPath}/image/main3.PNG"
imgArray[3] = "${pageContext.request.contextPath}/image/main4.PNG"

function showImage(){
	var imgNum = Math.round(Math.random()*(imgArray.length-1));
	$('#introImg').attr('src',imgArray[imgNum]);
}

function DivClick(val){
	event.stopPropagation();
	$(location).attr('href','${pageContext.request.contextPath}/project/projectView.do?pr_num='+val);
};

$(function(){
	$('.money').countTo({
		  from: 0,
		  to: ${countPay},
		  speed: 1500,
		  formatter: function (value, options) {
		    value = value.toFixed(options.decimals);
		    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		    value = value + " 원";
		    return value;
		  }
	});
	$('.member').countTo({
		  from: 0,
		  to: ${countMember},
		  speed: 1500,
		  formatter: function (value, options) {
		    value = value.toFixed(options.decimals);
		    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		    value = value + " 명";
		    return value;
		  }
	});
	$('.project').countTo({
		  from: 0,
		  to: ${totalCount },
		  speed: 1500,
		  formatter: function (value, options) {
		    value = value.toFixed(options.decimals);
		    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		    value = value + " 개";
		    return value;
		  }
	});
// 	$('tr:gt(0)').click(function(){
// 		var pr_num = $(this).find('#prnum').val();
// 		if(pr_num==null){
// 			return;
// 		}
// 		$(location).attr('href','${pageContext.request.contextPath}/frmyendproject/frEndProjectView.do?pr_num='+pr_num);
// 	})

	
	var crawling = function()
    {
        setTimeout(function(){
            $('#crawling li:first').animate( {marginTop: '-20px'}, 400, function(){
            
                $(this).detach().appendTo('ul#crawling').removeAttr('style');
                $('ul#crawling ul>li.first').hide();
                
            });
            crawling();
        }, 3000);
    };
    crawling();    
	
	
	
})
</script>
<body onload="showImage()">
<img id="introImg" border="0">
<div class="row gutters-tiny js-appear-enabled animated fadeIn 
		justify-content-center in row" 
		data-toggle="appear" style="margin-left: 30px; margin-right: 30px; margin-top: 30px; 
		padding-top: 20px; padding-bottom: 20px; background-color: white; border: 0.5px solid #EAEAEA" align="center">
    <!-- Row #1 -->
   	
   
   
   
   
    <div class="col-8 col-xl-3" style="border-right: 1px solid #EAEAEA; padding-right: 100px;">
    
    
    
        <div class="block-content block-content-full clearfix">
            <div class="float-left mt-10 d-none d-sm-block">
                <i class="si si-docs fa-3x text-gray"></i>
            </div>
            <div class="font-size-h3 font-w600"><span class="project"></span></div>
            
            <div class="font-size-sm font-w600 text-uppercase text-muted">등록된 프로젝트</div>
        </div>
    </div>
    
    <div class="col-8 col-xl-3" style="margin-right: 80px; margin-left: 80px;">
        <div class="block-content block-content-full clearfix">
            <div class="float-left mt-10 d-none d-sm-block">
                <i class="fa fa-money fa-3x text-gray"></i>
            </div>
            <div class="font-size-h3 font-w600"><span class="money"></span></div>
            <div class="font-size-sm font-w600 text-uppercase text-muted">프로젝트 등록금액</div>
        </div>
    </div>
    
    <div class="col-8 col-xl-3" style="border-left: 1px solid #EAEAEA; padding-left: 80px;">
        <div class="block-content block-content-full clearfix">
            <div class="float-left mt-10 d-none d-sm-block">
                <i class="si si-users fa-3x text-gray"></i>
            </div>
            <div class="font-size-h3 font-w600"><span class="member"></span></div>
            <div class="font-size-sm font-w600 text-uppercase text-muted">클라이언트 & 프리랜서</div>
        </div>
    </div>
    <!-- END Row #1 -->
</div>
<br>



<br>

<div align="center" style="margin-left: 80px; margin-right: 80px; padding-top: 15px;">
	<br>
	<div class="font-size-h5 font-w600">
	<img src="${pageContext.request.contextPath}/image/pen1.png" width="30px" ></img>
	&nbsp;등록된 프로젝트</div>
</div>
<input type="hidden" name="image">
<br>


<div class="row row-deck" style="margin-left: 80px; margin-right: 80px; padding-top: 10px;">

<c:forEach items="${projectList }" var="projectList">
    <div class="col-md-6 col-xl-3" onclick="DivClick(${projectList.pr_num});">
        <a class="block block-link-pop block-rounded block-bordered text-center">
            <div class="block-content">
                <div class="title font-size-h5 font-w700" style="color: #479BC8;">${projectList.pr_title }</div>
                <input type="hidden" name="pr_num" value="${projectList.pr_num}">
                <small><i class="fa fa-krw fa-1x" ></i> 예상금액  ${projectList.pr_payment }원 |  
                <i class="fa fa-clock-o fa-1x"></i> 예상기간 ${projectList.pr_ex_period }일 <br> 
                <em>등록일자 ${projectList.pr_date }</em></small>
                <p class="content">${projectList.pr_content }</p>
            	<p class="tech" style="overflow: hidden; padding-left: 20px; padding-right: 20px;" align="center">
            	<c:forEach items="${projectList.techList}" var="tech"><span
						class="badge badge-secondary font-size-sm">
						${tech.lan_name} </span>&nbsp;</c:forEach>
            	</p>
            </div>
        </a>
    </div>
 </c:forEach>   
<br>  
</div>


<div class="row gutters-tiny js-appear-enabled animated fadeIn 
		justify-content-center" 
		data-toggle="appear" style="margin-left: 97px; margin-right: 97px; margin-top: 30px; 
		padding-top: 20px; padding-bottom: 20px; background-color: white; border: 0.5px solid #EAEAEA; width: " align="left">
		<div align="center" class="font-size-h5 font-w600" style="padding-right: 100px;">
			&nbsp;<img src="${pageContext.request.contextPath}/image/news.png" width="35px" ></img>
			<br>
			관련 News
		</div>
		<div class="crawlingDiv">
		
		<ul id="crawling">
		<c:forEach items="${crawList }" var="crawInfo">
	       <li>${crawInfo.crawlingTotal}</li>
	    </c:forEach>
	   </ul>


		</div>
		
</div>


<br><br>
<div align="center" class="font-size-h5 font-w600"">
	<img src="${pageContext.request.contextPath}/image/process.png" width="35px" ></img>
	&nbsp;Papillon 프로세스
</div>
<div class="row justify-content-center in row" style="margin-left:20px; margin-right:20px; 
	padding-bottom: 20px; padding-top: 30px;">
     <div class="col-md-6 col-xl-2">
         <a class="block block-rounded block-link-pop text-center">
             <div class="block-content block-content-full" style="background-color: #B9D9EB;">
                 <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/pr1.png">
             </div>
             <div class="block-content block-content-full">
             <h5 style="color: #0C7AB6">STEP 1</h5>
                 <div class="font-w600 mb-5" style="padding-bottom: 10px;">프로젝트 등록</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">간단한 회원가입</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">프로젝트 등록</div>
                 <div class="font-size-sm text-muted">&nbsp;</div>
             </div>
         </a>
     </div>
     <img src="${pageContext.request.contextPath}/image/arrow3.png" height="25px" style="margin-top: 120px"></img>
     <div class="col-md-6 col-xl-2">
         <a class="block block-rounded block-link-pop text-center">
             <div class="block-content block-content-full" style="background-color: #9CC4DB;">
                 <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/pr2.png">
             </div>
             <div class="block-content block-content-full">
                 <h5 style="color: #0C7AB6">STEP 2</h5>
                 <div class="font-w600 mb-5" style="padding-bottom: 10px;">프로젝트 지원</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">지원자 미팅</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">지원자 선택</div>
                 <div class="font-size-sm text-muted">&nbsp;</div>
             </div>
         </a>
     </div>
     <img src="${pageContext.request.contextPath}/image/arrow3.png" height="25px" style="margin-top: 120px"></img>
     <div class="col-md-6 col-xl-2">
         <a class="block block-rounded block-link-pop text-center">
             <div class="block-content block-content-full" style="background-color: #79AFCC;">
                 <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/pr3.png">
             </div>
             <div class="block-content block-content-full">
             <h5 style="color: #0C7AB6">STEP 3</h5>
                 <div class="font-w600 mb-5" style="padding-bottom: 10px;">프로젝트 계약</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">기간 및 금액 결정</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">계약서 작성</div>
                 <div class="font-size-sm text-muted">대금 확인</div>
             </div>
         </a>
     </div>
     <img src="${pageContext.request.contextPath}/image/arrow3.png" height="25px" style="margin-top: 120px"></img>
     <div class="col-md-6 col-xl-2">
         <a class="block block-rounded block-link-pop text-center">
             <div class="block-content block-content-full" style="background-color: #4F90B4;">
                 <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/pr4.png">
             </div>
             <div class="block-content block-content-full">
             <h5 style="color: #0C7AB6">STEP 4</h5>
                 <div class="font-w600 mb-5" style="padding-bottom: 10px;">프로젝트 진행/관리</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">프로젝트 진행</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">프로젝트 관리 시스템</div>
                 <div class="font-size-sm text-muted">&nbsp;</div>
             </div>
         </a>
     </div>
     <img src="${pageContext.request.contextPath}/image/arrow3.png" height="25px" style="margin-top: 120px"></img>
     <div class="col-md-6 col-xl-2">
         <a class="block block-rounded block-link-pop text-center">
             <div class="block-content block-content-full" style="background-color: #38789B;">
                 <img class="img-avatar img-avatar-thumb" src="${pageContext.request.contextPath}/image/pr5.png">
             </div>
             <div class="block-content block-content-full">
             <h5 style="color: #0C7AB6">STEP 5</h5>
                 <div class="font-w600 mb-5">프로젝트 완료</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">프리랜서 평가</div>
                 <div class="font-size-sm text-muted" style="padding-bottom: 3px;">클라이언트 평가</div>
                 <div class="font-size-sm text-muted">프로젝트 완료</div>
             </div>
         </a>
     </div>
</div>



<br>
<br>









</body>
</html>
