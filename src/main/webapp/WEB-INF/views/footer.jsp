<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
#footer {
	border-bottom: solid black 1px;
	border-top: solid black 1px;
	width: 100%;
	height: 100px;
}

.toast{
	position: fixed;
    top: 0;
    left: 0;
    width: 300px;
    border: 3px solid #73AD21;
}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
			
		
		//이게 중요함,
		console.log("소켓알람 준비")
		
		
		connectalarm();
		
		
		function connectalarm(){
			console.log("연결 성공");
			
			//자체 지원,
			var wsalarm = new WebSocket("ws://localhost:80/gabom/Echo");  // 
			socketalarm = wsalarm
			//커넥션이 연결됐을때 이부분을 탄다.
			console.log("socketalarm : ", socketalarm)
			wsalarm.onopen = function() {
				console.log('Info: connection footer opened.');
			};

			
			wsalarm.onmessage = function(event) {   // 메세지 받을때
				
				//console.log("footer-ReceiveMessage : " , event.data + '\n');
				//alert("footer-ReceiveMessage : " + event.data );
				let JsonRespon = JSON.parse(event.data);
				
				alarmEvent(JsonRespon);
				
			};

			
			wsalarm.onclose = function(event) {
				console.log('Info: connection footer closed.');
			//	setTimeout(function() {connect()}, 1000)  //1초에 한번씩 커넥션 연결, 도중에 끈킬경우
			};
			
			wsalarm.onerror = function(event) {
				console.log('Info: connection footer closed.');
			};
		}
		
		$('#btnSend').on('click', function(evt) {
			console.log("음??");
			//console.log("socket : ",socket)
			evt.preventDefault();
			if (socketalarm.readyState !== 1)
				return;
			let msg = $('#msg').val();
			console.log("msg : " +msg);
			socketalarm.send();
		});
		
	})

		
	const alarmEvent =(JsonRespon)=>{
		console.log("alarmEvent 실행");
		console.log(JsonRespon);
		//gabom/somoim/somoimroom?roomnumber=24  절대 경로로 해야함
		var alarmNum = JsonRespon.somoimNumber; 	
		console.log("페이지 : " + alarmNum)
		var toastCont = $("<a href='/gabom/somoim/somoimroom?roomnumber="+alarmNum+"'>가입하신 소모임에 새로운 정모가 등록 되었습니다</a>")
		$(".toast-body").append(toastCont);
		if(JsonRespon.type=='jungmo'){
			console.log("정모 만들어질때 이벤트")
			 $('.toast').toast('show');
			  setTimeout(function() { 
			   $('.toast').toast('hide');
			  }, 5000);
		}
	}	
		
		

	
</script>
<body>

	<div>
		<input type="text" id="msg" />
		<button id="btnSend">전송1</button>
	</div>
	<div id="footer">여기는 footer 영역입니다.</div>
	
	<div class="toast" data-autohide="false">
    <div class="toast-header">
      <strong class="mr-auto text-primary">알람이 왔습니다!!</strong>
      <small class="text-muted">5초 후 꺼짐</small>
      <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
    <div class="toast-body">
      
    </div>
  	</div>


</body>

</html>