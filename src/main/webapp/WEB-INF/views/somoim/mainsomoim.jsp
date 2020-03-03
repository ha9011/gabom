<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#main {
	width: 90%;
	border: 1px solid gray;
	height: 1000px;
	margin: 20px;
}

#menunav {
	height: 40px;
	text-align: center;
}

.menu {
	width: 200px;
	margin: 100px 200px 0 200px;
}

#myJoin {
	
}

#myNoti {
	
}

.section {
	border: 1px solid gray;
	width: 30%;
	margin : 100px;
	
}

#content {
	text-align: center;
	flex-direction: row;
	justify-content: center;
	display: flex;
}

.title{
	margin : 20px;
}

.showlist{
	padding :5px;
	border : 1px black solid;
	width : 100%;
	height: 500px;
}
#makeSomoim{
	margin-top : 100%;
	width: 100%;
	
}
</style>
<body>
	<div id="main">
		<div id="menunav">
			<button type="button" class="btn btn-primary btn-lg menu">소모임</button>
			<button type="button" class="btn btn-primary btn-lg menu">내
				모임</button>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<hr>

		<div id="content">
			<div id="myJoin" class="section">
				<div class="title">my join</div>

				<div class="showlist">
				
				<a href="./makesomoim"><button id="makeSomoim"  class="btn btn-primary">개설하기</button></a>
				</div>
			</div>

			<div id="myNoti" class="section">
				<div class="title">my Noti</div>

				<div class="showlist"></div>
			</div>
		</div>
	</div>
</body>
</html>