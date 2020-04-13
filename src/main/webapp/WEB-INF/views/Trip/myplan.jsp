<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My plan</title>
<link rel="icon" href="favicon.ico">
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<!-- nav영역  -->


<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./resources/css/coming-soon.min.css" rel="stylesheet">


<style>
a{
cursor:pointer;
}
body {
	overflow: hidden;
}

#out {
	display: flex;
}

#trp {
	width: 100%;
	height: 1100px;
	background-color: rgba(255, 255, 255, 0.7);
	margin-top: 80px;
	text-align: center;
}

#mylist {
	font-size: 20px;
	font-weight: bold;
	width: 100%;
}

.bar {
	text-align: center;
	font-size: 30px;
}

#table {
	margin: 20px 10px;
}

tr {
	text-align: center;
	margin: 15px 0;
}

/* 프로필영역 */
#main {
	width: 100%;
	margin-top: 10%;
	color: white;
}

#ct {
	width: 450px;
	height: 1100px;
	background-color: rgba(0, 46, 102, 0.8);
	margin-top: 80px;
	text-align: center;
}



#mql {
	width: 100%;
	display: none;
}

#fql {
	width: 100%;
	display: none;
}

/* 버튼 */
#jbtn {
	float: right;
	margin: 10px 50px;
	font-size: 15px;
	width: 60%;
}

#t_title {
	cursor: pointer;
	text-decoration: none;
	text-align: left;
}

#rqmbtn {
	width: 100%;
	color: black;
}

#rqbtn {
	width: 100%;
	color: black;
}

/* modal */
#f {
	width: 400px;
	margin: 10px;
	display: flex;
}

#fbtn {
	float: right;
	border-radius: 10px;
	height: 50px;
    margin-top: 20px;
}

