<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>house-detail</title>

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
	font-size:20px;
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

h2 { /*숙소명 */
	text-align: center;
	margin: 2% 35%;
	width: 300px;
}

input {
	width: 200px;
	height: 40px;
	margin: 5px;
}

#reservation {
	margin: 2% 0;
}

#reser {
	font-size: 20px;
	margin: 5% 0;
	border:2px solid lightgray;
	width:600px;
}

#insertbtn {
	margin: 50px 7%;
}

section {
	margin: -100px 0;
	font-size:20px;
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
#replyinsert{
display:flex; 
border:2px solid lightgray;
}
#user_id{
margin:13px;
}
#repleinsert_btn{
width:100px;
font-size:20px;
height:40px;
margin:25px;
margin-left:200px;
text-align: center;
}
#replylist{
font-size:20px;
float:left;
text-align:left;
}
.ui-datepicker{
width:300px;
height:250px;
font-size:20px;
}
#ma{
margin-top:-180px;
margin-bottom:50px;
}
#ma2{
margin-bottom:20px;
font-size:20px;
}
#rev{
border-top:1px solid lightgray;

}
#re{
border-top:1px solid lightgray;
margin-top:2%;

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
							<i class="fas fa-search h3 text-body"></i>
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


		<section id="ma">
			<div class="row">
				<div class="col-md-5">
					<article class="blog-post">
						<div id="info" class="blog-post-body"></div>
						<div class="blog-post-body">
							<h3>주의사항</h3>
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
				<!-- 정보 -->

				<div class="rf col-md-7 sidebar-gutter">
					<aside>
						<!-- sidebar-widget -->
						<div style="margin-left:50px;" id="reser" class="sidebar-widget">
							<h3 class="sidebar-title">지금 예약하기</h3>
							<div class="widget-container widget-about">
								<form  id="reservation" name="reservation" method="post">
									<input class="date" type="text" name="reservation_checkin"
										id="datepicker1" autocomplete="off" > -<input class="date" type="text"
										name="reservation_checkout" id="datepicker2" autocomplete="off" >
									<button
										style="font-size: 20px; width: 150px; height: 50px; background-color: #064D84"
										type="button" id="dtcommit" class="btn btn-primary">날짜확정</button>
									<br> 총액 : <input name="reservation_totalprice" type="text"
										id="totalprice" placeholder="">만원<br> 인원 : <input
										name="reservation_person" type="number" id="person" value="">명
									<input type="hidden" name="house_hostid" id="hostid">
									<input type="hidden" name="house_number" id="house_number"><br>
									<input type="hidden" name="trip_number" id ="trip_number">
									<input type="hidden" name="trip_day" id ="trip_day">

									<button
										style="font-size: 20px; height: 50px; width: 500px; background-color: #064D84"
										type="submit" id="insertbtn" class="btn btn-lg btn-primary btn-block text-uppercase font-weight-bold mb-2">예약하기</button>
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
			<div class="col-md-12" id="rev">
				<article class="blog-post">
					<div class="blog-post-image"></div>
					<div class="blog-post-body">
						<h3 style="margin-top: 20px;">후기</h3>
						<div id="review">
						
						</div>
					</div>
				</article>
			</div>
		</section>
		<!-- 후기영역  -->
<section  >
			<div class="col-md-12" id="re">
				<article class="blog-post">
					<div class="blog-post-body" >
						<h3 style="margin-top: 20px;">댓글</h3>
						<form id="rel">
						<div id="replyinsert">
							<div id="user_id"></div>
							<input style="width:700px; margin:25px 5px;" id="reple_content" name="house_reple_content" type="text">
							<button id="repleinsert_btn"  class="btn btn-primary">등록</button>
							<input type="hidden" name="house_number" id="hrnum">
						</div>
						</form>
						<div id="replylist">
						
						</div>
					</div>
				</article>
			</div>
		</section>
		<!-- 댓글영역 -->
	</div>
	<!-- /.container -->

<!-- 리뷰상세보기  -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="d_img"></div>
       <div id="d_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



	<!-- <script src="./resources/js/bootstrap.min.js"></script> -->
	<script src="./resources/js/jquery.bxslider.js"></script>
	<script src="./resources/js/mooz.scripts.min.js"></script>
</body>

<script>
var house =${detailhouse};
var test =${detailreser};
var tripinfo= ${tripinfo};
console.log("house=",house);
console.log(test);
console.log("여행정보",tripinfo)

$(document).ready(function() {
    $('#hostid').val(house[0].house_hostid);
    $('#house_number').val(house[0].house_number);
});

var title = $('<h2 style="font-size:50px">'+house[0].house_name+'</h2>'); // 집 이름 
$("#title").append(title);

$("#img").attr('src', house[0].house_sysname);
$("#img1").attr('src', house[1].house_sysname);
$("#img2").attr('src', house[2].house_sysname);
$("#img3").attr('src', house[3].house_sysname);
$("#img4").attr('src', house[4].house_sysname);



//------------------------------------------------------------------------------이미지 영역

