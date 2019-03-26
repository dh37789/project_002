var socket = null;
var isClose = false;
(function() {
	// 태그 셀렉트
	var video = document.querySelector('video');

	var canvas = document.querySelector('canvas');
	var context = canvas.getContext('2d');
	var img = document.getElementById("ddd");

	socket = new WebSocket('wss://192.168.0.121/apcam');

	socket.onopen = function onOpen(event) {
		swal({
      	  	  title: "1:1화상미팅에 입장하였습니다.",
     	      icon: "success",
     	    });
	};

	socket.onclose = function onClose(event) {
		socket = null;
	};

	socket.onerror = function onClose(err) {
		alert("웹캠 서버 소켓 : " + err.data);
	};

	var constraints = {
		video : true,
		audio : true
	};
//	 브라우저 웹캠 디바이스 활성화 설정을 기초로 video 태그 대상 스트리밍 설정
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		video.srcObject = stream;
		video.play();
	});


	setInterval(main, 100);
	function main() {
		// video 태그 스트리밍을 canvas 태그 대상 드로잉
		drawCanvas();
		// video 태그 스트리밍의 canvas 태그 대상 드로잉 후 캡처 이미지 취득
		readCanvas();
	}
	function drawCanvas() {
		context.drawImage(video, 0, 0, canvas.width, canvas.height);
	}
	
	socket.onmessage = function(event){
		if (event.data instanceof Blob) {
			var uri = URL.createObjectURL(event.data);
			img.src = uri;
		}
	}
	

	// 코덱 확인
	// alert(canvas.toDataURL('image/jpeg', 1));

	function readCanvas() {
			var blobData = null;
			var canvasData = canvas.toDataURL('image/jpeg', 1);
			var decodeAString = atob(canvasData.split(',')[1]);
	
			var charArray = [];
			for (var i = 0; i < decodeAString.length; i++) {
				charArray.push(decodeAString.charCodeAt(i));
			}
	
			// 개발자 신텍스 에러 type => tpye
			blobData = new Blob([ new Uint8Array(charArray) ], {
				tpye : 'image/jpeg'
			});
			window.console.log("blobData 사이즈 : " + blobData.size);
			if (socket != null) {
				window.console.log("socket readyState : " + socket.readyState
						+ " | buffer : " + socket.bufferedAmount);
				socket.send(blobData);
			}
	}
})();
