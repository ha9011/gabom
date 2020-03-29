<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 여행플랜</title>
<!-- 지도 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="icon" href="favicon.ico">
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<!-- 페이징 처리 플러그인 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />
<!-- 페이징 처리 플러그인 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/cbpAnimatedHeader.js"></script>
<script src="./resources/js/jquery.appear.js"></script>
<script src="./resources/js/SmoothScroll.min.js"></script>
<script src="./resources/js/theme-scripts.js"></script>

<style>
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

body {
	overflow: scroll;
	background-image: url( "./resources/css/diarybg.jpg" )
}
/* 머리 */
header {
	margin: 5% 0;
	width: 100%;
	margin-bottom: 0;
}

.he {
	margin: 10px 30% 0 30%;
	width: 800px;
	text-align: center;
	height: 50px;
	font-size: 60px;
	color: white;
}

/* 상세여행 영역  */
.area {
	display: flex;
}

#planarea {
	margin: 0 2% 0 5%;
	margin-top: -50px;
	width: 72%;
	background-color: white;
	font-size: 20px;
}

#map {
	border: 2px solid white;
}

#day {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 50px;
}

#dayFrame {
	display: flex;
	margin: 0 0 0 83px;
}

#hc {
	text-align: center;
	margin: 20px 40%;
	width: 300px;
}

.addbtn {
	float: right;
	margin: 10px;
}
/* .icon{ */
/* margin:0 20%; */
/* } */
#date {
	width: 200px;
	font-size: 30px;
	display: inline;
	list-style: none;
	padding: 0px;
	margin: 23px 0px 0px 0px;
}

.number:nth-child(n+2) {
	display: none;
	font-size: 0px;
}

.number:nth-child(1) {
	font-size: 50px;
}

.number {
	margin: 0 0 0 83px;
}

/* 채팅영역 */
.chatFrame {
	display: flex;
	flex-direction: column;
}

#chatarea {
	border: 1px solid black;
	margin: 0 5% 0 2%;
	margin-top: -50px;
	width: 28%;
	background-color: #99BFE4;
	height: 700px;
}

#chatareaCont {
	overflow: auto;
	height: 93%;
	width: 100%;
	display: flex;
	flex-direction: column;
	background-color: #99BFE4;
}

.yourCommnet {
	margin: 15px 0 15px 10px;
	padding: 10px;
	font-size: 15px;
	align-items: flex-start;
	align-self: flex-start;
	text-align: left;
	background: white;
	border-radius: 10px;
}
/* align-self: flex-end; */
.myCommnet {
	margin: 15px 10px 15px 0;
	padding: 10px;
	font-size: 15px;
	align-items: flex-end;
	align-self: flex-end;
	text-align: right;
	background: yellow;
	border-radius: 10px;
}

.media-body {
	display: inline;
}

/* 여행계획 */
.planFrame {
	display: flex;
}

.idxbtn {
	border-radius: 10px;
	padding: 8px;
}
.mapbtn{

}
/* .planNum */
/* 	 planImg */
/* 	 planContFram */
/* 	 contTitle */
/* 	 contAddr */

</style>




</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--로고 자리 -->
				<img style="width: 200px;" src="./resources/headerImage/logo3.png"
					alt="logo">
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>

					<li><a class="page-scroll" href="/gabom/">Home</a></li>
					<li><a class="page-scroll" href="snsmain">SNS</a></li>
					<li><a class="page-scroll" href="myplan">내여행</a></li>
					<li><a class="page-scroll" href="housechoice">숙박</a></li>
					<li><a class="page-scroll" href="foodmain">맛집</a></li>
					<li><a class="page-scroll" href="#team">VIP</a></li>
					<li><a class="page-scroll" href="#contact">고객센터</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!--메뉴 자리 -->
	<header>
		<div class="he" id="titel"></div>
		<div class="he" id="totaldate"></div>
	</header>
	<section class="area">
		<div id="planarea">
			<div id="map" style="width: 100%; height: 600px;"></div>


			<div id="hc">
				<a>+숙소 선택하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>+체크리스트 </a>
			</div>

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
			<div id="t_destination">
				<button id="apiup" class="addbtn btn-lg btn-primary"
					data-toggle="modal" data-target="#area_modal"
					onclick="sigunguChange()">장소추가</button>
				<!-- onclick="modal" -->
				<button class="addbtn btn-lg btn-primary" onclick="memo()">메모추가</button>
				
				<button class="addbtn btn-lg btn-primary" id="savebtn" onclick="saveplan()">저장하기</button>
			</div>

			<!-- ---------------------------------areaCode기준 검색 모달--------------------------------- -->

			<div class="modal fade" id="area_modal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="area_title">여행 계획</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="api_search_body">
							시군구선택<select id="select_sigunguCode" title="시군구선택">

							</select>
							<table id="areatable" class="table table-bordered">
							</table>

							<div id="pagination"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
						</div>
					</div>
				</div>
			</div>

			<!-- ---------------------------------areaCode기준 검색 새창--------------------------------- -->





		</div>
		<div id="chatarea">
			채팅창
			<div id="chatareaCont"></div>
			<input id="chatInput">
			<button id='chatBtn'>입력</button>
		</div>

	</section>



</body>
<script>
var trip_data = ${detrip};
var areaCode = trip_data[0].trip_area;
console.log(areaCode)

