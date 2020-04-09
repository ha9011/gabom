<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/resume.min.css" rel="stylesheet">

<style>

section{
width:100%;
}
a{
cursor: pointer;
width:100%;
}
.list-group-item-action{
width:120%;
}

.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: white; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color:#064D84 ; 
	cursor: pointer; 
	border: 1px solid #064D84 ; 
	border-bottom-color: #064D84 ; 
	border-radius: .25em; 
} 
.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
}
/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  border: 1px solid #0080FF;
  border-bottom-color: #0080FF;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

#profileArea{
margin-top:70%; 
}
/* content 영역 */
#mainContent{
width:100%;
}
.table{
width: 120%;
}
.info{
display: flex;
margin:15px 20px;
}
.ttl{
margin:0 20px;
}
	
</style>


</head>

<body>

  <nav sty class="navbar navbar-expand-lg navbar-dark bg-primary" id="sideNav">
        <div id="profileArea">
			<div id="picArea" class="card" >
				<img id="meddelanden" class="card-img-top " src="${myinfodata.member_profile_picture}"  alt="Card image"
					style="width: 200px; height:200px" >
				</div>
			</div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
      
       <li class="nav-item filebox">
         		<div class="card-body">
					<h4 style="color:white;" class="card-title"></h4>
				</div>
         		<input id="changeProfile" type="file" name="changeProfile" >
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="myinfo">내 정보</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myreser">예약리스트</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" href="myplan">여행 리스트</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myreview">리뷰작성</a>
		</li>
     	<li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="writelist">게시물<br>좋아요<br>댓글</a>
		</li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
      	<div id="mainContent">
      		<div id="title">
			<h2>내 정보</h2>
			</div>
			<div id="Content">
				<div class="form-label-group">
                  	ID
                  	<input type="text" disabled  class="form-control" placeholder="${myinfodata.member_id}" >
                	</div>
                	<div class="form-label-group">
                  	PW
                  	<input type="text" disabled  class="form-control" placeholder="변경불가">
                	</div>
                	
                <form id="meminfo">	
                
                	<div class="form-label-group">
                  	NAME
                  	<input name="member_name" type="text" class="form-control" placeholder="${myinfodata.member_name}" 
                  			value="${myinfodata.member_name}">
                	</div>
                	<div class="form-label-group">
                  	BIRTH
                  	<input name="member_birth" type="text" class="form-control" placeholder="${myinfodata.member_birth}" 
                  		value="${myinfodata.member_birth}">
                	</div>
                	<div class="form-label-group">
                  	PHONE
                  	<input name="member_phone" type="text" class="form-control" placeholder="${myinfodata.member_phone}" 
                  		value="${myinfodata.member_phone}">
                	</div>
                	<div class="form-label-group">
                  	EMAIL
                  	<input name="member_email" type="text" class="form-control" placeholder="${myinfodata.member_email}" 
                  		value="${myinfodata.member_email}">
                	</div>
                	<div class="form-label-group">
                  	ADDRESS
                  	<input name="member_address" type="text" class="form-control" placeholder="${myinfodata.member_address}" 
                  		value="${myinfodata.member_address}">
                	</div>
                	<div class="form-label-group">
                  	HOBBY
                  	<input name="member_hobby" type="text" class="form-control" placeholder="${myinfodata.member_hobby}" 
                  		value="${myinfodata.member_hobby}">
                	</div>
                	<div class="form-label-group">
                  	MY PROFILE
                  	<input name="member_profile_contents" type="text" class="form-control" placeholder="${myinfodata.member_profile_contents}" 
                  		value="${myinfodata.member_profile_contents}" style="height:300px;">
                	</div>
					<button style="margin-top: 15px;"
					class="save btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">수정하기</button>
                </form>
			</div>
		</div>
		
    </section>

	</div>

<!-- 프로필 변경  -->
	<div class="modal fade" id="exampleModalChangeInfo" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


        

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./resources/js/resume.min.js"></script>


<!-- hreview Modal -->
<div class="modal fade" id="exampleModalhreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰를 작성해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form id="hre" enctype="multipart/form-data">
      <div class="modal-body">
    		<div class="filebox"> 
    			<label for="ex_filename">업로드</label> 
    			<input type="file" id="ex_filename" class="upload-hidden" name="house_review_orifile" multiple >
    				<div class="showPics"></div>
    				<div class="detail">
						<ul class="detailImage_sections"></ul>
					</div>
    		</div>
    		<input class="hreview_content" style="width:100%;min-height:400px;" type="text" name="house_review_content">
    		<input type="hidden" id="h_number" name="house_number">
    		<input type="hidden" id="r_number" name="reservation_number">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
        <button type="button" class="hreview btn btn-lg" data-dismiss="modal">Success</button>
      </div>
     </form>
    </div>
  </div>
