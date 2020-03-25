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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>   
<!-- 페이징 처리 플러그인 -->   
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/cbpAnimatedHeader.js"></script>
<script src="./resources/js/jquery.appear.js"></script>
<script src="./resources/js/SmoothScroll.min.js"></script>
<script src="./resources/js/theme-scripts.js"></script>

<style>
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
	margin: 0 50%;
	width: 300px;
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
#chatarea {
	border: 1px solid black;
	margin: 0 5% 0 2%;
	margin-top: -50px;
	width: 28%;
	overflow: auto;
	background-color: #99BFE4;
	height: 700px;
}
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


			<div id="day">
				<i class="fas fa-caret-left"></i>
				<div>여행 날(일단위)</div>
				<i class="fas fa-caret-right"></i>
			</div>

			<div id="hc">
				<a>+숙소 선택하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>+체크리스트 </a>
			</div>
			<div id="t_destination">
				<button id="apiup" class="addbtn btn-lg btn-primary"
					data-toggle="modal" data-target="#area_modal" onclick="sigunguChange()">장소추가</button>
				<!-- onclick="modal" -->
				<button class="addbtn btn-lg btn-primary" onclick="memo()">메모추가</button>
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
							시군구선택<select id="select_sigunguCode" title="시군구선택" >

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
		<div id="chatarea">채팅창</div>
	</section>



</body>
<script>
var trip_data = ${detrip};
var areaCode = trip_data[0].trip_area;
console.log(areaCode)
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
        				let img = $("<img width='150px' height='150px' src='"+i.firstimage+"'>");
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
				let img = $("<img width='150px' height='150px' src='"+i.firstimage+"'>");
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