var host=$('<h2 style="margin-left:10px;width:500px;">'+house[0].house_hostid+'님의 하우스'+'</h2>');
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
	 	 $("#trip_number").val(tripinfo[0].trip_number);
	      $("#trip_day").val(tripinfo[0].trip_day);
       var formData = new FormData(document.getElementById("reservation"));
       var trip_number=tripinfo[0].trip_number;
       
       console.log("여행번호",formData.get("trip_number"));
       console.log("여행일수 ",formData.get("trip_day"));
       $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
        $.ajax({
            url:'tprest/tripreservation',
            type:'post',
            data:formData,
            processData:false,
            contentType:false,  //제이슨 아니니깐 까보지마!!
            success:function(data){
               alert("예약완료");
               console.log(data)
               $("#reservation")[0].reset();
               location.href="detailplan?trip_number="+trip_number;
            },
            error:function(error){
               alert("예약실패")
               console.log(error);
            }
            
         })
    });//---------------------------------------------------------예약영역------------------------------------------------------------------------
 
    var reple_list=${reple_list};
    console.log(reple_list);
    var login_id = ${memberinfo}
    console.log("로그인아이디",login_id);
    console.log(login_id[0].member_id)
    
    var user_id =$('<h3>'+login_id[0].member_id+'</h3>');
    	$("#user_id").append(user_id);
    
    
    
    for( i of reple_list){
		var reple_id = $('<div>'+i.member_guestid+'님의 댓글:      '+i.house_reple_content+'&nbsp'+'&nbsp'+'&nbsp'+i.house_reple_time+'<div>');
		$("#replylist").append(reple_id);//아이디 
		
		
		 if(i.member_guestid == login_id[0].member_id){
			
     		$("<button data-housenum='"+house[0].house_number+"' data-replenum='"+i.house_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
    		                      .text("삭제").appendTo($("#replylist"));
    	 }
		
	}
    
    $("#repleinsert_btn").on('click',function(e){
    	
    	$("#hrnum").val(house[0].house_number);
    	var formData = new FormData(document.getElementById("rel")); 
    	
    	 $.ajaxSetup({         
   	      beforeSend : function(xhr){
   	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
   	      });//먼저 보냄
   	      
       $.ajax({
           url:'hrest/insertreple',
           type:'post',
           data:formData,
           processData:false,
           contentType:false,  //제이슨 아니니깐 까보지마!!
            dataType:"json", //rest 컨트롤 이용   
           success:function(data){
              alert("댓글 입력완료 ");
              console.log(data)
              
              
           },
           error:function(error){
              alert("댓글 입력 실패 ")
              console.log(error);
           }
           
        })
    	
    	
    	
    });// 댓글 등록 끝 
    
    
    $("#btnDelete").on('click',function(e){//댓글 삭제
    	var result = confirm( '댓글을 삭제하시겠습니까?' );
    	
    	if(result){
    		
    	var replenum = e.target.dataset.replenum
    	var house_number = e.target.dataset.housenum
    	console.log("댓글 번호 ",replenum);
    
    	var data ={
    			"house_reple_number":replenum,
    			"house_number":house_number
    	}
    	$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		
		$.ajax({
	        url: "hrest/repledel",
	         type: 'post',
	         data :data,
	         dataType: "json", //rest 컨트롤 이용   
	         success:function(data){
	         console.log(data);
	         
	         $("#replylist").empty();
	         
	         for( i of data){
	     		var reple_id = $('<div>'+i.member_guestid+'님의 댓글:      '+i.house_reple_content+'&nbsp'+'&nbsp'+'&nbsp'+i.house_reple_time+'<div>');
	     		$("#replylist").append(reple_id);//아이디 
	     		
	     		
	     		 if(i.member_guestid == login_id[0].member_id){
	     			
	          		$("<button data-replenum='"+i.house_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
	         		                      .text("삭제").appendTo($("#replylist"));
	         	 }
	     		
	     		}
	         },
	         
	         error:function(error){
	               console.log(error);
	            }
		 });//ajax 끝
    	  }else{
    	   		//아니오면 그냥 그대로 
    	    }
    })
    
 
    
    
    
    
    
    
    

    
//-----------------------------------------------------------------------------------댓글영역    
    //review 영역
  var review =${review_list};
  console.log("리뷰리스트 ",review);
   
  for (i of review){
	 
	  var out =$('<div class="outl"></div>');
	  var w_id = $('<h4>'+i.member_guestid+'님'+'</h4>');
	  var w_cont = $('<p  class="dn">'+i.house_review_content+'</p>');
	  var w_dt =$('<a style="float:right" class="dn detail" href="#" data-toggle="modal" data-target="#detail" name="'+i.house_review_number+'">자세히보기</a>');
	  
	  $("#review").append(out);
	  out.append(w_id);
	  out.append(w_cont);
	  out.append(w_dt);	 
  }
    
    
  $(document).on('click',".detail", function() {
		console.log("클릭한 리뷰번호"+$(this).attr("name"));
		
		var rnum = $(this).attr("name");
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		
		$.ajax({
	        url: "hrest/hdreview",
	         type: 'post',
	         data : {"house_review_number":rnum},
	         dataType: "json", //rest 컨트롤 이용   
	         success:function(data){
	         console.log("자세한 리뷰내용",data);
	         	$("#d_img").empty();
	         	$("#d_content").empty();
	         	
	         	var d_content =$('<p>'+data[0].house_review_content+'</p>');
	         	$("#d_content").append(d_content);
	         	
	         	for(i of data){
	         		var d_img =$('<img style="width:200px;" src="'+i.house_review_sysfile+'">');
	         		$("#d_img").append(d_img);
	         	} 
	         },
	         
	         error:function(error){
	               console.log(error);
	            }
		 });//ajax 끝
	})  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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