var chatData = ${JsonchatData}; // 최근 날자로 채팅 가져오기
var nextDay= "${nextDay}" // 다음 검색할 날짜
var firstDayPlan = ${firstDayPlan}.tripData;
// console.log("chatData")
// console.log(chatData)
// console.log("nextDay")
// console.log(nextDay)
var sccket ;
var memberID = ${myinfo}.member_id;
var myPic = ${myinfo}.member_profile_picture.substring(0);
var tripNum = ${detrip}[0].trip_number;

let customOverlayy = [];
let distanceOverlayy = [];
let clickLinee =[];
let currentPlanDay = 1;

$(document).ready(function(){

	let clickLine ;
	
	//첫째날 시작
	 arr[1] = firstDayPlan
	 console.log("arr",arr);
	 console.log("points",points);
	 console.log("tripDate",arr[1]);
	 console.log("currentPlanDay",1);
	 let arrFrame = arr[1];
	 let pointsFrame = points[1];
	 createPlanForm(arrFrame,pointsFrame)
	 
	 //버튼 비 활성화  저장하기 opacity
	 $("#savebtn").prop("disabled", true);
	 $("#savebtn").css('opacity',0.5);
	 
})

//채팅 초기화 하기
for(let v of chatData ){
		//var myPic = ${myinfo}.member_profile_picture.substring(0);
		let cSomoimNumber = v.trip_number;
		let cId = v.chatting_name;
		let cCont = v.chatting_content;
		let cDate = getFormatDate(v.chatting_date);
		let cTime = getFormatOnlyTime(v.chatting_date)
		let cProfile =v.chatting_profile.substring(0);;
		
			if(cId===memberID){ //내가 보낸 데이터일 경우
				
				let media = $("<div class='myCommnet' data-date='"+cDate+"'></div>");
				let mediabody = $("<div class='media-body'></div>");
						
				var bodyName = $("<span><small><i> "+cTime+" </i></small></span><br>");
				var bodyCont = $("<span>"+cCont+"</span>");
				
				mediabody.append(bodyName);
				mediabody.append(bodyCont);
						
				media.append(mediabody);
				
				$("#chatareaCont").append(media)
				
	 		}else{ //타인이 보낸 데이터 일경우
	 			let media = $("<div class=' yourCommnet' data-date='"+cDate+"'></div>");
		 			
	 			let img = $("<img style='margin:3px;' src='"+cProfile+"'  class='mr-3 mt-3 rounded-circle' width='40px' height='40px' >")
						
	 			media.append(img);
		 		
	 			let mediabody = $("<div class='media-body'></div>");
		 		
	 			var bodyName = $("<span>"+cId+"<small><i> "+cTime+" </i></small></span><br>");
				var bodyCont = $("<span>"+cCont+"</span>");
				
				mediabody.append(bodyName);
		 		mediabody.append(bodyCont);
		 		
		 		media.append(mediabody);
		 		$("#chatareaCont").append(media)
	 		}
			
		
	}

$("#chatareaCont").scrollTop($("#chatareaCont")[0].scrollHeight);


