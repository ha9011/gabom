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
<link rel="stylesheet" href="./resources/css/timepicker-addon.css" />
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="./resources/js/timepicker-addon.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"> 

<!-- Custom styles for this template -->
<link href="./resources/css/modern-business.css" rel="stylesheet">
<!-- <script src="./resources/js/bootstrap.min.js"></script> -->
<script src="./resources/js/jquery.bxslider.js"></script>
<script src="./resources/js/mooz.scripts.min.js"></script>
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	



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
#foodchangesearch{
border:none;
text-align:center;
}
#searchfood{
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
#freplelist{
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


<form action="searchfood" method="get" > <!-- foodmain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-5 col-lg-12">
                                <div style="padding: 0.5rem;margin-left: 50px;margin-bottom:30px;" class="out card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchfood" name="food_address" class="form-control form-control-borderless" type="search" placeholder="지역을 입력해주세요">
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
							<p>애완동물 금지<i class="fas fa-paw"></i>  흡연금지<i class="fas fa-smoking-ban"></i> 외부음식 금지<i class="fas fa-birthday-cake"></i></p>
							
							
						</div>
						
			<div class="blog-post-body" style="width:140%;">
				<div id="review" >
      			</div>
			</div>
      

        <!-- Comments Form -->
        <div class="card my-4" style="width: 100%;">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form  id="rel">
              <div class="form-group">
                <textarea id="reple_content" class="form-control" rows="3" name="food_reple_content"></textarea>
              </div>
              <button id="repleinsert_btn" type="button" class="btn btn-primary">등록</button>
              <input type="hidden" name="member_guestid" id="member_id">
              <input type="hidden" name="food_number" id="hrnum">
            </form>
          </div>
        </div>

        <!-- Single Comment -->
       <div id="freplelist">
       
      </div>
	</div>
	
	
      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">지금예약하기</h5>
          <div class="card-body">
          <form  id="reservation" name="reservation" method="post">
				<input class="date" type="text" name="foodreservation_date"
						id="datepicker" autocomplete="off" placeholder="예약날짜">
				<input class="date" type="text"
						name="foodreservation_time" id="timepicker" autocomplete="off" placeholder="예약시간">
				<input class="date" name="foodreservation_person" type="number" id="person" value="" placeholder="인원수를 선택하세요">명
				<input type="hidden" name="food_hostid" id="hostid">
				<input type="hidden" name="food_number" id="food_number"><br>

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

<script>
var food =${detailfood};
var test =${detailfreser};
console.log("food=",food);
console.log(test);

$(document).ready(function() {
    $('#hostid').val(food[0].food_hostid);
    $('#food_number').val(food[0].food_number);
});

var title =$('<'+food[0].food_name+'>'); // 집 이름 
$("#title").append(title);

$("#img").attr('src', food[0].food_sysname);
$("#img1").attr('src', food[1].food_sysname);
$("#img2").attr('src', food[2].food_sysname);
$("#img3").attr('src', food[3].food_sysname);
$("#img4").attr('src', food[4].food_sysname);


if(food[0].food_parkable == 0){
	food[0].food_parkable="불가능"
}else{
	food[0].food_parkable="가능"
}





//------------------------------------------------------------------------------이미지 영역
var food_info= $('<div class="info">'+'주소:'+food[0].food_address+'</div>')
var info= $('<div style="display:flex;"><p class="i">인원'+food[0].food_person+'명'+'&nbsp'+'</p>'
        +'<p class="i">주차장  '+food[0].food_parkable+'</p></div>')
