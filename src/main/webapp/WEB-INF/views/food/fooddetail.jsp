<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박예약</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 날짜 시간 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/timepicker-addon.css" />
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="resources/js/timepicker-addon.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"> 

<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/jquery.bxslider.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<!-- 레이아웃 부트스트랩 영역 -->

<style>
body {
	overflow: scroll;
}

.container {
	width: 100%;
}

.form-control-borderless {
	border: none;
}

.form-control-borderless:hover, .form-control-borderless:active,
	.form-control-borderless:focus {
	outline: none;
	box-shadow: none;
	border: 1px solid lightgray;
}

h1 { /*숙소명 */
	text-align: center;
	margin-bottom:200px;
	margin: 0 25%;
	width: 500px;
	font-size: 50px;
}

input {
	width: 200px;
	height: 40px;
	margin: 5px;
}

#reservation {
	font-size: 20px;
	margin: 10% 0;
}

#reser {
	height: 100px;
}

#insertbtn {
	margin: 50px 20%;
}

section {
	margin:-150px 0;
}

.carousel-inner {
	margin-top:150px;
	width: 100%;
	height: 550px;
}

.d-block{
	width: 100%;
	height: 500px;
}
.ma{
margin-bottom: 120px;
}

</style>

</head>
<body>
		
<div>
	<form action="searchfood" method="get">
		<!-- foodmain page에서 검색하는 것  -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8">
					<div class="card-body row no-gutters align-items-center">
						<div class="col-auto">
							<!-- 돋보기 -->
							<i class="fas fa-search h4 text-body"></i>
						</div>
						<!--end of col-->
						<div class="col">
							<!-- 검색창 -->
							<input id="searchfood" name="food_address"
								class="form-control form-control-lg form-control-borderless"
								type="search" placeholder="Search topics or keywords">
						</div>
						<!--end of col-->
						<div class="col-auto">
							<!-- 검색버튼 -->
							<button style="background-color: #064D84" id="searchbtn"
								class="btn btn-lg btn-success" type="submit">Search</button>
						</div>
						<!--end of col-->
					</div>
				</div>
				<!--end of col-->
			</div>
		</div>
	</form>
</div>
		<div class="container">
		<div id="title"></div>
		<!-- 숙소 이름 영역 -->

		<section class="main-slider">
			<div id="carouselExampleControls" class="carousel slide"data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img id="img" class="d-block" src="">
					</div>
					<div class="carousel-item">
						<img id="img1" class="d-block" src="" >
					</div>
					<div class="carousel-item">
						<img id="img2" class="d-block" src="" >
					</div>
					<div class="carousel-item">
						<img id="img3" class="d-block" src="" >
					</div>
					<div class="carousel-item">
						<img id="img4" class="d-block" src="" >
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</section>
		<!--사진영역 -->

		<section class="ma">
			<div class="row">
				<div class="col-md-5">
					<article class="blog-post">
						<div class="blog-post-image"></div>
						<div id="info" class="blog-post-body"></div>
					</article>
				</div>
				<!-- 정보 -->

				<div class="col-md-7 sidebar-gutter">
					<aside>
						<!-- sidebar-widget -->
						<div id="reser" class="sidebar-widget">
							<h3 class="sidebar-title">지금 예약하기</h3>
							<div class="widget-container widget-about">
								<form id="reservation" name="reservation"  method="post">
								날짜:<input autocomplete="off" type="text" id="datepicker" class="datepicker" name="foodreservation_date" />
                                                                             시간:<input autocomplete="off" type="text" id="timepicker" class="timepicker" name="foodreservation_time" /><br>
								인원 : <input name="foodreservation_person" type="number" id="person">명 
								<input type="hidden" name="food_hostid" id="hostid" > 
								<input type="hidden" name="food_number" id="food_number"><br>
								<button style="font-size: 20px; height: 50px; width: 300px; background-color: #064D84"
								 type="submit" class="btn btn-secondary btn-lg{" id="insertbtn">예약하기</button>
								</form>	
					 
							</div>
						</div>
					</aside>
				</div>
				<!-- 예약 form -->
				</div>
		</section>
		
			<section>
			<div class="col-md-12">
				<article class="blog-post">
					<div class="blog-post-image"></div>
					<div class="blog-post-body">
						<h2>후기</h2>
						<p>ew months ago, we found ridiculously cheap plane tickets
							for Boston and off we went. It was our first visit to the city
							and, believe it or not, Stockholm in February was more pleasant
							than Boston in March. It probably has a lot to do with the fact
							that we arrived completely unprepared. That I, in my converse and
							thin jacket, did not end up with pneumonia is honestly not even
							fair.</p>
					</div>
				</article>
			</div>
		</section>
		<!-- 후기영역  -->

		<section>
			<div class="col-md-12">
				<article class="blog-post">
					<div class="blog-post-image"></div>
					<div class="blog-post-body">
						<h2>댓글</h2>
						<p>ew months ago, we found ridiculously cheap plane tickets
							for Boston and off we went. It was our first visit to the city
							and, believe it or not, Stockholm in February was more pleasant
							than Boston in March. It probably has a lot to do with the fact
							that we arrived completely unprepared. That I, in my converse and
							thin jacket, did not end up with pneumonia is honestly not even
							fair.</p>
					</div>
				</article>
			</div>
		</section>
		<!-- 댓글영역 -->
	</div>
	<!-- /.container -->

