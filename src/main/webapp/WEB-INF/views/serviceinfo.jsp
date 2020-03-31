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
width:140%;
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
width: 1550px;
}
.info{
display: flex;
margin:15px 20px;
}
.ttl{
margin:0 20px;
}
#img{
width:300px;

}
/* 사진 flex */
.m_out{
display:flex;
width:100%;
}
.line{
margin:10px;
border:1px solid black;
text-align:center;

}

</style>


</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="sideNav">
        <div id="profileArea">
			<div id="picArea" class="card" >
				<img id="meddelanden" class="card-img-top " src="${myinfodata.member_profile_picture}"  alt="Card image"
					style="width: 100%" >
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
         		<input id="changeProfile" type="file" name="changeProfile">
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="myinfo">내 정보</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="reserlist">예약리스트</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myfood">보유 맛집목록</a>
		</li>
		<li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myhouse">보유 숙박목록</a>
		</li>
     	<!-- <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="reviewlist">리뷰관리</a>
		</li> -->
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
					<button class="save btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">수정하기</button>
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
</body>
<script>

$(".save").on('click',function(e){
	 var formData = new FormData(document.getElementById("meminfo")); 
	 
     console.log(formData.get("member_name"));
     console.log(formData.get("member_birth"));
     console.log(formData.get("member_phone"));
     console.log(formData.get("member_email"));
     console.log(formData.get("member_address"));
     console.log(formData.get("member_hobby"));
     console.log(formData.get("member_profile_contents"));
     
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



// 내정보 탭 
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
		
		console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		if(!files[0]["type"].match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 
		}
		
		 var reader = new FileReader();
         reader.onload = function(e) {
             $('#meddelanden').attr('src', e.target.result);
         }
         reader.readAsDataURL(files[0]);
	})
	
})


$(document).on("click","#changePicBasic",function(){
	console.log("기본이미지")
	$("#meddelanden").trigger("click");
	
})
var date = getFormatDate(new Date());//오늘날짜 

//-------------------------------------------받은 예약리스트-----------------------------------------
$("#reserlist").on('click',function(e){
		e.preventDefault;
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/reserlist',
	  		type:'post',
	  		
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("내가 받은 예약 리스트 ",data);
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			var title = $('<div><h3>예약 리스트</h3></div>');
	  			$("#title").append(title);
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			$("#Content").append(table);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약장소'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'시간'+'</th>');//
				var t_th6 =$('<th>'+'예약 인원'+'</th>');//
				var t_th7 =$('<th>'+'예약 금액'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				t_tr.append(t_th7);
				
	  			for(i of data.hreserlist){// 업체명이 먼저 출력
	  				var cid = getFormatDate(i.reservation_checkin);
	  	  			var cod = getFormatDate(i.reservation_checkout);
	  	  			 	
	  	  			var subtr =$('<tr id="hstr"></tr>');
	  				table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.house_name+'</td>');//
	  				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  				var t_td4 =$('<td>'+cid+'-'+cod+'</td>');//
	  				var t_td5 =$('<td>'+'/'+'</td>');//
	  				var t_td6 =$('<td>'+i.reservation_person+'명'+'</td>');//
	  				var t_td7 =$('<td>'+i.reservation_totalprice+'원'+'</td>');//
	  				
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
	  				subtr.append(t_td4);
	  				subtr.append(t_td5);
	  				subtr.append(t_td6);
	  				subtr.append(t_td7);
	  					
	  			}
		 	  for(i of data.freserlist){// 업체명이 먼저 출력
		 		 	var cid = getFormatDate(i.foodreservation_date);
	  	  			 	
	  	  			var subtr =$('<tr id="hstr"></tr>');
	  				table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.food_name+'</td>');//
	  				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  				var t_td4 =$('<td>'+cid+'</td>');//
	  				var t_td5 =$('<td>'+i.foodreservation_time+'</td>');//
	  				var t_td6 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
	  				var t_td7 =$('<td>'+'/'+'원'+'</td>');//
	  				
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
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
	})
});

//-------------------------------------------보유 맛집 목록  ------------------------------------------

