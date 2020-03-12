<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>house-detail</title>

<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/jquery.bxslider.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<!-- 레이아웃 부트스트랩 영역 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 검색창 부트스트랩 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<!-- 달력 부트스트랩 -->


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
	margin: 2% 35%;
	width: 300px;
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
	margin: -100px 0;
}

.carousel-inner {
	margin: 20px;
	width: 100%;
	height: 550px;
}

.d-block{
	width: 100%;
	height: 500px;
}
</style>

</head>
<body>
<%-- 
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header> --%>

<div>
	<form action="searchhouse" method="get">
		<!-- housemain page에서 검색하는 것  -->
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
							<input id="searchhouse" name="house_address"
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


		<section>
			<div class="row">
				<div class="col-md-6">
					<article class="blog-post">
						<div class="blog-post-image"></div>
						<div id="info" class="blog-post-body"></div>
					</article>
				</div>
				<!-- 숙소정보 -->


				<div class="col-md-6 sidebar-gutter">
					<aside>
						<!-- sidebar-widget -->
						<div id="reser" class="sidebar-widget">
							<h3 class="sidebar-title">지금 예약하기</h3>
							<div class="widget-container widget-about">
								<form id="reservation" name="reservation" method="post">
									<input class="date" type="text" name="reservation_checkin"
										id="datepicker1"> -<input class="date" type="text"
										name="reservation_checkout" id="datepicker2">
									<button
										style="font-size: 20px; width: 100px; height: 50px; background-color: #064D84"
										type="button" id="dtcommit" class="btn btn-primary">날짜확정</button>
									<br> 총액 : <input name="reservation_totalprice" type="text"
										id="totalprice" placeholder="">만원<br> 인원 : <input
										name="reservation_person" type="number" id="person" value="">명
									<input type="hidden" name="house_hostid" id="hostid">
									<input type="hidden" name="house_number" id="house_number"><br>

									<button
										style="font-size: 20px; height: 50px; width: 300px; background-color: #064D84"
										type="submit" id="insertbtn" class="btn btn-secondary btn-lg">예약하기</button>
								</form>
							</div>
						</div>
					</aside>
				</div>
				<!-- 예약 form -->
			</div>
		</section>
		<!-- middle end -->

		<section>
			<div class="row">
				<div class="col-md-6">
					<article class="blog-post">
						<div class="blog-post-image"></div>
						<div class="blog-post-body">
							<h2>주의사항</h2>
							<p>체크인:오후 4:00 - 오후 10:00</p>
							<p>체크아웃:오전 11:00</p>
							<p>예약 취소</p>
							<p>48시간 동안 취소 수수료 없음</p>
							<p>그 이후로 체크인 5일 전까지 취소하면 서비스 수수료를 제외한 전액이 환불됩니다.</p>
							<p>애환동물 금지 , 흡연금지, 파티금지</p>
							
							<img style="width:50px;height:50px;" src="./resources/houseimg/no.JPG">&nbsp;
							<img style="width:50px;height:50px;" src="./resources/houseimg/nopet.JPG">&nbsp;
							<img style="width:50px;height:50px;" src="./resources/houseimg/party.png">
						</div>
					</article>
				</div>
			</div>
		</section>
		<!-- 주의사항 -->
		
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


	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.bxslider.js"></script>
	<script src="./resources/js/mooz.scripts.min.js"></script>
</body>

<script>
var house =${detailhouse};
var test =${detailreser};
console.log("house=",house);
console.log(test);

$(document).ready(function() {
    $('#hostid').val(house[0].house_hostid);
    $('#house_number').val(house[0].house_number);
});

var title = $('<h1>'+house[0].house_name+'</h1>'); // 집 이름 
$("#title").append(title);

$("#img").attr('src', house[0].house_sysname);
$("#img1").attr('src', house[1].house_sysname);
$("#img2").attr('src', house[2].house_sysname);
$("#img3").attr('src', house[3].house_sysname);
$("#img4").attr('src', house[4].house_sysname);



//------------------------------------------------------------------------------이미지 영역

var host=$('<h2>'+house[0].house_hostid+'님의 하우스'+'</h2>');
var house_info= $('<p class="info">'+'주소:'+house[0].house_address+'  '+'<br>'
        +'1박가격:'+house[0].house_price+'만원'+'<br>'
        +'수용가능인원:'+house[0].house_person+'&nbsp'+'&nbsp'+'&nbsp'
        +'주차장:'+house[0].house_parkable+'<br>'
        +'방갯수:'+house[0].house_rooms+'&nbsp'
        +'& 침대수:'+house[0].house_beds+'&nbsp'+'&nbsp'+'&nbsp'
        +'욕실:'+house[0].house_bathrooms+
        '</p>')
