<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="favicon.ico">
<title>여행 만들기 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css"  rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>

<style>
#outbox{
float:left;
margin-left: -605px;
}
.inbox{
margin-top:30px;
width:700px;
height:870px;
background-color:black;
background-color: rgba(0, 0, 0, 0.7);
font-size:25px;
}
.content{
margin: 40px;
}
#searchbox{
margin-top:20px;
display:flex;
color: white;
text-align:left;
margin-left:10px; 
}
#sa{
height:50px;
margin-left:30px;
width:100%; 
}
.cont{
margin:20px 10px;
color: white;
float:left;
text-align:left;
}
.date{
color: black;
width:230px;
}
.btn{
border-radius:10px;
margin:5px 0;
font-weight:bold;
font-size:15px;
}
#triplist{
float:right;
margin-top: 30px;
margin-right:-86%;
width:700px;
height:870px;
background-color:black;
background-color: rgba(0, 0, 0, 0.7);
font-size:15px;
}
#planlist{
width:625px;
height:60px;
margin-top:-35px;
color:black;
}
table{
margin: 0 5%;
font-size:20px;
color:white;
text-align:center;
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


/* 맵 */
.mapdialog{
	width:800px;
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
}
</style>


</head>

<body id="page-top">
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
		
		
		<!-- Header -->
		<header>
			<div class="container-fluid">
				<img style="width:100%;height:950px;" src="./resources/tripImage/planbg.JPG" class="img-responsive" alt="portfolio">
					<div id="outbox" class="intro-text">
						<div class="inbox">
								<br>
								<form class="content" id="content">
								<div class="content" id ="searchbox">Trip Area
    								<select id="sa" name="trip_area" class="form-control mr-sm-6"  aria-label="Search" >
    									<option value="1">서울</option>
            							<option value="2">인천</option>
            							<option value="3">대전</option>
            							<option value="4">대구</option>
            							<option value="5">광주</option>
            							<option value="6">부산</option>
            							<option value="7">울산</option>
            							<option value="8">세종특별자치시</option>
							            <option value="31">경기도</option>
							            <option value="32">강원도</option>
							            <option value="33">충청북도</option>
							            <option value="34">충청남도</option>
							            <option value="35">경상북도</option>
							            <option value="36">경상남도</option>
							            <option value="37">전라북도</option>
							            <option value="38">전라남도</option>
							            <option value="39">제주도</option>
    								</select>
    							</div>	
    							
    								<div class="cont">Trip Title
    									&nbsp;<input autocomplete="off" name="trip_title" style="width:460px" class="date" type="text">
    								</div>
    								<div class="cont" >Trip Date
    									<input autocomplete="off" name="trip_start_date" type="date" class="date" aria-label="Start Date" ><input name="trip_end_date" class="date" type="date" placeholder="End Date">
    								</div>
    								<br>
    								
    								<button id="savebtn" class="btn btn-primary btn-lg btn-block">저장 </button>
    								<button id="resetbtn" class="btn btn-dark btn-lg btn-block">초기화</button>
    							</form>
    							<button id="planlist" class="btn btn-info btn-lg btn-block">추천여행보기</button>
						</div>
					</div>
					
					<div class="intro-text">
						<div id="triplist">
							<nav class="navbar navbar-light bg-light" style="display:flex;margin-top:20px;">
    							<input id="trip_area" name="trip_area" style="width:500px;margin:10px 30px 10px 50px;"  class="form-control" type="search" placeholder="지역을 입력해주세요" aria-label="Search">
    							<button id="search"class="btn btn-success my-2 my-sm-0">Search</button>
							</nav>
							<div id="t_list">
							<!--내용-->
							</div>
						
						</div>
					</div>
			</div>
		</header>
		
		 <%-- <div>
			<jsp:include page="/WEB-INF/views/footer.jsp"/>
		</div> --%> 
		
		<!-- 상세보기 모달 -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog mapdialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="map" style="width:100%; height:300px;"></div>
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

		<!-- Bootstrap core JavaScript -->
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="./resources/js/bootstrap.min.js"></script>
		<script src="./resources/js/owl.carousel.min.js"></script>
		<script src="./resources/js/cbpAnimatedHeader.js"></script>
		<script src="./resources/js/jquery.appear.js"></script>
		<script src="./resources/js/SmoothScroll.min.js"></script>
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

$("#triplist").hide();
$("#planlist").on('click',function(){
	$("#triplist").show();
})//클릭이벤트 끝

$(document).on('click',"#search",function(){
	var trip_area = $("#trip_area").val();
		console.log("지역",trip_area);
	
	 if(trip_area == "서울"){
			trip_area = 1		  
	 	  }else if(trip_area == "인천"){
	 		 trip_area = 2	  
	 	  }else if(trip_area == "대전"){
			trip_area = 3		  
	 	  }else if(trip_area == "대구"){
			trip_area = 4		  
	 	  }else if(trip_area == "광주"){
			trip_area = 5		  
	 	  }else if(trip_area == "부산"){
			trip_area = 6		  
	 	  }else if(trip_area == "울산"){
			trip_area = 7		  
	 	  }else if(trip_area == "세종시"){
			trip_area = 8		  
	 	  }else if(trip_area == "경기도"){
			trip_area = 31		  
	 	  }else if(trip_area == "강원도"){
			trip_area = 32		  
	 	  }else if(trip_area == "충청북도"	){
			trip_area = 33	  
	 	  }else if(trip_area == "충청남도"	){
			trip_area = 34	  
	 	  }else if(trip_area == "경상북도"){
			trip_area = 35		  
	 	  }else if(trip_area == "경상남도"	){
			trip_area = 36	  
	 	  }else if(trip_area == "전라북도"	){
			trip_area = 37	  
	 	  }else if(trip_area == "전라남도"	){
			trip_area = 38	  
	 	  }else if(trip_area == "제주도"){
			trip_area = 39		  
	 	  }
	 console.log("코드변환",trip_area);

	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
	
	$.ajax({
      url: "tprest/searchtrippaln",
       type: 'post',
       data : {"data":trip_area},
       dataType: "json", //rest 컨트롤 이용   
       success:function(data){
       	console.log(data);
       	$("#table").empty();
       	var table =$('<table id="table"></table>');
    	$("#t_list").append(table);

    	for(i of data){
    		
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
    	 	  }

    		var sd = getFormatDate(i.trip_start_date);
    		var ed = getFormatDate(i.trip_end_date);
    		var tr = $('<tr></tr>'); 
    		var td =$('<td><a data-name="'+i.trip_number+'" class="modalplan">'+i.trip_title+'</a></td>');
    		var td2 =$('<td>'+'&nbsp'+sd+' ~ '+ed+'   '+i.trip_area+'지역'+'</td>');
    		table.append(tr);
    		tr.append(td);
    		tr.append(td2);
    		
    	}
    	
       },
       
       error:function(error){
             console.log(error);
          }
	 });//ajax 끝
	
})//클릭이벤트 끝


