<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
	<style>
		#loginImage{
			text-align: center;
		}
		#loginBox {
			text-shadow: black 0.2em 0.2em 0.2em;
			background-image: url(resources/loginimage/beach.jpg);
			background-size: cover;
			font-size: 15px;
			font-weight: bold;
			color: white;
			height: 600px;
			display: none;
			font-family: 'Jua' ;
		}
		#loginLogoImage{
			border-radius: 30px;
			width: 450px;
		}
		#member_id,#member_password{
			border-radius: 10px;
			height: 40px;
		}
		#loginButton{
			height: 40px;
			font-weight: bold;
			font-size: 20px;
			border-radius: 10px;
			text-shadow: black 0.1em 0.1em 0.1em;
		}
		#signUpButton{
			height: 40px;
			font-weight: bold;
			font-size: 17px;
			border-radius: 10px;
			color: #58ACFA;
			border: 1.5px solid #58ACFA;
			margin-top: 10px;
			background-color: white;
		}
		#apiLoginContainer{
			text-align: center;
			border: 1px solid red;
			text-shadow: black 0em 0em 0em;
		}
		#findContainer{
			text-align: center;
		}
		#findId,#findPassword{
			width: 100%;
			text-shadow: black 0.1em 0.1em 0.1em;
			height: 30px;
			font-size: 11px;
			border-radius: 10px;
			font-weight: bold;
			text-align: center;
			margin-top: 7px;
		}
		#member_id,#member_password{
		color: #585858;
		}
		.jumbotron{
		color: #585858;
		width: 430px;
		height: 500px;
		margin: 0 auto;
		margin-top: 40px;
		}
		#idText,#passwordText{
			text-shadow: black 0em 0em 0em;
			color: #585858;
		}
	</style>
	<script type="text/javascript">
	
	$(function () {
		$('#loginBox').fadeIn("slow");
		$("#member_password").focusin(function(){
			$(window).keydown(function(key) {
				console.log(key);
		        if (key.keyCode == 13) {
		        	loginFrm.submit();
		        }
		        });
		});
	});
	
	</script>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>

<div class="container-fluid" id="loginBox">
	<div class="jumbotron" id="jumbotronBox">
	<form action="login" method="post" name="loginFrm">
	<div id="idText">아이디</div>
	<input type="text" class="col-md-12 col-sm-12 col-xs-12" id="member_id" name="member_id" class="form-control"><br/>
	<br/>
	<br/>
	<br/>
	<div id="passwordText">비밀번호</div>
	<input type="password" class="col-md-12 col-sm-12 col-xs-12" 
	id="member_password" name="member_password" class="form-control"><br/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<br/>
	<br/>
	<div class="row" id="findContainer">
		<div class="col-md-6 col-sm-12 col-xs-12 " >
			<button type="button" class="btn btn-info" id="findId" onclick="searchuserid()">아이디 찾기</button>
		</div>
		<div class="col-md-6 col-sm-12 col-xs-12">
			<button type="button" class="btn btn-info" id="findPassword" onclick="searchuserpassword()">비밀번호 찾기</button>
		</div>
	</div>
	<br/>
	<div id="alertBox"></div>
	<br/>
	<input type="submit" class="col-md-12 col-sm-12 col-xs-12 btn btn-info" value="로그인" id="loginButton" formaction="login">
	<br/>
	<br/>
	<input type="button" class="col-md-12 col-sm-12 col-xs-12 btn btn-outline-info" value="회원가입" id="signUpButton" onclick="signup()">
	<br/>
	<br/>
	<br/>
	</form>
	<div class="row" id="apiLoginContainer">
	<div class="col-md-6 col-sm-12 col-xs-12">구글 로그인 영역</div><div class="col-md-6 col-sm-12 col-xs-12">카카오 로그인 영역</div>
	</div>
	<br/>
	</div>
</div>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>
	<script type="text/javascript">
	let result="${message.message}"
		if(result!=''&&result!=undefined){
			alert(result);
		}
	</script>
	<script type="text/javascript">
	console.log(location.search.substr(6));
	
	if(location.search.substr(6)=="true"){
		$("#alertBox").css("color","red").css("text-shadow","black 0em 0em 0em").css("font-size","10px").text("아이디 또는 비밀번호가 다릅니다.");
	}
	</script>
	<script type="text/javascript">
	function searchuserid() {
		location.href="searchuserid";		
	}
	function searchuserpassword(){
		location.href="searchuserpassword";
	}
	function signup(){
		location.href="joinselecttype";
	}
	
	</script>
</body>
</html>