$(document).on('click','#myfood',function(e){
		e.preventDefault;
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myfoodlist',
	  		type:'post',
	  		
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("내 맛집 리스트 ",data);
	  			
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			if(data == []){
	  				var none = $('<div><h3>보유 목록이 없습니다 등록해주세요 </h3></div>');
	  				$("#title").append(none);
	  			}else{
	  				var title = $('<div><h3>보유 목록</h3></div>');
		  			$("#title").append(title);
		  			
		  			var m_out = $('<div class="m_out"></div>');
		  			$("#Content").append(m_out);
		  			let index =0;
		  		 	for(let i of data ){
		  		 		 if(index%5==0){
		  		 			 console.log(index);
		  		 			var br = $('<br><br>');
		  		 			$(".m_out").append(br);
		  		 		} 
		  		 		 
		  		 		 var out = $('<div class="line" name ='+[i.food_number]+'></div>')
		  		 		 var img = $('<div id="mainimg" name ='+[i.food_number]+'><img id="img" alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
		  		 		 var title=$('<h4>'+[i.food_name]+'</h4>');
		  		 		 var info = $('<div id="info">'+[i.food_address]+'</div>')
						 var delbtn = $('<button class="delfbtn btn-lg btn-warning btn-block" data-fnum="'+i.food_number+'">등록취소</button>');
		  		 		 
		  		 		$(".m_out").append(out);
		  		 		out.append(img);
		  		 		out.append(title);
		  		 		out.append(info);
		  		 		
		  		 	 	
		  		 		if(i.food_granttype == 0){
		  		 			 var dg = $('<p style="font-weight:bold;color:blue">승인대기중</p>');
		  		 			out.append(dg);
		  		 		 }/* else{
		  		 			var br = $('<br>');
		  		 			out.append(br);
		  		 		 } */
		  		 		out.append(delbtn);
		  		 		if(i.food_granttype == 1){
		  		 			$("#mainimg").on('click', function() {
		  						console.log($(this).attr("name"));
		  		    			location.href="fooddetail?food_number="+$(this).attr("name");
		  					});
		  		 		}
		  		 		index++;
		  		 	}
	  			}
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	})
});
//승인 타입 표시
//-------------------------------------------보유 집 목록---------------------------------------------

$(document).on('click','#myhouse',function(e){
		e.preventDefault;
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myhouselist',
	  		type:'post',
	  		
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("내 집 리스트 ",data);
	  			
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			if(data == []){
	  				var none = $('<div><h3>보유 목록이 없습니다 등록해주세요 </h3></div>');
	  				$("#title").append(none);
	  			}else{
	  				var title = $('<div><h3>보유 목록</h3></div>');
		  			$("#title").append(title);
		  			
		  			var m_out = $('<div class="m_out"></div>');
		  			$("#Content").append(m_out);
		  			
		  			let index =0;
		  		 	for(let i of data ){
		  		 		
		  		 		 if(index%5==0){
		  		 			 console.log(index);
		  		 			var br = $('<br><br>');
		  		 			$(".m_out").append(br);
		  		 		} 
		  		 		 
		  		 		 var out = $('<div class="line" name ='+[i.house_number]+'></div>');
		  		 		 var img = $('<div id="mainimg" name ='+[i.house_number]+'><img id="img" alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="'+[i.house_sysname]+'"></div>');
		  		 		 var title=$('<h4>'+[i.house_name]+'</h4>');
		  		 		 var info = $('<div id="info">'+"가격    "+[i.house_price]+"만원"+"<br>"+[i.house_address]+'</div>');
		  		 		 var delbtn = $('<button class="delhbtn btn-lg btn-warning btn-block" data-hnum="'+i.house_number+'">등록취소</button>');	
		  		 		 
		  		 		 $(".m_out").append(out);
		  		 			out.append(img);
		  					out.append(title);
		  		 			out.append(info);
		  		 		 
		  		 		 if(i.house_granttype == 0){
		  		 			 var dg = $('<p style="font-weight:bold;color:blue">승인대기중</p>');
		  		 			out.append(dg);
		  		 		 }else{
			  		 			var br = $('<br>');
			  		 			out.append(br);
			  		 		 }
		  		 		out.append(delbtn);
		  		 		 
		  		 		 if(i.house_granttype == 1){
		  		 			$(".house").on('click', function() {
			  					console.log("사진클릭")
			  					console.log($(this).attr("name"));
			  		    		location.href="housedetail?house_number="+$(this).attr("name");
			  				});
		  		 		 }
		  					 index++;
		  			 }
		  			
		  			
	  			}
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	})
});
//승인 타입 표시