$("#info").append(food_info);
$("#info").append(info);
//-----------------------------------------------------------------------------------------info영역
 
 $("#totalprice").attr('placeholder', 'PRICE PER night : '+food[0].food_price); 
 $("#person").attr('placeholder', '최대인원 : '+food[0].food_person+"명"  ); // 넘길때 이벤트 줘야함.

 //인원 버튼 
   $("#person").keyup(function(){
	   console.log(typeof food[0].food_person)
	   if($(this).val()>Number(food[0].food_person)){
		   alert("수용인원을 초과하였습니다. 최대인원 : "+food[0].food_person);   
		   $(this).val("")	;
		   $(this).focus()	;
	   }else{
		      
	   }
	    
   })
 //-----------------------------------------------------------------------------------------------인원 및 총가격
  $("#insertbtn").on("click", function (e) {
	  	e.preventDefault();
	 	console.log("ajax 예약");
       var formData = new FormData(document.getElementById("reservation")); 
        	
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
    });//---------------------------------------------------------예약영역------------------------------------------------------------------------
 
    var freplelist=${freplelist};
    console.log("댓글들",freplelist);
    var login_id = ${memberinfo}
    console.log("로그인아이디",login_id);
    console.log(login_id[0].member_id)
    
    if(freplelist == 0){
    	var none = $('<h1 style="margin:50px 0;color:lightgray;">댓글이 없습니다 댓글을 입력해주세요 !</h1>');
    	$("#freplelist").append(none);
    }else{
    
    for( i of freplelist){
    	
    	var cont1 =$('<div class="media mb-4" id="reple"></div>');
    	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
    	var cont3 =$('<div class="media-body"></div>');
    	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
    	var cont5 =$('<p>'+i.food_reple_time+'</p>');
    	var cont6 =$('<p>'+i.food_reple_content+'</p>');
    	
    	$("#freplelist").append(cont1);
    	cont1.append(cont2);
    	cont1.append(cont3);
    	cont3.append(cont4);
    	cont3.append(cont5);
    	cont3.append(cont6);
    	
		 if(i.member_guestid == login_id[0].member_id){
			
     		$("<button data-foodnum='"+food[0].food_number+"' data-replenum='"+i.food_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
    		                      .text("삭제").appendTo(cont1);
    	 }
		
	}
   }
    $("#repleinsert_btn").on('click',function(e){
    	
    	$("#hrnum").val(food[0].food_number);
    	$("#member_id").val(login_id[0].member_id);
    	var formData = new FormData(document.getElementById("rel")); 
    	
    	 $.ajaxSetup({         
   	      beforeSend : function(xhr){
   	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
   	      });//먼저 보냄
   	      
       $.ajax({
           url:'frest/insertreple',
           type:'post',
           data:formData,
           processData:false,
           contentType:false,  //제이슨 아니니깐 까보지마!!
            dataType:"json", //rest 컨트롤 이용   
           success:function(data){
              alert("댓글 입력완료 ");
              console.log("새로운댓글",data)
              $("#reple_content").val("");
              $("#freplelist").empty();
              
              for( i of data){
              	
              	var cont1 =$('<div class="media mb-4" id="reple"></div>');
              	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
              	var cont3 =$('<div class="media-body"></div>');
              	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
              	var cont5 =$('<p>'+i.food_reple_time+'</p>');
              	var cont6 =$('<p>'+i.food_reple_content+'</p>');
              	
              	$("#freplelist").append(cont1);
              	cont1.append(cont2);
              	cont1.append(cont3);
              	cont3.append(cont4);
              	cont3.append(cont5);
              	cont3.append(cont6);
              	
          		 if(i.member_guestid == login_id[0].member_id){
          			
               		$("<button data-foodnum='"+food[0].food_number+"' data-replenum='"+i.food_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
              		                      .text("삭제").appendTo(cont1);
              	 }
              }
              
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
    	var food_number = e.target.dataset.foodnum
    	console.log("댓글 번호 ",replenum);
    
    	var data ={
    			"food_reple_number":replenum,
    			"food_number":food_number
    	}
    	$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		
		$.ajax({
	        url: "frest/repledel",
	         type: 'post',
	         data :data,
	         dataType: "json", //rest 컨트롤 이용   
	         success:function(data){
	         console.log(data);
	         
	         $("#freplelist").empty();
	         for( i of data){
	              	
	              	var cont1 =$('<div class="media mb-4" id="reple"></div>');
	              	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
	              	var cont3 =$('<div class="media-body"></div>');
	              	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
	              	var cont5 =$('<p>'+i.food_reple_time+'</p>');
	              	var cont6 =$('<p>'+i.food_reple_content+'</p>');
	              	
	              	$("#freplelist").append(cont1);
	              	cont1.append(cont2);
	              	cont1.append(cont3);
	              	cont3.append(cont4);
	              	cont3.append(cont5);
	              	cont3.append(cont6);
	              	
	          		 if(i.member_guestid == login_id[0].member_id){
	          			
	               		$("<button data-foodnum='"+food[0].food_number+"' data-replenum='"+i.food_reple_number+"'></button").attr("id","btnDelete").attr("class","btn btn-warning")
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
  var review =${freviewlist};
  console.log("리뷰리스트 ",review);
  
  if(review == 0){
  	var none = $('<h1 style="margin:50px 0;color:lightgray;">아직 등록된 리뷰가 없습니다</h1>');
  	$("#review").append(none);
  }else{
  
  for( i of review){
    	
    	var cont1 =$('<div class="media mb-4" id="reple"></div>');
    	var cont2 =$('<img style="width:50px" class="d-flex mr-3 rounded-circle" src="'+i.member_profile_picture+'">');
    	var cont3 =$('<div class="media-body"></div>');
    	var cont4 =$('<h5 class="mt-0" id="use_name">'+i.member_guestid+'</h5>');
    	var cont5 =$('<p>'+i.food_rview_date+'</p>');
    	var cont6 =$('<p>'+i.food_review_content+'</p>');
    	var cont7 =$('<a class="dn detail" href="javascript:void(0);"  name="'+i.food_review_number+'">자세히보기</a>');
    	
    	$("#review").append(cont1);
    	cont1.append(cont2);
    	cont1.append(cont3);
    	cont3.append(cont4);
    	cont3.append(cont5);
    	cont3.append(cont6);
    	cont3.append(cont7);
    	
    	 }
  }
  $(document).on('click',".detail", function() {
		console.log("클릭한 리뷰번호"+$(this).attr("name"));
		
		$("#detail").show();
		
		var rnum = $(this).attr("name");
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		
		$.ajax({
	        url: "frest/hdreview",
	         type: 'post',
	         data : {"food_review_number":rnum},
	         dataType: "json", //rest 컨트롤 이용   
	         success:function(data){
	         console.log("자세한 리뷰내용",data);
	         	$("#d_img").empty();
	         	$("#d_content").empty();
	         	
	         	var d_content =$('<p style="color:black;margin:50px 15px;">'+data[0].food_review_content+'</p>');
	         	$("#d_content").append(d_content);
	         	
	         	for(i of data){
	         		var d_img =$('<img style="width:200px;height:150px;" src="'+i.food_review_sysfile+'">');
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
       timeFormat:'HH:mm',
       controlType:'select',
       'default': '00:00',
       minTime: food[0].food_mintime,
       maxTime: food[0].food_maxtime,
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