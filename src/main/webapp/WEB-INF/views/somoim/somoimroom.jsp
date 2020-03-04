<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

#main{

width:100%;
height: 1000px;

}

#top {
	margin: 50px auto;
	width: 80%;
	height: 200px;
	border: 1px solid black;

}

#bottom {
	margin: 0px auto 50px auto;
	width: 80%;
	height: 700px;
	display: flex;
	justify-content: center;
}
/* margin: 20px 50px 0px 0px */
#out1 {
	margin: 30px 50px 0px 0px;
	width: 45%;
	border: 1px solid black;
}

#out2 {
	margin: 30px 0px 0px 50px;	
 	width: 45%;	
	border: 1px solid black;
}
.nav-item{
	width: 33%;
}
</style>

</head>
<body>
	<div id="main">
		<div id="top"></div>
		<br>
		<div id="bottom">
			<div id="out1">
				<!-- Nav pills -->
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="#noti">공지</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#board">게시글</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#album">사진첩</a></li>
				</ul>




				<!-- Tab panes -->
				<div class="tab-content">
					<div id="#noti" class="container tab-pane active">
						<br>
						<h3>HOME</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
					
					<div id="board" class="container tab-pane fade">
						<br>
						<h3>Menu 1</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
							laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					
					<div id="album" class="container tab-pane fade">
						<br>
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
				</div>
			</div>

			<div id="out2">
				<div id="chattingRoom">
				
				</div>
				
				<div id="cont2">
					<input type="text"> <button></button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>