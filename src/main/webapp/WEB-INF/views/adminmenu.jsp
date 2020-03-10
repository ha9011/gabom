<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스업체 등록 심사</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<!-- 제이쿼리 -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
부트스트랩 -->

<style>
#headerContainer {
	margin-top: 10px;
	border-radius: 20px;
	background-color: white;
}

img {
	float: none;
	margin: 0 auto;
	display: flex;
	align-items: center;
	width: 250px;
	height: 75px;
	margin-bottom: 40px;
}

li {
	font-size: 16px;
	font-weight: 700;
	font-family: 'Jua' ;
}
#logout{
border: 0;
outline: 0;
background-color: white;
color: #337ab7;
font-family: 'Jua' ;
width: 85px;
height: 50px;
}
#logout:hover{
background-color: #E6E6E6
}

/* -------------------------------------------------------------- */
#housemain_judge {
	width: 70%;
	margin-left: 5%;
}

#house_judge {
	height: auto;
	width: 100%;
	display: block;
	border: 1px solid black;
	width: 100%;
	overflow: auto;
}

#foodmain_judge {
	width: 70%;
	margin-left: 5%;
}

#food_judge {
	display: block;
	border: 1px solid black;
	width: 100%;
	overflow: auto;
}

#list_left {
	float: left;
	height: 100%;
	width: 20%;
	display: block;
	padding: 6px;
}

#list_right_sec {
	float: left;
	width: 78%;
	height: 230px;
}

#list_right {
	height: 70%;
	display: block;
	padding: 6px;
}

#list_button {
	float: right;
}

ul {
	list-style: none;
}

li {
	float: left;
}
</style>

</head>
<body>
	<div class="container" id="headerContainer">
		<%-- <div class="col-md-12 col-sm-12 col-xs-12">
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAnonymous()">
					<li><a href="login" >로그인</a></li>
					<li><a href="joinselecttype">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="myinfo">나의 정보</a></li>
					<li>
						<form method="post" action="/gabom/logout">	
							<input type="submit" value="로그아웃" id="logout"> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</li>
				</sec:authorize>
			</ul>
		</div> --%>
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 40px;"><a href="/gabom/">
			<img src="resources/headerImage/logo3.png">
			</a>
		</div>
	</div>
	<div class="container">
		<!-- <h2>Toggleable Tabs</h2> -->
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist" style="background-color: infobackground;">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#jodge">서비스업체 등록심사</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">서비스업체 신고관리</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu2">여행객계획 등록심사</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu3">여행객 신고관리</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#all_notices" id="all_notices_click">전체회원 공지사항</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#qna_board" id="qna_board_click">QnA</a></li>
			<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
		</ul>
		<!-- Tab 내용 -->
		<div class="tab-content">
			<div id="jodge" class="container tab-pane active">
				<br>
				<div>
					<div id="service_main">
						<div id="housemain_judge">
							<h3>House심사대기 List</h3>
						</div>
						<div id="foodmain_judge">
							<h3>Food심사대기 List</h3>
						</div>
					</div>
				</div>
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<h3>서비스업체 신고관리</h3>
				<p>메 뉴 1</p>
			</div>
			<div id="menu2" class="container tab-pane fade">
				<br>
				<h3>여행객계획 등록심사</h3>
				<p>메뉴2</p>
			</div>
			<div id="menu3" class="container tab-pane fade">
				<br>
				<h3>여행객 신고관리</h3>
				<p>메뉴3</p>
			</div>
			<div id="all_notices" class="container tab-pane fade">
				<br>
				<h3>전체회원 공지사항</h3>
				<div>
					<table id="boards" class="table table-hover">
						<colgroup>
							<!-- 열너비 지정 -->
							<col width="15%">
							<col width="45%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="notices_body">
						</tbody>
					</table>
				</div>
				<!-- pagination 영역 -->
				<div style="text-align: center;">
					<ul id="pagination" class="pagination"></ul>
				</div>

				<!-- 글쓰기 번튼 영역 -->
				<div style="text-align: center;" id="write_button_area"></div>
			</div>
			<!-- 질문게시판 출력 -->
			<div id="qna_board" class="container tab-pane fade">
				<br>
				<h3>질문 게시판</h3>
				<div>
					<table id="qna_boards" class="table table-hover">
						<colgroup>
							<!-- 열너비 지정 -->
							<col width="15%">
							<col width="45%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="qna_body">
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 서비스업 Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog ">
				<!-- modal-dialog-scrollable -->
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h1 class="modal-title">서비스업 등록 심사</h1>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<form id="sFrm">
						<div class="modal-body" id="judge_modal"></div>
						<div class="modal-body" id="notices_modal"></div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button id="approved" value="승인" class="btn btn-primary judge"
								data-dismiss="modal">승인</button>
							<button id="refuse" value="거절" class="btn btn-primary judge"
								data-dismiss="modal">거절</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Modal End -->

		<!-- 공지사항디테일 Modal -->
		<div class="modal" id="noticesModal">
			<div class="modal-dialog ">
				<!-- modal-dialog-scrollable -->
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header" id="notices_modal_header">
						<h1 class="modal-title"></h1>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body" id="notices_modal_body"></div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- noticesModal End -->
		
		<!-- qna디테일 Modal -->
		<div class="modal" id="qnaModal">
			<div class="modal-dialog ">
				<!-- modal-dialog-scrollable -->
				<div class="modal-content">
					<!-- Modal Header -->
					<form id="afrm">
					<div class="modal-header" id="qna_modal_header">
						<h1 class="modal-title"></h1>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body" id="qna_modal_body"></div>
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" id="qna_answer_button" class="btn btn-info answer">답글작성</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- noticesModal End -->

		<!-- 글쓰기 Modal -->
		<div class="modal" id="write_modal">
			<div class="modal-dialog ">
				<!-- modal-dialog-scrollable -->
				<div class="modal-content">
					<!-- Modal Header -->
					<form id="write_notices">
						<div class="modal-header" id="write_modal_header">
							<!-- <h1 class="modal-title"></h1> -->
							<label for="title">제목:</label> <input type="text"
								class="form-control" id="title" placeholder="제목" name="title">
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body" id="write_modal_body">
							<textarea class="form-control" rows="5" id="content"
								name="content"></textarea>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" id="write_modal_button"
								class="btn btn-info" data-dismiss="modal">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- write_modal End -->

	</div>
	<!-- container End -->




	<div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>

