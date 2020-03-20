<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 여행플랜</title>
<!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="icon" href="favicon.ico">
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css"  rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/cbpAnimatedHeader.js"></script>
<script src="./resources/js/jquery.appear.js"></script>
<script src="./resources/js/SmoothScroll.min.js"></script>
<script src="./resources/js/theme-scripts.js"></script>

<style>
body{
overflow:scroll;
background-image:url( "./resources/css/diarybg.jpg" )
}
/* 머리 */
header{
	margin:5% 0;
	width:100%;
	margin-bottom:0;
}
.he{
margin:10px 30% 0 30%;
width:800px;
text-align: center;
height:50px;
font-size:60px;
color:white;

}


/* 상세여행 영역  */
.area{
display:flex;
}

#planarea{
margin:0 2% 0 5%;
margin-top:-50px;
width:72%;
background-color: white;
font-size:20px;
}
#map{
border:2px solid white;
}
#day{
display:flex;
margin: 0 5%;
width:100%;
font-size:50px;
}
#hc{
text-align: center;
margin:20px 40%;
width:300px;
}
.addbtn{
float:right;
margin:10px;
}
.icon{
margin:0 20%;
}
#date{
width:200px;
font-size:30px;
display:inline-flex;
list-style:none;
}
.number:nth-child(n+2){
display: none;
}
.number:nth-child(1){
font-size: 50px;
}

/* 채팅영역 */
#chatarea{
border:1px solid black;
margin:0 5% 0 2%;
margin-top:-50px;
width:28%;
overflow: auto;
background-color: #99BFE4;
height:700px;
}


</style>




</head>
<body>
<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<!--로고 자리 -->
					<img style="width:200px;" src="./resources/headerImage/logo3.png" alt="logo">
				</div>
				
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						
						<li>
							<a class="page-scroll" href="/gabom/">Home</a>
						</li>
						<li>
							<a class="page-scroll" href="snsmain">SNS</a>
						</li>
						<li>
							<a class="page-scroll" href="myplan">내여행</a>
						</li>
						<li>
							<a class="page-scroll" href="housechoice">숙박</a>
						</li>
						<li>
							<a class="page-scroll" href="foodmain">맛집</a>
						</li>
						<li>
							<a class="page-scroll" href="#team">VIP</a>
						</li>
						<li>
							<a class="page-scroll" href="#contact">고객센터</a>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--메뉴 자리 -->
		<header>
			<div class="he" id="titel"> </div>
			<div class="he" id="totaldate"></div>
		</header>
		<section class="area">
			<div id="planarea">
				<div id="map" style="width: 100%; height: 600px; "></div>
				
				<div id="hc">
					<a>+숙소 선택하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a>+체크리스트 </a>
				</div>
				
				<div id="day">
					<div class="icon" id="left">◀</div>
					<ul id="date"></ul>
					<div class="icon" id="right">▶</div>
				</div>
				
				<div id="t_destination">
					<button class="addbtn btn-lg btn-primary" onclick="modal">장소추가</button>
					<button class="addbtn btn-lg btn-primary" onclick="memo()">메모추가</button>
				</div>
				
				
				
				
				
				
			</div>
			<div id="chatarea">채팅창 </div>
		</section>
		
		
		
</body>
<script>
var trip_data = ${detrip};
console.log(trip_data);

//날짜 변환
var sd = getFormatDate(trip_data[0].trip_start_date);
var ed = getFormatDate(trip_data[0].trip_end_date);

//header
var titel =$('<h1>'+trip_data[0].trip_title+'</h1>')
var totaldate =$('<h1>'+sd+' - '+ed+'</h1>')

$("#titel").append(titel);
$("#totaldate").append(totaldate);
//-------------------------------------------------------------------------------------
//date 날짜 들어가는 div

 for(i of trip_data){
	var li =$('<li data-trnum="'+i.trip_number+'" class="number">'+i.trip_day+'</li>');
	$("#date").append(li);
} 


 $("#left").on("click",function(e){
	 ///var trnum =e.target.dataset.trnum
	 //console.log(trnum);
		console.log("왼쪽버튼")
		console.log($(".number"))
		//console.log($(".number").length)
		var $lastNumber = $(".number").length-1
		console.log($lastNumber)
		var $li = $(".number")[$lastNumber];
		$("#date").prepend($li);
		
		console.log($(".number")[0]);
		console.log($(".number")[0].dataset.trnum);
		
	})



 $("#right").on("click",function(e){
	 var trnum =e.target.dataset.trnum
	 console.log(trnum);
		console.log("오른쪽버튼")
		console.log($(".number"))
		console.log($(".number").length)
		var $li = $(".number")[0];
		$("#date").append($li);
	})








//------------------------------------------------------------------------------------날짜 변환 클릭

/* function memo() {
	
} */






















var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);


//날짜 포맷 변환기  str -> date ->str----------------------------------------------------------------------------------
function getFormatDate(strdate){
   var date = new Date(strdate);
   console.log(date);
    var year = date.getFullYear();              //yyyy
 var month = (1 + date.getMonth());          //M
 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
 var day = date.getDate();                   //d
 day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
 return  year + '년  ' + month + '월  ' + day+'일   ';
}

//=================================================================================이예상 
















</script>

</html>