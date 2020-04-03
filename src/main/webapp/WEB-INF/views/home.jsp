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
width:80%;
margin:0 10%;
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
margin:0 10%;
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
			<h2 style="color:gray;font-size:70px;font-weight:bold;">Gabom</h2>
		</div>
		<div class="out" >
			<div class="in">
				<div class="featured-icon"><i class="fa-5x fas fa-plane-departure "></i></div>
				<div class="featured-text">
					<h4>나만의 여행을 계획해보세요!</h4>
					<p style="width:300px"> 나만의 여행계획을 만들어 친구들과 공유해보세요</p>
				</div>
			</div>
			<div class="in">
				<div class="featured-icon"><i class="fa-5x fas fa-users"></i></div>
				<div class="featured-text">
					<h4>SNS와 소모임으로 다양한 <br>사람들과 소통하세요!</h4>
					<p style="width:350px">다양한 소모임과  SNS를 활용하여 사람들과 소통하세요</p>
				</div>
			</div>
			<div class="in">
				<div class="featured-icon"><i class="fa-5x fas fa-home"></i></div>
				<div class="featured-text">
					<h4>숙박과 맛집을 한번에 해결하세요!</h4>
					<p style="width:300px">가봄에서는 호텔뿐만 아니라 가봄만의 이색적인 숙소와 맛집을 예약해 이용해보세요</p>
				</div>
			</div>
		</div>
</section>

<section class="sec" id="house">
	<!-- 최근 예약된 집  4개 출력-->
	<div class="section-title">
			<h2 style="color:gray;font-size:70px;font-weight:bold;">House</h2>
			<p><strong class="hftext">최근에 예약된 숙소를 만나보세요!</strong></p>
			<div class="out" id="himg">
				
			</div>
		</div>
</section>

<section class="sec" id="food">
	<!-- 최근 예약된 맛집 리스트 4개 출력-->
	<div class="section-title">
			<h2 style="color:gray;font-size:70px;font-weight:bold;">Food</h2>
			<p><strong class="hftext">최근에 예약된 맛집을 만나보세요!</strong></p>
			<div class="out" id="fimg">
				
			</div>
		</div>
</section>

<section class="sec" id="sido">
	<!-- 대충 자리 채울려고 시,도청 마크 넣고 여행가능 지역 표시  -->
	<div class="section-title">
			<h2 style="color:gray;font-size:70px;font-weight:bold;">Tour</h2>
			<div class="out"></div>
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
				 var div = $('<div class="img"></idv>');
				 	$("#himg").append(div);
				 var img = $('<img style="height:150px" src="'+i.house_sysname+'">');
					 div.append(img);
				 var title =$('<h5>'+i.house_name+'</h5>');
				 	 div.append(title);
			 }
			 
			 for(i of data.flist){
				 var div = $('<div class="img"></idv>');
				 	$("#fimg").append(div);
				 var img = $('<img style="height:150px" src="'+i.food_sysname+'">');
					 div.append(img);
				 var title =$('<h5>'+i.food_name+'</h5>');
				 	 div.append(title);
			 }
			 
        },
        error:function(error){
      	  alert("실패");
           console.log(error);
        }
	}); 
	
	
});



</script>
</html>
