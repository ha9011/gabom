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
a{
cursor: pointer;
}
.icon{
cursor: pointer;
}
section {
  position: relative;
  height: 75vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
  
}
.ul_list{
	list-style: none;
	cursor:pointer;
}
.ul_list > li{
	float:left;
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

}
.hftext{
font-size:15px;
}
.img{
margin:15px;
height:350px;
position: relative;
width:260px;
}
.hbtn{
position:absolute;
bottom:25px;
width:250px;
right: 1px;
}
.fbtn{
position:absolute;
bottom:25px;
width:250px;
right: 1px;
}
.houseimg{
margin-top:15px;
	width :46px;
	height: 34px;
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

.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	top: 40px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.numberr {
	font-weight: bold;
	color: #ee6152;
}
.planFrame {
	display: flex;
}

.idxbtn {
	border-radius: 10px;
	padding: 8px;
	margin-top: 15px;
}

.planImg > img{
	width : 70px;
	height: 70px;
	
	
}

#detailTrip{
	height : 300px;
	overflow: auto;
}

#titleframe{
	margin-top : 10px;
	text-align: center;
	
}
#plantitle{
	font-size: 20px;
	font-weight: bold;
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
	</div>
			<div class="out" id="himg">
				
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
    	<div id="titleframe"><span id="plantitle"></span></div>
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
    	&nbsp&nbsp&nbsp&nbsp<input id="datebtn" type="date" placeholder="여행 첫 날짜 입력해주세요"> <button id="dateCommit">확정</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      	<span id="finalDay"> </span>
      </div>
      <div style="display:flex;" class="modal-footer">
         <button type="button" class="dsbtn btn btn-primary planjudgebtn" disabled="disabled" >저장</button>
        <button type="button" class="dsbtn btn btn-secondary">닫기</button>
      </div>
    </div>
  </div>
</div>   	








</body>

<script>
var tnum ; // 승인대기 여행 번호 
var map;
let arr ; // 계획 모음!
let points ={}; // x,y좌표 모음
let planidx = 1;


let customOverlayy = [];
let distanceOverlayy = [];
let clickLinee =[];

let tripnum // 여행번호
let sdate //  여행 저장 날짜
let edate //

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
				 var img = $('<img style="height:200px;margin-bottom:10px;" src="'+i.house_sysname+'">');
					 div.append(img);
				 var title =$('<h4>'+i.house_name+'</h4>');
				 var address =$('<h5>'+i.house_address+'</h5>');
				 	 div.append(title);
				 	 div.append(address);
				 var btn =$('<button data-hnum="'+i.house_number+'" class="hbtn btn btn-info">지금 예약하러가기</button>');
					 div.append(btn);
					 
			 }
		

			 
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
			arr = data;
			let idx = 0;
			for(let i of data){
				  
				let sd = getFormatDate(i.trip_start_date);
				let ed = getFormatDate(i.trip_end_date);
			 	  
				let a =$('<a class="modalplan" data-title="'+i.trip_title+'" name="'+i.trip_number+'" data-arrnum="'+idx+'"></a>');
				let ul = $('<ul  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="ul_list"></ul>');
				let li;
				if(idx == 0){
					 li =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li"><i style="color:gold;" class="fas fa-fan fa-spin"></i><span class="badge badge-success">'+i.trip_share_count+'</span></li>');
				}else if(idx == 1){
					 li =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li"><i style="color:silver;" class="fas fa-fan fa-spin"></i><span class="badge badge-success">'+i.trip_share_count+'</span></li>');
				}else if(idx == 2){
					 li =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li"><i style="color:#cd7f32;" class="fas fa-fan fa-spin"></i><span class="badge badge-success">'+i.trip_share_count+'</span></li>');
				}else{
					 li =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li"><i style="color:black;" class="fas fa-fan fa-spin"></i><span class="badge badge-success">'+i.trip_share_count+'</span></li>');
				}
				
				let li1 =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li">'+i.trip_title+'</li>');
				//var li2 =$('<li class="t_li">'+i.trip_area+'</li>');
				let li3 =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li">'+sd+'   ~   '+'</li>');
				let li4 =$('<li  data-arrnum="'+idx+'" data-title="'+i.trip_title+'" class="t_li">'+ed+'</li>');
				//var li5 =$('<li class="t_li">'+i.trip_share_count+'</li>');
				
				
				ul.append(li);
				ul.append(li1);
				//ul.append(li2);
				ul.append(li3);
				ul.append(li4);
				a.append(ul);
				$("#t_list").append(a);

				idx++;
			}
			
        },
        error:function(error){
      	  alert("실패");
           console.log(error);
        }
	}); 
	
	
}); 

