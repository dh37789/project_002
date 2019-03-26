<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Papillon</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/handson/handsontable.full.css">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/handson/handsontable.full.js"></script>
<script type="text/javascript">
$(function(){
	if (eval('${empty tableInfo.data_data}')) {
	 var data = [];
	}else{
	var jsonData = '${tableInfo.data_data}';
	 var data = JSON.parse(jsonData);
	}
	var cols = [{ data: 'no', type: 'text', width: 250},
                { data: 'id', type: 'text', width: 250},
                { data: 'time', type: 'text', width: 350}];

        var table = document.getElementById('table');
        var hTable = new Handsontable(table, {
            data: data,
            columns: cols,
            rowHeaders: true,
            colHeaders: ['한글명','영문약어명','영문명'],
            colWidths: 120,
            rowHeights: 23,
            autoRowSize: false,
            autoColSize: true,
            dropdownMenu: true,
            contextMenu: true,
            mergeCells: true,
            allowInsertColumn: true
         });
        
        $("input").keydown(function(evt) { 
    		if (evt.keyCode == 13) return false; 
    	});
        
         $('#minus').click(function(){
             hTable.alter('remove_row');
         });
         $('#plus').click(function(){
        	 hTable.alter('insert_row');
         });
         $('#save').click(function(){
        	 var data_data = JSON.stringify(hTable.getSourceData());
        	 $.ajax({
       	         type:'POST',
       	         dataType:'JSON',
       	         data:{data_data : data_data,
       	        	   output_num : '${output_num}',
       	        	   mem_id : '${USER_LOGININFO.mem_id}',
       	        	   pr_num : '${pnum}',
       	        	   data_num : '${tableInfo.data_num}'},
       	         url:'${pageContext.request.contextPath}/handson/tableWrite.do',
       	         error:function(result){
       	            alert(result.message);
       	         },
       	         success:function(result){
       	            if(eval(result.result.flag)){
       	            	swal({
       	           	  	  title: "저장 되었습니다.",
       	          	      icon: "success",
       	          	    });
       	            }else{
       	            }
       	         }
       	      });
         });
         $('#exit').click(function(){
        	 swal({
           	  title: "나가시겠습니까?",
           	  text: "저장하지 않은 데이터는 날아갈 수 있습니다.",
           	  icon: "warning",
           	  buttons: true,
           	  dangerMode: true,
           	})
           	.then(function(exit){
           	  if (exit) {
           		  window.close();
           	  } else {
           	    return;
           	  }
           	});
         })
}); 
</script>
<body>
<div class="col-13 text-center" style="height: 50px; padding-top: 7px; padding-left: 10px; background-color: #bfbfbf;">
<div class="row">
<c:if test="${empty tableInfo }">
<h3 class="text-white" style="padding-left: 20px;">요구사항 정의서</h3>&nbsp;<small class="text-white">최종 수정 날짜 : --:--:--  최종 수정자 : ---</small>
</c:if>
<c:if test="${not empty tableInfo }">
<h3 class="text-white" style="padding-left: 20px;">요구사항 정의서</h3>&nbsp;<small class="text-white">최종 수정 날짜 : ${tableInfo.data_date }  최종 수정자 : ${tableInfo.mem_id }</small>
</c:if>
<div class="button-group" style="position: absolute; right: 0; padding-right: 20px;">
<input type="hidden">
<c:if test="${empty ADMIN_LOGININFO }">
<button id="plus" class="btn btn-light pull-right" onclick="return false;"><i class="fas fa-plus"></i>&nbsp;행 추가</button>
<button id="minus" class="btn btn-light pull-right" onclick="return false;"><i class="fas  fa-minus"></i>&nbsp;행 삭제</button>
<button id="save" class="btn btn-light pull-left"><i class="far fa-save"></i>&nbsp;저장하기</button>
</c:if>
<button id="exit" class="btn btn-light pull-right" onclick="return false;"><i class="fas fa-sign-out-alt"></i>&nbsp;나가기</button>
</div>
</div>
</div>
<div id="table" style="width: 100%;"></div>
</body>
</html>