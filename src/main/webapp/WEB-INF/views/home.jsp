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
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
section {
  position: relative;
  height: 75vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
  
}
.sec{
width:100%;
text-align:center;
height: 50vh;
padding-bottom:2rem;
}
#how{
height:360px;
}
#sido{
height:100px;
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
  top: 78%;
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
	letter-spacing:70px;
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
#ul_list{

font-size:10px
}
.t_li{
margin:0 10px 5px 0;
list-style:none;
font-size: 20px;
}
.modalplan{
display: flex;
}


/* 여기부터 날짜 및 모달내 데이터 영역 */
.number:nth-child(n+2) {
	display: none;
	font-size: 0px;
}

.number:nth-child(1) {
	font-size: 20px;
}

.number {
	margin: 0 0 0 83px;
}
#day {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 50px;
}
#date {
	width: 200px;
	font-size: 30px;
	display: inline;
	list-style: none;
	padding: 0px;
	margin: 23px 0px 0px 0px;
}
#dayFrame {
	display: flex;
	margin: 0 0 0 8px;
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
			<h2 style="color:#3abade;font-size:70px;font-weight:bold;">About The Gabom</h2>
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
					<p style="width:370px">다양한 소모임과  SNS를 활용하여 사람들과 소통하세요</p>
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
			<div class="out">
				
				<img style="width:50%;height:100%" src="./resources/cssimg/t4.JPG">
				<div style="width:50%" id="t_list">
					<div class="featured-text">
					<h2 style="font-weight:bold;margin-bottom:20px;">Best Trip Plan</h2>
				</div>
				</div>
			</div>
</section>

<section class="sec" id="house">
	<!-- 최근 예약된 집  4개 출력-->
	<div class="section-title">
			<h2 style="color:#3abade;font-size:70px;font-weight:bold;">House</h2>
			<p><strong class="hftext">최근에 예약된 숙소를 만나보세요!</strong></p>
			<div class="out" id="himg">
				
			</div>
		</div>
</section>

<section class="sec" id="food">
	<!-- 최근 예약된 맛집 리스트 4개 출력-->
	<div class="section-title">
			<h2 style="color:#3abade;font-size:70px;font-weight:bold;">Food</h2>
			<p><strong class="hftext">최근에 예약된 맛집을 만나보세요!</strong></p>
			<div class="out" id="fimg">
				
			</div>
		</div>
</section>

<section class="sec" id="sido">
	<!-- 대충 자리 채울려고 시,도청 마크 넣고 여행가능 지역 표시  -->
	<div class="section-title">
			<h2 style="color:#3abade;font-size:70px;font-weight:bold;">Tour</h2>
	</div>
		<div class="out" style="height:100px;">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/1.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/2.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/3.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/4.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/5.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/6.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/7.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/8.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/9.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/10.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/11.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/12.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/13.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/14.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/15.JPG">
					<img style="width:100px;height: 50px;" src="./resources/cssimg/16.JPG">
			</div>
</section>

<section class="sec" style="height:40vh;">
	<!-- 학원주소 넣을거임  -->
			<div class="out" style="margin:0;width:100%;height:100%">
				<div id="map" style="width:100%;height:350px;"></div>
			</div>
</section>

 <div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 