$(document).on('click','.modalplan',function(e){//모달 열고 지도 및 정보 표시
	$(".planjudgebtn").prop("disabled", true)
	console.log("모달 첫 클릭")

	console.log("etitle",e.target.dataset.title);
	console.log("enum",e.target.dataset.arrnum);
	$("#plantitle").text(e.target.dataset.title);
	$("#date").empty();  // 비우기
	$("#detailTrip").empty();  // 비우기
	$("#detail").show();
	//$("#d_map").empty();
 	//$("#d_content").empty();
	var tnum = $(this).attr("name");//
	
	console.log(tnum);

	//<button type="button" class="dsbtn btn btn-primary planjudgebtn" disabled="disabled" >저장</button>
	var el = document.querySelector('.planjudgebtn');
	el.dataset.tripnumber = tnum;
	
	var ell = document.querySelector('.planjudgebtn');
	el.dataset.arrnum = e.target.dataset.arrnum;
	
	setTimeout(function() {
		var mapContainer = document.getElementById('d_map'), // 지도를 표시할 div  
		mapOption = { 
	      
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	   map = new kakao.maps.Map(mapContainer, mapOption); 
	}, 200)
	
	
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
















































// // 모달 여행지도
// 	setTimeout(function() {
// 		var mapContainer = document.getElementById('d_map'), // 지도를 표시할 div  
// 		mapOption = { 
	      
// 	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
// 	        level: 3 // 지도의 확대 레벨
// 	    };
// 	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
// 	   map = new kakao.maps.Map(mapContainer, mapOption); 
// 	}, 1000)




	//--------------------- 맵에 필요한 친구
	var houseNum = null;
	const createPlanForm = (arrFrame,pointsFrame) =>{
		console.log("arrFrame",arrFrame)
		console.log("pointsFrame",pointsFrame)
		var checkHouseD = false;
		
		for( let v of arrFrame){
			if(v.trip_type==1){ //숙소일때
				console.log("숙소 포문")
				console.log("v",v)
				
				let planFrame = $("<div class='planFrame'>  </div>");
				let planNum = $("<div class='planNum'> <img class='houseimg' style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'> </div>");
				let planImg = $("<div class='planImg'><img src='"+v.trip_img+"' width='50px' height='50px' ></div>");
				
				planFrame.append(planNum);
				planFrame.append(planImg);
				
				
				let planContFram = $("<div class='planContFram'> </div>");
				let contTitle = $("<div class='contTitle'>"+v.trip_title+"</div>");
				let contAddr= $("<div class='contAddr'>"+v.trip_destination+" </div>");
				planContFram.append(contTitle);
				planContFram.append(contAddr);
				
				planFrame.append(planContFram);
				
				
				
				
				
				$("#detailTrip").append(planFrame);
				
				
				pointsFrame.push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)); //추가 할 마커 저장하기 arr에...
				console.log("pointsFrame",pointsFrame);
			
				
				let clickPosition = new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint); // 클릭한 좌표...(가상)
				
				if( planidx >= 2){
					console.log(planidx);
					console.log("??")
					let clickLine = new kakao.maps.Polyline({
		            	map: map, // 선을 표시할 지도입니다 
		            	path: [pointsFrame[planidx-2] ,pointsFrame[planidx-1]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            	strokeWeight: 3, // 선의 두께입니다 
		            	strokeColor: '#db4040', // 선의 색깔입니다
		            	strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            	strokeStyle: 'solid' // 선의 스타일입니다
		        	});
					console.log("???")
					clickLinee.push(clickLine);
					
					let distance = Math.round(clickLine.getLength());
					
					displayCircleDot(pointsFrame[planidx-1], distance)
				
				}
				houseNum = planidx;
				planidx++;
				checkHouseD = true;
			
			}else{ //숙소 아닐때
				console.log("숙소아닌 포문")
				console.log("v",v)
				
				let planFrame = $("<div class='planFrame'>  </div>");
			
				let planNum
				if(checkHouseD==true){
					planNum = $("<div class='planNum'> <button type='button' class='btn btn-primary idxbtn'> <span class='badge badge-light'>"+(planidx+1)+"</span> </button> </div>");
				}else{
					planNum = $("<div class='planNum'> <button type='button' class='btn btn-primary idxbtn'> <span class='badge badge-light'>"+planidx+"</span> </button> </div>");
									
				}
				
				let planImg = $("<div class='planImg'><img src='"+v.trip_img+"' width='50px' height='50px' ></div>");
				
				planFrame.append(planNum);
				planFrame.append(planImg);
				
				
				let planContFram = $("<div class='planContFram'> </div>");
				let contTitle = $("<div class='contTitle'>"+v.trip_title+"</div>");
				let contAddr= $("<div class='contAddr'>"+v.trip_destination+" </div>");
				planContFram.append(contTitle);
				planContFram.append(contAddr);
				
				planFrame.append(planContFram);
				
			
				
				
				
				$("#detailTrip").append(planFrame);
				
				
				pointsFrame.push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)); //추가 할 마커 저장하기 arr에...
				console.log("pointsFrame",pointsFrame);
			
				
				let clickPosition = new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint); // 클릭한 좌표...(가상)
				
				if( planidx >= 2){
					console.log(planidx);
					console.log("!!")
					
					let clickLine = new kakao.maps.Polyline({
		            	map: map, // 선을 표시할 지도입니다 
		            	path: [pointsFrame[planidx-2] ,pointsFrame[planidx-1]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            	strokeWeight: 3, // 선의 두께입니다 
		            	strokeColor: '#db4040', // 선의 색깔입니다
		            	strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            	strokeStyle: 'solid' // 선의 스타일입니다
		        	});
					
					console.log("!!!")
					
					clickLinee.push(clickLine);
					
					let distance = Math.round(clickLine.getLength());
					
					displayCircleDot(pointsFrame[planidx-1], distance)
				
				}
			
				planidx++;
			
			
			} 
		}
		
		 //-----------지도 마커에 따른 재위치 선정
		 let bounds = new kakao.maps.LatLngBounds(); 
		 var checkHouse = false;
		 for (i = 0; i < pointsFrame.length; i++) {
		     // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		// 커스텀 오버레이에 표시할 내용입니다     
		// HTML 문자열 또는 Dom Element 입니다 
		let content;
		if(houseNum-1 == i){
			content = " <img class='houseimg' style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'>  ";
			checkHouse = true;
		}else{
			if(checkHouse==true){
				content = "<button  type='button' class='btn btn-primary idxbtn mapbtn'> <span class='badge badge-light'>"+(i)+"</span> </button> ";
			}else{
				content = "<button  type='button' class='btn btn-primary idxbtn mapbtn'> <span class='badge badge-light'>"+(i+1)+"</span> </button> ";
			}
		}
		
		
		// 커스텀 오버레이를 생성합니다
		let custom = new kakao.maps.CustomOverlay({
	   	 position: pointsFrame[i],
	   	 content: content   
		});
		customOverlayy.push(custom);
		// 커스텀 오버레이를 지도에 표시합니다
	 	customOverlayy[customOverlayy.length-1].setMap(map);
		
		   
		
		 bounds.extend(pointsFrame[i]);
		 }
		 
		 setTimeout(function() {
			 setBounds(bounds)
			}, 100);
		     // 재설정매소드
		 
	 	
		planidx=1;
	} 
		
	const initMapKaKao=()=>{
		for(v of customOverlayy){
			v.setMap(null);
		}
		customOverlayy=[];
		for(v of distanceOverlayy){
			v.setMap(null);
		}
		distanceOverlayy=[];
		for(v of clickLinee){
			v.setMap(null);
		}
		clickLinee=[];
	}	

	function setBounds(bounds, points) {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}

	function displayCircleDot(position, distance) {
		
	    if (distance > 0) {
	        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	         var distanceOverlay = new kakao.maps.CustomOverlay({
	            content: '<div class="dotOverlay">거리 <span class="numberr">' + distance + '</span>m</div>',
	            position: position,
	            yAnchor: 1,
	            zIndex: 2
	        });

	         distanceOverlayy.push(distanceOverlay);
	         
	        // 지도에 표시합니다
	        distanceOverlayy[distanceOverlayy.length-1].setMap(map);
	    }

	    // 배열에 추가합니다
	    //dots.push({circle:circleOverlay, distance: distanceOverlay});
	}

























































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



