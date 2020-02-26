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
	<style>
		#loginImage{
			text-align: center;
			
		}
		.jumbotron {
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;
			background-image: url(resources/loginimage/beach.jpg);
			background-size: cover;
			font-size: 30px;
			font-weight: bold;
		}
		#loginLogoImage{
			border-radius: 30px;
			width: 450px;
		}
		#member_id,#member_password{
			border-radius: 30px;
			height: 70px;
		}
		#loginButton{
			height: 70px;
			font-weight: bold;
			font-size: 30px;
			border-radius: 40px;
			text-shadow: black 0.2em 0.2em 0.2em;
		}
		#signUpButton{
			height: 70px;
			font-weight: bold;
			font-size: 30px;
			border-radius: 40px;
			color: #58ACFA;
			background-color: #EFF5FB;
			text-shadow: black 0.01em 0.01em 0.01em;
		}
		#apiLoginContainer{
			text-align: center;
			border: 1px solid red;
		}
		#findContainer{
			text-align: center;
		}
		#findId,#findPassword{
			width: 100%;
			text-shadow: black 0.1em 0.1em 0.1em;
			height: 50px;
			font-size: 20px;
			border-radius: 40px;
			font-weight: bold;
		}
		#member_id,#member_password{
		color: black;
		}
	</style>
</head>
<body>


<div class="container">
	<div class="jumbotron">
	<form action="" method="post">
	<div id="loginImage"><img src="resources/loginimage/logo2.png" class="img-thumbnail" id="loginLogoImage"></div>
	<br/>
	<br/>
	<br/>
	ID
	<input type="text" class="col-md-12 col-sm-12 col-xs-12" id="member_id" name="member_id"><br/>
	<br/>
	<br/>
	<br/>
	Password
	<input type="password" class="col-md-12 col-sm-12 col-xs-12" 
	id="member_password" name="member_password"><br/>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<br/>
	<br/>
	<br/>
	<div class="row" id="findContainer">
		<div class="col-md-6 col-sm-12 col-xs-12 " >
			<button type="submit" class="btn btn-info" id="findId" formaction="searchuserinfo">find ID</button>
		</div>
		<div class="col-md-6 col-sm-12 col-xs-12">
			<button type="submit" class="btn btn-info" id="findPassword" formaction="searchuserinfo">Forgot your password?</button>
		</div>
	</div>
	<br/>
	<br/>
	<input type="submit" class="col-md-12 col-sm-12 col-xs-12 btn btn-info" value="Login" id="loginButton" formaction="login">
	<br/>
	<br/>
	<input type="submit" class="col-md-12 col-sm-12 col-xs-12 btn btn-default" value="Sign-up" id="signUpButton" formaction="signup">
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
	
	
</body>
</html>