<script>
	
	function getToday() {
		const today = new Date();
		let dd=today.getDate(); //일 반환
		let mm=today.getMonth()+1; //월 반환 (1월이 0이기 때문에 +1)
		let yyyy=today.getFullYear();
		if(dd<10)
			dd='0'+dd; //1자리 숫자 앞에 0 붙이기
		if(mm<10)
			mm='0'+mm; //1자리 숫자 앞에 0 붙이기
		return yyyy+"-"+mm+"-"+dd;
	}
	
	//---------------------------------------------------------------------qna 전체 출력---------------------------------------------------------------------
	 $("#qna_board_click").on("click",function(){
		console.log("qna 클릭");
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		 $.ajax({
             url : "qnaboard",
             type : "Post",
             dataType : 'json',
             success : function(response) {
				console.log('qna불러오기 성공');
				$("#qna_body").empty();
				let strq = " ";
				for(i=0;i<response.length;i++){
					strq += '<tr>';
					strq += '<td>'+response[i].qna_number+'</td>'; //질문번호
					strq += '<td><a id="qna_detail" class="qna_detail" href="#;" data-toggle="modal" data-target="#qnaModal" data-number="'+response[i].qna_number+'">'+response[i].qna_title+'</a></button>';
					strq += '</td>'; //제목
					strq += '<td>'+response[i].qna_member_id+'</td>';
					const writeDate=response[i].qna_date.split(" ");  //split(쪼개다)
					//console.log(writeDate[0]); //년 월 일
					//console.log(writeDate[1]); //시 분 초
					
					const today = getToday(); //오늘 날짜를 직접 정의
					
					if(today==writeDate[0]){ //날 짜
					strq += '<td>'+writeDate[1]+'</td>';
					}else{
						strq += '<td>'+writeDate[0]+'</td>';
					}
					strq += '</tr>';
						
				}
				$("#qna_body").append(strq);
				
             }, error : function(jqXHR, status, e) {
                 console.error("qna출력 에러");
             }
         });	 
		      
		      
	}); //qna function End
	
	//---------------------------------------------------------------------qna 상세 모달창---------------------------------------------------------------------
	$(document).on("click", "#qna_detail",function(e){
		console.log("qna상세 클릭");
		
		var params = e.target.dataset.number; 
		console.log("qna",params);
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
          	console.log("qna ajax시작");
          $.ajax({
              url : "qnamodal",
              type : "Post",
              data : {"num":params}, 
              success : function(response) {
					$("#qna_modal_header").empty();
					$("#qna_modal_body").empty();
					response = JSON.parse(response);

					let strn = " ";
					strn += '<div>'+response[0].qna_title+'</div>';
					$("#qna_modal_header").append(strn);
					strn = " ";
					strn += '<div>작 성 자 : '+ response[0].qna_member_id + '<span> 글 번 호 : '+ response[0].qna_number+'<br>';
					strn += '<input type="hidden" name="number" id="number" value="'+response[0].qna_number+'">';
					strn += '작성일 : '+response[0].qna_date  +'</div>';
					strn += '<div>'+response[0].qna_body+'</div>';
					strn += '<div id="qna_reply_div" style="border-top: 1px solid #D8D8D8">댓글</div>';
						for(i=0;i<response.length;i++){
							strn += '<div class="qna_reply_div" style="border-top: 1px solid #D8D8D8">'+response[i].qna_reply+'</div>';
						}
					strn += '<textarea class="form-control" rows="5" id="qnaanswer" name="qnaanswer"></textarea>';
					$("#qna_modal_body").append(strn);
					
					console.log("modal생성"); 
              }, error : function(jqXHR, status, e) {
                  console.error("qna출력모달 에러");
              }
          });	  
	}); //qna 상세모달 End
	
	//---------------------------------------------------------------------qna 답글 작성---------------------------------------------------------------------
	$('.answer').on('click',function(e){
		console.log("답글작성 클릭");
		/* var formData = new FormData(document.getElementById("afrm"));
		console.log('답글번호',formData.get("number")[0]);
		console.log('답글내용',formData.get("qnaanswer")[0]); */
		var formData = new FormData();
  		formData.append("num",document.getElementById("number").value);
  		
		var str = $('#qnaanswer').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("qnaanswer").value=str;
		formData.append("qnaanswer",document.getElementById("qnaanswer").value); 
		
		console.log('답글번호1',formData.get("num"));
		console.log('답글내용1',formData.get("qnaanswer"));
		
		$.ajaxSetup({         
  			beforeSend : function(xhr){
  		    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
  		    });
          	console.log("답글쓰기 ajax시작");
          	$.ajax({
      			url : "qnaanswer",
                  type : "Post",
                  data : formData, 
                  dataType : 'json',
      			processData:false,//application/x-www-form-urlencoded(쿼리스트링)
                  contentType:false,//multipart의 경우 contentType을 false로
                  
                  success : function(response) {
                  	console.log("답글쓰기",response);
                  	document.getElementById("qnaanswer").value=" "; //답글 textarea 리셋
                  	$(".qna_reply_div").empty(); //댓글div 리셋
                  	let strn = " ";
                  	for(i=0;i<response.length;i++){
						strn += '<div class="qna_reply_div" style="border-top: 1px solid #D8D8D8">'+response[i].qna_reply+'</div>';
					}
                  	$("#qna_reply_div").append(strn);
                  	
                  }, error : function(jqXHR, status, e) {
                      console.log("답글쓰기 에러");
                  }
                  
      		});
		
	}); //qna 답글작성 End

	//----------------------------------------------전체공지 출력---------------------------------------------------------------------
	$("#all_notices_click").on("click",function(){
		console.log("notices 클릭");
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		 $.ajax({
           url : "allnotices",
           type : "Post",
           dataType : 'json',
           success : function(response) {
				console.log('notices불러오기 성공');
				console.log(response);
				
				$("#notices_body").empty();
				let strb = " ";
				for(var i = 0;i<response.length;i++){
					strb += '<tr>';
					strb += '<td>'+response[i].all_notices_number+'</td>'; //글번호
					strb += '<td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a>';
					strb += '</td>'; //제목
					const writeDate=response[i].all_notices_date.split(" ");  //split(쪼개다)
					//console.log(writeDate[0]); //년 월 일
					//console.log(writeDate[1]); //시 분 초
					
					const today = getToday(); //오늘 날짜를 직접 정의
					
					if(today==writeDate[0]){ //날 짜
					strb += '<td>'+writeDate[1]+'</td>';
					}else{
						strb += '<td>'+writeDate[0]+'</td>';
					}
					strb += '<td id="'+'board'+response[i].all_notices_number+'">'+response[i].all_notices_views+'</td>'; //조 회 수
					strb += '</tr>';
				}//for문 종료
				$("#notices_body").append(strb);
				
           }, error : function(jqXHR, status, e) {
               console.error("게시판출력 에러");
           }
       });
	});//notices function End
	
	//---------------------------------------------------------------------전체공지 modal 생성---------------------------------------------------------------------
	$(document).on("click", "#notices_detail",function(e){
		console.log("게시글번호 클릭");
		var params = e.target.dataset.number; 
		console.log("게시글",params);
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
          	console.log("notices ajax시작");
          	console.log(params);
          $.ajax({
              url : "noticesmodal",
              type : "get",
              data : {"num":params}, 
              success : function(response) {
					$("#notices_modal_header").empty();
					$("#notices_modal_body").empty();
					response = JSON.parse(response);
					console.log("notices",response);
					let strn = " ";
					strn += '<div>'+response[0].all_notices_title+'</div>';
					$("#notices_modal_header").append(strn);
					strn = " ";
					strn += '<div>작성일 : '+response[0].all_notices_date  +'<span> 조 회 수 : '+  response[0].all_notices_views+'</div>';
					strn += '<div style="border-top: 1px solid #D8D8D8">'+response[0].all_notices_body+'</div>';
					$("#notices_modal_body").append(strn);
					console.log("modal생성"); 
					console.log(response[0].all_notices_views);
					$("#board"+response[0].all_notices_number).text(response[0].all_notices_views); //조회수 변경
              }, error : function(jqXHR, status, e) {
                  console.error("게시판출력모달 에러");
              }
          });	  
	}); //notices모달 click End
	
	//---------------------------------------------------------------------글쓰기 버튼 생성---------------------------------------------------------------------
	$("<button>").addClass("btn btn-info custom").attr("id","write").attr("data-toggle","modal").attr("data-target","#write_modal").text("글쓰기").appendTo($("#write_button_area"));
	
	//---------------------------------------------------------------------글쓰기 모달 생성---------------------------------------------------------------------
	$("#write_modal_button").on("click",function(){
		console.log("글쓰기 클릭");
		
		var formData = new FormData();
		formData.append("title",document.getElementById("title").value);
		
		var str = $('#content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("content").value=str;
		formData.append("content",document.getElementById("content").value);
		console.log("글쓰기=",formData.get("title"));
		console.log("글내용=",formData.get("content"));
		$.ajaxSetup({         
			beforeSend : function(xhr){
		    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		    });
        	console.log("글쓰기 ajax시작");
        	
		$.ajax({
			url : "noticeswrite",
            type : "Post",
            data : formData, 
            dataType : 'json',
			processData:false,//application/x-www-form-urlencoded(쿼리스트링)
            contentType:false,//multipart의 경우 contentType을 false로
            
            success : function(response) {
            	console.log("글쓰기 성공",response);
            	document.getElementById("title").value = " ";
            	document.getElementById("content").value = " ";
            	
            	$("#notices_body").empty();
				let strb = " ";
				for(var i = 0;i<response.length;i++){
					strb += '<tr>';
					strb += '<td>'+response[i].all_notices_number+'</td>'; //글번호
					strb += '<td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a>';
					strb += '</td>'; //제목
					const writeDate=response[i].all_notices_date.split(" ");  //split(쪼개다)
					//console.log(writeDate[0]); //년 월 일
					//console.log(writeDate[1]); //시 분 초
					
					const today = getToday(); //오늘 날짜를 직접 정의
					
					if(today==writeDate[0]){ //날 짜
					strb += '<td>'+writeDate[1]+'</td>';
					}else{
						strb += '<td>'+writeDate[0]+'</td>';
					}
					strb += '<td id="'+'board'+response[i].all_notices_number+'">'+response[i].all_notices_views+'</td>'; //조 회 수
					strb += '</tr>';
				}//for문 종료
				$("#notices_body").append(strb);
            	
            }, error : function(jqXHR, status, e) {
                console.log("글쓰기 에러");
            }
            
		});
            
	});//글쓰기 ajax End 

	
	//---------------------------------------------------------------------house 리스트 출력---------------------------------------------------------------------
	const house = ${housejudge}; //house 리스트 json
	const food = ${foodjudge}; //food 리스트 json
	console.log("house=",house);
	console.log("food=",food);
	console.log("house",house.length);
	console.log("food",food.length);
//	console.log("housemodal",${housemodal});
	let strh=" ";
	
 	for(let i=0;i<house.length;i++){
 		if(i>=2){
 			console.log("house break");
 			break;
 		}
 		strh+='<div style="border: 1px solid black; margin-top: 5px; id="house_judge">';
		strh+='<div id="house_judge">';

		strh+='<div id="list_left"><img style="height:200px; width:100%;" src="'+house[i].house_sysname+'"></div>';
		strh+='<div id="list_right_sec">';
		strh+='<div id="list_right">상 호 명 : '+house[i].house_name+'<br>';

		if(house[i].house_type == 1){
			strh+='집 유 형 : 아파트 <br>';
		}else if(house[i].house_type == 2){
			strh+='집 유 형 : 빌라 <br>';
		}else if(house[i].house_type == 3){
			strh+='집 유 형 : 주택 <br>';
		}
		strh+='집 주 소 : '+house[i].house_address+'</div>';
		strh+='<div id="list_button" class="house"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-number="'+house[i].house_number+'">승인/거절</button></div>';
		strh+='</div>';
		strh+='</div>';
		strh+='</div>';
 	}
 	$("#housemain_judge").append(strh); //house 리스트 End
 	
 	console.log("food : ",food);
	//---------------------------------------------------------------------food 리스트 출력---------------------------------------------------------------------
 	let strf= " ";
 	for(let i=0;i<food.length;i++){

 		if(i>=2){
 			console.log("food break");
 			break;
 		}
 		strf+='<div style="border: 1px solid black; margin-top: 5px; id="food_judge">';
		strf+='<div id="food_judge">';
		strf+='<div id="list_left"><img style="height:200px; width:100%;" src="'+food[i].food_sysname+'"></div>';
		strf+='<div id="list_right_sec">';
		strf+='<div id="list_right">상 호 명 : '+food[i].food_name+'<br>';
		if(food[i].food_type == 1){
			strf+='집 유 형 : 레스토랑 <br>';
		}else if(food[i].food_type == 2){
			strf+='집 유 형 : 카페 <br>';
		}else if(food[i].food_type == 3){
			strf+='집 유 형 : 호프 <br>';
		}
		strf+='음식점 주소 : '+food[i].food_address+'</div>';
		strf+='<div id="list_button" class="food"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-number="'+food[i].food_number+'">승인/거절</button></div>';
		strf+='</div>';
		strf+='</div>';
		strf+='</div>';
 	}
 	$("#foodmain_judge").append(strf); //food 리스트 End
	
 	//---------------------------------------------------------------------하우스 모달 ajax 시작---------------------------------------------------------------------
 	$('.house').on('click',function(e){ 
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number;
 		//시큐리티 ajax Setup
 		$.ajaxSetup({         
 		      beforeSend : function(xhr){
 		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 		      });//먼저 보냄
            	console.log("house ajax시작");
            	console.log(params);
            $.ajax({
                url : "housemodal",
                type : "get",
                data : {"num":params}, 
                success : function(response) {
                	
 					$("#judge_modal").empty();
 					response = JSON.parse(response);
 					console.log("11123",response);
 					
                	
 
                    let strj = " ";
                	
                	for ( var i=0;i<1;i++){
                    strj += '<div class="modal-body">';
                    strj += '등록번호 : '+response[i].house_number+'<br>';
                    strj += '<input type="hidden" name="number" value="'+response[i].house_number+'">';
                    strj += '아이디 : '+response[i].house_hostid+'<br>';
                    strj += '집이름 : '+response[i].house_name+'<br>';
                    strj += '주소 : '+response[i].house_address+'<br>';
                    if(response[i].house_type == 1){
            			strj+='집 유 형 : 아파트 <br>';
            		}else if(response[i].house_type == 2){
            			strj+='집 유 형 : 빌라 <br>';
            		}else if(response[i].house_type == 3){
            			strj+='집 유 형 : 주택 <br>';
            		}
                    strj += '<input type="hidden" name="type" value="house">';
                    strj += '수용인원 : '+response[i].house_person+' 명<br>';
                    strj += '주차공간 : '+response[i].house_parkable+' 대<br>';
                    strj += '방갯수 : '+response[i].house_rooms+' 개<br>';
                    strj += '침대수 : '+response[i].house_beds+' 개<br>';
                    strj += '욕실 : '+response[i].house_bathrooms+' 개<br>';
                    strj += '체크인 : '+response[i].house_mindate+'<br>';
                    strj += '체크아웃 : '+response[i].house_maxdate+'<br>';
                    strj += '1박가격 : '+response[i].house_price+' 원<br>';
                    strj += '</div>';
                    strj += '<div>';
                    for(var j=0;j<response.length;j++){ //사진 for문 시작
                        console.log("123__",response); 
                        console.log("111",response[j].house_sysname);
                    strj += '<img style="height:100px; width:200px; margin: 1px;"src="'+response[j].house_sysname+'">';
                    	} //사진for문 종료
                    strj += '</div>';
                	}//for문 종료
                	
                    
                    $("#judge_modal").append(strj);
                    
                }, error : function(jqXHR, status, e) {
                    //console.error(status + " :asdasd " + e);
                }
            });	 
 	}); //house모달 End
 	
 	//---------------------------------------------------------------------음식점 모달 ajax 시작---------------------------------------------------------------------
 	 $('.food').on('click',function(e){ 
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number;

 		//시큐리티 ajax Setup
 		$.ajaxSetup({         //상세모달 ajax
 		      beforeSend : function(xhr){
 		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 		      });//먼저 보냄

            	console.log("food ajax시작");
            	console.log(params);
            $.ajax({
                url : "foodmodal",
                type : "get",
                data : {"num":params}, 
                success : function(response) {
                	
 					$("#judge_modal").empty();
 					response = JSON.parse(response);
 					console.log("11123",response);
 					
                    let strj = " ";
                	
                	for ( var i=0;i<1;i++){
                    strj += '<div class="modal-body">';
                    strj += '등록번호 : '+response[i].food_number+'<br>';
                    strj += '<input type="hidden" name="number" value="'+response[i].food_number+'">';
                    strj += '아이디 : '+response[i].food_hostid+'<br>';
                    strj += '상호명 : '+response[i].food_name+'<br>';
                    strj += '주소 : '+response[i].food_address+'<br>';
                    if(response[i].food_type == 1){
            			strj+='집 유 형 : 레스토랑 <br>';
            		}else if(response[i].food_type == 2){
            			strj+='집 유 형 : 카페 <br>';
            		}else if(response[i].food_type == 3){
            			strj+='집 유 형 : 호프 <br>';
            		}
                    strj += '<input type="hidden" name="type" value="food">';
                    strj += '수용인원 : '+response[i].food_person+' 명<br>';
                    strj += '주차공간 : '+response[i].food_parkable+' 대<br>';
                    strj += '오픈시간 : '+response[i].food_mintime+'<br>';
                    strj += '마감시간 : '+response[i].food_maxtime+'<br>';
                    strj += '</div>';
                    strj += '<div>';
                    for(var j=0;j<response.length;j++){//사진 for문 시작
                    strj += '<img style="height:100px; width:200px; margin: 1px;"src="'+response[j].food_sysname+'">';
                    	} //사진 for문 종료
                    strj += '</div>';
                	}//for문 종료
                    
                    $("#judge_modal").append(strj);
                    
                }, error : function(jqXHR, status, e) {
                    //console.error(status + " :asdasd " + e);
                }
            });	 
 		
 	}); //food모달 End
 	
	//---------------------------------------------------------------------승인거절 ajax---------------------------------------------------------------------
	$('.judge').on('click',function(e){
		console.log(e.target.value);
		var formData = new FormData(document.getElementById("sFrm"));
		
		  console.log(formData.get("number")[0]);
	      console.log(formData.getAll("type"));
	      var urlRest;
	      var params = {
	    		  "number" : formData.get("number"),
	    		  "type" : formData.get("type"),
	      }
	      
	      if(e.target.value == "승인"){
	    	  urlRest = "approved"
	      }else if(e.target.value == "거절"){
	    	  urlRest = "refuse"
	      }
	      console.log(urlRest);
	     
	      $.ajax({
	            url:urlRest,
	            type:'Post',
	            data:params,
	            //까보지 말라는 뜻
	            //processData:false,//application/x-www-form-urlencoded(쿼리스트링)
	            //contentType:true,//multipart의 경우 contentType을 false로
	            //contentType:'application/json;charset=UTF-8'
	            dataType:'json',
	            success:function(data){
	               
	               alert('성공');
	               console.log("data",data);
	               location.href="adminmenu";
	               

	            },
	            error:function(err){
	            	console.log("승인거절 에러");
	               console.log(err);
	            }
	         });//승인거절 ajax End
	})//on click함수 End
	
	
 	
</script>
</body>

</html>