</div>
   
<!-- freview Modal -->
<div class="modal fade" id="exampleModalfreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰를 작성해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="fre" enctype="multipart/form-data">
      <div class="modal-body">
    		<div class="filebox"> 
    			<label for="ex_filename">업로드</label> 
    			<input type="file" id="ex_filename" class="upload-hidden" name="food_review_orifile"multiple >
    			<div class="detail">
						<ul class="detailImage_sections"></ul>
				</div>
    		</div>
    		<input id="freview_content" style="width:100%;min-height:400px;" type="text" name="food_review_content">
    		<input type="hidden" id="f_number" name="food_number">
    		<input type="hidden" id="fr_number" name="freservation_number">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
        <button type="button" class="freview btn btn-lg" data-dismiss="modal">Success</button>
      </div>
     </form>
    </div>
  </div>
</div>

<!-- 리뷰상세보기  -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="d_img"></div>
       <div id="d_content"></div>
      </div>
      <div style="display:flex;" class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
       <div id="delbtn"></div>
      </div>
    </div>
  </div>
</div>
</body>




<script>

$(".save").on('click',function(e){
	 var formData = new FormData(document.getElementById("meminfo")); 
    
   $.ajaxSetup({         
 	      beforeSend : function(xhr){
 	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 	      });//먼저 보냄
     
     $.ajax({
         url:'myinfo/changememinfo',
         type:'post',
         data:formData,
         processData:false,
         contentType:false,  //제이슨 아니니깐 까보지마!!
          dataType:"json", //rest 컨트롤 이용   
         success:function(data){
            alert("변경완료");
            console.log(data);
            window.location.reload();
         },
         error:function(error){
       	  alert("실패");
            console.log(error);
         }
 }); 
	
})


var mty = "${myinfodata.member_type}";


if(mty == 1){
	mty = "여행자"
}else if(mty ==  2){
	mty ="서비스 업체"
}
var mt= $('<h4>'+mty+'</h4>');
$("#ty").append(mt);


var elem = '<div  class="well"><a id="changePicBasic" href="#">기본이미지변경</a></div>'+
'<div  class="well"><a id="changePicWant" href="#">사진이미지변경</a></div>'+
'<button id="close-popover" data-toggle="popover" class="btn btn-small btn-primary pull-right" onclick="$(&quot;#meddelanden&quot;).popover(&quot;hide&quot;);">Close please!</button>';

$('#meddelanden').popover({animation:true, content:elem, html:true});



	var a = "${myinfodata.member_name}";
	var b = "${myinfodata.member_id}";
	console.log(a);
	$(".card-title").append(a);

$(document).on("click","#changePicWant",function(){
	console.log("원하는 사진 변경")
	//ajax실행하기	
	$("#changeProfile").trigger("click");
	$("#meddelanden").trigger("click");
	
	$("#changeProfile").change(function(e){
		$('#meddelanden').attr('src', ""); // 변할 때마다 리셋
		var files = e.target.files;
		
		console.log("file",files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		if(!files[0]["type"].match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 
		}
		
		 var reader = new FileReader();
         reader.onload = function(e) {
             $('#meddelanden').attr('src', e.target.result);
         }
         reader.readAsDataURL(files[0]);
         
         // 사진 서버에 전송
         //<input id="changeProfile" type="file" name="changeProfile">
        
         let formData = new FormData(); //ajax로 넘길 data
			
		//let fileInput = document.getElementById("changeProfile"); //id로 파일 태그를 호출
		
		console.log("fileInput1",files[0]);
		console.dir("fileInput1",files[0]);
		formData.append("member_profile_picture", files[0]);

     	$.ajaxSetup({         
           beforeSend : function(xhr){
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
           });//먼저 보냄

           $.ajax({
       		url:'myinfo/mychangeProfile',
       		type:'post',
       		data: formData,
	      	processData: false,
	      	contentType: false,
       		success:function(data){
       			console.log(data);
       		
       		},
       		error:function(error){
       			alert("fail")
       			console.log(error);
       		}
       		
       	})//ajax end
         
	})
	
})


$(document).on("click","#changePicBasic",function(){
	console.log("기본이미지")
	$("#meddelanden").trigger("click");
	
})
//-----------------------------------------------------------------------------------------기본 정보 
var date = getFormatDate(new Date());//오늘날짜 


$("#myreser").on('click', function(e) {
	e.preventDefault;
	
	$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });//먼저 보냄

      $.ajax({
  		url:'myinfo/myreser',
  		type:'post',
  		
  	 	dataType:"json", //rest 컨트롤 이용	
  		success:function(data){
  			console.log(data);
  			$("#title").empty();
  			$("#Content").empty();
  			
  			var title = $('<div><h3>'+a+'님의 예약 리스트 '+'</h3></div>');
  			$("#title").append(title);
  			
  			var table =$('<table class="table"></table>');//전체 테이블 
  			var nextbtn =$('<button onclick="myfreser()" class="btn-lg btn-primary">맛집 예약보기  </button>');
  			$("#Content").append(table);
  			$("#Content").append(nextbtn);
  			
			var t_tr =$('<tr></tr>');//타이틀 tr
			table.append(t_tr);
			
			var t_th1 =$('<th>'+'예약번호'+'</th>');//
			var t_th2 =$('<th>'+'예약자명'+'</th>');//
			var t_th3 =$('<th>'+'예약장소'+'</th>');//
			var t_th4 =$('<th>'+'체크인'+'</th>');//
			var t_th5 =$('<th>'+'체크아웃'+'</th>');//
			var t_th6 =$('<th>'+'예약 인원'+'</th>');//
			var t_th7 =$('<th>'+'예약 금액'+'</th>');//
			var t_th8 =$('<th>'+'예약취소'+'</th>');//
			t_tr.append(t_th1);
			t_tr.append(t_th2);
			t_tr.append(t_th3);
			t_tr.append(t_th4);
			t_tr.append(t_th5);
			t_tr.append(t_th6);
			t_tr.append(t_th7);
			t_tr.append(t_th8);
			
			
			if(data == null){
				
			}else{
				
			
			
  			for(i of data){
  				
  				var cid = getFormatDate(i.reservation_checkin);
  			 	var cod = getFormatDate(i.reservation_checkout);
  			 	
  				
  				var subtr =$('<tr id="hstr"></tr>');
  				table.append(subtr);
  				
  				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
  				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
  				var t_td3 =$('<td style="overflow:hidden">'+i.house_name+'</td>');//
  				var t_td4 =$('<td>'+cid+'</td>');//
  				var t_td5 =$('<td>'+cod+'</td>');//
  				var t_td6 =$('<td>'+i.reservation_person+'명'+'</td>');//
  				var t_td7 =$('<td>'+i.reservation_totalprice+'원'+'</td>');//
  				
  				var t_td8 =$('<td><button class="cbtn btn btn-warning" data-resernum="'+i.reservation_number+'">예약취소</button></td>');//
  				
  				subtr.append(t_td1);
  				subtr.append(t_td2);
  				subtr.append(t_td3);
  				subtr.append(t_td4);
  				subtr.append(t_td5);
  				subtr.append(t_td6);
  				subtr.append(t_td7);
  				subtr.append(t_td8);
  				
  			}
		}
  			 
  		
  		},
  		error:function(error){
  			alert("fail")
  			console.log(error);
  		}
  		
  	})//ajax end
})// 클릭이벤트 끝

//-----------------------------------------------맛집 불러오기 
 function myfreser() {
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myfreser',
	  		type:'post',
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log(data);
	  			$("#Content").empty();
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			var nextbtn =$('<button onclick="" class="btn-lg btn-primary">숙박 예약보기</button>');
	  			$("#Content").append(table);
	  			$("#Content").append(nextbtn);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약번호'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th3 =$('<th>'+'예약장소'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'예약시간'+'</th>');//
				var t_th6 =$('<th>'+'예약 인원'+'</th>');//
				var t_th7 =$('<th>'+'예약 취소'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				t_tr.append(t_th7);
				
				
	  			for(i of data){
	  				
	  			var rd = getFormatDate(i.foodreservation_date);
	  				
	  			var subtr =$('<tr id="fstr"></tr>');
	  			table.append(subtr);
	  				
	  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
	  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  			var t_td3 =$('<td>'+i.food_name+'</td>');//
	  			var t_td4 =$('<td>'+rd+'</td>');//
	  			var t_td5 =$('<td>'+i.foodreservation_time+'</td>');//
	  			var t_td6 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
	  			var t_td7 =$('<td><button class="fcbtn btn btn-warning"data-fresernum="'+i.foodreservation_number+'">예약취소</button></td>');//
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
	  				subtr.append(t_td3);
	  				subtr.append(t_td4);
	  				subtr.append(t_td5);
	  				subtr.append(t_td6);
	  				subtr.append(t_td7);
	  				
	  			}
	  			 
	  			 
	  		
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	})//ajax end
	}// 클릭이벤트 끝
 