//=========================================================================
	//scroll 이벤트 - 인피니티
	
	//스크롤이벤트
	let selectDay
	if(nextDay=="없음"){
		selectDay = "없음";
	}else{
		selectDay = new Date(nextDay);
	}
	
	let chatScrollToggle = 0;
	
	 $("#chatareaCont").scroll(function(e){
		 console.log("===")
        let scrollTop = e.target.scrollTop ;
		let scrollHeight = e.target.scrollHeight;
		let clientHeight = e.target.clientHeight;
		
        
        //chatDate.
        let index = 0 ;
        for(let v of e.target.children){
        	console.log("----");
         	let total = Number(v.offsetTop)+Number(v.offsetHeight) 
        	if(v.offsetTop < scrollTop && (total) > scrollTop ){
        		console.log("채팅날짜 이벤트 실행")
        		
        		$("#chatDate").text(v.dataset.date);
        		$("#chatDate").show();
        		break;
        	}
        	index++;
        }
        
        console.log("scrollTop : " +  scrollTop)
     	console.log("scrollHeight : " +  scrollHeight)
     	console.log("clientHeight : " +  clientHeight)

		console.log("toggle 이벤트 시작전  : " + chatScrollToggle)
		
		// 인피니티 시작이다.
        if (scrollTop <= (scrollHeight/8) && scrollHeight >= clientHeight && chatScrollToggle==0 && selectDay!='없음') {
        	console.log("이벤트발생")
        	console.log("toggle key : " + chatScrollToggle)
        	console.log("검색날짜 : " + getFormatDate(selectDay) )
        		
            	
        		chatScrollToggle=1;
        		setTimeout(() => {
        			console.log("셋타임아웃")
        			console.log("toggle key : " + chatScrollToggle)
        			chatScrollToggle=0;
        			
        			let chatData = {
    		    			"date":getFormatDate(selectDay),
    		    			"tripNum": tripNum,
    				}
            	//성공시 날짜변경
    			
					let iDate =getFormatDate(selectDay)
					let iDateChatFrame = $("<div id='yesterday' class='chatFrame' data-date='"+iDate+"'> </div>");
        		
        		
        		
            	$.ajaxSetup({         
    			    	  beforeSend : function(xhr){
    			      	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    				});//먼저 보냄
    				
    				$.ajax({
    					url:'tprest/selectDateChatting',
    					type:'post',
    					data:chatData,
    					dataType: "json",
    					success:function(data){
    						
    						//alert("success");
    						//console.log(data)
    						console.log("채팅 인피니티 성공--")
    						console.log(data)
    						
    						if(data.hasOwnProperty('date')){ // date가 있으면 진행
    							selectDay = new Date(data.date);
    						}else{ // 없으면 다음 date가 없다는 거임 
    							selectDay = '없음';	  // 그러니 ajax 안해도 된다는 걸 의미
    						}
    						
    						console.log(chatData)
    						console.log("select Day : "+ selectDay)
    						
    						for(let v of data.chattingtripDate ){
    							
    							//c chatting
    							let cSomoimNumber = v.somoim_number;
    							let cId = v.chatting_name;
    							let cCont = v.chatting_content;
    							let cDate = getFormatDate(v.chatting_date);
    							let cTime = getFormatOnlyTime(v.chatting_date)
    							let cProfile =v.chatting_profile.substring(0);
    							
									 if(cId===memberID){ //내가 보낸 데이터일 경우
    									
    									let media = $("<div class='myCommnet' data-date='"+cDate+"' ></div>");
    									let mediabody = $("<div class='media-body'></div>");
    											
    									
    									let bodyName = $("<span><small><i> "+cTime+" </i></small></span><br>");
    									let bodyCont = $("<span>"+cCont+"</span>");
    									
    									mediabody.append(bodyName);
    									mediabody.append(bodyCont);
    											
    									media.append(mediabody);
    									iDateChatFrame.append(media)
    									
    						 		}else{ //타인이 보낸 데이터 일경우
    						 			let media = $("<div class='yourCommnet' data-date='"+cDate+"'></div>");
    							 			
    						 			let img = $("<img src='"+cProfile+"' alt='John Doe' class='mr-3 mt-3 rounded-circle' width='40px' height='40px'>")
    							 		media.append(img);
    							 		
    						 			let mediabody = $("<div class='media-body'></div>");
    							 		
    						 			
    						 			let bodyName = $("<span>"+cId+"<small><i> "+cTime+" </i></small></span><br>");
    						 			let bodyCont = $("<span>"+cCont+"</span>");
    									
    							 		mediabody.append(bodyName);
    							 		mediabody.append(bodyCont);
    							 		
    							 		media.append(mediabody);
    							 		iDateChatFrame.append(media)
    						 		}
    							$("#chatareaCont").prepend(iDateChatFrame)
    							
    						}
    						
    						if(iDateChatFrame[0].clientHeight!=0){
    							$("#chatareaCont").scrollTop(iDateChatFrame[0].clientHeight);
        							
    						}
    						
    					},
    					error:function(error){
    						alert("fail")
    						console.log(error);
    					}
    				})
			}, 400);
        	
        	
        } else {
        	console.log("======아직 인피니티 아님===")
        	//$("#confirm").attr('disabled', true);
        }
	
	});
	
	
	
//================================

$("#apiup")[0].dataset.areacode=areaCode;
//$("#apiup").data("test",areaCode);
console.log(trip_data);

// console.log("area=",areaCode);
//날짜 변환
var sd = getFormatDate(trip_data[0].trip_start_date);
var ed = getFormatDate(trip_data[0].trip_end_date);

//header
var titel =$('<h1>'+trip_data[0].trip_title+'</h1>')
var totaldate =$('<h1>'+sd+' - '+ed+'</h1>')
//var area = $('<input type="hidden" value="'+areaCode+'"')
$("#apiup").append()
$("#titel").append(titel);
$("#totaldate").append(totaldate);
//--------------------------------페이징 --------------------------------------------

   



//--------------------------------areaCode로 지역 검색-------------------------------------
$("#apiup").on("click",function(e) {
	console.log('버튼클릭');
	var areaCode = e.target.dataset.areacode;
	var data = {"areaCode" : areaCode};
	console.log('data', data);
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	console.log("지역검색 시작");
	$.ajax({
		url : 'apisearch',
		type : 'get',
		data : data,
		dataType : 'json',
		success : function(msg) {
			console.log(msg);
			
			
			let container = $('#pagination');
            container.pagination({
                
                 dataSource: msg, //받아온 데이터
                 pageSize: 9,
                 callback: function (msg, pagination) { //데이터 찍어주는 부분
                    console.log("data=",msg);
                 
                    $("#areatable").empty();
        			
        			
        			let index = 1;
        			
        			let tr = $("<tr></tr>");
        			
        			console.log("size : " + msg.length);
        			console.log("몫 : " + parseInt(msg.length/3));
        			for(let i of msg){
        	
        				
        			    if(index%9===1 ){
        			    	let div = $("<div id='areadiv"+Math.ceil(index/9)+"' date-pagenum='"+Math.ceil(index/9)+"'></div>");
        			         $("#areatable").append(div); 
        			    }

        				let td = $('<td></td>');
        				let img = $("<img width='250px' height='150px' src='"+i.firstimage+"'><p>"+i.title+"</p>");
        				let a = $("<a href='tripdetailapi?contentid="+i.contentid+"', target='_blank'></a>");
        				a.append(img);
        				td.append(a);
        				tr.append(td);

        				if(index%3===0){
        					$("#areadiv"+Math.ceil(index/9)).append(tr);
        					tr = $("<tr></tr>")
        				}else if(index==msg.length){
        					$("#areadiv"+Math.ceil(index/9)).append(tr);
        					tr = $("<tr></tr>")
        				}
                   
//         				if(index%9===0){
        			         
//         			         $("#areatable").append(div);
//         		   		 }

                   
                   		index++;                
        			}
                    
                 }
            
             })         
			
			
		},
		error : function(jqXHR, status, e) {
			console.log("지역검색 에러");
		}
	}); //ajax End
	
}); //api 버튼 클릭 End
// 		}); //select function End


//----------------------------------------select 체인지 -----------------------------------------
	function sigunguChange() {
		var SEOUL = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구",	"송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var INCHEON = ["강화군","계양구","미추홀구","남동구","동구","부평구","서구","연수구","웅진군","중구"];
		var DAEJEON = ["대덕구","동구","서구","유성구","중구"];
		var DAEGU = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
		var GWANGJU = ["광산구","남구","동구","북구","서구"];
		var BUSAN = ["강서구","금서구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"];
		var ULSAN = ["중구","남구","동구","북구","울주군"];
		var SEJONG = ["새종특별자치시"];
		var GYEONGGI = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
		var KANGWON = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
		var CHUNGBUK = ["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","진천군","청원군","청주시","충주시","증평군"];
		var CHUNGNAM = ["공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군","홍성군","계룡시"];//아산시9, 예산군11
		var GYUNGBUK = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시"];
		var GYUNGNAM = ["거제시","거창군","고성군","김해시","남해군","마산시","밀양시","사천시","산청군","양산시","의령군","진주시","진해시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"];//양산시10,의령군12
		var JEONBUK = ["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"];
		var JEONNAM = ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];//여수시13, 영광군16
		var JEJU = ["남제주군","북제주군","서귀포시","제주시"];
		
		var selectItem = areaCode;
		console.log("selectItem=",selectItem);
		var changeItem;
		if(selectItem == 1){
			changeItem = SEOUL;
		}else if(selectItem == 2){
			changeItem = INCHEON;
		}else if(selectItem == 3){
			changeItem = DAEJEON;
		}else if(selectItem == 4){
			changeItem = DAEGU;
		}else if(selectItem == 5){
			changeItem = GWANGJU;
		}else if(selectItem == 6){
			changeItem = BUSAN;
		}else if(selectItem == 7){
			changeItem = ULSAN;
		}else if(selectItem == 8){
			changeItem = SEJONG;
		}else if(selectItem == 31){
			changeItem = GYEONGGI;
		}else if(selectItem == 32){
			changeItem = KANGWON;
		}else if(selectItem == 33){
			changeItem = CHUNGBUK;
		}else if(selectItem == 34){
			changeItem = CHUNGNAM;
		}else if(selectItem == 35){
			changeItem = GYUNGBUK;
		}else if(selectItem == 36){
			changeItem = GYUNGNAM;
		}else if(selectItem == 37){
			changeItem = JEONBUK;
		}else if(selectItem == 38){
			changeItem = JEONNAM;
		}else if(selectItem == 39){
			changeItem = JEJU;
		}
		console.log("changeItem",changeItem);
		console.log("selectItem=",selectItem);
		$("#select_sigunguCode").empty();
		var option = $("<option selected disabled>전체</option>");
		$("#select_sigunguCode").append(option);
		for(var count = 0; count<changeItem.length; count++){
			var option1 = $('<option id="sigunguSelect" data-areacode="'+selectItem+'" data-sigungucode="'+changeItem[count]+'" value="'+changeItem[count]+'">'+changeItem[count]+'</option>');
			$("#select_sigunguCode").append(option1);
		}
 	};