$("#info").append(host);
$("#info").append(house_info);
//-----------------------------------------------------------------------------------------info영역
 
 $("#totalprice").attr('placeholder', 'PRICE PER night : '+house[0].house_price +"원"  ); 
 $("#person").attr('placeholder', '최대인원 : '+house[0].house_person+"명"  ); // 넘길때 이벤트 줘야함.

 //인원 버튼 
   $("#person").keyup(function(){
	   console.log(typeof house[0].house_person)
	   if($(this).val()>Number(house[0].house_person)){
		   alert("수용인원을 초과하였습니다. 최대인원 : "+house[0].house_person);   
		   $(this).val("")	;
		   $(this).focus()	;
	   }else{
		      
	   }
	    
   })
 //-----------------------------------------------------------------------------------------------인원 및 총가격
  $("#insertbtn").on("click", function (e) {
	  	e.preventDefault();
	 	console.log("ajax 예약");
        //var formData = $("#reservation").serializeObject();
       var formData = new FormData(document.getElementById("reservation")); 
        	
       console.log(formData.get("reservation_checkin"));
       $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
        $.ajax({
            url:'hrest/housereservation',
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
 
	var disabledDays = [];  //"2020-01-15"
		
	$(document).ready(function(){
		
		$("#datepicker1").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date(),
		    maxDate: new Date(house[0].house_maxdate.substr(0,10)),
			beforeShowDay:function(date){
				console.log("date:",date);
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(typeof dateText)
		    	console.log(dateText)  // 2020-01-21
		    	var select = new Date(dateText);
		    	
		    	/* if(a=="Invalid Date"){
		    		
		    	}else{ */
		    		$("#datepicker1").datepicker('option', 'minDate', new Date(dateText));
		    		$("#datepicker2").datepicker('option', 'minDate', new Date(dateText));
	    			
		    		
		    		for(i in disabledDays){
		    			var ss = new Date(disabledDays[i])
		    			console.log(select.getDate());
		    			console.log(ss.getDate());
		    			console.log(ss.getDate()-select.getDate())
		    			if(ss.getDate()-select.getDate()>0){ //양수일때  // 1일차이일때 이벤트도 줘야함.
		    				$("#datepicker1").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				$("#datepicker2").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				break;
		    			}else{ //음수일때
		    				
		    			}
		    			
		    		}
		    		
		    	/* } */
		    	
 		    }



			});
		
		
	$("#datepicker2").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date(),
		    maxDate: new Date(house[0].house_maxdate.substr(0,10)),
			beforeShowDay:function(date){
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(dateText)
		    	var a = new Date(disabledDays[0]);
		    	
 		    }



			});
			
			
		
	});
	
	$('#dtcommit').on('click',function(){
		console.log("testtest");
		
		var sdate = $('#datepicker1').val();  
		var ddate = $('#datepicker2').val();  
		  
		var ar1 = sdate.split('-');
	    var ar2 = ddate.split('-');  
	    
	    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		  
	    var dif = da2 - da1;
	    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	    var cMonth = cDay * 30;// 월 만듬
	    var cYear = cMonth * 12; // 년 만듬
		
	    if(sdate && ddate){
			console.log(parseInt(dif/cDay))
			$("#totalprice").val(parseInt(dif/cDay)*house[0].house_price);
		 } 

	})
	
	
var listDate = [];
var checkeddate = ${detailreser};
for(i of checkeddate){
	
	var st = new Date(i.reservation_checkin);

	var smonth = st.getUTCMonth() + 1; //months from 1-12
	var sday = st.getUTCDate();
	if(sday<10){
		sday = "0"+sday;
	}		
	
	
	
	var syear = st.getUTCFullYear();
	if(smonth<10){
		st = syear + "-0" + smonth + "-" + sday;
			
	}else{
		st = syear + "-" + smonth + "-" + sday;
		
	}
	
	
	
	console.log("st : " +st)
	//
	var ed = new Date(i.reservation_checkout);

	var emonth = ed.getUTCMonth() + 1; //months from 1-12
	var eday = ed.getUTCDate();
	if(eday<10){
		eday = "0"+eday;
	}	
	var eyear = ed.getUTCFullYear();

	if(emonth<10){
		ed = eyear + "-0" + emonth + "-" + eday;
			
	}else{
		ed = eyear + "-" + emonth + "-" + eday;
		
	}
	
	console.log("ed : " +ed)
	//
	disabledDays = getDateRange(st,ed,disabledDays)
	console.log()
} 

	function getDateRange(startDate, endDate, listDate){

        var dateMove = new Date(startDate);
        var strDate = startDate;

        if (startDate == endDate){

            var strDate = dateMove.toISOString().slice(0,10);
			console.log("strDate ",strDate);
            listDate.push(strDate);

        }else{

            while (strDate < endDate){

                var strDate = dateMove.toISOString().slice(0, 10);
                console.log("strDate ",strDate);
                listDate.push(strDate);

                dateMove.setDate(dateMove.getDate() + 1);

            }

        }

        return listDate;

    };
   
	
	console.log(disabledDays);
</script>

</html>