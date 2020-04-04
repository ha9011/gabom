<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>
	
<style>
section {
  position: relative;
  height: 75vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
  
}
.sec{
border-bottom:3px solid lightgray;
width:100%;
text-align:center;
height: 50vh;
padding-bottom:2rem;
}
#how{
height:360px;
}
#sido{
height:300px;
}
.in{
margin:2%;
}
.out{
display: flex;
width:90%;
margin:0 5%;
padding-bottom:2rem;
}
.hftext{
font-size:15px;
}
.img{
margin:15px;
}
section video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: 0;
  -ms-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
}
.display-3{
	font-size:100px;
	letter-spacing:50px;
}
section .container {
  color:white;
  position: relative;
  margin-top:15%;
  z-index: 2;
}

section .overlay {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  S
  opacity: 0.5;
  z-index: 1;
}

@media (pointer: coarse) and (hover: none) {
  section {
    background: url('./resources/css/background.mp4') no-repeat center center scroll;
  }
  section video {
    display: none;
    
  }
}

</style>
</head>


<body>
<header>
	<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>

<%-- <div>
	<jsp:include page="/WEB-INF/views/homesearch.jsp" />
</div> --%>

<section>
<div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="./resources/css/background.mp4" type="video/mp4">
  </video>
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100 text-white">
        <h1 class="display-3">GABOM</h1>
        <p class="lead mb-0"></p>
      </div>
    </div>
  </div>
</section>

<section class="sec" id="how">
	<!-- 사이트 이용설명 -->
		<div class="section-title">
			<h2 style="font-size:50px;font-weight:bold;">About The Gabom</h2>
			<h5 style="font-weight:bold;">일상에 지친 당신 떠나가보자! </h5>
		</div>
		<div class="out" style="margin:0 20%;" >
			<div class="in">
				<div class="featured-icon"><i class="fa-3x fas fa-plane-departure "></i></div>
				<div class="featured-text">
					<h4 style="font-weight:bold;">나만의 여행을 계획해보세요!</h4>
					<p style="width:300px"> 나만의 여행계획을 만들어 친구들과 공유해보세요</p>
				</div>
			</div>
			<div class="in">
				<div class="featured-icon"><i class="fa-3x fas fa-users"></i></div>
				<div class="featured-text">
					<h4 style="font-weight:bold;">SNS와 소모임으로 다양한 <br>사람들과 소통하세요!</h4>
					<p style="width:350px">다양한 소모임과  SNS를 활용하여 사람들과 소통하세요</p>
				</div>
			</div>
			<div class="in">
				<div class="featured-icon"><i class="fa-3x fas fa-home"></i></div>
				<div class="featured-text">
					<h4 style="font-weight:bold;">숙박과 맛집을 한번에 해결하세요!</h4>
					<p style="width:300px">가봄에서는 호텔뿐만 아니라 가봄만의 이색적인 숙소와 맛집을 예약해 이용해보세요</p>
				</div>
			</div>
		</div>
</section>

<section class="sec" id="tourlist" style="height: 60vh;">
	<!-- 최근 예약된 집  4개 출력-->
			<div class="out">
				<img style="width:50%;height:100%" src="./resources/houseimg/t4.JPG">
				<div id="t_list">
					<table id="t_table"></table>
				</div>
			</div>
</section>

<section class="sec" id="house">
	<!-- 최근 예약된 집  4개 출력-->
	<div class="section-title">
			<h2 style="font-size:50px;font-weight:bold;">House</h2>
			<p><strong class="hftext">최근에 예약된 숙소를 만나보세요!</strong></p>
			<div class="out" id="himg">
				
			</div>
		</div>
</section>

<section class="sec" id="food">
	<!-- 최근 예약된 맛집 리스트 4개 출력-->
	<div class="section-title">
			<h2 style="font-size:50px;font-weight:bold;">Food</h2>
			<p><strong class="hftext">최근에 예약된 맛집을 만나보세요!</strong></p>
			<div class="out" id="fimg">
				
			</div>
		</div>
</section>

<section class="sec" id="sido">
	<!-- 대충 자리 채울려고 시,도청 마크 넣고 여행가능 지역 표시  -->
	<div class="section-title">
			<h2 style="font-size:50px;font-weight:bold;">Tour</h2>
			<div class="out"></div>
		</div>
</section>

<section class="sec" style="height:40vh;">
	<!-- 학원주소 넣을거임  -->
			<div class="out" style="margin:0;width:100%;height:100%">
				<div id="map" style="width:100%;height:350px;"></div>
			</div>
</section>

 <div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div> 
</body>

<script>

$(function() {

  $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
    
    $.ajax({
        url:'hmrest/housefood',
        method:'post',
        dataType:"json", //rest 컨트롤 이용   
        success:function(data){
			console.log(data);
			
			 for(i of data.hlist){
				 var div = $('<div class="img hz"></idv>');
				 	$("#himg").append(div);
				 var img = $('<img style="height:200px;margin-bottom:10px;" src="'+i.house_sysname+'">');
					 div.append(img);
				 var title =$('<h4>'+i.house_name+'</h4>');
				 var address =$('<h5>'+i.house_address+'</h5>');
				 	 div.append(title);
				 	 div.append(address);
				 var btn =$('<button data-hnum="'+i.house_number+'" id ="hbtn" class="hbtn btn btn-block btn-info">지금 예약하러가기</button>');
					 div.append(btn);
					 
					 $(".hbtn").hide();
			 }
			 $('.hz').mouseover(function() {
				 	$(".hbtn").show();
				 	//$(".hbtn").slideDown("slow");
				 });
			 $('.hz').mouseout(function() {
				 	$(".hbtn").hide();
					//$(".hbtn").slideUp("fast");
				 });

			 
			 $(".hbtn").on('click', function(e) {
					var hnum = e.target.dataset.hnum
					  location.href="housedetail?house_number="+hnum;
				});
			 
			 for(i of data.flist){
				 var div = $('<div class="img"></idv>');
				 	$("#fimg").append(div);
				 var img = $('<img style="height:200px;margin-bottom:10px;" src="'+i.food_sysname+'">');
					 div.append(img);
				 var title =$('<h5>'+i.food_name+'</h5>');
				 var address =$('<h5>'+i.food_address+'</h5>');
			 	 	div.append(title);
			 		div.append(address);
			 	 var btn =$('<button data-fnum="'+i.food_number+'" class="fbtn btn btn-block btn-info">지금 예약하러가기</button>');
					div.append(btn);
				 	 
			 }
			
			 $(".fbtn").on('click', function(e) {
					var fnum = e.target.dataset.fnum
					  location.href="fooddetail?food_number="+fnum;
				});
			 
        },
        error:function(error){
      	  alert("실패");
           console.log(error);
        }
	}); 
	
	
});
//------------------------------------------------------------------------
/* $(function() {

  $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
    
    $.ajax({
        url:'hmrest/planlist',
        method:'post',
        dataType:"json", //rest 컨트롤 이용   
        success:function(data){
			console.log(data);
			
        },
        error:function(error){
      	  alert("실패");
           console.log(error);
        }
	}); 
	
	
}); */























var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.4388771, 126.675093), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
var imageSize = new kakao.maps.Size(24, 35); 
//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.4388771, 126.675093); 
var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition,
image : markerImage // 마커 이미지 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style=" text-align:center"><h4>(주)GABOM</h4></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker);    
</script>
</html>
