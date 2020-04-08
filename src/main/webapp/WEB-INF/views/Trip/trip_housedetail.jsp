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
<!-- Custom styles for this template -->
<link href="./resources/css/modern-business.css" rel="stylesheet">
  
<style>
.out{
width:100%;
border:1px solid lightgray;
margin:40px 0 0 0;
border-radius: 50px;
}
#searchbtn{
border-radius: 40px;
background-color:#3abade
}
#housechangesearch{
border:none;
text-align:center;
}
#searchhouse{
text-align:center;
margin:0 10px;
border:none;
}


.navbar-dark .navbar-nav .nav-link{
color:white;
}
#dtcommit{
font-size: 15px;
    width: 100px;
    height: 50px;
    position: absolute;
    margin-top: -26px;
    margin-left: 15px;
}
.date{/* 예약날짜 */
margin:0 0 5px 15px;
}
.d-block{
width:100%;
height:600px;
}
.i{
margin: 5px 15px 20px 0;
font-weight:bold;
}
#reple_list{
height:600px;
width:100%;
overflow:auto;
margin: 15px 0;
}
#btnDelete{
margin-right:50px;
}
.blog-post-body{
border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>

  <!-- Navigation -->
  <nav style="background-color:#3abade" class="navbar fixed-top navbar-expand-lg navbar-dark  fixed-top">
    <div class="container">
       <a class="navbar-brand" href="/gabom/"><img style="width: 200px;" src="./resources/headerImage/color_rogo.JPG"
					alt="logo"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="trip">여행</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="snsmain">sns</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="housechoice">숙박</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="foodmain">맛집</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="somoim/mainsomoim">소모임</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="servicecenter">고객센터</a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>


<form action="searchhouse" method="get" > <!-- housemain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-5 col-lg-12">
                                <div style="padding: 0.5rem;margin-left: 50px;margin-bottom:30px;" class="out card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchhouse" name="house_address" class="form-control form-control-borderless" type="search" placeholder="지역을 입력해주세요">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" class="btn btn-lg  " type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
          </div>
	</div>
	</form>


  <header>
    <div style="width: 70%;margin: 0 15%;" id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active">
            <img id="img" class="d-block" src="">
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" id="one">
           	<img id="img1" class="d-block" src="" >
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item">
           	<img id="img2" class="d-block" src="" >
        </div>
         <div class="carousel-item" >
            	<img id="img3" class="d-block" src="" >
        </div>
         <div class="carousel-item">
            	<img id="img4" class="d-block" src="" >
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h3 id="title" class="mt-4" style="margin-bottom: 20px;"></h3>

        <!-- Post Content -->
      <div class="blog-post-body">
      					<div id="info"></div>
							<p style="font-weight:bold;">주의사항</p>
							<p>체크인:오후 4:00 - 오후 10:00 &nbsp & &nbsp 체크아웃:오전 11:00</p>
							<p>예약 취소규정</p>
							<p>48시간 동안 취소 수수료 없음</p>
							<p>그 이후로 체크인 5일 전까지 취소하면 서비스 수수료를 제외한 전액이 환불됩니다.</p>
							<p>애완동물 금지<i class="fas fa-paw"></i>  흡연금지<i class="fas fa-smoking-ban"></i> 파티금지<i class="fas fa-birthday-cake"></i></p>
							
							
						</div>
						
			<div class="blog-post-body" style="width:140%;">
				<div id="review" style="margin: 15px;">
      			</div>
			</div>
      

        <!-- Comments Form -->
        <div class="card my-7" style="width: 140%;">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form  id="rel">
              <div class="form-group">
                <textarea id="reple_content" class="form-control" rows="3" name="house_reple_content"></textarea>
              </div>
              <button id="repleinsert_btn" type="button" class="btn btn-primary">등록</button>
              <input type="hidden" name="member_guestid" id="member_id">
              <input type="hidden" name="house_number" id="hrnum">
            </form>
          </div>
        </div>

        <!-- Single Comment -->
       <div id="reple_list">
       
      </div>
	</div>
	
	
      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">지금예약하기</h5>
          <div class="card-body">
          <form  id="reservation" name="reservation" method="post">
				<input class="date" type="text" name="reservation_checkin"
						id="datepicker1" autocomplete="off" placeholder="체크인 날짜">
				<input class="date" type="text"
						name="reservation_checkout" id="datepicker2" autocomplete="off" placeholder="체크아웃 날짜">
				<button type="button" id="dtcommit" class="btn btn-info">날짜확정</button>
				<br> <input class="date" name="reservation_totalprice" type="text"
						id="totalprice" placeholder="">만원<br> 
				<input class="date" name="reservation_person" type="number" id="person" value="" placeholder="인원수를 선택하세요">명
				<input type="hidden" name="house_hostid" id="hostid">
				<input type="hidden" name="house_number" id="house_number"><br>
				<input type="hidden" name="trip_number" id ="trip_number">
				<input type="hidden" name="trip_day" id ="trip_day">

				<button id="insertbtn" class="btn btn-lg btn-info btn-block">예약하기</button>
			</form>
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<div style="border-top:1px solid lightgray;margin-top:50px;"  >
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 


<!-- 리뷰상세보기  -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="d_img"></div>
       <div id="d_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="c-modal btn btn-secondary">Close</button>
      </div>
    </div>
  </div>
</div>



</body>

	<!-- <script src="./resources/js/bootstrap.min.js"></script> -->
	<script src="./resources/js/jquery.bxslider.js"></script>
	<script src="./resources/js/mooz.scripts.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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

var title =$('<'+house[0].house_name+'>'); // 집 이름 
$("#title").append(title);

$("#img").attr('src', house[0].house_sysname);
$("#img1").attr('src', house[1].house_sysname);
$("#img2").attr('src', house[2].house_sysname);
$("#img3").attr('src', house[3].house_sysname);
$("#img4").attr('src', house[4].house_sysname);


if(house[0].house_parkable == 0){
	house[0].house_parkable="불가능"
}else{
	house[0].house_parkable="가능"
}


//------------------------------------------------------------------------------이미지 영역

var house_info= $('<div class="info">'+'주소:'+house[0].house_address+'</div>')
var info= $('<div style="display:flex;"><p class="i">인원'+house[0].house_person+'명'+'&nbsp'+'</p>'
        +'<p class="i">주차장  '+house[0].house_parkable+'</p>'
        +'<p class="i">침실'+house[0].house_rooms+'개'+'</p>'
        +'<p class="i">침대'+house[0].house_beds+'개'+'</p>'
        +'<p class="i">욕실'+house[0].house_bathrooms+'개'+'</p>'+
        '</div>')
$("#info").append(house_info);
$("#info").append(info);
//-----------------------------------------------------------------------------------------info영역
 
 $("#totalprice").attr('placeholder', 'PRICE PER night : '+house[0].house_price); 
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
 var tripinfo =${tripinfo};
 console.log("여행정보",tripinfo);
 
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
    console.log("댓글들",reple_list);
    var login_id = ${memberinfo}
    //console.log(memberinfo);
    console.log("로그인아이디",login_id);
    console.log(login_id[0].member_id)
    
    for( i of reple_list){
    	
    	var cont1 =$('<div class="media mb-4" id="reple"></div>');
    	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
    	var cont3 =$('<div class="media-body"></div>');
    	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
    	var cont5 =$('<p>'+i.house_reple_time+'</p>');
    	var cont6 =$('<p>'+i.house_reple_content+'</p>');
    	
    	$("#reple_list").append(cont1);
    	cont1.append(cont2);
    	cont1.append(cont3);
    	cont3.append(cont4);
    	cont3.append(cont5);
    	cont3.append(cont6);
    	
		 if(i.member_guestid == login_id[0].member_id){
			
     		$("<button data-housenum='"+house[0].house_number+"' data-replenum='"+i.house_reple_number+"'></button").attr("class","btnDelete btn btn-warning")
    		                      .text("삭제").appendTo(cont1);
    	 }
		
	}
    
    
 $("#repleinsert_btn").on('click',function(e){
    	
    	$("#hrnum").val(house[0].house_number);
    	$("#member_id").val(login_id[0].member_id);
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
              console.log("새로운댓글",data)
              $("#reple_content").val("");
              $("#reple_list").empty();
              
              for( i of data){
              	
              	var cont1 =$('<div class="media mb-4" id="reple"></div>');
              	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
              	var cont3 =$('<div class="media-body"></div>');
              	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
              	var cont5 =$('<p>'+i.house_reple_time+'</p>');
              	var cont6 =$('<p>'+i.house_reple_content+'</p>');
              	
              	$("#reple_list").append(cont1);
              	cont1.append(cont2);
              	cont1.append(cont3);
              	cont3.append(cont4);
              	cont3.append(cont5);
              	cont3.append(cont6);
              	
          		 if(i.member_guestid == login_id[0].member_id){
          			
               		$("<button data-housenum='"+house[0].house_number+"' data-replenum='"+i.house_reple_number+"'></button").attr("class","btnDelete btn btn-warning").text("삭제").appendTo(cont1);
              	 }
              }
              
           },
           error:function(error){
              alert("댓글 입력 실패 ")
              console.log(error);
           }
           
        })
    	
    	
    	
    });// 댓글 등록 끝 
    
    $(document).on('click',".btnDelete",function(e){//댓글 삭제
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
	         
	         $("#reple_list").empty();
	         for( i of data){
	              	
	              	var cont1 =$('<div class="media mb-4" id="reple"></div>');
	              	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
	              	var cont3 =$('<div class="media-body"></div>');
	              	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
	              	var cont5 =$('<p>'+i.house_reple_time+'</p>');
	              	var cont6 =$('<p>'+i.house_reple_content+'</p>');
	              	
	              	$("#reple_list").append(cont1);
	              	cont1.append(cont2);
	              	cont1.append(cont3);
	              	cont3.append(cont4);
	              	cont3.append(cont5);
	              	cont3.append(cont6);
	              	
	          		 if(i.member_guestid == login_id[0].member_id){
	          			
	               		$("<button data-housenum='"+house[0].house_number+"' data-replenum='"+i.house_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
	              		                      .text("삭제").appendTo(cont1);
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
  
  for( i of review){
    	
    	var cont1 =$('<div class="media mb-4" id="reple"></div>');
    	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
    	var cont3 =$('<div class="media-body"></div>');
    	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
    	var cont5 =$('<p>'+i.house_review_date+'</p>');
    	var cont6 =$('<p>'+i.house_review_content+'</p>');
    	var cont7 =$('<a class="dn detail" href="#" name="'+i.house_review_number+'">자세히보기</a>');
    	
    	$("#review").append(cont1);
    	cont1.append(cont2);
    	cont1.append(cont3);
    	cont3.append(cont4);
    	cont3.append(cont5);
    	cont3.append(cont6);
    	cont3.append(cont7);
    	
    	
    	 }
  
  $(document).on('click',".detail", function() {
		console.log("클릭한 리뷰번호"+$(this).attr("name"));
		
		$("#detail").show();
		
		var rnum = $(this).attr("name");
		console.log(rnum);
		
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
	
	$(document).on('click','.c-modal' ,function() {
		$('#detail').hide();
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