//-----------------------------------여기부터 지도---------------------------------------------------------
//------------------------------
 	$(document).on('click','.dsbtn',function(){//모달 닫음
   $("#detail").hide();
})

var checkbtn = false;  //날짜 확정 버튼 눌러야 저장 가능함. 
$(document).on('click','.modalplan',function(e){//모달 열고 지도 및 정보 표시
	arr={};
	points={};
	checkbtn = false;
	$("#finalDay").text("");
	$("#datebtn").val("");
	$("#detailTrip").empty();
	tripnum =e.target.dataset.name //전역변수에 넣기
	
	setTimeout(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
	      
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	   map = new kakao.maps.Map(mapContainer, mapOption); 
	}, 500)
	
	
   $("#detail").show();
   tnum = e.target.dataset.name //여행번호
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
         let li =$('<li data-trnum="'+tnum+'" class="number">'+i+'일차'+'</li>');
         $("#date").append(li);
         // point 넣기
         // new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)
         points[i]=[];
      	
//          for(let v of data[i]){
// 			points[i].push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint));
         	 
//           }
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
})

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
			let planNum = $("<div class='planNum'> <img style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'> </div>");
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
		content = " <img style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'>  ";
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







//-----------------------------------아래부터 여행계획 등록-----------------------------------------------------------------------
$("#resetbtn").on('click', function() {
	$(".content")[0].reset();	
	
});

$("#savebtn").on('click', function(e) {//1차 여행플랜 생성 
	e.preventDefault();
	
	//console.log(document.getElementById("content"));
	//var area =$("#area").val("#sarea");
	//console.dir(area);
	
	var formData = new FormData(document.getElementById("content")); 
	console.log(formData);
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
  
  $.ajax({
      url:'tprest/savetripplan',
      type:'post',
      data:formData,
      processData:false,
      contentType:false,  //제이슨 아니니깐 까보지마!!
       dataType:"json", //rest 컨트롤 이용   
      success:function(data){
         alert("여행플랜이 저장되었습니다.");
         console.log(data)
         $("#content")[0].reset();
         
      },
      error:function(error){
         alert("저장에 실패했습니다.")
         console.log(error);
      }
      
   })
	
	
	
});// 클릭이벤트 끝



//날짜 포맷 변환기  str -> date ->str
function getFormatDate(strdate){
   var date = new Date(strdate);
   //console.log(date);
    var year = date.getFullYear();              //yyyy
 var month = (1 + date.getMonth());          //M
 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
 var day = date.getDate();                   //d
 day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
 return  year + '년  ' + month + '월  ' + day+'일   ';
}

$("#dateCommit").on("click", function(){
	checkbtn = true;   
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

$(document).on("click", ".planjudgebtn", function(){   // 저장 누르면 반드시 초기화 해야함, 
    var rangedate = getDateRangeData(sdate,edate)
	
    console.log("rangedate",rangedate)
    console.log("tripnum",tripnum)
    var data = {
		"rangedate" : rangedate,
		"tripnum" : tripnum
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
     	dataType:"json", //rest 컨트롤 이용   
    	success:function(data){
      	 	alert("여행플랜이 저장되었습니다.");
       		console.log(data)
       		$("#content")[0].reset();
       
    },
    error:function(error){
       		alert("저장에 실패했습니다.")
       		console.log(error);
    }
    
 })
	
})



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