/* 버튼 */
.applybtn {
	margin-left: 10px;
	border-radius: 30px;
	width: 30px;
}
.f_img{
width:100px;
height:100px;
border-radius:100px;
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
					<!-- <span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> -->
				</button>

				<!--로고 자리 -->
				<a href="/gabom/"><img style="width: 200px;"
					src="./resources/headerImage/logo3.png" alt="logo"></a>
			</div>


			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>

					<li><a class="page-scroll" href="/gabom/">Home</a></li>
					<li><a class="page-scroll" href="snsmain">SNS</a></li>
					<li><a class="page-scroll" href="trip">여행계획</a></li>
					<li><a class="page-scroll" href="housechoice">숙박</a></li>
					<li><a class="page-scroll" href="foodmain">맛집</a></li>
					<li><a class="page-scroll" href="somoim/mainsomoim">소모임</a></li>
					<li><a class="page-scroll" href="#contact">고객센터</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>




	<!-- <div class="overlay"></div> -->
	<video playsinline="playsinline" autoplay="autoplay" muted="muted"
		loop="loop">
		<source src="./resources/css/bg.mp4" type="video/mp4">
	</video>


	<div id="out">

		<div class="masthead" id="ct">

			<div id="main">
				<div id="propic"></div>
				<div id="title"></div>
				<div id="reauest">
					<div id="rqm">
						<button id="rqmbtn" class=" btn-lg btn-primary" onclick="myreq()">여행
							요청리스트</button>
						<div id="mql"></div>
					</div>
					<div id="rql">
						<button id="rqbtn" class=" btn-lg btn-primary" onclick="freq()">요청
							상황</button>
						<div id="fql"></div>
					</div>
				</div>
			</div>
		</div>


		<div class="masthead" id="trp">
			<div id="table">
				<table id="mylist">

				</table>
			</div>
		</div>
	</div>

	<%-- <div>
      <jsp:include page="/WEB-INF/views/footer.jsp"/>
   </div>  --%>





	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<!-- <span aria-hidden="true">&times;</span> -->
					</button>
				</div>
				<div class="modal-body">
					<div id="trip_friend"></div>
					<div id="flist"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 날짜변경 모달 -->
	<div class="modal" id="dateChangeModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="dateChangeTitle">날짜변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div>
						변경전 : <span id="dateChange_bf"></span>
					</div>
					<div>
						변경후 : <span id="dateChange_af"></span>
					</div>
					<input type="hidden" id="newStartDay" name="newStartDay"> 
					<input type="hidden" id="newLastDay" name="newLastDay"> 
					<input type="hidden" id="tripNumber" name="tripNumber">

					<div>
						여행 제목 : <input id="inputTripTitle" type="text" ><br>
						여행 날짜 : <input id="inputfirstday" type="text" placeholder="여행 첫날짜" onfocus="(this.type='date')">
						<button type="button" class="btn btn-danger"  id="inputfirstdaybtn">등록</button>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						id="dataChangeSave" disabled="true">변경</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>




<!-- 멤버보기  -->
<div class="modal" id="member" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="m_list"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="c-modal btn btn-secondary">Close</button>
      </div>
    </div>
  </div>
</div>






	<footer>
		<jsp:include page="/WEB-INF/views/footer/tripfooter.jsp" />
	</footer>

	<!-- Custom scripts for this template -->
	<script src="./resources/js/coming-soon.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/cbpAnimatedHeader.js"></script>
	<script src="./resources/js/jquery.appear.js"></script>
	<script src="./resources/js/SmoothScroll.min.js"></script>
	<script src="./resources/js/theme-scripts.js"></script>

</body>

<script>
 var socketalarm; // 소켓 시작
 var rangeDay ;//날짜변경할때 필요한... 차이
 var mylist =${myplanlist};
 console.log("내 여행 목록",mylist);
 console.log(mylist.trip_area);
 var order;
 
 
 
 
 
 
 
 var myinfo =${memberinfo};
 console.log("myinfo",myinfo);
 var friend =${friendlist};
 console.log("친구 리스트 ",friend);
 var friend =${friendlist};
 console.log(friend);
 
 var reql =${reqlist};
 console.log(reql);
 var reqmel =${myreqlist};
 console.log(reqmel);

 
 
 
 //console.log(sd, ed)
 //------------------------------------------------------------------데이터 영역
 
 var propic =$('<img style="width:300px;border-radius:70%;" src="'+myinfo[0].member_profile_picture+'">');
 $("#propic").append(propic);
 
 var n =$('<h1>'+myinfo[0].member_name+'님'+'</h1><h3>반갑습니다<br><br>어디로 떠나실 계획인가요?</h3>')
 $("#title").append(n);
 
  for(i of reqmel){//내가 받은 리스트 
	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
	 var sbtn=$('<button class="sbtn btn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
	 var cbtn=$('<button class="cbtn btn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
	 $("#mql").append(tr_id);
	 $("#mql").append(sbtn);
	 $("#mql").append(cbtn);
 }
 
 for (i of reql){//내가 보낸 리스트
	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
	 
	 $("#fql").append(sh_id);
 } 
 
 
 
 
/*   $("#mql").hide();
 $("#fql").hide(); */ 
  function myreq() {//내가 받은 요청사항
	  var x = document.getElementById("mql");
	  if (x.style.display === "block") {
	    x.style.display = "none";
	  } else {
	    x.style.display = "block";
	  }
	}
 
 
 function freq() {//내가 보낸 요청사항 
	  var y = document.getElementById("fql");
	  if (y.style.display === "block") {
		 y.style.display = "none";
	} else {
         y.style.display = "block";
	 }
	}
 
 //-------------------------------------------------------------------유저 정보 영역
 	let thead = $("<tr><th class='bar' id='t'>여행 제목</th><th class='bar'>여행지</th><th class='bar'>여행 날짜</th><th class='bar'>멤버</th><th class='bar'>친구와 함께하기</th><th class='bar'>변경하기</th><th  class='bar'>삭제하기</th></tr>")
	$("#mylist").append(thead) 
  
  let idx = 0;	
  for(i of mylist) { //게시글
	  
	  console.log(i.trip_area);
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
	  
 	 let sd = getFormatDate(i.trip_start_date);
 	let ed = getFormatDate(i.trip_end_date);	  
 	
 	let tr = $('<tr></tr>'); 
    
    // 추천에 승인 추가 if문
    console.log("tripendday2",new Date(i.trip_end_date));
    console.log("today1",new Date());
    console.log(new Date(i.trip_end_date) < new Date());

    let title;
    if(new Date(i.trip_end_date) < new Date()){  // 날짜 지났으니 버튼 추가
    	
    	if(i.trip_plan_appry_status == 2){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/c.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}else if(i.trip_plan_appry_status == 1){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/d.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}else if(i.trip_plan_appry_status == 0){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/p.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}
    	
    
    
    }else{
        title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a></td>');    	
    }
   
    let area =$('<td>'+i.trip_area+'</td>');
    let date =$('<td>'+sd+' - '+ed+'</td>');
    let btn =$('<td><button style="margin-left:5px;" id="jbtn" class="joinbtn btn btn-info" data-toggle="modal" data-target="#exampleModal"  data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
    let member =$('<td><button class="mbbtn btn btn-info" data-tnum="'+i.trip_number+'">멤버보기</button></td>')
    let changeDate =$('<td><button id="changebtn"  class="changeDateBtn btn btn-info" data-order="'+idx+'" data-toggle="modal" data-target="#dateChangeModal"  data-tripnum ="'+i.trip_number+'">날짜 변경</button></td>');
    let deleteplan =$('<td><button id="deleteplanbtn"  class="deleteplanbtn btn btn-danger" data-order="'+idx+'"  data-tripnum ="'+i.trip_number+'">삭제하기</button></td>');
    
    
    $("#mylist").append(tr);
    $(tr).append(title);
    $(tr).append(area);
    $(tr).append(date);
    $(tr).append(member);
    $(tr).append(btn);
    $(tr).append(changeDate);
    $(tr).append(deleteplan);
    

    idx++;
 }
 
 
 
 
 
 
 
  $(document).on('click',".movePlan", function(e) {
  	console.log(e.target.dataset.name);
  	var number = e.target.dataset.name;
  	location.href="detailplan?trip_number="+number;
  });
  
  $(document).on('click', ".mbbtn", function name(e) {// 멤버보기 클릭시 
		
	  $("#member").show();
	  
	  var trip_number = e.target.dataset.tnum
	  
	  $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/showmember",
         type: 'post',
         data :{"trip_number":trip_number},
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){ 
        	console.log("member",data);
        	 $("#m_list").empty();

         
         for(i of data){
        	 
        	var f_div =$('<div style="display:flex"></div>');
        	var f_img = $('<img class="f_img" src="'+i.member_profile_picture+'">');
        	var freind =$('<div id="f"><h4>'+i.member_name+'님'+'</h4></div>');
        	 
        	 $("#m_list").append(f_div);
        	 f_div.append(f_img);
        	 f_div.append(freind);
         }
         },
         error:function(error){
            alert("실패.");
               console.log(error);
            }
 
 
	});//ajax 끝
})
  
  $(document).on('click', ".c-modal", function () {
	 
	  $("#member").hide();
})
  
  
  
  
  
  
  
  
  
//------------------------------------------------------------------------------------------게시글 영역
$(".joinbtn").on('click', function(e) { // 친구 추가시 여행번호 
	var trip_number = e.target.dataset.tripnum
	console.log(trip_number);
	
	//flist
	
	$("#flist").empty();
	
	for(i of friend){
	var f_div =$('<div style="display:flex"></div>');
	var f_img = $('<img class="f_img" src="'+i.member_profile_picture+'">');
	var freind =$('<div id="f"><h4>'+i.member_name+'님'+'</h4></div>');
	var fbtn =$('<button id="fbtn" class="fbtn btn" data-fid="'+i.friend_id+'" data-tnum="'+trip_number+'">추가하기</button>')
	$("#flist").append(f_div);
	$(f_div).append(f_img);
	$(f_div).append(freind);
	$(f_div).append(fbtn);
	
	}
	
})
//---------------------------------------------------날짜변경이벤트
$(".changeDateBtn").on('click', function(e) { 
	$("#dataChangeSave").prop("disabled",true)
	$("#inputfirstdaybtn").prop("disabled",true)
	order =  e.target.dataset.order;
	let trip_number = e.target.dataset.tripnum;
	console.log(trip_number);
	$("#tripNumber").val(trip_number);
	console.log(e.target.parentNode.parentElement.cells[2].innerText)   // 부모 tr에서 3번째td내용 가져오기 ( 날짜 )
	let originDay = e.target.parentNode.parentElement.cells[2].innerText;
	$("#dateChange_bf").text(originDay);
	let Triptitle = e.target.parentNode.parentElement.cells[0].innerText;
	$("#inputTripTitle").val(Triptitle);
	
	let oriStartDay= getFormatDateDB(new Date(mylist[order].trip_start_date));
	$("#inputfirstday").val(oriStartDay);
	
			
	//초기화 
	$("#inputfirstday").prop("type","text");
	$("#inputfirstday").prop("placeholder","여행 첫날짜");
	$("#dateChange_af").text("")
	$("#newStartDay").val(getFormatDateDB(new Date(mylist[order].trip_start_date)));  // 초기화 말고 여행 첫날 이런걸로
	$("#newLastDay").val(getFormatDateDB(new Date(mylist[order].trip_end_date)));
	
	order =  e.target.dataset.order;
	var oriFirstDay = new Date(mylist[order].trip_start_date);
	var oriLastDay = new Date(mylist[order].trip_end_date);
	console.log("oriFirstDay",oriFirstDay);
	console.log("oriLastDay",oriLastDay);
	console.log("차이",oriLastDay-oriFirstDay)
	rangeDay =Math.ceil((oriLastDay.getTime()-oriFirstDay.getTime())/(1000*3600*24));
// 	<div id="dateChange_bf">변경전</div>
// 	<div id="dateChange_af">변경후</div>
//dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
	
})
// -- 날짜 확정시
$("#inputfirstdaybtn").on("click", function(){
	var firstday = new Date($("#inputfirstday").val());
	var lastday = new Date($("#inputfirstday").val());
	lastday.setDate(lastday.getDate()+rangeDay)
	
	var resultDays = getFormatDate(firstday)+" ~ "+getFormatDate(lastday);
	$("#dateChange_af").text(resultDays);
	$("#dataChangeSave").prop("disabled",false); // 버튼 활성화

	// input hidden에 날짜 숨겨 놓기
	//<input type="hidden" id="newStartDay" name="newStartDay">
	//<input type="hidden" id="newLastDay" name="newLastDay">
	$("#newStartDay").val(firstday);
	$("#newLastDay").val(lastday);
	

	console.log("sd",$("#newStartDay").val())
	console.log("ed",$("#newLastDay").val())
})

// -- 변경확정버튼  -- 날짜 변경시
$("#dataChangeSave").on("click", function(){
	console.log("sd",$("#newStartDay").val())
	console.log("ed",$("#newLastDay").val())
	console.log("tripNumber",$("#tripNumber").val());
	console.log("rangeDay",rangeDay)
	console.log("order",order)
	var oriFirstDay = new Date(mylist[order].trip_start_date);
	var newStratDay = new Date($("#newStartDay").val());

	var tripNumber = $("#tripNumber").val()
	var newStartDayDB = getFormatDateDB($("#newStartDay").val());
	var newLastDayDB = getFormatDateDB($("#newLastDay").val());
	var rangeDayy = rangeDay;
	var diffOriNewFirstday = Math.ceil((newStratDay.getTime()-oriFirstDay.getTime())/(1000*3600*24))-1;
	var changeTripTitle = $("#inputTripTitle").val();
	var data = {
			"tripNumber":tripNumber,
			"newStartDayDB":newStartDayDB,   // 새롭게 변경된 첫날 날짜
			"newLastDayDB":newLastDayDB,	// 새롭게 변경된 마지막날 날짜
			"rangeDay":rangeDayy,
			"diffOriNewFirstday":diffOriNewFirstday,  // 바꾼 날짜랑 얼마나 차이나는지..
			"changeTripTitle":changeTripTitle
	}
	console.log("data",data)
	
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/changeDay",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){ 
        	 $("#mylist").empty();
         console.log("data",data)
         
        let thead = $("<tr><th class='bar' id='t'>여행 제목</th><th class='bar'>여행지</th><th class='bar'>여행 날짜</th><th style='width: 300px' class='bar'>친구와 함께하기</th><th style='width: 200px' class='bar'>변경하기</th></tr>")
	$("#mylist").append(thead) 
     	
     	let idx = 0;
         for(i of data) { //게시글
     	  
     	  console.log(i.trip_area);
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
     	  
      	let sd = getFormatDate(i.trip_start_date);
      	let ed = getFormatDate(i.trip_end_date);	  
     	  
      	
//       	<tr>
//      	<th class="bar">여행 제목</th>
//      	<th class="bar">여행지</th>
//      	<th class="bar">여행 날짜</th>
//      	<th style="width: 500px" class="bar">친구와 함께하기</th>
     // </tr>

         let tr = $('<tr></tr>'); 
         
         // 추천에 승인 추가 if문
//          console.log("tripendday2",new Date(i.trip_end_date));
//          console.log("today1",new Date());
//          console.log(new Date(i.trip_end_date) < new Date());

         let title;
         if(new Date(i.trip_end_date) < new Date()){  // 날짜 지났으니 버튼 추가
         	
         	if(i.trip_plan_appry_status == 2){
         		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/c.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
         	}else if(i.trip_plan_appry_status == 1){
         		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/d.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
         	}else if(i.trip_plan_appry_status == 0){
         		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/p.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
         	}
         	
         
         
         }else{
             title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a></td>');    	
         }
        
         let area =$('<td>'+i.trip_area+'</td>');
         let date =$('<td>'+sd+' - '+ed+'</td>');
         let btn =$('<td><button id="jbtn" class="joinbtn btn btn-info" data-toggle="modal" data-target="#exampleModal"  data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
         let changeDate =$('<td><button id="changebtn"  class="changeDateBtn btn btn-info" data-order="'+idx+'" data-toggle="modal" data-target="#dateChangeModal"  data-tripnum ="'+i.trip_number+'">날짜 변경</button></td>');
         
         $("#mylist").append(tr);
         $(tr).append(title);
         $(tr).append(area);
         $(tr).append(date);
         $(tr).append(btn);
         $(tr).append(changeDate);
         

         idx++;
      }
                 
     	$("#dataChangeSave").prop("disabled",true)
    	$("#inputfirstdaybtn").prop("disabled",true)   
                 
    	location.href="myplan";
              },
              error:function(error){
                 alert("여행 거절 실패.");
                    console.log(error);
                 }
      
      
   });//ajax 끝
})


