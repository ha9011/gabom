<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body {
	/* background-image: url(images/tree-247122_1280.jpg);
	background-size: cover; */
}

#headerContainer {
	width: 1650px;
	margin-top: 45px;
	border-radius: 20px;
	background-color: white;
}

img {
	float: none;
	margin: 0 auto;
	display: flex;
	align-items: center;
	width: 450px;
	height: 130px;
	margin-top: 50px;
}

li {
	font-size: 19px;
	font-weight: 700;
}
#logout{
border: 0;
outline: 0;
background-color: white;
margin-top: 10px;
margin-left: 8px;
color: #064D84;
}
</style>
</head>
<body>
	<div class="container" id="headerContainer">
		<div><a href="/gabom/">
			<img src="resources/headerImage/logo3.png">
			</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<sec:authorize access="isAnonymous()">
				<li><a href="login">로그인</a></li>
				<li><a href="joinmember">회원가입</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="myinfo">나의정보</a></li>
				<li>
					<form method="post" action="/gabom/logout">
						<input type="submit" value="로그아웃" id="logout"> <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>

				</li>
			</sec:authorize>
		</ul>
	</div>


	
</body>
</html>