$(document).on('click','.delhbtn',function(e){
	
var result = confirm( '등록을 취소하시겠습니까?' );
	
 if(result){
	var hnum = e.target.dataset.hnum
	//console.log(hnum);
	
	 var data = {
		 "house_number":hnum
	 }
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/delhouse',
	  		type:'post',
	  		data:data,
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log(data);
	  			alert("등록이 취소되었습니다.")
	  			$(".m_out").empty();
	  			
	  			let index =0;
	  		 	for(let i of data ){
	  		 		
	  		 		 if(index%5==0){
	  		 			 console.log(index);
	  		 			var br = $('<br><br>');
	  		 			$(".m_out").append(br);
	  		 		} 
	  		 		 
	  		 		 var out = $('<div class="line" name ='+[i.house_number]+'></div>');
	  		 		 var img = $('<div id="mainimg" name ='+[i.house_number]+'><img id="img" alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="'+[i.house_sysname]+'"></div>');
	  		 		 var title=$('<h4>'+[i.house_name]+'</h4>');
	  		 		 var info = $('<div id="info">'+"가격    "+[i.house_price]+"만원"+"<br>"+[i.house_address]+'</div>');
	  		 		 var delbtn = $('<button class="delhbtn btn-lg btn-warning btn-block" data-hnum="'+i.house_number+'">등록취소</button>');	
	  		 		 
	  		 		 $(".m_out").append(out);
	  		 			out.append(img);
	  					out.append(title);
	  		 			out.append(info);
	  		 		 
	  		 		 if(i.house_granttype == 0){
	  		 			 var dg = $('<p style="font-weight:bold;color:blue">승인대기중</p>');
	  		 			out.append(dg);
	  		 		 }else{
		  		 			var br = $('<br>');
		  		 			out.append(br);
		  		 		 }
	  		 		out.append(delbtn);
	  		 		 
	  		 		 if(i.house_granttype == 1){
	  		 			$(".house").on('click', function() {
		  					console.log("사진클릭")
		  					console.log($(this).attr("name"));
		  		    		location.href="housedetail?house_number="+$(this).attr("name");
		  				});
	  		 		 }
	  					 index++;
	  			 }
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
		})
 }else{
   		//아니오면 그냥 그대로 
    }
	
});

$(document).on('click','.delfbtn',function(e){
	
	var result = confirm( '등록을 취소하시겠습니까?' );
		
	 if(result){
		 var fnum = e.target.dataset.fnum
		//console.log(hnum);
		
		 var data = {
			 "food_number":fnum
		 }
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄

		      $.ajax({
		  		url:'myinfo/delfood',
		  		type:'post',
		  		data:data,
		  	 	dataType:"json", //rest 컨트롤 이용	
		  		success:function(data){
		  			console.log(data);
		  			alert("등록이 취소되었습니다.")
		  			$("#Content").empty();
		  			
		  			let index =0;
		  		 	for(let i of data ){
		  		 		 if(index%5==0){
		  		 			 console.log(index);
		  		 			var br = $('<br><br>');
		  		 			$(".m_out").append(br);
		  		 		} 
		  		 		 
		  		 		 var out = $('<div class="line" name ='+[i.food_number]+'></div>')
		  		 		 var img = $('<div id="mainimg" name ='+[i.food_number]+'><img id="img" alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
		  		 		 var title=$('<h4>'+[i.food_name]+'</h4>');
		  		 		 var info = $('<div id="info">'+[i.food_address]+'</div>')
						 var delbtn = $('<button class="delfbtn btn-lg btn-warning btn-block" data-fnum="'+i.food_number+'">등록취소</button>');
		  		 		 
		  		 		$(".m_out").append(out);
		  		 		out.append(img);
		  		 		out.append(title);
		  		 		out.append(info);
		  		 		
		  		 	 	
		  		 		if(i.food_granttype == 0){
		  		 			 var dg = $('<p style="font-weight:bold;color:blue">승인대기중</p>');
		  		 			out.append(dg);
		  		 		 }
		  		 		out.append(delbtn);
		  		 		if(i.food_granttype == 1){
		  		 			$("#mainimg").on('click', function() {
		  						console.log($(this).attr("name"));
		  		    			location.href="fooddetail?food_number="+$(this).attr("name");
		  					});
		  		 		}
		  		 		index++;
		  		 	}
	  		},
		  		error:function(error){
		  			alert("fail")
		  			console.log(error);
		  		}
			});
	 }else{
	   		//아니오면 그냥 그대로 
	    }
		
	});
	
//------------------------------------------리뷰관리-----------------------------------------------
/* $(document).on('click','#reviewlist',function(e){
		e.preventDefault;
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/reviewlist',
	  		type:'post',
	  		
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("리뷰목록 ",data);
	  			
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			if(data == 0){
	  				var none = $('<div><h3>작성된 리뷰가 없습니다 </h3></div>');
	  				$("#title").append(none);
	  			}else{
	  				var title = $('<div><h3>등록된 리뷰목록</h3></div>');
		  			$("#title").append(title);
		  			
		  			
		  			
	  			}
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	})
});
//승인 타입 표시

 */
//----------------------------------------기타 --------------------------------------------------


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