//----------------------------------------------------------------------------------------친구초대 버튼 

$(document).on('click',".fbtn", function(e) {
	var ftrip_number = e.target.dataset.tnum
	var friend_id = e.target.dataset.fid
	
	console.log(ftrip_number,friend_id);
	
	
	var data = {
            "trip_number" : ftrip_number,
            "share_id" : friend_id
            
         } 
   console.log(data);
   
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/togetherplan",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
            alert("친구 초대완료.");
            console.log("요청리스트",data);
            $("#mql").empty();
            $("#fql").empty();
            
             for(i of data.myreqlist){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
            }
            
            for (i of data.reqlist){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            }  
           //---------------소켓
           console.log("알람 소켓 전송 - shareTrip")
           
				let tripPlanShare ={
					"type" : "tripShare",
					"trip_number" : ftrip_number,
			        "share_id" : friend_id,
			        "my_id" : ${memberinfo}[0].member_id
				};
           console.log("tripPlanShare",tripPlanShare)
			let resultMemberData = JSON.stringify(tripPlanShare);
            socketalarm.send(resultMemberData);
           
           //-------------------
           
         },
         
         error:function(error){
            alert("친구초대 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 



//--------------------------------------------------------------------------------------------초대 이벤트 영역


$(document).on('click', ".sbtn",function(e) {//승인 버튼 
	var trip_number = e.target.dataset.trnum
	console.log(trip_number);
	var data = {
            "trip_number" : trip_number,
         } 
   console.log(data);
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/accepttrip",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
        	 console.log("승인 내 목록",data);
            alert("여행 참여 완료.");
            
            $("#mylist").empty();
            
            let thead = $("<tr><th class='bar' id='t'>여행 제목</th><th class='bar'>여행지</th><th class='bar'>여행 날짜</th><th style='width: 300px' class='bar'>친구와 함께하기</th><th style='width: 200px' class='bar'>변경하기</th></tr>")
        	$("#mylist").append(thead) 
          
          let idx = 0;	
          for(i of data.myplanlist) { //게시글
        	  
        	  console.log(i.trip_area);
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
        	  
         	 let sd = getFormatDate(i.trip_start_date);
         	let ed = getFormatDate(i.trip_end_date);	  
         	
         	let tr = $('<tr></tr>'); 
            
            // 추천에 승인 추가 if문
            console.log("tripendday2",new Date(i.trip_end_date));
            console.log("today1",new Date());
            console.log(new Date(i.trip_end_date) < new Date());

            let title;
            if(new Date(i.trip_end_date) < new Date()){  // 날짜 지났으니 버튼 추가
            	
            	if(i.trip_plan_appry_status == 2){
            		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/c.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
            	}else if(i.trip_plan_appry_status == 1){
            		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/d.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
            	}else if(i.trip_plan_appry_status == 0){
            		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/p.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
            	}
            	
            
            
            }else{
                title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a></td>');    	
            }
           
            let area =$('<td>'+i.trip_area+'</td>');
            let date =$('<td>'+sd+' - '+ed+'</td>');
            let btn =$('<td><button id="jbtn" class="joinbtn btn btn-info" data-toggle="modal" data-target="#exampleModal"  data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
            let changeDate =$('<td><button id="changebtn"  class="changeDateBtn btn btn-info" data-order="'+idx+'" data-toggle="modal" data-target="#dateChangeModal"  data-tripnum ="'+i.trip_number+'">날짜 변경</button></td>');
            
            
            $("#mylist").append(tr);
            $(tr).append(title);
            $(tr).append(area);
            $(tr).append(date);
            $(tr).append(btn);
            $(tr).append(changeDate);
            

            idx++;
         }
            
            
          	$("#fql").empty();
            $("#mql").empty();
            
            for(i of data.myreqlist){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
           	 
            }
            
            for (i of data.reqlist){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            } 
            
             
         },
         
         error:function(error){
            alert("여행 참여 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 



 $(".cbtn").on('click', function(e) {//거절 버튼 
	var trip_number = e.target.dataset.trnum
	console.log(trip_number);
	var data = {
            "trip_number" : trip_number,
         } 
   console.log(data);
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/rejecttrip",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
            alert("여행 거절 완료.");
           
            $("#mql").empty();
            $("#fql").empty();
            
            for(i of data.myreqlist ){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
            }
            
            for (i of data.reqlist){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            } 
            
             
         },
         
         error:function(error){
            alert("여행 거절 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 



 
//--------------------------------------------------------------------------------------------- (오늘 기준) 지난 날짜 여행 계획 신청
$(document).on("click",".applybtn",function(e){
	var tripPlanNum = e.target.dataset.name;
	var tripPlanStatus = e.target.dataset.status;
	console.log("tripPlanNum",tripPlanNum)
	console.log("tripPlanStatus",tripPlanStatus)
	
	
	var data = {
		"tripPlanNum" : tripPlanNum,
		"tripPlanStatus":	tripPlanStatus
	}
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
        url: "tprest/tripplanapply",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
        	 $("#mylist").empty();
            console.log("data",data)
            
    let thead = $("<tr><th class='bar' id='t'>여행 제목</th><th class='bar'>여행지</th><th class='bar'>여행 날짜</th><th style='width: 300px' class='bar'>친구와 함께하기</th><th style='width: 100px' class='bar'>변경하기</th></tr>")
	$("#mylist").append(thead) 
	
	let idx = 0;
    for(i of data) { //게시글
	  
	  console.log(i.trip_area);
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
	  
 	let sd = getFormatDate(i.trip_start_date);
 	let ed = getFormatDate(i.trip_end_date);	  
	  
 	
//  	<tr>
// 	<th class="bar">여행 제목</th>
// 	<th class="bar">여행지</th>
// 	<th class="bar">여행 날짜</th>
// 	<th style="width: 500px" class="bar">친구와 함께하기</th>
// </tr>

    let tr = $('<tr></tr>'); 
    
    // 추천에 승인 추가 if문
//     console.log("tripendday2",new Date(i.trip_end_date));
//     console.log("today1",new Date());
//     console.log(new Date(i.trip_end_date) < new Date());

    let title;
    if(new Date(i.trip_end_date) < new Date()){  // 날짜 지났으니 버튼 추가
    	
    	if(i.trip_plan_appry_status == 2){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/c.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}else if(i.trip_plan_appry_status == 1){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/d.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}else if(i.trip_plan_appry_status == 0){
    		title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a><img src="./resources/css/p.JPG" data-name="'+i.trip_number+'" data-status="'+i.trip_plan_appry_status+'" class="applybtn" ></td>');
    	}
    	
    
    
    }else{
        title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a></td>');    	
    }
   
    let area =$('<td>'+i.trip_area+'</td>');
    let date =$('<td>'+sd+' - '+ed+'</td>');
    let btn =$('<td><button id="jbtn" class="joinbtn btn btn-info" data-toggle="modal" data-target="#exampleModal"  data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
    let changeDate =$('<td><button id="changebtn"  class="changeDateBtn btn btn-info" data-order="'+idx+'" data-toggle="modal" data-target="#dateChangeModal"  data-tripnum ="'+i.trip_number+'">날짜 변경</button></td>');
    
    $("#mylist").append(tr);
    $(tr).append(title);
    $(tr).append(area);
    $(tr).append(date);
    $(tr).append(btn);
    $(tr).append(changeDate);
    

    idx++;
 }
            
            
            
         },
         error:function(error){
            alert("여행 거절 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝
})
//---------------------title 변경될때
//inputTripTitle dataChangeSave

$("#inputTripTitle").on("keydown",function(){
	console.log("title변화")
	$("#dataChangeSave").prop("disabled",false)
})
//inputfirstdaybtn

$("#inputfirstday").on("change",function(){
	console.log("날짜변화")
	$("#inputfirstdaybtn").prop("disabled",false)
})
//--------------------------------------------------------------------------------------------- 승인 거절이벤트 
$(document).on('click','.deleteplanbtn',function(e){
	
var	tripnumber = e.target.dataset.tripnum

var data = {
         "tripnumber":tripnumber
      }
      
      
      
      $.ajaxSetup({         
          beforeSend : function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
       });//먼저 보냄
                   
       $.ajax({
          url:'tprest/deleteTripPlan',
          type:'post',
          data:data,
          success:function(data){
            alert("여행계획을 삭제 했습니다.");
             location.href="myplan";
             
             
          },
          error:function(error){
            alert("fail")
            console.log(error);
         }
      })  // ajax end
})






















//날짜 포맷 변환기  str -> date ->str
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
   
 //날짜 포맷 변환기  DB용도
   function getFormatDateDB(strdate){
      var date = new Date(strdate);
      console.log(date);
       var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
   }
</script>


</html>