//-------------------------------------------------------------시군구코드select ajax----------------------------------
$(document).on("change","#select_sigunguCode", function (e){
	console.log("클릭되니?");
	var a =$("#select_sigunguCode option:selected");
//	console.log("a:"+a);
//	console.dir(a);
	console.log("222",a[0].dataset.areacode);
	console.log("223",a[0].dataset.sigungucode);
	
	var parms = {
		"areaCode": a[0].dataset.areacode ,
		"sigunguCode": a[0].dataset.sigungucode
	}
	console.log("parms",parms);
	
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	console.log("지역검색 시작");
	
	$.ajax({
		url : 'sigungusearch',
		type : 'get',
		data : parms,
		dataType : 'json',
		success : function(msg) {
			
		
			console.log(msg);
			let container = $('#pagination');
            container.pagination({
                
                 dataSource: msg, //받아온 데이터
                 pageSize: 9,
                 callback: function (msg, pagination) { //데이터 찍어주는 부분
                    console.log("data=",msg);
			
			$("#areatable").empty();
			
			let index = 1;
			
			let tr = $("<tr></tr>");
			
			console.log("size : " + msg.length);
			console.log("몫 : " + parseInt(msg.length/3));
			for(let i of msg){
	
				
			    if(index%9===1 ){
			    	let div = $("<div id='areadiv"+Math.ceil(index/9)+"' date-pagenum='"+Math.ceil(index/9)+"'></div>");
			         $("#areatable").append(div); 
			    }

				let td = $('<td></td>');
				let img = $("<img width='220px' height='150px' src='"+i.firstimage+"'><p>"+i.title+"</p>");
				let a = $("<a href='tripdetailapi?contentid="+i.contentid+"', target='_blank'></a>");
				a.append(img);
				td.append(a);
				tr.append(td);

				if(index%3===0){
					$("#areadiv"+Math.ceil(index/9)).append(tr);
					tr = $("<tr></tr>")
				}else if(index==msg.length){
					$("#areadiv"+Math.ceil(index/9)).append(tr);
					tr = $("<tr></tr>")
				}
           
// 				if(index%9===0){
			         
// 			         $("#areatable").append(div);
// 		   		 }
           
           		index++;                
			}
                 }
            })   
		},
		error : function(jqXHR, status, e) {
			console.log("지역검색 에러");
		}
	}); //ajax End
	
	
	
});


