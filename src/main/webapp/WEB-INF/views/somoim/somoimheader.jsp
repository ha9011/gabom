<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet"/>

<style>


#headerContainer {
	margin-top: 10px;
	border-radius: 20px;
	background-color: white;
}
/* class='testimg' */
.frmRight{
	
}
.testimg {
	float: none;
	margin: 0 auto;
	display: flex;
	align-items: center;
	width: 250px;
	height: 75px;
	margin-bottom: 40px;
}
/* class='testli' */
.testli {   
	font-size: 16px;
	font-weight: 700;
	font-family: 'Jua' ;
}
#myinfo{
border: 0;
outline: 0;
background-color: white;
color: #337ab7;
font-family: 'Jua' ;
width: 85px;
height: 50px;
}

#myinfo:hover{
background-color: #E6E6E6

}

#logout{
border: 0;
outline: 0;
background-color: white;
color: #337ab7;
font-family: 'Jua' ;
width: 85px;
height: 50px;
}

#logout:hover{
background-color: #E6E6E6

}

.nav-tabs{

			/* background-color: #16AEF6;  */
			background-color : white; 
			border: 0;
			border-radius: 10px;
			padding-left: 30px;
			
		}
		.nav-tabs li a{
			/*color: #2E2E2E;*/
			color: black;
			font-size: 19px;
			margin-left: 20px;
			
		}
</style>
</head>
<body>
	<div class="container" id="headerContainer">
	
	<div class="col-md-12 col-sm-12 col-xs-12">
	
		<ul class="nav justify-content-end">
		
			<sec:authorize access="isAnonymous()">
				<li class='testli nav-item'><a href="login" >로그인</a></li >
				<li class='testli nav-item'><a href="joinselecttype">회원가입</a></li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<li class='testli'>
					
					<form class='frmRight' class='' method="post" action="/gabom/logout">
						<input type="button" value="나의정보" id="myinfo"> 
						
					</form>
				</li>
				<li class='testli '>
					<form class='frmRight' method="post" action="/gabom/logout">
						<input type="submit" value="로그아웃" id="logout"> 
						<input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</li>
			</sec:authorize>
			
		</ul>
	</div>
		
		<div class="col-md-12 col-sm-12 col-xs-12">
		<a href="/gabom/">
			<img class='testimg' src="../resources/headerImage/logo3.png">
			</a>
		</div>
		
		</div>
		
		
			<ul class="nav nav-tabs nav-justified">
				<li class='testli nav-item travel'><a href="#" id="travel">여행</a></li>
				<li class='testli nav-item sns'><a href="../snsmain" id="sns" >SNS</a></li>
				<li class='testli nav-item room'><a href="../housechoice" id="room" >숙박</a></li>
				<li class='testli nav-item popularRestaurant'><a href="foodmain" id="popularRestaurant">맛집</a></li>
				<li class='testli nav-item vip'><a href="#" id="vip">VIP</a></li>
				<li class='testli nav-item service'><a href="#" id="service">고객센터</a></li>
			</ul>
		
		
		
		<script type="text/javascript">
		//나의 정보 클릭시 
		$("#myinfo").on("click", function(){
			location.href="myinfo";
		})
		
		//호버시 아이콘 변환 스크립트
			$(".travel").hover(function () {
				$("#travel").html('<i class="fas fa-plane-departure"></i>');
				$(".travel").css("background-color","#eee");
			},function(){
				$("#travel").html('여행');	
				$(".travel").css("background-color","white");
			});
			
			$(".sns").hover(function () {
				$("#sns").html('<i class="far fa-comments"></i>');
				$(".sns").css("background-color","#eee");
			},function(){
				$("#sns").html('SNS');
				$(".sns").css("background-color","white");
			});
			
			$(".room").hover(function () {
				$("#room").html('<i class="fas fa-hotel"></i>');
				$(".room").css("background-color","#eee");
			},function(){
				$("#room").html('숙박');
				$(".room").css("background-color","white");
			});
			
			$(".popularRestaurant").hover(function () {
				$('#popularRestaurant').html('<i class="fas fa-utensils"></i>');
				$(".popularRestaurant").css("background-color","#eee");
			},function(){
				$('#popularRestaurant').html('맛집');
				$(".popularRestaurant").css("background-color","white");
			});
			
			$(".vip").hover(function () {
				$('#vip').html('<i class="fas fa-crown"></i>');
				$(".vip").css("background-color","#eee");
			},function(){
				$('#vip').html('VIP');
				$(".vip").css("background-color","white");
			});
			
			$(".service").hover(function () {
				$('#service').html('<i class="fas fa-headset"></i>');
				$(".service").css("background-color","#eee");
			},function(){
				$('#service').html('고객센터');
				$(".service").css("background-color","white");
			});
		</script>
		<script type="text/javascript">
		$(function() {
			//여기에 로딩이 끝나고 시큐리티에 아이디가 있으면 ajax로 로그인 상태를 체크 해야됨
		    $("body").css("display", "none");
		    $("body").fadeIn(500);
		    $("#sns").click(function(event){
		        $("body").fadeOut(500);
		    });
		});
		
		</script>
</body>
</html>