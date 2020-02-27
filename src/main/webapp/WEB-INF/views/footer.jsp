<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
#footer {
	border-bottom: solid black 1px;
	border-top: solid black 1px;
	width: 100%;
	height: 100px;
}
</style>
<script type="text/javascript">
	
	var socket = null;
	function connect(){
		console.log("연결 성공");
		//자체 지원,
		var ws = new WebSocket("ws://localhost:80/gabom/Echo");  // 
		socket = ws
		//커넥션이 연결됐을때 이부분을 탄다.
		
		ws.onopen = function() {
			console.log('Info: connection opened.');
		};

		
		ws.onmessage = function(event) {
			console.log("ReceiveMessage : " , event.data + '\n');
		};

		
		ws.onclose = function(event) {
			console.log('Info: connection closed.');
		//	setTimeout(function() {connect()}, 1000)  //1초에 한번씩 커넥션 연결, 도중에 끈킬경우
		};
		
		ws.onerror = function(event) {
			console.log('Info: connection closed.');
		};
	}
	
	connect();
	
	$(document).ready(function(){
		//이게 중요함,
		$('#btnSend').on('click', function(evt) {
			console.log("음??");
			console.log("socket : ",socket)
			evt.preventDefault();
			if (socket.readyState !== 1)
				return;
			let msg = $('#msg').val();
			console.log("msg : " +msg);
			socket.send(msg);
		});
		
	})

		
		
		
		

	
</script>
<body>

	<div>
		<input type="text" id="msg" />
		<button id="btnSend">전송1</button>
	</div>
	<div id="footer">여기는 footer 영역입니다.</div>



</body>

</html>