////test array
let testarr = {};
testarr["1"]=[1,2,3]
console.log("testarr",testarr)
testarr.hasOwnProperty("1");
console.log(testarr.hasOwnProperty("1"));

//////////////////////////////////////// tripha 
let planidx = 1;
let arr = {}; //처음에 DB 내용을 넣고 추가할때마다 여기다 쌓는다.

for(let v in trip_data ){
	let k = (parseInt(v)+1);
	arr[k]=[];
}
console.log("arrr")
console.log(arr)

let points ={} ;
for(let v in trip_data ){
	let k = (parseInt(v)+1);
	points[k]=[];
}

let tripDate = [];
for(let v in trip_data ){
	let k = (parseInt(v)+1);
	tripDate.push(k);
}


 

function destinationselect(params) { //tripdetailapi 데이터 받아오는곳
	$("#savebtn").prop("disabled", false);
	 $("#savebtn").css('opacity',1);
	 
	points[currentPlanDay]=[];  // 초기화
	$("#detailTrip").empty(); // 여행계획 비워야하고
	arr[currentPlanDay].push(params); // 계획 날짜에 맞게 추가해줘야함
	console.log("arr",arr);
	console.log("points",points);
	console.log("tripDat",tripDate);
	console.log("currentPlanDay",currentPlanDay);
	
	let arrFrame = arr[currentPlanDay];
	let pointsFrame = points[currentPlanDay];
	// 해당하는 var에 대해 수정해야함. 그럼 포인트도 해당 번호에 맞게 초기화와 추가가 이루어져야함.
	 
	 createPlanForm(arrFrame,pointsFrame);
} 






//-------------------------------------------------------------------------------------
//date 날짜 들어가는 div

 for(i of trip_data){
	var li =$('<li data-trnum="'+i.trip_number+'" class="number">'+i.trip_day+'</li>');
	$("#date").append(li);
} 


 $("#left").on("click",function(e){
	 $("#savebtn").prop("disabled", true);
	 $("#savebtn").css('opacity',0.5);
	 
		var $lastNumber = $(".number").length-1
		var $li = $(".number")[$lastNumber];
		$("#date").prepend($li);
		var tripNum = $(".number")[0].dataset.trnum;
		currentPlanDay = $('#date li:nth-child(1)').text();
		console.log("여행번호 : ", tripNum)
		console.log("현재페이지 : ", currentPlanDay)
		
		var Data = {
		"day" : currentPlanDay,
		"tripNum" : tripNum
	}
	
	$.ajaxSetup({         
    	beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    });//먼저 보냄
    				
    $.ajax({
    	url:'tprest/movePlanDay',
    	type:'post',
    	data:Data,
    	dataType: "json",
    	success:function(data){
    		console.log("success",data)
    		
    		var dayy = data.day;;
    		var tripNumm = data.tripNum;
    		var dataArr = data.tripData;
		
    		points[currentPlanDay]=[];    // 좌표 초기화
    		initMapKaKao();
    		$("#detailTrip").empty();
					
			//가장 중요한 부분
			arr[dayy] = data.tripData
			
			console.log("arr",arr);
			console.log("points",points);
			console.log("tripDate",arr[dayy]);
			console.log("currentPlanDay",dayy);
	
 		let arrFrame = arr[dayy];
 		let pointsFrame = points[dayy];
	
 		createPlanForm(arrFrame,pointsFrame)
    		
    	},
    	error:function(error){
			alert("fail")
			console.log(error);
		}
	})
		
})



 $("#right").on("click",function(e){
	 $("#savebtn").prop("disabled", true);
	 $("#savebtn").css('opacity',0.5);
	 
	 	var trnum =e.target.dataset.trnum
		var $li = $(".number")[0];
		$("#date").append($li);
		var tripNum = $(".number")[0].dataset.trnum;
		currentPlanDay = $('#date li:nth-child(1)').text();
		console.log("여행번호 : ", tripNum)
		console.log("현재페이지 : ", currentPlanDay)
		
		
	var Data = {
		"day" : currentPlanDay,
		"tripNum" : tripNum
	}
	
	$.ajaxSetup({         
    	beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    });//먼저 보냄
    				
    $.ajax({
    	url:'tprest/movePlanDay',
    	type:'post',
    	data:Data,
    	dataType: "json",
    	success:function(data){
    		console.log("success",data)
    		
    		var dayy = data.day;;
    		var tripNumm = data.tripNum;
    		var dataArr = data.tripData;
		
    		points[currentPlanDay]=[];    // 좌표 초기화
    		initMapKaKao();
    		$("#detailTrip").empty();
					
			//가장 중요한 부분
			arr[dayy] = data.tripData
			
			console.log("arr",arr);
			console.log("points",points);
			console.log("tripDate",arr[dayy]);
			console.log("currentPlanDay",dayy);
	
 		let arrFrame = arr[dayy];
 		let pointsFrame = points[dayy];
	
 		createPlanForm(arrFrame,pointsFrame)
    		
    	},
    	error:function(error){
			alert("fail")
			console.log(error);
		}
	})
		
		
 })

 $(document).on("click",".upPlan",function(e){
	 $("#savebtn").prop("disabled", false);
	 $("#savebtn").css('opacity',1);
	 
	 	console.log("up")
	 	let tripNum = $(".number")[0].dataset.trnum;
	 	let planidx = e.target.dataset.idx;
	 	points[currentPlanDay]=[];  //초기화
		currentPlanDay = $('#date li:nth-child(1)').text();
		console.log("여행번호 : ", tripNum)
		console.log("현재페이지 : ", currentPlanDay)
		console.log("내가 누른 버튼 번호 :",planidx)
		console.log("-arr-",arr);
	//	console.log("-0-",arr[currentPlanDay])
		
		
		
		if(planidx == 0){  // 이렇게 하면 안도는데 뭔가 이상해..........................하.....
			let arrCopy = arr[currentPlanDay].splice(planidx, 1); //없애버리고	  // 삭제된놈이 담긴다.
			arr[currentPlanDay].push(arrCopy[0])
		}else{ // 그냥 1칸씩 위로
			console.log("plan+ " , planidx-1)
			let temp = arr[currentPlanDay][planidx];
			arr[currentPlanDay][planidx] = arr[currentPlanDay][planidx-1];
			arr[currentPlanDay][planidx-1] = temp; 
		}
		
		//삭제
		initMapKaKao()
		//재생성
		$("#detailTrip").empty(); // 여행계획 비워야하고
		console.log("arr",arr);
		console.log("points",points);
		console.log("tripDat",tripDate);
		console.log("currentPlanDay",currentPlanDay);

		let arrFrame = arr[currentPlanDay];
		let pointsFrame = points[currentPlanDay];
		// 해당하는 var에 대해 수정해야함. 그럼 포인트도 해당 번호에 맞게 초기화와 추가가 이루어져야함.
		createPlanForm(arrFrame,pointsFrame);
		
 })


