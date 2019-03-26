<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>산출물 툴</title>
    <link rel="icon" href="favicon.ico" type="${pageContext.request.contextPath }/js/image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/rappid.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/theme-picker.css">

    <!-- theme-specific application CSS  -->
<%--     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/style.dark.css"> --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/style.material.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/css/style.modern.css">
</head>
<body>
	<div class="col-13" style="height: 50px; padding-top: 7px; padding-left: 10px; background-color: #30d0c6;">
	<form class="form-inline" id="form" action="#" 
	method="post" >
	<span class="badge badge-light" style="font-size: 24px;">산출물 작성 Tool</span>&nbsp;
	<span class="badge badge-success" style="font-size: 24px;">제목</span>&nbsp;
	<input type="text" class="form-control" name="data_title" style="width: 69%;">&nbsp;
	<input type="hidden" class="form-control" name="data_data">
	<input type="hidden" class="form-control" name="data_num">
	<button id="exit" class="btn btn-light pull-right" onclick="return false;"><i class="fas fa-sign-out-alt"></i>&nbsp;나가기</button>
	</form>
	</div>
    <div id="app">
        <div class="app-header" style="height: 80px;">
              <div class="app-title">
              <c:if test="${empty ADMIN_LOGININFO }">
                 <button type="button" id="save" class="btn btn-dark" style="width: 100%; height: 100%;"><i class="far fa-save fa-2x"></i><br>저장 하기</button>
              </c:if>
              <c:if test="${not empty ADMIN_LOGININFO }">
                 <button type="button" id="save" class="btn btn-dark" style="width: 100%; height: 100%;" disabled="disabled"><i class="far fa-save fa-2x"></i><br>저장 하기</button>
              </c:if>
              </div>
              <div class="toolbar-container"></div>
        </div>
        <div class="app-body">
              <div class="stencil-container"></div>
              <div class="paper-container"></div>
              <div class="inspector-container"></div>
              <div class="navigator-container"></div>
        </div>
    </div>

    <!-- Rappid/JointJS dependencies: -->
    <script src="${pageContext.request.contextPath }/js/build/index.js"></script>
    <script src="${pageContext.request.contextPath }/js/build/backbone.js"></script>
    <script src="${pageContext.request.contextPath }/js/build/graphlib.core.js"></script>
    <script src="${pageContext.request.contextPath }/js/build/dagre.core.js"></script>

    <script src="${pageContext.request.contextPath }/js/build/rappid.js"></script>

    <!--[if IE 9]>
        <script>
          // `-ms-user-select: none` doesn't work in IE9
          document.onselectstart = function() { return false; };
        </script>
    <![endif]-->

    <!-- Application files:  -->
    <script src="${pageContext.request.contextPath }/js/config/halo.js"></script>
    <script src="${pageContext.request.contextPath }/js/config/selection.js"></script>
    <script src="${pageContext.request.contextPath }/js/config/inspector.js"></script>
    <script src="${pageContext.request.contextPath }/js/config/stencil.js"></script>
    <script src="${pageContext.request.contextPath }/js/config/toolbar.js"></script>
    <script src="${pageContext.request.contextPath }/js/views/main.js"></script>
    <script src="${pageContext.request.contextPath }/js/views/theme-picker.js"></script>
    <script src="${pageContext.request.contextPath }/js/models/joint.shapes.app.js"></script>
    <script src="${pageContext.request.contextPath }/js/views/navigator.js"></script>

    <script>
    $(function(){
    	$('input[name=data_num]').val('${diagramInfo.data_num}');
    	$('input[name=data_title]').val('${diagramInfo.data_title}');
    	$('#save').click(function(){
    		var data_data =  JSON.stringify(app.graph.toJSON());
    		var data_title = $('input[name=data_title]').val();
    		var data_num = $('input[name=data_num]').val();
	    	if (data_title == "") {
	    		swal({
	           	  	  title: "제목을 입력해 주세요.",
	          	      icon: "warning",
	          	    });
	    		return;
			}
    		$.ajax({
   	         type:'POST',
   	         dataType:'JSON',
   	         data:{data_data : data_data,
   	        	   output_num : '${output_num}',
   	        	   mem_id : '${USER_LOGININFO.mem_id}',
   	        	   data_title : data_title,
   	        	   pr_num : '${pnum}',
   	        	   data_num : data_num},
   	         url:'${pageContext.request.contextPath}/diagram/diagramWrite.do',
   	         error:function(result){
   	            swal("", result.message, "info");
   	         },
   	         success:function(result){
   	        	$('input[name=data_num]').val(result.data_num);
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
          		  opener.location.reload();
          		  window.close();
          	  } else {
          	    return;
          	  }
          	});
        })
    });
        joint.setTheme('modern');
        app = new App.MainView({ el: '#app' });
        themePicker = new App.ThemePicker({ mainView: app });
        themePicker.render().$el.appendTo(document.body);
        window.addEventListener('load', function() {
	    	var data = '${diagramInfo.data_data}';
	    	if (data != null && data != '') {
		    	app.graph.fromJSON(JSON.parse(data));
			}
        });
   	</script>

    <!-- Local file warning: -->
    <div id="message-fs" style="display: none;">
      <p>The application was open locally using the file protocol. It is recommended to access it trough a <b>Web server</b>.</p>
      <p>Please see <a href="README.md">instructions</a>.</p>
    </div>
    <script>
        (function() {
            var fs = (document.location.protocol === 'file:');
            var ff = (navigator.userAgent.toLowerCase().indexOf('firefox') !== -1);
            if (fs && !ff) {
               (new joint.ui.Dialog({
                   width: 300,
                   type: 'alert',
                   title: 'Local File',
                   content: $('#message-fs').show()
                })).open();
            }
        })();
    </script>

</body>
</html>