<!-- 
	<script src="./resources/js/bootstrap.min.js"></script> -->
	<script src="./resources/js/jquery.bxslider.js"></script>
	<script src="./resources/js/mooz.scripts.min.js"></script>
</body>

<script>
var food =${detailfood};
console.log(food[0]);

$(document).ready(function() {
    $('#hostid').val(food[0].food_hostid);
    $('#food_number').val(food[0].food_number);
});

var title = $('<h1>'+food[0].food_name+'</h1>'); // 집 이름 
$("#title").append(title);

$("#img").attr('src', food[0].food_sysname);
$("#img1").attr('src', food[1].food_sysname);
$("#img2").attr('src', food[2].food_sysname);
$("#img3").attr('src', food[3].food_sysname);
$("#img4").attr('src', food[4].food_sysname);



//------------------------------------------------------------------------------이미지 영역

var host=$('<h2>'+food[0].food_hostid+'님의 맛집'+'</h2>');
var food_info= $('<p class="info">'+'주소:'+food[0].food_address+'  '+'<br>'
		+'수용가능인원:'+food[0].food_person+'명'+'<br>'
		+'주차장:'+food[0].food_parkable+'<br>'
		+'오픈시간:'+food[0].food_mintime+'<br>'
		+'마감시간:'+food[0].food_maxtime+
        '</p>')
$("#info").append(host);
$("#info").append(food_info);

//-----------------------------------------------------------------------------------------info영역
$("#insertbtn").on("click", function (e) {
	  	e.preventDefault();
	 	console.log("ajax 예약");
        //var formData = $("#reservation").serializeObject();
       var formData = new FormData(document.getElementById("reservation")); 
        	
       //console.log(formData.get("reservation_checkin"));
       $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
        $.ajax({
            url:'frest/foodreservation',
            type:'post',
            data:formData,
            processData:false,
            contentType:false,  //제이슨 아니니깐 까보지마!!
             dataType:"json", //rest 컨트롤 이용   
            success:function(data){
               alert("예약완료");
               console.log(data)
               $("#reservation")[0].reset();
               
            },
            error:function(error){
               alert("예약실패")
               console.log(error);
            }
            
         })
    });
 
</script>
<script>

$(function() {
   //모든 datepicker에 대한 공통 옵션 설정
   $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd' //Input Display Format 변경
       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
       ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
       ,changeYear: true //콤보박스에서 년 선택 가능
       ,changeMonth: true //콤보박스에서 월 선택 가능                
      /*  ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시   */
       
       ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
       ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
       ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
       ,minDate: "newdate" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
       ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
      
   });
   $.timepicker.setDefaults({
         // timepicker 설정
       timeFormat:'HH:mm:ss',
       controlType:'select',
       oneLine:true,      
   });
   
   $("#timepicker").timepicker();
   $("#timepicker").timepicker('setTime', new Date());

   //input을 datepicker로 선언
   $("#datepicker").datepicker();                    

   //From의 초기값을 오늘 날짜로 설정
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   });
   var date = $("#datepicker").val();
   console.log(date);
</script>
</html>