<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog mapdialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="d_map" style="width:100%; height:300px;"></div>
       <div class="plan">
          <!-- 여행계획 및 날짜  -->
       <div id="day">
				<div id='dayFrame'>
					<div class="icon" id="left">◀</div>
					<ul id="date"></ul>
					<div class="icon" id="right">▶</div>
				</div>
			</div>
			<hr>
			<!-- ---------------------------------여기부터 여행 계획 내역들 나옴--------------------------------- -->
			<div id="detailTrip"></div>
			<!-- ---------------------------------   ↑↑↑ 여행 계획 ↑↑↑    --------------------------------- -->

			<hr>
       </div>
      </div>
      <div>
    	<input id="datebtn" type="date" placeholder="여행 첫 날짜 입력해주세요"> <button id="dateCommit">확정</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      	<span id="finalDay"> </span>
      </div>
      <div style="display:flex;" class="modal-footer">
         <button type="button" class="dsbtn btn btn-primary planjudgebtn" >저장</button>
        <button type="button" class="dsbtn btn btn-secondary">닫기</button>
      </div>
    </div>
  </div>
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
			 var idx = 0;
			 for(i of data.hlist){
				 var div = $('<div class="img hz" id="hz'+idx+'"></idv>');
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
					 
					 idx++;
			 }
			 $('#hz0').mouseover(function() {
				 	$(".hbtn").show();
				 	//$(".hbtn").slideDown("slow");
				 });
			 $('#hz0').mouseout(function() {
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
$(function() {

  $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
    
    $.ajax({
        url:'hmrest/planlist',
        method:'post',
        dataType:"json", //rest 컨트롤 이용   
        success:function(data){
			console.log("여행데이터",data);
			
			for(i of data){
				
				/* console.log(i.trip_area);
			 	  if(i.trip_area == 1){
					i.trip_area = "서울"		  
					
			 	  }else if(i.trip_area == 2){
					i.trip_area = "인천"		  
			 	  }else if(i.trip_area == 3){
					i.trip_area = "대전"		  
			 	  }else if(i.trip_area == 4){
					i.trip_area = "대구"		  
			 	  }else if(i.trip_area == 5){
					i.trip_area = "광주"		  
			 	  }else if(i.trip_area == 6){
					i.trip_area = "부산"		  
			 	  }else if(i.trip_area == 7){
					i.trip_area = "울산"		  
			 	  }else if(i.trip_area == 8){
					i.trip_area = "세종특별자치시"		  
			 	  }else if(i.trip_area == 31){
					i.trip_area = "경기도"		  
			 	  }else if(i.trip_area == 32){
					i.trip_area = "강원도"		  
			 	  }else if(i.trip_area == 33){
					i.trip_area = "충청북도"		  
			 	  }else if(i.trip_area == 34){
					i.trip_area = "충청남도"		  
			 	  }else if(i.trip_area == 35){
					i.trip_area = "경상북도"		  
			 	  }else if(i.trip_area == 36){
					i.trip_area = "경상남도"		  
			 	  }else if(i.trip_area == 37){
					i.trip_area = "전라북도"		  
			 	  }else if(i.trip_area == 38){
					i.trip_area = "전라남도"		  
			 	  }else if(i.trip_area == 39){
					i.trip_area = "제주도"		  
			 	  } */
				  
			 	 var sd = getFormatDate(i.trip_start_date);
			 	 var ed = getFormatDate(i.trip_end_date);
			 	  
				var ul =$('<a class="modalplan" name="'+i.trip_number+'"><ul id="ul_list"></ul></a>');
				var li =$('<li class="t_li"><i class="fas fa-fan"></i></li>');
				var li1 =$('<li class="t_li">'+i.trip_title+'</li>');
				//var li2 =$('<li class="t_li">'+i.trip_area+'</li>');
				var li3 =$('<li class="t_li">'+sd+'   ~   '+'</li>');
				var li4 =$('<li class="t_li">'+ed+'</li>');
				//var li5 =$('<li class="t_li">'+i.trip_share_count+'</li>');
				
				$("#t_list").append(ul);
				ul.append(li);
				ul.append(li1);
				//ul.append(li2);
				ul.append(li3);
				ul.append(li4);
				//ul.append(li5);
			}
			
        },
        error:function(error){
      	  alert("실패");
           console.log(error);
        }
	}); 
	
	
}); 

$(document).on('click','.modalplan',function(e){//모달 열고 지도 및 정보 표시
	
	$("#detail").show();
	//$("#d_map").empty();
 	//$("#d_content").empty();
	var tnum = $(this).attr("name");
	console.log(tnum);


	 $.ajaxSetup({         
		    beforeSend : function(xhr){
		       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		    });//먼저 보냄

		   $.ajax({
		   url:'tprest/getplan',
		   type:'post',
		   data:{"trip_number":tnum},
		   dataType:"json", //rest 컨트롤 이용   
		   success:function(data){
		      console.log(data);
		      arr = data
		      let obj_length = Object.keys(data).length;
		      for(let i = 1 ; i <= obj_length ; i++){
		    	  console.log(i);
		         let li =$('<li style="list-style:none" data-trnum="'+tnum+'" class="number">'+i+'일차'+'</li>');
		         $("#date").append(li);
		         // point 넣기
		         // new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)
		         points[i]=[];
		      	
//		          for(let v of data[i]){
//		 			points[i].push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint));
		         	 
//		           }
		      } 
		      
		      
		      console.log("arr",arr);
		      console.log("points",points)
		     setTimeout(function() {
		      		 let arrFrame = arr[1];
		      		  let pointsFrame = points[1];
		      		
		      		  createPlanForm(arrFrame,pointsFrame)
			}, 300)
		     
		      
		   },
		   error:function(error){
		      alert("실패")
		      console.log(error);
		   }
		   
		   })//ajax 끝    
	
});// 클릭이벤트 끝 

 

$("#left").on("click",function(e){
	   
    
    var $lastNumber = $(".number").length-1
    var $li = $(".number")[$lastNumber];
    $("#date").prepend($li);
    var tripNum = $(".number")[0].dataset.trnum;
    currentPlanDay = $('#date li:nth-child(1)').text();
    console.log("여행번호 : ", tripNum)
    console.log("현재페이지 : ", currentPlanDay.substring(0, currentPlanDay.indexOf("일")))
    var currentDay = currentPlanDay.substring(0, currentPlanDay.indexOf("일"));
    $("#detailTrip").empty();
    console.log("arr",arr)
    console.log("points",points)
    points[currentDay]=[];    // 좌표 초기화
	 initMapKaKao();
	//	$("#detailTrip").empty();

 let arrFrame = arr[currentDay];
	  let pointsFrame = points[currentDay];
	
	  createPlanForm(arrFrame,pointsFrame)
});   
    
    
    
$("#right").on("click",function(e){
   
        
        var trnum =e.target.dataset.trnum
       var $li = $(".number")[0];
       $("#date").append($li);
       var tripNum = $(".number")[0].dataset.trnum;
       currentPlanDay = $('#date li:nth-child(1)').text();
       console.log("여행번호 : ", tripNum)
       console.log("현재페이지 : ", currentPlanDay.substring(0, currentPlanDay.indexOf("일")))
       var currentDay = currentPlanDay.substring(0, currentPlanDay.indexOf("일"));
       $("#detailTrip").empty();
       
       console.log("arr",arr)
       console.log("points",points)
       points[currentDay]=[];    // 좌표 초기화
  	 initMapKaKao();
  	//	$("#detailTrip").empty();

    let arrFrame = arr[currentDay];
	  let pointsFrame = points[currentDay];
	
	  createPlanForm(arrFrame,pointsFrame)

});





$(document).on('click','.dsbtn' ,function() {
	$('#detail').hide();
})
















































// 모달 여행지도
	setTimeout(function() {
		var mapContainer = document.getElementById('d_map'), // 지도를 표시할 div  
		mapOption = { 
	      
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	   map = new kakao.maps.Map(mapContainer, mapOption); 
	}, 1000)











































//home 지도 
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











////날짜 포맷 변환기  str -> date ->str
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
</script>
</html>