//-------------------------------------------------------------------숙박취소버튼 
//resernum 숙박 취소버튼 
//fresernum 맛집 취소버튼 

$(document).on('click','.cbtn',function(e) {
	
	var result = confirm( '예약을 취소하시겠습니까?' );
	
    if(result){
    	var reservation_number = e.target.dataset.resernum
    	console.log(reservation_number);
    	
    	var data ={
    			"reservation_number":reservation_number
    			}
    	$.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
     
     
     $.ajax({
        
          url: 'myinfo/deletehreser',
           type: 'post',
           data :data,
           dataType: "json", //rest 컨트롤 이용   
           success:function(data){
        	   alert("예약이 취소되었습니다.")
        	   $("#hstr").empty();
             
     			for(i of data){
     				
     				var cid = getFormatDate(i.reservation_checkin);
     			 	var cod = getFormatDate(i.reservation_checkout);	  
     				
     				var subtr =$('<tr id="hstr"></tr>');
     				table.append(subtr);
     				
     				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
     				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td>'+cid+'</td>');//
     				var t_td5 =$('<td>'+cod+'</td>');//
     				var t_td6 =$('<td>'+i.reservation_person+'명'+'</td>');//
     				var t_td7 =$('<td>'+i.reservation_totalprice+'원'+'</td>');//
     				var t_td8 =$('<td><button class="cbtn btn btn-warning" data-resernum="'+i.reservation_number+'">예약취소</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				subtr.append(t_td6);
     				subtr.append(t_td7);
     				subtr.append(t_td8);
     				
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
//---------------------------------------------------------맛집 예약 취소 
$(document).on('click','.fcbtn',function(e) {
	
	var result = confirm( '예약을 취소하시겠습니까?' );
	
    if(result){
    	var foodreservation_number = e.target.dataset.fresernum
    	console.log(foodreservation_number);
    	
    	var data ={
    			"foodreservation_number":foodreservation_number
    			}
    	$.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
     
     
     $.ajax({
        
          url: 'myinfo/deletefreser',
           type: 'post',
           data :data,
           dataType: "json", //rest 컨트롤 이용   
           success:function(data){
        	   alert("예약이 취소되었습니다.")
        	   $("#fstr").empty();
	  			
	  			for(i of data){
	  				
	  			var rd = getFormatDate(i.foodreservation_date);
	  				
	  			var subtr =$('<tr></tr>');
	  			table.append(subtr);
	  				
	  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
	  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  			var t_td3 =$('<td>'+i.food_name+'</td>');//
	  			var t_td4 =$('<td>'+rd+'</td>');//
	  			var t_td5 =$('<td>'+i.foodreservation_time+'</td>');//
	  			var t_td6 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
	  			var t_td7 =$('<td><button class="fcbtn btn btn-warning"data-fresernum="'+i.foodreservation_number+'">예약취소</button></td>');//
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
	  				subtr.append(t_td3);
	  				subtr.append(t_td4);
	  				subtr.append(t_td5);
	  				subtr.append(t_td6);
	  				subtr.append(t_td7);
	  				
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

//----------------------------------------------------------------------------리뷰 작성란 
$("#myreview").on('click', function(e) {
	e.preventDefault;
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myhreview',
	  		type:'post',
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("전체 내역",data);
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			var title = $('<div><h3>'+a+'님의 리뷰내역 '+'</h3></div>');
	  			$("#title").append(title);
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			$("#Content").append(table);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약번호'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th3 =$('<th>'+'예약장소'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'예약 인원'+'</th>');//
				var t_th6 =$('<th>'+'리뷰작성'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				
	  			
				
	  			for(i of data.hlist){
	  				var cid = getFormatDate(i.reservation_checkin);
	  				var subtr =$('<tr id="hrel"></tr>');
		  			table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
     				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td>'+cid+'</td>');//
     				var t_td5 =$('<td>'+i.reservation_person+'명'+'</td>');//
     				var t_td6 =$('<td><button class="hreviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalhreview" data-resernum="'+i.reservation_number+'">리뷰작성</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				subtr.append(t_td6);
     				
     				$(".hreview").attr("data-hnum",i.house_number).attr("data-resernum",i.reservation_number);
	  				
	  			}
	  			
	  			for(i of data.flist){
	  				
	  				var rd = getFormatDate(i.foodreservation_date);
	  				
		  			var subtr =$('<tr id="frel"></tr>');
		  			table.append(subtr);
		  				
		  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
		  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
		  			var t_td3 =$('<td>'+i.food_name+'</td>');//
		  			var t_td4 =$('<td>'+rd+'</td>');//
		  			var t_td5 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
		  			var t_td6 =$('<td><button class="freviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalfreview" data-fresernum="'+i.foodreservation_number+'">리뷰작성</button></td>');//
		  				subtr.append(t_td1);
		  				subtr.append(t_td2);
		  				subtr.append(t_td3);
		  				subtr.append(t_td4);
		  				subtr.append(t_td5);
		  				subtr.append(t_td6);
		  				
		  				$(".freview").attr("data-fnum",i.food_number).attr("data-fresernum",i.foodreservation_number);
     				
	  			}
	  			
	  			
//--------------------------------------------------------------------------------------------------리뷰작성한 테이블 	  			
	  			
	  			var tbtn=$('<button data-toggle="collapse" data-target="#det" class="accordion-toggle btn-lg btn-primary">작성한 리뷰보기</button>')
	  			$("#Content").append(tbtn);
	  			
	  			
	  			var table2 =$('<br><table class="table accordian-body collapse" id="det" ></table>');//전체 테이블 
	  			$("#Content").append(table2);
	  			
	  			
				var t_tr2 =$('<tr></tr>');//타이틀 tr
				table2.append(t_tr2);
				
				var t_th11 =$('<th>'+'작성자'+'</th>');//
				var t_th21 =$('<th>'+'작성날짜'+'</th>');//
				var t_th31 =$('<th>'+'예약장소'+'</th>');//
				var t_th41 =$('<th>'+'상세보기'+'</th>');//
				
				t_tr2.append(t_th11);
				t_tr2.append(t_th21);
				t_tr2.append(t_th31);
				t_tr2.append(t_th41);
				
				for(i of data.hrel){ //숙박작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr id="hde"></tr>');
		  			table2.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
				
				for(i of data.frel){ //맛집작성한 리뷰 
	  				var rd = getFormatDate(i.food_review_date);
	  				var subtr =$('<tr id="fde"></tr>');
		  			table2.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.food_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.food_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  				  			
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
	     
	    
})//---------------------------------------------------------------리뷰 작성 끝 

$(document).on('click',".detail", function() {
	console.log("클릭한 리뷰번호"+$(this).attr("name"));
	
	var rnum = $(this).attr("name");
	
	$.ajax({
        url: "myinfo/showhreview",
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


//---------------------------------------------------------------------리뷰 자세히 모달 


$(".upload-hidden").change(function(e){
	$("#detailImage_sections").empty();  // 변할 때마다 리셋
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	console.log(filesArr); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
	
	filesArr.forEach(function(f,i){
		console.log(f)
		console.log(i)
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 	
		}
		
		
		 var reader = new FileReader();
         reader.onload = function(e) {
         	var $li = $("<li></li>").attr("class","detailPictures");
         	var $tt = $li.append($('<img/>').attr('src', e.target.result).css("width", "100px").css("heigh","100px"));
         	$("#detailImage_sections").append($tt);
         }
         reader.readAsDataURL(f);
	});//end forEach
})
//-----------------------------------------------------------------------이미지 

 $(document).on('click',".hreview",function(e){//리뷰 작성
	 $(".showPics").empty();
	 $(".hreview_content").empty();
	 
	 var house_number = e.target.dataset.hnum
	 var reservation_number= e.target.dataset.resernum
	 $("#h_number").val(house_number);
	 $("#r_number").val(reservation_number);
	 var formData = new FormData(document.getElementById("hre")); 
	 
	 console.log(formData.get("reservation_number"));
	 
	 $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/inserthreview',
	  		type:'post',
	  		processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
	  		data: formData,
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("작성리뷰 업데이트",data);
	  			$("#hde").empty();
	  			$("#hrel").empty();
	  			
	  			
	  			
	  			for(i of data.hlist){
	  				var cid = getFormatDate(i.reservation_checkin);
	  				var subtr =$('<tr id="hrel"></tr>');
		  			table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
     				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td>'+cid+'</td>');//
     				var t_td5 =$('<td>'+i.reservation_person+'명'+'</td>');//
     				var t_td6 =$('<td><button class="hreviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalhreview" data-resernum="'+i.reservation_number+'">리뷰작성</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				subtr.append(t_td6);
     				
     				$(".hreview").attr("data-hnum",i.house_number).attr("data-resernum",i.reservation_number);
	  				
	  			}
	  			
	  			for(i of data){ //작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr></tr>');
		  			$("#det").append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  		
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
}) 

$(document).on('click',".freview",function(e){
	 
	 var food_number = e.target.dataset.fnum
	 var food_reservation_number= e.target.dataset.fresernum
	 $("#f_number").val(food_number);
	 $("#fr_number").val(food_reservation_number);
	 var formData = new FormData(document.getElementById("fre")); 
	 
	 console.log(formData.get("food_reservation_number"));
	 
	 $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/insertfreview',
	  		type:'post',
	  		processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
	  		data: formData,
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("작성리뷰 업데이트",data);
	  			$("#fde").empty();
	  			$("#frel").empty();
	  			
					for(i of data.flist){
	  				
	  				var rd = getFormatDate(i.foodreservation_date);
	  				
		  			var subtr =$('<tr id="frel"></tr>');
		  			table.append(subtr);
		  				
		  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
		  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
		  			var t_td3 =$('<td>'+i.food_name+'</td>');//
		  			var t_td4 =$('<td>'+rd+'</td>');//
		  			var t_td5 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
		  			var t_td6 =$('<td><button class="freviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalfreview" data-fresernum="'+i.foodreservation_number+'">리뷰작성</button></td>');//
		  				subtr.append(t_td1);
		  				subtr.append(t_td2);
		  				subtr.append(t_td3);
		  				subtr.append(t_td4);
		  				subtr.append(t_td5);
		  				subtr.append(t_td6);
		  				
		  				$(".freview").attr("data-fnum",i.food_number).attr("data-fresernum",i.foodreservation_number);
     				
	  			}
	  			
	  			for(i of data){ //작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr></tr>');
		  			$("#det").append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  		
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
}) 
//--------------------------------------------------------------------------------- 리뷰 끝

$("#writelist").on('click', function() { //게시물 클릭 작성한 게시물 sns제외 가져옴 .
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/writelist',
	  		type:'post',
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log(data);
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			var title = $('<div><h3>'+a+'님의 게시글 '+'</h3></div>');
	  			$("#title").append(title);
	  			
	  			
	 			var qa=$('<a href="#" data-toggle="collapse" data-target="#qna" class="accordion-toggle  list-group-item list-group-item-action list-group-item-primary">QnA 작성글 보기 </a>')
	  			$("#Content").append(qa);
	 			
	  			
	  			var table =$('<table class="table accordian-body collapse" id="qna"></table>');//전체 테이블 
	  			$("#Content").append(table);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'글번호 '+'</th>');//
				var t_th2 =$('<th>'+'작성자 '+'</th>');//
				var t_th3 =$('<th>'+'글제목'+'</th>');//
				var t_th4 =$('<th>'+'작성날'+'</th>');//
				var t_th5 =$('<th>'+'내용보기 '+'</th>');//
				
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				
	  			
    			for(i of data.qnal){ //qna 게시판 글 
	  				var rd = getFormatDate(i.qna_date);
	  				var subtr =$('<tr id="subtr"></tr>');
	  				table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.qna_number+'</td>');//
     				var t_td2 =$('<td>'+i.qna_member_id+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.qna_title+'</td>');//
     				var t_td4 =$('<td>'+rd+'</td>');//
     				var t_td5 =$('<td><a  name="'+i.qna_number+'" class="qna" data-toggle="modal" data-target="#detail">내용보기</a></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				
				}
    			//---------------------------------qna 게시판 게시글 ----------------------------------------------------------------------
    			
    			var qa=$(' <a href="#" data-toggle="collapse" data-target="#som" class="accordion-toggle list-group-item list-group-item-action list-group-item-success">소모임 작성글 보기 </a>')
	  			$("#Content").append(qa);
    			
    			
    			var table =$('<table class="table accordian-body collapse" id="som"></table>');//전체 테이블 
	  			$("#Content").append(table);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'소모임이름 '+'</th>');//
				var t_th3 =$('<th>'+'글제목'+'</th>');//
				var t_th5 =$('<th>'+'내용보기 '+'</th>');//
				
				t_tr.append(t_th1);
				t_tr.append(t_th3);
				t_tr.append(t_th5);
				
	  			
    			for(i of data.soml){ //소모임 게시글 
	  				var subtr =$('<tr id="subtr"></tr>');
	  				table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.somoim_name+'</td>');//
     				var t_td3 =$('<td>'+i.board_title+'</td>');//
     				var t_td5 =$('<td><a  name="'+i.board_number+'" class="som" data-toggle="modal" data-target="#detail">내용보기</a></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td3);
     				subtr.append(t_td5);
     				
				}
    			
    		//----------------------------------------소모임 게시글 ----------------------------------------------------------	
    			
    			var qa=$('<a href="#" data-toggle="collapse" data-target="#snslike" class="accordion-toggle  list-group-item list-group-item-action list-group-item-info">SNS 좋아요 목록 </a>')
	  			$("#Content").append(qa);
	 			
	  			
	  			var ul =$('<ul class="table accordian-body collapse" id="snslike"></ul>');//전체 테이블 
	  			$("#Content").append(ul);
	  		
	  			
    			for(i of data.snslikel){ //sns 좋아요 목록 
	  				
	  				var li = $('<li>'+'글 내용  -   '+i.sns_posts_content+'  에 좋아요를 누르셨습니다.'+'</li>');
	  				ul.append(li);
				}
    		
    		
    		//-------------------------------------------sns 좋아요--------------------------------------------------------------------
	  		
    			var qa=$('<a href="#" data-toggle="collapse" data-target="#somolike" class="accordion-toggle  list-group-item list-group-item-action list-group-item-primary">소모임 좋아요 목록 </a>')
	  			$("#Content").append(qa);
	 			
    			var ul =$('<ul class="table accordian-body collapse" id="somolike"></ul>');//전체 테이블 
	  			$("#Content").append(ul);
	  		
	  			
    			for(i of data.somolikel){ //소모임 좋아요 목록  
	  				
	  				var li = $('<li>'+i.somoim_name+'소모임에 게시글   '+i.board_title+'  에 좋아요를 누르셨습니다.'+'</li>');
	  				ul.append(li);
				}
    		
	  		//-----------------------------------소모임 좋아요 --------------------------------------------------------------
	  		
	  		
    			var qa=$('<a href="#" data-toggle="collapse" data-target="#snsreple" class="accordion-toggle  list-group-item list-group-item-action list-group-item-success">SNS 댓글 목록  </a>')
	  			$("#Content").append(qa);
	 			
	  			
    			var ul =$('<ul class="table accordian-body collapse" id="snsreple"></ul>');//전체 테이블 
	  			$("#Content").append(ul);
	  		
	  			
    			for(i of data.snsreple){ //sns댓글 
	  				
	  				var li = $('<li>'+i.sns_posts_content+'을 남겼습니다.'+'</li>');
	  				ul.append(li);
				}
    		//---------------------------------------------------------sns 댓글 -------------------------------
    			var qa=$('<a href="#" data-toggle="collapse" data-target="#freple" class="accordion-toggle  list-group-item list-group-item-action list-group-item-primary">맛집 댓글 목록</a>')
	  			$("#Content").append(qa);
	 			
	  			
    			var ul =$('<ul class="table accordian-body collapse" id="freple"></ul>');//전체 테이블 
	  			$("#Content").append(ul);
	  		
	  			
    			for(i of data.freple){ //맛집댓글 
	  				
	  				var li = $('<li>'+i.food_name+' GABOM FOOD에 '+i.food_reple_content+'  댓글을 남기셨습니다.'+'</li>');
	  				ul.append(li);
				}
    			
    		//---------------------------------------------------------맛집 댓글 목록 --------------------------------
    		var qa=$('<a href="#" data-toggle="collapse" data-target="#hreple" class="accordion-toggle  list-group-item list-group-item-action list-group-item-primary">숙박 댓글 목록</a>')
	  			$("#Content").append(qa);
	 				
    		var ul =$('<ul class="table accordian-body collapse" id="hreple"></ul>');//전체 테이블 
	  			$("#Content").append(ul);
	  		
	  			
				for(i of data.hreple){ //맛집댓글 
	  				
	  				var li = $('<li>'+i.house_name+' GABOM HOUSE에 '+i.house_reple_content+'  댓글을 남기셨습니다.'+'</li>');
	  				ul.append(li);
				}
	  		
	  		},
	  		 error:function(error){
                 console.log(error);
              }
     });//ajax 끝
})
     
     $(document).on('click','.qna', function() { //게시글 내용보기 모달
    	 var qnanum = $(this).attr("name");
    		
    		$.ajax({
    	        url: "myinfo/showcontent",
    	         type: 'post',
    	         data : {"qna_number":qnanum},
    	         dataType: "json", //rest 컨트롤 이용   
    	         success:function(data){
    	         console.log("게시글 상세내용",data);
    	         	$("#d_content").empty();
    	         	$("#delbtn").empty();
    	         	
    	         	var q_cont = $('<div><p>'+data[0].qna_body+'</p></div>');
    	         	var delbtn =$('<button data-qnum="'+data[0].qna_number+'" class="delbtn btn btn-secondary" data-dismiss="modal">삭제 </button>');
    	         	$("#d_content").append(q_cont);
    	         	$("#delbtn").append(delbtn);
    	         	
    	         	
    	         },
    	         
    	         error:function(error){
    	               console.log(error);
    	            }
    		 });//ajax 끝
    	})
$(document).on('click','.delbtn',function(e){// 게시글 삭제 

	var result = confirm( '삭제하시겠습니까?' );
	
    if(result){
	
	var qnum = e.target.dataset.qnum
	
	console.log(qnum);
	
	$.ajax({
        url: "myinfo/delqna",
         type: 'post',
         data : {"qna_number":qnum},
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
        	 console.log("글 다시 불러옴",data)
	  		$("#subtr").empty();
	  			
	  			
 			for(i of data){ //작성한 리뷰 
	  			var rd = getFormatDate(i.qna_date);
	  				
	  			var t_td1 =$('<td>'+i.qna_number+'</td>');//
  				var t_td2 =$('<td>'+i.qna_member_id+'님'+'</td>');//
  				var t_td3 =$('<td>'+i.qna_title+'</td>');//
  				var t_td4 =$('<td>'+rd+'</td>');//
  				var t_td5 =$('<td><a  name="'+i.qna_number+'" class="qna" data-toggle="modal" data-target="#detail">내용보기</a></td>');//
  				$(".subtr").append(t_td1);
  				$(".subtr").append(t_td2);
  				$(".subtr").append(t_td3);
  				$(".subtr").append(t_td4);
  				$(".subtr").append(t_td5);
  				
				}
         },
         
         error:function(error){
               console.log(error);
            }
	 });//ajax 끝
    }else{
    	// 취소면 그냥 내비둬 
    }
})

//----------------------------------소모임 게시글 상세보기 지우기 ----------------------------------------


$(document).on('click','.som', function() { //게시글 내용보기 모달
    	 var sbnum = $(this).attr("name");
    		
    		$.ajax({
    	        url: "myinfo/showcontentsomo",
    	         type: 'post',
    	         data : {"board_number":sbnum},
    	         dataType: "json", //rest 컨트롤 이용   
    	         success:function(data){
    	         console.log("게시글 상세내용",data);
    	         	$("#d_content").empty();
    	         	$("#delbtn").empty();
    	         	
    	         	var q_cont = $('<div><p>'+data[0].board_content+'</p></div>');
    	         	var delbtn =$('<button data-snum="'+data[0].board_number+'" class="delbtnsomo btn btn-secondary" data-dismiss="modal">삭제 </button>');
    	         	$("#d_content").append(q_cont);
    	         	$("#delbtn").append(delbtn); 
    	         	
    	         	
    	         },
    	         
    	         error:function(error){
    	               console.log(error);
    	            }
    		 });//ajax 끝
    	})
$(document).on('click','.delbtnsomo',function(e){// 게시글 삭제 

	var result = confirm( '삭제하시겠습니까?' );
	
    if(result){
	
	var snum = e.target.dataset.snum
	
	console.log(snum);
	
	$.ajax({
        url: "myinfo/delsomo",
         type: 'post',
         data : {"board_number":snum},
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
        	 console.log("글 다시 불러옴",data)
	  		$("#subtr").empty();
	  			
	  			
        	 for(i of data){ //소모임 게시글 
        		 
	  			var t_td1 =$('<td>'+i.somoim_name+'</td>');//
  				var t_td3 =$('<td>'+i.board_title+'</td>');//
  				var t_td5 =$('<td><a  name="'+i.board_number+'" class="som" data-toggle="modal" data-target="#detail">내용보기</a></td>');//
  				$(".subtr").append(t_td1);
  				$(".subtr").append(t_td3);
  				$(".subtr").append(t_td5);
  				
				}
         },
         
         error:function(error){
               console.log(error);
            }
	 });//ajax 끝
    }else{
    	// 취소면 그냥 내비둬 
    }
})


























$("#ex_filename").change(function(e){
		$("#showPics").empty();  // 변할 때마다 리셋
		console.log("???")
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		console.log(filesArr); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		filesArr.forEach(function(f,i){
			console.log(f)
			console.log(i)
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능함")
				return 	
			}
			
			
			 var reader = new FileReader();
	         reader.onload = function(e) {
	         	var $li = $("<span></span>").attr("class","detailPictures");
	         	var $tt = $li.append($('<img/>').attr('src', e.target.result).css("width", "100px").css("heigh","100px"));
	         	$(".showPics").append($tt);
	         }
	         reader.readAsDataURL(f);
	         //$("#detail").show();
		});//end forEach
	})











//----------------------------------------------------------------------------

 $('.accordian-body').on('show.bs.collapse', function () {//아코디언 
	    	    $(this).closest("table")
	    	        .find(".collapse.in")
	    	        .not(this)
	    	        //.collapse('toggle')
	    	}) 


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
</script>
</html>