$(document).on("click",".downPlan",function(e){
	$("#savebtn").prop("disabled", false);
	 $("#savebtn").css('opacity',1);
	 	console.log("down")
	 	let tripNum = $(".number")[0].dataset.trnum;
	 	let planidx = e.target.dataset.idx;
	 	points[currentPlanDay]=[];  //초기화
		currentPlanDay = $('#date li:nth-child(1)').text();
		console.log("여행번호 : ", tripNum)
		console.log("현재페이지 : ", currentPlanDay)
		console.log("내가 누른 버튼 번호 :",planidx)
		console.log("-arr-",arr);
	//	console.log("-0-",arr[currentPlanDay])
		
		
		
		if(planidx == arr[currentPlanDay].length-1){
			console.log("마지막 버튼 클릭")
 			let arrCopy = arr[currentPlanDay].splice(planidx, 1); //없애버리고	  // 삭제된놈이 담긴다.
 			arr[currentPlanDay].unshift(arrCopy[0])
		}else{ // 그냥 1칸씩 밑으로
			let nextidx = parseInt(planidx)+1
			let temp = arr[currentPlanDay][planidx];
			arr[currentPlanDay][planidx] = arr[currentPlanDay][nextidx];
			arr[currentPlanDay][nextidx] = temp; 
		}
	
		//삭제
		initMapKaKao()
		//재생성
		$("#detailTrip").empty(); // 여행계획 비워야하고
		console.log("arr",arr);
		console.log("points",points);
		console.log("tripDat",tripDate);
		console.log("currentPlanDay",currentPlanDay);

		let arrFrame = arr[currentPlanDay];
		let pointsFrame = points[currentPlanDay];
		// 해당하는 var에 대해 수정해야함. 그럼 포인트도 해당 번호에 맞게 초기화와 추가가 이루어져야함.
		createPlanForm(arrFrame,pointsFrame);
	
	
	
 })




//------------------------------------------------------------------------------------날짜 변환 클릭




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











