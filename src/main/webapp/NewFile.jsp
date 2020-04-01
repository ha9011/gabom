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
<!-- 추가한 css -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="./resources/css/landing-page.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#icon{
		margin-right: 10%;
	}
/* 추가한 css */


.searchinput{
	width : 33%;
	margin-right: 10px;
}
#somoim {
	display: none;
}

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

.contentFrameInner{
	font-weight: bold;
}

.section {
	border: 1px solid gray;
	width: 30%;
	margin: 100px;
}

#content {
	flex-direction: row;
	justify-content: center;
	display: flex;
}

.title {
	margin: 20px;
}

.showlist {
	overflow: auto;
	padding: 5px;
	border: 1px black solid;
	width: 100%;
	height: 500px;
}

#showlistContent {
	height: 90%;
	width: 100%;
}
#showNotilistContent{
	height: 90%;
	width: 100%;

}
#makeSomoim {
	margin-top: 5px;
	width: 100%;
}

.makeSomoim {
	width: 100%;
}

.mymoimFrame {
	border: 1px solid blue;
	margin: 3px 0 3px 0;
	display: flex;
}

.contentFrame {
	width: 60%;
	height: 90%;
	margin: auto 10px;
}

.contentFrameInner {
	margin: 10px;
}
</style>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/header/somoimheader.jsp" />
	</header>
	
	
	<!-- 검색창 -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">Build a landing page for your business or project and generate more leads!</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          
        </div>
      </div>
    </div>
  </header>

	 <!-- 소모임 내모임 -->
  <section class="text-center">
    <div class="container" id="icon">
      <div class="row" >
        <div class="col-lg-4">
          <div id="somoimMenu" class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
          <img src="./resources/css/ourso.JPG" style="margin-top:10px;width:200px;height:150px;">
            <h3>소모임</h3>
            <p class="lead mb-0">This theme will look great on any device, no matter the size!</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div id="mySomoimMenu" class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <img src="./resources/css/myso.JPG"style="margin-top:10px;width:150px;height:150px;">
            <h3>내모임</h3>
            <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p>
          </div>
        </div>
      </div>
    </div>
  </section>
	<!-- <br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr> -->
	<!-- 	mymoim	 -->
	<div id="mainMymoim">
		<div id="content">
			<div id="myJoin" class="section">
				<div class="title">my join</div>

				<div class="showlist">
					<div id="showlistContent"></div>

				</div>
				<div id="makeSomoim">
					<a href="./makesomoim"><button
							class="btn btn-primary makeSomoim">개설하기</button></a>
				</div>
			</div>

			<div id="myNoti" class="section">
				<div class="title">my Noti</div>

				<div class="showlist" id="showNotilistContent"></div>
			</div>
		</div>
	</div>


	<!-- 	somoim	 -->

	<div id="somoim">
		<div id="content">
			<div id="myJoin" class="section">
				<div class="title">추천 소모임</div>

				<div class="showlist">
					<div id="showRecommandListContent"></div>

				</div>

			</div>

			<div id="myNoti" class="section">
				<div class="title">
					<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
						<form class="form-inline" id="searchFrm">
							<input class="searchinput" type="text" name="address"
								placeholder="address">
							<input class="searchinput" type="text" name="hobby"
								placeholder="hobby">	
							<button class="btn btn-success" type="button" id="searchSomoimBtn">Search</button>
						</form>
					</nav>
				</div>

				<div class="showlist" id="searchList"></div>
			</div>
		</div>
	</div>



</body>
</html>