$("#dateCommit").on("click", function(){
	
	$(".planjudgebtn").prop("disabled",false)
	checkbtn = true;   
	
	console.log("arr",arr)
    let obj_length = Number(Object.keys(arr).length-1);	
	console.log(obj_length);
    console.log($("#datebtn").val());
    
    sdate = new Date($("#datebtn").val());
    console.log(sdate);
    
    edate = new Date($("#datebtn").val())
    edate.setDate(edate.getDate()+obj_length);
    console.log(edate);
    
    let resultPerid = "  최종확정일은  " +getFormatDate(sdate) + " ~ " + getFormatDate(edate)
    $("#finalDay").text(resultPerid);
})


$(".planjudgebtn").on("click",function(e){
	console.log("?")
	console.log(e.target.dataset.tripnumber)
	
	var rangedate = getDateRangeData(sdate,edate)
	
    
    
    var data = {
		"rangedate" : rangedate,
		"tripnum" : e.target.dataset.tripnumber
	}
	
	console.log(data);
	
    $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	$.ajax({
    	url:'tprest/shareplansave',
    	type:'post',
    	data:data,
     	//dataType:"json", //rest 컨트롤 이용   
    	success:function(data){
      	 	alert("여행플랜이 저장되었습니다.");
      	 	$(".planjudgebtn").prop("disabled",true);
       
    },
    error:function(error){
       		alert("저장에 실패했습니다.")
       		console.log(error);
    }
    
 })
	
})








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
   // 날짜사이 간격 배열형태로 전환
   function getDateRangeData(param1, param2){  //param1은 시작일, param2는 종료일이다.
		var res_day = [];
	 	var ss_day = new Date(param1);
	   	var ee_day = new Date(param2);    	
	  		while(ss_day.getTime() <= ee_day.getTime()){
	  			var _mon_ = (ss_day.getMonth()+1);
	  			_mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
	  			var _day_ = ss_day.getDate();
	  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;
	   			res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
	   			ss_day.setDate(ss_day.getDate() + 1);
	   	}
	   	return res_day;
	}
</script>
</html>