//=====================================하동원 채팅 시작 건들지 말것, scroll 이벤트
 //채팅
 	
 	//console.log("나의 정보")
 	console.log(${myinfo})
 	//console.log(memberID)
 	connect();
	function connect(){ 
		
		var weAddress="ws://localhost:80/gabom/detailplan/ChatTrip?trip_number="+tripNum; // 번호 수정해야함
		 var ws = new WebSocket(weAddress);
		 socket = ws;
		    ws.onopen = function () {   //커넥션이 연결됬을때
		        console.log('Info: connection opened.');
		        
		        ws.onmessage = function (event) {    // 메시지 받을 때 실행함
		            console.log("receiveMessage : " + event.data+'\n');
		            
		            var data = JSON.parse(event.data);
		            var date = new Date();
		            var chatTime = 	getFormatOnlyTime(date);
		            console.log("---------------")
		            console.log(data);
		    		//여기서 데이터 쏴주고, 쏴준후 db 저장해야하는데 트랜잭션...어떻게?
		    				
		    				
		    		if(data.id === memberID ){ //내가 보낸 데이터 일경우
		    			//chattingRoom	
		    			
		    			var media = $("<div class='  myCommnet' data-date='"+getFormatDate(new Date())+"' ></div>");
						var mediabody = $("<div class='media-body'></div>");
						
						var bodyName = $("<span><small><i> "+chatTime+" </i></small></span><br>");
						var bodyCont = $("<span>"+data.msg+"</span>");
						mediabody.append(bodyName);
						mediabody.append(bodyCont);
						
						media.append(mediabody);
						$("#chatareaCont").append(media)
						
						//$("#chattingRoom").append($("<div class='myCommnet' >"+data.msg+"</div>"))
		    		}else{ // 내가 보낸 데이터가 아닐경우

						var media = $("<div class='yourCommnet'></div>");
						
						var img = $("<img style='margin:3px;' src='"+myPic+"'  class='mr-3 mt-3 rounded-circle' width='40px' height='40px' >")
						media.append(img);
						
						var mediabody = $("<div class='media-body'></div>");
						
						
						var bodyName = $("<span>"+data.id+"<small><i> "+chatTime+" </i></small></span><br>");
						var bodyCont = $("<span>"+data.msg+"</span>");
						mediabody.append(bodyName);
						mediabody.append(bodyCont);
						
						media.append(mediabody);
						$("#chatareaCont").append(media)
		    		}
		    		
		    		//console.log($("#chattingRoom"));
		    		//console.dir($("#chattingRoom"));
		    		$("#chatareaCont").scrollTop($("#chatareaCont")[0].scrollHeight);
		        };
		       
		    
		    };

			
		    ws.onclose = function (event) { 
		    	console.log('Info: ', event);
		    	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
				   
		    };
		    
		    ws.onerror = function (err) { console.log('Error: ', err); };
	 }

	
	//chatInput
	//chatBtn

	$('#chatBtn').on('click', function(evt) {
      console.log("실행되는건가?");
	  evt.preventDefault();
	  if (socket.readyState !== 1) return;
	  		
    	  let data = {
  	  			"id" : memberID,
    			"msg" :  $('#chatInput').val(),
  	  			"tripNum" : tripNum,
  	  	  		"profilePicture" : "."+myPic
    	  }
  	  	  let resultChatData = JSON.stringify(data);
    	  console.log("resultChatData : " +resultChatData)
    	  // 소켓에 보내기
    	  socket.send(resultChatData);
    	  
    	  
    	  //-------------채팅내용 저장
	    	//아이디, 내용, 소모임 번호
	    	var date = new Date();
    	  
	    	var chatData = {
	    			"id" : memberID,
	    			"msg" :  $('#chatInput').val(),
	  	  			"tripNum" : tripNum,
	    			"date" : date
	    	}
	    	
	    	console.log(chatData);
	    	
	    	$.ajaxSetup({         
		    	  beforeSend : function(xhr){
		      	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			});//먼저 보냄
			
			$.ajax({
				url:'tprest/inserttripchatting',
				type:'post',
				data:chatData,
				success:function(data){
					alert("success");
					console.log(data)
					 $('#chatInput').val("");
			    	 $('#chatInput').focus();
					
				},
				error:function(error){
					alert("fail")
					console.log(error);
				}
			})
    	  
    });
//================================================
	
 	
 	
 	
 	
 	
 	
 	
//================================================
	//온니 시간만 오후/오전 
	function getFormatOnlyTime(strdate){
		var date = new Date(strdate);
		
		var time = date.getHours();
		var min = date.getMinutes();
		var result ;
		if(time > 12){
			result = "오후 "+(time-12)+"시 "+min+"분"
		}else{
			result = "오전 "+time+"시 "+min+"분"
		}
		return result;
	}
	
	function getFormatDate(strdate){
		var date = new Date(strdate);
		console.log(date);
  		 var year = date.getFullYear();              //yyyy
    	var month = (1 + date.getMonth());          //M
    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    	var day = date.getDate();                   //d
    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    	return  year + '/' + month + '/' + day;
	}
//===================================
	
// -------------------------------------------여행 계획 ------------------------------------------------;;
function setBounds(bounds, points) {
	     // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	     // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	     map.setBounds(bounds);
}

// 길이 구해주는 펑션
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

//여행 취소.
$(document).on('click',".cancelPlan",function(e){
	$("#savebtn").prop("disabled", false);
	 $("#savebtn").css('opacity',1);
	//마커 성공
	initMapKaKao()
	// 위까진 지도 초기화
	
	
	// 해당하는 var에 대해 수정해야함. 그럼 포인트도 해당 번호에 맞게 초기화와 추가가 이루어져야함.
	//-------------
	points[currentPlanDay]=[];    // 좌표 초기화
	$("#detailTrip").empty();
	let choiceIdx =e.target.dataset.idx  // 몇번쨰 클릭했는지에 대한 번호
	arr[currentPlanDay].splice(choiceIdx, 1); // 해당 클릭한 놈 삭제

	console.log("arr",arr);
	console.log("points",points);
	console.log("tripDat",tripDate);
	console.log("currentPlanDay",currentPlanDay);
	
	let arrFrame = arr[currentPlanDay];
	let pointsFrame = points[currentPlanDay];
	
	
	createPlanForm(arrFrame,pointsFrame)
	
})
	

const saveplan= () => {
	console.log("save")//
	console.log("현재페이지 : " +currentPlanDay )
	console.log("arr",arr[currentPlanDay])
	console.log("현재 여행 페이지 : " + trip_data[0].trip_number);
	var jsonTripData = JSON.stringify(arr[currentPlanDay])
	console.log(jsonTripData)
	
	var Data = {
		"day" : currentPlanDay,
		"tripNum" : trip_data[0].trip_number,
		"tripData" : jsonTripData
	}
	
	$.ajaxSetup({         
    	beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    });//먼저 보냄
    				
    $.ajax({
    	url:'tprest/insertPlanDetail',
    	type:'post',
    	data:Data,
    	dataType: "json",
    	success:function(data){
    		console.log("success",data)
    		
    		var dayy = data.day;;
    		var tripNumm = data.tripNum;
    		var dataArr = data.tripData;

    		points[currentPlanDay]=[];    // 좌표 초기화
	 		$("#detailTrip").empty();
	 		initMapKaKao();
					
			//가장 중요한 부분
			arr[dayy] = data.tripData
			
			console.log("arr",arr);
			console.log("points",points);
			console.log("tripDate",arr[dayy]);
			console.log("currentPlanDay",dayy);
	
 		let arrFrame = arr[dayy];
 		let pointsFrame = points[dayy];
	
	
 		createPlanForm(arrFrame,pointsFrame)
    		
    	},
    	error:function(error){
			alert("fail")
			console.log(error);
		}
	})
   
	
}

	
const createPlanForm = (arrFrame,pointsFrame) =>{
	
	for( let v of arrFrame){
		console.log("포문 도냐?")
		console.log("v",v)
		
		let planFrame = $("<div class='planFrame'>  </div>");
		let planNum = $("<div class='planNum'> <button type='button' class='btn btn-primary idxbtn'> <span class='badge badge-light'>"+planidx+"</span> </button> </div>");
		let planImg = $("<div class='planImg'><img src='"+v.trip_img+"' width='50px' height='50px' ></div>");
		
		planFrame.append(planNum);
		planFrame.append(planImg);
		
		
		let planContFram = $("<div class='planContFram'> </div>");
		let contTitle = $("<div class='contTitle'>"+v.trip_title+"</div>");
		let contAddr= $("<div class='contAddr'>"+v.trip_destination+" </div>");
		planContFram.append(contTitle);
		planContFram.append(contAddr);
		
		planFrame.append(planContFram);
		
		let cancelPlan = $("<div ><button class='cancelPlan' data-idx='"+(planidx-1)+"'>x</button></div>");
		planFrame.append(cancelPlan);
		
		let updownFrame = $("<div ></div>");
		let upPlan = $("<div ><button class='upPlan' data-idx='"+(planidx-1)+"'>up</button></div>");
		let downPlan = $("<div ><button class='downPlan' data-idx='"+(planidx-1)+"'>down</button></div>");

		updownFrame.append(upPlan);
		updownFrame.append(downPlan);
		planFrame.append(updownFrame);
		
		$("#detailTrip").append(planFrame);
		
		
		pointsFrame.push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)); //추가 할 마커 저장하기 arr에...
		console.log("pointsFrame",pointsFrame);
	
		
		let clickPosition = new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint); // 클릭한 좌표...(가상)
		
		if( planidx >= 2){
			console.log(planidx);

			let clickLine = new kakao.maps.Polyline({
            	map: map, // 선을 표시할 지도입니다 
            	path: [pointsFrame[planidx-2] ,pointsFrame[planidx-1]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            	strokeWeight: 3, // 선의 두께입니다 
            	strokeColor: '#db4040', // 선의 색깔입니다
            	strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            	strokeStyle: 'solid' // 선의 스타일입니다
        	});
			
			clickLinee.push(clickLine);
			
			let distance = Math.round(clickLine.getLength());
			
			displayCircleDot(pointsFrame[planidx-1], distance)
		
		}
	
		planidx++;
	
	
	} 
	 
	 //-----------지도 마커에 따른 재위치 선정
	 var bounds = new kakao.maps.LatLngBounds();    
	 for (i = 0; i < pointsFrame.length; i++) {
	     // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	// 커스텀 오버레이에 표시할 내용입니다     
	// HTML 문자열 또는 Dom Element 입니다 
	var content = "<button  type='button' class='btn btn-primary idxbtn mapbtn'> <span class='badge badge-light'>"+(i+1)+"</span> </button> ";
	// 커스텀 오버레이를 생성합니다
	var custom = new kakao.maps.CustomOverlay({
   	 position: pointsFrame[i],
   	 content: content   
	});
	customOverlayy.push(custom);
	// 커스텀 오버레이를 지도에 표시합니다
 	customOverlayy[customOverlayy.length-1].setMap(map);
	
	   
	
	 bounds.extend(pointsFrame[i]);
	 }
	 
	 setBounds(bounds)    // 재설정매소드
	 
 	
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
	

</script>

</html>