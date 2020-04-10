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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
   

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script

	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>

/* 맵 */
.mapdialog{
	width:800px;
}

.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	top: 40px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.numberr {
	font-weight: bold;
	color: #ee6152;
}
.planFrame {
	display: flex;
}

.idxbtn {
	border-radius: 10px;
	padding: 8px;
}
/* 맵끝 */
#headerContainer {
	margin-top: 10px;
	border-radius: 20px;
	background-color: white;
}

#header_img {
	float: none;
	margin: 0 auto;
	display: flex;
	align-items: center;
	width: 250px;
	height: 75px;
	margin-bottom: 40px;
}

#logout {
	border: 0;
	outline: 0;
	background-color: white;
	color: #337ab7;
	font-family: 'Jua';
	width: 85px;
	height: 50px;
}

#logout:hover {
	background-color: #E6E6E6
}

/* -------------------header------------------------------------------- */
#housemain_judge {
	width: 90%;
	margin-left: 5%;
}

#house_judge {
	height: auto;
	width: 100%;
	/* display: block; */
	border: 1px solid black;
	overflow: auto;
}

#foodmain_judge {
	width: 90%;
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
.qwe{
	margin: 0 30px;
}
/* 여기부터 날짜 및 모달내 데이터 영역 */
.number:nth-child(n+2) {
   display: none;
   font-size: 0px;
}

.number:nth-child(1) {
   font-size: 20px;
}

.number {
   margin: 0 0 0 83px;
}
#day {
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 50px;
}
#date {
   width: 200px;
   font-size: 30px;
   display: inline;
   list-style: none;
   padding: 0px;
   margin: 23px 0px 0px 0px;
}
#dayFrame {
   display: flex;
   margin: 0 0 0 8px;
}

</style>

</head>
<body>
	<div class="container" id="headerContainer">

		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 40px;">
			<a href="/gabom/"> <img id="header_img"
				src="resources/headerImage/logo3.png">
			</a>
		</div>
	</div>
	<div class="container">
		<!-- <h2>Toggleable Tabs</h2> -->
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="qwe nav-item"><a class="nav-link active"
				data-toggle="tab" href="#judge" id="judge_click">서비스업체 등록심사</a></li>
<!-- 			<li class="nav-item"><a class="nav-link" data-toggle="tab" -->
<!-- 				href="#service_declaration">서비스업체 신고관리</a></li> -->
			<li class="qwe nav-item"><a class="nav-link" data-toggle="tab"
				href="#tourist_judge" id="judgeTripPlan">여행객계획 등록심사</a></li>  
				
			<li class="qwe nav-item"><a class="nav-link" data-toggle="tab"
				href="#sns_declaration" id="snsmanage" >SNS 신고관리</a>
			</li>
			
			<li class="qwe nav-item"><a class="nav-link" data-toggle="tab"
				href="#all_notices" id="all_notices_click">전체회원 공지사항</a></li>
			<li class="qwe nav-item"><a class="nav-link" data-toggle="tab"
				href="#qna_board" id="qna_board_click">QnA</a></li>
			<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
		</ul>
		<!-- Tab 내용 -->
		<div class="tab-content">
			<div id="judge" class="container tab-pane active">
				<div>
					<div id="service_main">
						<div id="housemain_judge">
							<h3 id="h3_house">House심사대기 List</h3>
						</div>
						<div id="foodmain_judge">
							<h3 id="h3_food">Food심사대기 List</h3>
						</div>
					</div>
				</div>
			</div>
			<div id="service_declaration" class="container tab-pane fade">
				<h3>서비스업체 신고관리</h3>
				<p>메 뉴 1</p>
			</div>
			<div id="tourist_judge" class="container tab-pane fade">
				<h3>여행객계획 등록심사</h3>
				<div id="TripSharePlanList"></div>
			</div>
			<div id="sns_declaration" class="container tab-pane fade">
				<ul class="nav nav-tabs">
					<li class="nav-item" style="width: 50%">
						<a class="nav-link" id="sns_trigger" data-toggle="tab" href="#sns_posts" onclick="sns_posts()">sns게시글 신고</a></li>
					<li class="nav-item" style="width: 50%">
						<a class="nav-link" data-toggle="tab" href="#sns_posts" onclick="sns_comment()">sns댓글 신고</a></li>
				</ul>
			</div>
			<!----------------------------------------------전체공지 출력---------------------------------------------->
			<div id="all_notices" class="container tab-pane fade">
				<h3>전체회원 공지사항</h3>
				<div id="boardstable">
				
				
				</div>
				
				<!-- pagination 영역 -->
				<!-- <div style="text-align: center;">
					<ul id="pagination" class="pagination"></ul>
				</div> -->

				<!-- 글쓰기 번튼 영역 -->
				<div style="text-align: center;" id="write_button_area"></div>
			</div>
			<!----------------------------------------------질문게시판 출력---------------------------------------------->
			<div id="qna_board" class="container tab-pane fade">
				<h3>질문 게시판</h3>
				<div id="qnadatatable">
					<table id="qna_boards" class="table table-bordered table-hover">
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

		<!----------------------------------------------서비스업 Modal---------------------------------------------->
		<div class="modal" id="myModal">
			<div class="modal-dialog-lg ">
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

		<!----------------------------------------------공지사항디테일 Modal---------------------------------------------->
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
						<!-- <input type="button" value="삭제" class="btn btn-warning delete" data-dismiss="modal"> -->
						<button type="button" class="btn btn-warning delete"
							data-dismiss="modal">삭제</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- noticesModal End -->

		<!----------------------------------------------qna디테일 Modal---------------------------------------------->
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
							<button type="button" id="qna_answer_button"
								class="btn btn-info answer">답글작성</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- qna디테일 modal End -->

		<!----------------------------------------------글쓰기 Modal---------------------------------------------->
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
	<!----------------------------------------------------------SNS신고관리---------------------------------------------------------->
	<div id="sns_posts" class="container tab-pane fade">
		<div id="sns_table">
		</div>
	</div>

	   <!-- 상세보기 모달 -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog mapdialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="map" style="width:100%; height:300px;"></div>
       <div class="plan">
          <!-- 여행계획 및 날짜  -->
       <div id="day">
				<div id='dayFrame'>
					<div class="icon" id="left">◀</div>
					<ul id="date"></ul>
					<div class="icon" id="right">▶</div>
				</div>
			</div>
			<hr>
			<!-- ---------------------------------여기부터 여행 계획 내역들 나옴--------------------------------- -->
			<div id="detailTrip"></div>
			<!-- ---------------------------------   ↑↑↑ 여행 계획 ↑↑↑    --------------------------------- -->

			<hr>
       </div>
      </div>
      <div style="display:flex;" class="modal-footer">
         <button type="button" class="dsbtn btn btn-primary planjudgebtn" >승인</button>
         <button type="button" class="dsbtn btn btn-primary planjudgebtn" >거절</button> 
        <button type="button" class="dsbtn btn btn-secondary">닫기</button>
      </div>
    </div>
  </div>
</div>      
	<div>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp" />
	</div>
   <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	
	
	<script>
	var socketalarm =null;  // 소켓 지박령!!
	var tnum ; // 승인대기 여행 번호 
	var map;
	let arr ; // 계획 모음!
	let points ={}; // x,y좌표 모음
	let planidx = 1;
	
	
	let customOverlayy = [];
	let distanceOverlayy = [];
	let clickLinee =[];
      
      
      

	
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
	//---------------------------------------------------------sns게시글 신고 출력 ----------------------------------------------------------------
// 	$("#snsmanage").on("click",function(){
// 		console.log("1111sns신고관리 클릭");
// 		$("#snsmanage").trigger(sns_posts());
// 	});
	
	
function sns_posts() {
	console.log("sns게시글 클릭");
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	console.log("sns게시글신고 시작");
	$.ajax({
		url : 'snspostsreport',
		type : 'post',
		dataType : 'json',
		success : function(response) {
			console.log("게시글출력=",response);
			$("#sns_table").empty();
			let table = $("<table class='table table-bordered table-hover'>");
			let thead = $("<thead>");
			let tr = $("<tr>");
			let th = $("<th>게시글번호</th><th>게시글내용</th><th>작성자</th><th>신고횟수</th><th>게시물삭제</th>");
			table.append(thead);
		 	thead.append(tr);
		 	tr.append(th);
		 	
		 	
 		 	let tbody = $("<tbody>");
 		 	/* let td = $("<td>"); */
 		 	for(let i = 0; i<response.length; i++){
  		 	let bodytr = $("<tr>");
  		 	let td = $("<td>");
 		 		console.log("11",response[i]);
 		 		//let bodytr = $("<tr>");
 		 		td += "<td>"+response[i].sns_posts_number+"</td>";
 		 		td += "<td>"+response[i].sns_posts_content+"</td>";
 		 		td += "<td>"+response[i].sns_posts_writer+"</td>";
 		 		td += "<td>"+response[i].sns_posts_report+"</td>";
 		 		td += "<td><button class='sns_delete' data-number='"+response[i].sns_posts_number+"'>삭제</button></td>";
 		 		
 		 		bodytr.append(td);
 		 		tbody.append(bodytr);
 		 		td = " ";
 		 	}
		 	table.append(tbody);
		 	$("#sns_table").append(table);
		},
		error : function(jqXHR, status, e) {
			console.log("신고 게시글 검색 에러");
		}
	});
	
	
}; //sns_posts end
//---------------------------------------------------------sns댓글 신고 출력 ----------------------------------------------------------------
function sns_comment() {
	console.log("sns댓글 클릭");
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	$.ajax({
		url : 'snscommentreport',
		type : 'post',
		dataType : 'json',
		success : function(response) {
			console.log("댓글출력",response);
			$("#sns_table").empty();
			let table = $("<table class='table table-bordered table-hover'>");
			let thead = $("<thead>");
			let tr = $("<tr>");
			let th = $("<th>댓글번호</th><th>댓글내용</th><th>댓글작성자</th><th>신고횟수</th><th>게시물삭제</th>");
			table.append(thead);
		 	thead.append(tr);
		 	tr.append(th);
		 	$("#sns_table").append(table);
		 	
		 	let tbody = $("<tbody>");
 		 	/* let td = $("<td>"); */
 		 	for(let i = 0; i<response.length; i++){
  		 	let bodytr = $("<tr>");
  		 	let td = $("<td>");
 		 		
 		 		td += "<td>"+response[i].sns_comment_number+"</td>";
 		 		td += "<td>"+response[i].sns_comment_content+"</td>";
 		 		td += "<td>"+response[i].sns_comment_member_id+"</td>";
 		 		td += "<td>"+response[i].sns_comment_report+"</td>";
 		 		td += "<td><button class='sns_comment_delete' data-number='"+response[i].sns_comment_number+"'>삭제</button></td>";
 		 		
 		 		//form.append(td);
 		 		bodytr.append(td);
 		 		tbody.append(bodytr);
 		 		td = " ";
 		 		//form = " ";
 		 	}
		 	table.append(tbody);
		 	$("#sns_table").append(table);
		},
		error : function(jqXHR, status, e) {
			console.log("지역검색 에러");
		}
	});
	
}; //sns_comment end
//---------------------------------------------------------sns게시글 신고 삭제 ----------------------------------------------------------------
$(document).on("click",".sns_delete",function(e) {
	console.log("삭제버튼 클릭");
	var params = e.target.dataset.number;
	console.log("삭제할 게시글",params);
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	console.log("ajax시작");
	$.ajax({
		url : 'snspostsdelete',
		type : 'post',
		data : {"num":params},
		dataType : 'json',
		success : function(response) {
			sns_posts();
		},
		error : function(jqXHR, status, e) {
			console.log("게시글삭제 에러");
		}
	});//ajax end
});//sns_delete end
//---------------------------------------------------------sns댓글 신고 삭제 ----------------------------------------------------------------
$(document).on("click",".sns_comment_delete",function(e) {
	console.log("삭제버튼 클릭");
	//var params = $(".snsdelet").val();
	var params = e.target.dataset.number;
	console.log("삭제할 댓글",params);
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		}
	});
	console.log("ajax시작");
	$.ajax({
		url : 'snscommentdelete',
		type : 'post',
		data : {"num":params},
		dataType : 'json',
		success : function(response) {
			sns_comment();
		},
		error : function(jqXHR, status, e) {
			console.log("댓글삭제 에러");
		}
	}); //ajax end
});//sns_comment_delete end
	
	
//---------------------------------------------------------------------qna 전체 출력---------------------------------------------------------------------
	 $("#qna_board_click").on("click",function(){
		console.log("qna 클릭");
		
		if(dtable!=null){
			dtable.destroy();
		}
		
		setTimeout(function() {
			
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
					console.log("size",response.length);
					$("#sns_table").empty();
					$("#qnadatatable").empty();
					
					let boards = $("<table id='qna_boards' class='table table-bordered table-hover'> </table>")
					let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
					let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>글쓴이</th><th>날짜</th></tr></thead>")
			        
					let tbody = $("<tbody ></tbody>")	
					
					
					
					
					for(i=0;i<response.length;i++){
						
						let tr = $("<tr></tr>")
	 					let td1 =$('<td>'+response[i].qna_number+'</td><td><a id="qna_detail" class="qna_detail" href="#;" data-toggle="modal" data-target="#qnaModal" data-number="'+response[i].qna_number+'">'+response[i].qna_title+'</a></td><td>'+response[i].qna_member_id+'</td>');
	 					
						const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
						
						const today = getToday(); //오늘 날짜를 직접 정의
						
						let td2 ;
	 					if(today==writeDate[0]){ //날 짜
	 						td2 = $('<td>'+writeDate[1]+'</td>')
	 					}else{
	 						td2= $('<td>'+writeDate[0]+'</td>');
	 					}
	 					
	 					tr.append(td1);
	 					tr.append(td2);
	 					tbody.append(tr);		
					}
					
					boards.append(colgroup);
	 				boards.append(thead); 
	 				boards.append(tbody);
	 				
	 				$("#qnadatatable").append(boards);
					
	 				setTimeout(() => {
						dtable =$("#qna_boards").DataTable({
							 "order": [[0, 'desc']], // asc 또는 desc

							 "dom" : '<"top"il>t<"bottom"prf><"clear">',

				             	// 검색 기능 숨기기
				             	searching: false,
//				             	// 정렬 기능 숨기기
//				             	ordering: false,
//				             	// 정보 표시 숨기기
				             	info: false,
//				             	// 페이징 기능 숨기기
//				             	paging: false
				            	
				            });
					}, 100);	
						
					
	             }, error : function(jqXHR, status, e) {
	                 console.error("qna출력 에러");
	             }
	         });	
		}, 200)
		
	 
		      
		      
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
					console.log(response);
					console.log(response.nlist);

					let strn = " ";
					strn += '<div><h3>제목 : '+response.nlist[0].qna_title+'</h3></div>';
					$("#qna_modal_header").append(strn);
					strn = " ";
					strn += '<div>작 성 자 : '+ response.nlist[0].qna_member_id + '<span> 글 번 호 : '+ response.nlist[0].qna_number+'<br>';
					strn += '<input type="hidden" name="number" id="number" value="'+response.nlist[0].qna_number+'">';
					
					strn += '작성일 : '+response.nlist[0].resultDate+'</div>';
					strn += '<div>내용 : '+response.nlist[0].qna_body+'</div>';
					strn += '<br><div id="qna_reply_div">답변</div><br>';
						for(i=0;i<response.alist.length;i++){
							strn += '<div class="qna_reply_div" style="border-top: 1px solid #D8D8D8">'+response.alist[i].qna_reply+'</div>';
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
	var dtable ;
	$("#all_notices_click").on("click",function(){
		console.log("notices 클릭");
		
		if(dtable!=null){
			dtable.destroy();  // 일단 초기화
		}
		
		setTimeout(function() {

			$.ajaxSetup({         
			      beforeSend : function(xhr){
			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			      });//먼저 보냄
			 $.ajax({
	           url : "allnotices",
	           type : "Post",
	           dataType : 'json',
	           success : function(response) {
	        	   
	        	   $("#sns_table").empty();
					console.log('notices불러오기 성공');
					console.log(response);
					console.log("전체공지 사이즈",response.length);
					let pagesize = response.length;
					console.log("페이지사이즈",pagesize);
					$("#boardstable").empty();
					

					
					let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
					let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
					let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
			        
					let tbody = $("<tbody ></tbody>")		
					
					
			        
			        
					for(let i = 0;i<response.length;i++){
						
						let tr = $("<tr></tr>")
						let td1 =$('<td>'+response[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a></td>');
						
						const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
						console.log("년월일",writeDate[0]); //년 월 일
						//console.log("시분초",writeDate[1]); //시 분 초
						const today = getToday(); //오늘 날짜를 직접 정의
						console.log("sksksk",response);
						let td2 ;
						if(today==writeDate[0]){ //날 짜
							td2 = $('<td>'+writeDate[1]+'</td>')
						}else{
							td2= $('<td>'+writeDate[0]+'</td>');
						}
						let td3 = $('<td id="'+'board'+response[i].all_notices_number+'">'+response[i].all_notices_views+'</td>'); //조 회 수

						tr.append(td1);
						tr.append(td2)
						tr.append(td3);
						
						tbody.append(tr);	
					}//for문 종료
					
					boards.append(colgroup);
					boards.append(thead); 
					boards.append(tbody);
					console.dir(boards);
					$("#boardstable").append(boards);
					
					setTimeout(() => {
						dtable =$("#boards").DataTable({
							 "order": [[0, 'desc']], // asc 또는 desc

							 "dom" : '<"top"il>t<"bottom"prf><"clear">',

				             	// 검색 기능 숨기기
				             	searching: false,
//				             	// 정렬 기능 숨기기
//				             	ordering: false,
//				             	// 정보 표시 숨기기
				             	info: false,
//				             	// 페이징 기능 숨기기
//				             	paging: false
				            	
				            });
					}, 100);
					
	           }, error : function(jqXHR, status, e) {
	               console.error("게시판출력 에러");
	           }
	       		}); //ajax end
		}, 200)
		
		
		//}); //datatable end
	}); //notices function End
	
	//---------------------------------------------------------------------전체공지 상세 modal 생성---------------------------------------------------------------------
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
					console.log("숫자",response[0].all_notices_number);
					let strn = " ";
					strn += '<div><h3>'+response[0].all_notices_title+'</h3></div>';
					strn += '<input type="hidden" name="notices_delete" id="notices_delete" data-target="#notices_delete" value="'+response[0].all_notices_number+'">';
					$("#notices_modal_header").append(strn);
					strn = " ";
					strn += '<div>작성일 : '+response[0].resultDate  +'<span> 조 회 수 : '+  response[0].all_notices_views+'</div>';
					strn += '<br><div style="border-top: 1px solid #D8D8D8"><br>'+response[0].all_notices_body+'</div>';
					$("#notices_modal_body").append(strn);
					console.log("modal생성"); 
					console.log(response[0].all_notices_views);
					$("#board"+response[0].all_notices_number).text(response[0].all_notices_views); //조회수 변경
              }, error : function(jqXHR, status, e) {
                  console.error("게시판출력모달 에러");
              }
          });	  
	}); //notices모달 click End
	
	//----------------------------------------------공지사항 삭제---------------------------------------------------------------------
	$(".delete").on("click",function(){
		dtable.destroy();
		
		setTimeout(function() {
			console.log("삭제버튼 클릭");
			var params = $("#notices_delete").val();
			console.log("params",params);
			
			$.ajaxSetup({         
			      beforeSend : function(xhr){
			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			      });//먼저 보냄
	        	console.log("notices delete시작");
	        	 $.ajax({
	                 url : "noticedelete",
	                 type : "Post",
	                 data : {"num":params}, 
	                 dataType : 'json',
	                 success : function(response) {
	                	 
	                	 $("#sns_table").empty();
	     				console.log('notices불러오기 성공');
	     				console.log(response);
	     				console.log("전체공지 사이즈",response.length);
	     				let pagesize = response.length;
	     				console.log("페이지사이즈",pagesize);
	     				$("#boardstable").empty();
	     				
	     				let strb = " ";

	     				
	     				let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
	     				let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
	     				let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
	     		        
	     				let tbody = $("<tbody ></tbody>")		
	     				
	     				
	     		        
	     		        
	     				for(let i = 0;i<response.length;i++){
	     					
	     					let tr = $("<tr></tr>")
	     					let td1 =$('<td>'+response[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a></td>');
	     					
	     					const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
							console.log("년월일",writeDate[0]); //년 월 일
							//console.log("시분초",writeDate[1]); //시 분 초
							const today = getToday(); //오늘 날짜를 직접 정의
							console.log("sksksk",response);
							let td2 ;
							if(today==writeDate[0]){ //날 짜
								td2 = $('<td>'+writeDate[1]+'</td>')
							}else{
								td2= $('<td>'+writeDate[0]+'</td>');
							}
	     					let td3 = $('<td id="'+'board'+response[i].all_notices_number+'">'+response[i].all_notices_views+'</td>'); //조 회 수

	     					tr.append(td1)
	     					tr.append(td2)
	     					tr.append(td3)
	     					
	     					tbody.append(tr);	
	     				}//for문 종료
	     				
	     				boards.append(colgroup);
	     				boards.append(thead); 
	     				boards.append(tbody);
	     				console.dir(boards);
	     				$("#boardstable").append(boards);
	     				
	     				setTimeout(() => {
	     					dtable =$("#boards").DataTable({
	     						 "order": [[0, 'desc']], // asc 또는 desc

	     						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

	     			             	// 검색 기능 숨기기
	     			             	searching: false,
//	     			             	// 정렬 기능 숨기기
//	     			             	ordering: false,
//	     			             	// 정보 표시 숨기기
	     			             	info: false,
//	     			             	// 페이징 기능 숨기기
//	     			             	paging: false
	     			            	
	     			            });
	     				}, 100);
	     				
	     				
	                }, error : function(jqXHR, status, e) {
	                     console.error("공지사항 삭제 에러");
	                 }
	             });		
		}, 200)
		
		
		  
   	}); //notices delete End
	
	//---------------------------------------------------------------------글쓰기 버튼 생성---------------------------------------------------------------------
	$("<button>").addClass("btn btn-info custom").attr("id","write").attr("data-toggle","modal").attr("data-target","#write_modal").text("글쓰기").appendTo($("#write_button_area"));
	
	//---------------------------------------------------------------------글쓰기 모달 생성---------------------------------------------------------------------
	
	//공지사항 글쓰기
	$("#write_modal_button").on("click",function(){
		console.log("글쓰기 클릭");
		
		$("#boardstable").empty();
		dtable.destroy();
		
		setTimeout(function() {

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
	            	
	            	$("#sns_table").empty();
	 				console.log('notices불러오기 성공');
	 				console.log(response);
	 				console.log("전체공지 사이즈",response.length);
	 				let pagesize = response.length;
	 				console.log("페이지사이즈",pagesize);
	 				
	 				
	 				let strb = " ";

	 				
	 				let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
	 				let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
	 				let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
	 		        
	 				let tbody = $("<tbody ></tbody>")		
	 				
	 				
	 		        
	 		        
	 				for(let i = 0;i<response.length;i++){
	 					
	 					let tr = $("<tr></tr>")
	 					let td1 =$('<td>'+response[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a></td>');
	 					
	 					const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
						console.log("년월일",writeDate[0]); //년 월 일
						//console.log("시분초",writeDate[1]); //시 분 초
						const today = getToday(); //오늘 날짜를 직접 정의
						console.log("sksksk",response);
						let td2 ;
						if(today==writeDate[0]){ //날 짜
							td2 = $('<td>'+writeDate[1]+'</td>')
						}else{
							td2= $('<td>'+writeDate[0]+'</td>');
						}
	 					let td3 = $('<td id="'+'board'+response[i].all_notices_number+'">'+response[i].all_notices_views+'</td>'); //조 회 수

	 					tr.append(td1)
	 					tr.append(td2)
	 					tr.append(td3)
	 					
	 					tbody.append(tr);	
	 				}//for문 종료
	 				
	 				boards.append(colgroup);
	 				boards.append(thead); 
	 				boards.append(tbody);
	 				console.dir(boards);
	 				
	 				$("#boardstable").append(boards);
	 				
	 				setTimeout(() => {
	 					dtable =boards.DataTable({
	 						 "order": [[0, 'desc']], // asc 또는 desc

	 						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

	 			             	// 검색 기능 숨기기
	 			             	searching: false,
//	 			             	// 정렬 기능 숨기기
//	 			             	ordering: false,
//	 			             	// 정보 표시 숨기기
	 			             	info: false,
//	 			             	// 페이징 기능 숨기기
//	 			             	paging: false
	 			            	
	 			            });
	 				}, 100);
	 			
	 				console.log("qweqwe")
	 				
	 				
	 //	--- 전체 공지 알람 
	 
		  	let AllMemberAlramObj ={
		 			"type" : "adminnoti",
		 			//"somoimNumber" : somoimnumber,
		 			//"members" : somoimAllMember
			};
		
		
		 		let AllMemberAlramData = JSON.stringify(AllMemberAlramObj);
	  			socketalarm.send(AllMemberAlramData); 
	 				
	 //	--
		
	            }, error : function(jqXHR, status, e) {
	                console.log("글쓰기 에러");
	            }
	            
			});	
		}, 200)
		
            
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
 	//--------------------------------------------------------------------서비스업체 등록심사 ajax-----------------------------------------------------------
 	$("#judge_click").on("click",function(){
 		
 		if(dtable!=null){
			dtable.destroy();  // datatable 초기화
		}
 		
 		setTimeout(function() {
 			console.log("서비스업체 클릭");
 	 		$.ajaxSetup({         
 			      beforeSend : function(xhr){
 			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 			      });//먼저 보냄
 	 		$.ajax({
 	 			url : 'judgelist',
 	 			type : 'post',
 	 			dataType : 'json',
 	 			success : function(response) {
 	 				console.log("select성공");
 	 				console.log("flist",response.flist);
 	 				console.log("hlist",response.hlist);
 	 				$("#sns_table").empty();
 	 				$("#foodmain_judge").empty();
 	 				$("#housemain_judge").empty();
 	 				
 	 				//strh = "";
 	 				strh = "<h3>House심사대기 List</h3>";
 	 				$("#housemain_judge").append(strh);
 	 				strh = "";
 	 				
 	 				for(let i=0;i<response.hlist.length;i++){
 	 			 		if(i>=2){
 	 			 			console.log("house break");
 	 			 			break;
 	 			 		}
 	 			 		strh+='<div style="border: 1px solid black; margin-top: 5px;" id="house_judge">';
 	 					strh+='<div id="house_judge">';

 	 					strh+='<div id="list_left"><img style="height:200px; width:100%;" src="'+response.hlist[i].house_sysname+'"></div>';
 	 					strh+='<div id="list_right_sec">';
 	 					strh+='<div id="list_right">상 호 명 : '+response.hlist[i].house_name+'<br>';

 	 					if(response.hlist[i].house_type == 1){
 	 						strh+='집 유 형 : 아파트 <br>';
 	 					}else if(response.hlist[i].house_type == 2){
 	 						strh+='집 유 형 : 빌라 <br>';
 	 					}else if(response.hlist[i].house_type == 3){
 	 						strh+='집 유 형 : 주택 <br>';
 	 					}
 	 					strh+='집 주 소 : '+response.hlist[i].house_address+'</div>';
 	 					strh+='<div id="list_button" class="house"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-number="'+response.hlist[i].house_number+'">승인/거절</button></div>';
 	 					strh+='</div>';
 	 					strh+='</div>';
 	 					strh+='</div>';
 	 			 	}
 	 			 	$("#housemain_judge").append(strh); //house 리스트 End
 	//----------------------------------------------------------------------------------------------------------
 	 				//strf = "";
 	 				strf = "<h3>Food심사대기 List</h3>";
 	 				$("#foodmain_judge").append(strf);
 	 				strf = "";
 	 				
 	 			 	for(let i=0;i<response.flist.length;i++){

 	 			 		if(i>=2){
 	 			 			console.log("food break");
 	 			 			break;
 	 			 		}
 	 			 		strf+='<div style="border: 1px solid black; margin-top: 5px;" id="food_judge">';
 	 					strf+='<div id="food_judge">';
 	 					strf+='<div id="list_left"><img style="height:200px; width:100%;" src="'+response.flist[i].food_sysname+'"></div>';
 	 					strf+='<div id="list_right_sec">';
 	 					strf+='<div id="list_right">상 호 명 : '+response.flist[i].food_name+'<br>';
 	 					if(response.flist[i].food_type == 1){
 	 						strf+='집 유 형 : 레스토랑 <br>';
 	 					}else if(response.flist[i].food_type == 2){
 	 						strf+='집 유 형 : 카페 <br>';
 	 					}else if(response.flist[i].food_type == 3){
 	 						strf+='집 유 형 : 호프 <br>';
 	 					}
 	 					strf+='음식점 주소 : '+response.flist[i].food_address+'</div>';
 	 					strf+='<div id="list_button" class="food"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-number="'+response.flist[i].food_number+'">승인/거절</button></div>';
 	 					strf+='</div>';
 	 					strf+='</div>';
 	 					strf+='</div>';
 	 			 	}
 	 			 	$("#foodmain_judge").append(strf); //food 리스트 End
 	 				
 	 			},
 	 			error : function(jqXHR, status, e) {
 	 				console.log("서비스업체심사리스트 에러");
 	 			}
 	 		}); //ajax end
 		}, 200)
 		
 		
 		
 	});//judge_click end
 	
 	
	
 	//---------------------------------------------------------------------하우스 모달 ajax 시작---------------------------------------------------------------------
 	$(document).on('click','.house',function(e){ 
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
                    strj += '1박가격 : '+response[i].house_price+' 만원<br>';
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
 	 $(document).on('click','.food',function(e){ 
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
	
	//----------
	$("#snsmanage").on("click",function(){
		console.log("SNS관리");
		console.log(dtable);
		if(dtable!=null){
			dtable.destroy();
		}
		$("#sns_trigger").trigger('click');
	})

	$("#judgeTripPlan").on("click",function(){
		console.log("여행관리계획");
		console.log(dtable);
		$("#TripSharePlanList").empty();
		if(dtable!=null){
			dtable.destroy();
		}
		
		setTimeout(function() {

			$.ajaxSetup({         
			      beforeSend : function(xhr){
			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			      });//먼저 보냄
			      
			$.ajax({
				url : 'tripshareplanlist',
				type : 'post',
				dataType : 'json',
				success : function(response) {
					console.log("승인대기 목록 : " , response);
					
					
					 $("#sns_table").empty();
	  				console.log(response);
	  				console.log("전체공지 사이즈",response.length);
	  				let pagesize = response.length;
	  				console.log("페이지사이즈",pagesize);
	  				$("#TripSharePlanList").empty();
	  				
	  				

	  				
	  				let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
	  				let colgroup =$("<colgroup><col width='25%'><col width='30%'><col width='45%'></colgroup>")
	  				let thead = $("<thead><tr><th>지역</th><th>이름</th><th>날짜</th></tr></thead>")
	  		        
	  				let tbody = $("<tbody ></tbody>")		
	  				
	  				
	  		        
	  		        console.log("포문직전")
	  				for(  i of response){
	  					
	  					let sd = getFormatDate(i.trip_start_date);
	  				 	let ed = getFormatDate(i.trip_end_date);
	  				 	let areaStr = getTripAreaStr(i.all_notices_number)
	  					let tr = $("<tr></tr>")
	  					
	  					let td1 =$('<td>'+areaStr+'</td>');  //지역
	  					
	  					//<a data-name="'+i.trip_number+'" class="modalplan">
	  					let td2 = $('<td><a data-name="'+i.trip_number+'" class="modalplan">'+i.trip_title+'</a></td>');   // 이름
	  					let td3 = $('<td>'+sd+' - '+ed+'</td>'); // 날짜

	  					tr.append(td1)
	  					tr.append(td2)
	  					tr.append(td3)
	  					
	  					tbody.append(tr);	
	  				}//for문 종료
	  				
	  				boards.append(colgroup);
	  				boards.append(thead); 
	  				boards.append(tbody);
	  				console.dir(boards);
	  				$("#TripSharePlanList").append(boards);
	  				
	  				setTimeout(() => {
	  					dtable =$("#boards").DataTable({
	  						 "order": [[0, 'desc']], // asc 또는 desc

	  						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

	  			             	// 검색 기능 숨기기
	  			             	searching: false,
//	  			             	// 정렬 기능 숨기기
//	  			             	ordering: false,
//	  			             	// 정보 표시 숨기기
	  			             	info: false,
//	  			             	// 페이징 기능 숨기기
//	  			             	paging: false
	  			            	
	  			            });
	  				}, 100);
					
					
					
				},
				error : function(jqXHR, status, e) {
					console.log("서비스업체심사리스트 에러");
				}
			}); //ajax end	
		}, 200)
		//TripSharePlanList
		
		
		
		
	})
	
	//----------------날짜 바꾸기
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
 	
 	const getTripAreaStr = (areanum)=>{
 		let number = areanum;
 		let result 
 		if(i.trip_area == 1){
 			result = "서울"		  
 	 	  }else if(i.trip_area == 2){
 	 		result = "인천"		  
 	 	  }else if(i.trip_area == 3){
 	 		result = "대전"		  
 	 	  }else if(i.trip_area == 4){
 	 		result = "대구"		  
 	 	  }else if(i.trip_area == 5){
 	 		result = "광주"		  
 	 	  }else if(i.trip_area == 6){
 	 		result = "부산"		  
 	 	  }else if(i.trip_area == 7){
 	 		result = "울산"		  
 	 	  }else if(i.trip_area == 8){
 	 		result = "세종특별자치시"		  
 	 	  }else if(i.trip_area == 31){
 	 		result = "경기도"		  
 	 	  }else if(i.trip_area == 32){
 	 		result = "강원도"		  
 	 	  }else if(i.trip_area == 33){
 	 		result = "충청북도"		  
 	 	  }else if(i.trip_area == 34){
 	 		result = "충청남도"		  
 	 	  }else if(i.trip_area == 35){
 	 		result = "경상북도"		  
 	 	  }else if(i.trip_area == 36){
 	 		result = "경상남도"		  
 	 	  }else if(i.trip_area == 37){
 	 		result = "전라북도"		  
 	 	  }else if(i.trip_area == 38){
 	 		result = "전라남도"		  
 	 	  }else if(i.trip_area == 39){
 	 		result = "제주도"		  
 	 	  }
 	
 		return result;
 	}
 	
 	//------------------------------
 	$(document).on('click','.dsbtn',function(){//모달 닫음
   $("#detail").hide();
})

$(document).on('click','.modalplan',function(e){//모달 열고 지도 및 정보 표시
	arr={};
	points={};
	
	$("#detailTrip").empty();
	setTimeout(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
	      
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	   map = new kakao.maps.Map(mapContainer, mapOption); 
	}, 200)
	
	
   $("#detail").show();
   tnum = e.target.dataset.name //여행번호
   console.log(tnum);

	
      
 $.ajaxSetup({         
    beforeSend : function(xhr){
       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    });//먼저 보냄

   $.ajax({
   url:'tprest/getplan',
   type:'post',
   data:{"trip_number":tnum},
   dataType:"json", //rest 컨트롤 이용   
   success:function(data){
      console.log(data);
      arr = data
      let obj_length = Object.keys(data).length;
      for(let i = 1 ; i <= obj_length ; i++){
    	  console.log(i);
         let li =$('<li data-trnum="'+tnum+'" class="number">'+i+'일차'+'</li>');
         $("#date").append(li);
         // point 넣기
         // new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)
         points[i]=[];
      	
//          for(let v of data[i]){
// 			points[i].push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint));
         	 
//           }
      } 
      
      
      console.log("arr",arr);
      console.log("points",points)
     setTimeout(function() {
      		 let arrFrame = arr[1];
      		  let pointsFrame = points[1];
      		
      		  createPlanForm(arrFrame,pointsFrame)
	}, 300)
     
      
   },
   error:function(error){
      alert("실패")
      console.log(error);
   }
   
   })//ajax 끝       
})

$("#left").on("click",function(e){
   
    
      var $lastNumber = $(".number").length-1
      var $li = $(".number")[$lastNumber];
      $("#date").prepend($li);
      var tripNum = $(".number")[0].dataset.trnum;
      currentPlanDay = $('#date li:nth-child(1)').text();
      console.log("여행번호 : ", tripNum)
      console.log("현재페이지 : ", currentPlanDay.substring(0, currentPlanDay.indexOf("일")))
      var currentDay = currentPlanDay.substring(0, currentPlanDay.indexOf("일"));
      $("#detailTrip").empty();
      console.log("arr",arr)
      console.log("points",points)
      points[currentDay]=[];    // 좌표 초기화
 	 initMapKaKao();
 	//	$("#detailTrip").empty();

   let arrFrame = arr[currentDay];
	  let pointsFrame = points[currentDay];
	
	  createPlanForm(arrFrame,pointsFrame)
});   
      
      
      
$("#right").on("click",function(e){
     
          
          var trnum =e.target.dataset.trnum
         var $li = $(".number")[0];
         $("#date").append($li);
         var tripNum = $(".number")[0].dataset.trnum;
         currentPlanDay = $('#date li:nth-child(1)').text();
         console.log("여행번호 : ", tripNum)
         console.log("현재페이지 : ", currentPlanDay.substring(0, currentPlanDay.indexOf("일")))
         var currentDay = currentPlanDay.substring(0, currentPlanDay.indexOf("일"));
         $("#detailTrip").empty();
         
         console.log("arr",arr)
         console.log("points",points)
         points[currentDay]=[];    // 좌표 초기화
    	 initMapKaKao();
    	//	$("#detailTrip").empty();

      let arrFrame = arr[currentDay];
	  let pointsFrame = points[currentDay];
	
	  createPlanForm(arrFrame,pointsFrame)
 
 });


//--------------------- 맵에 필요한 친구
var houseNum = null;
const createPlanForm = (arrFrame,pointsFrame) =>{
	console.log("arrFrame",arrFrame)
	console.log("pointsFrame",pointsFrame)
	var checkHouseD = false;
	
	for( let v of arrFrame){
		if(v.trip_type==1){ //숙소일때
			console.log("숙소 포문")
			console.log("v",v)
			
			let planFrame = $("<div class='planFrame'>  </div>");
			let planNum = $("<div class='planNum'> <img style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'> </div>");
			let planImg = $("<div class='planImg'><img src='"+v.trip_img+"' width='50px' height='50px' ></div>");
			
			planFrame.append(planNum);
			planFrame.append(planImg);
			
			
			let planContFram = $("<div class='planContFram'> </div>");
			let contTitle = $("<div class='contTitle'>"+v.trip_title+"</div>");
			let contAddr= $("<div class='contAddr'>"+v.trip_destination+" </div>");
			planContFram.append(contTitle);
			planContFram.append(contAddr);
			
			planFrame.append(planContFram);
			
			
			
			
			
			$("#detailTrip").append(planFrame);
			
			
			pointsFrame.push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)); //추가 할 마커 저장하기 arr에...
			console.log("pointsFrame",pointsFrame);
		
			
			let clickPosition = new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint); // 클릭한 좌표...(가상)
			
			if( planidx >= 2){
				console.log(planidx);
				console.log("??")
				let clickLine = new kakao.maps.Polyline({
	            	map: map, // 선을 표시할 지도입니다 
	            	path: [pointsFrame[planidx-2] ,pointsFrame[planidx-1]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
	            	strokeWeight: 3, // 선의 두께입니다 
	            	strokeColor: '#db4040', // 선의 색깔입니다
	            	strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            	strokeStyle: 'solid' // 선의 스타일입니다
	        	});
				console.log("???")
				clickLinee.push(clickLine);
				
				let distance = Math.round(clickLine.getLength());
				
				displayCircleDot(pointsFrame[planidx-1], distance)
			
			}
			houseNum = planidx;
			planidx++;
			checkHouseD = true;
		
		}else{ //숙소 아닐때
			console.log("숙소아닌 포문")
			console.log("v",v)
			
			let planFrame = $("<div class='planFrame'>  </div>");
		
			let planNum
			if(checkHouseD==true){
				planNum = $("<div class='planNum'> <button type='button' class='btn btn-primary idxbtn'> <span class='badge badge-light'>"+(planidx+1)+"</span> </button> </div>");
			}else{
				planNum = $("<div class='planNum'> <button type='button' class='btn btn-primary idxbtn'> <span class='badge badge-light'>"+planidx+"</span> </button> </div>");
								
			}
			
			let planImg = $("<div class='planImg'><img src='"+v.trip_img+"' width='50px' height='50px' ></div>");
			
			planFrame.append(planNum);
			planFrame.append(planImg);
			
			
			let planContFram = $("<div class='planContFram'> </div>");
			let contTitle = $("<div class='contTitle'>"+v.trip_title+"</div>");
			let contAddr= $("<div class='contAddr'>"+v.trip_destination+" </div>");
			planContFram.append(contTitle);
			planContFram.append(contAddr);
			
			planFrame.append(planContFram);
			
		
			
			
			
			$("#detailTrip").append(planFrame);
			
			
			pointsFrame.push(new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint)); //추가 할 마커 저장하기 arr에...
			console.log("pointsFrame",pointsFrame);
		
			
			let clickPosition = new kakao.maps.LatLng(v.trip_ypoint, v.trip_xpoint); // 클릭한 좌표...(가상)
			
			if( planidx >= 2){
				console.log(planidx);
				console.log("!!")
				
				let clickLine = new kakao.maps.Polyline({
	            	map: map, // 선을 표시할 지도입니다 
	            	path: [pointsFrame[planidx-2] ,pointsFrame[planidx-1]], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
	            	strokeWeight: 3, // 선의 두께입니다 
	            	strokeColor: '#db4040', // 선의 색깔입니다
	            	strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            	strokeStyle: 'solid' // 선의 스타일입니다
	        	});
				
				console.log("!!!")
				
				clickLinee.push(clickLine);
				
				let distance = Math.round(clickLine.getLength());
				
				displayCircleDot(pointsFrame[planidx-1], distance)
			
			}
		
			planidx++;
		
		
		} 
	}
	
	 //-----------지도 마커에 따른 재위치 선정
	 let bounds = new kakao.maps.LatLngBounds(); 
	 var checkHouse = false;
	 for (i = 0; i < pointsFrame.length; i++) {
	     // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	// 커스텀 오버레이에 표시할 내용입니다     
	// HTML 문자열 또는 Dom Element 입니다 
	let content;
	if(houseNum-1 == i){
		content = " <img style='width:40;height:40px;'src='./resources/tripImage/bookhouse.png'>  ";
		checkHouse = true;
	}else{
		if(checkHouse==true){
			content = "<button  type='button' class='btn btn-primary idxbtn mapbtn'> <span class='badge badge-light'>"+(i)+"</span> </button> ";
		}else{
			content = "<button  type='button' class='btn btn-primary idxbtn mapbtn'> <span class='badge badge-light'>"+(i+1)+"</span> </button> ";
		}
	}
	
	
	// 커스텀 오버레이를 생성합니다
	let custom = new kakao.maps.CustomOverlay({
   	 position: pointsFrame[i],
   	 content: content   
	});
	customOverlayy.push(custom);
	// 커스텀 오버레이를 지도에 표시합니다
 	customOverlayy[customOverlayy.length-1].setMap(map);
	
	   
	
	 bounds.extend(pointsFrame[i]);
	 }
	 
	 setTimeout(function() {
		 setBounds(bounds)
		}, 200);
	     // 재설정매소드
	 
 	
	planidx=1;
} 
	
const initMapKaKao=()=>{
	for(v of customOverlayy){
		v.setMap(null);
	}
	customOverlayy=[];
	for(v of distanceOverlayy){
		v.setMap(null);
	}
	distanceOverlayy=[];
	for(v of clickLinee){
		v.setMap(null);
	}
	clickLinee=[];
}	

function setBounds(bounds, points) {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

function displayCircleDot(position, distance) {
	
    if (distance > 0) {
        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
         var distanceOverlay = new kakao.maps.CustomOverlay({
            content: '<div class="dotOverlay">거리 <span class="numberr">' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

         distanceOverlayy.push(distanceOverlay);
         
        // 지도에 표시합니다
        distanceOverlayy[distanceOverlayy.length-1].setMap(map);
    }

    // 배열에 추가합니다
    //dots.push({circle:circleOverlay, distance: distanceOverlay});
}



//--------------------------------------------------거절 승인
$(".planjudgebtn").on('click',function(e){
	console.dir(e.target.innerText)  //승인or거절
	var judge = e.target.innerText
	var data = {"tnum":tnum,
		"judge":judge
	}
	$("#TripSharePlanList").empty();
	if(dtable!=null){
		dtable.destroy();
	}
	
	setTimeout(function() {
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
	    	
	    	
	    $.ajax({
	        url : "judgeplanshare",
	        type : "post",
	        data : data,
	        dataType : 'json',
	        success : function(response) {
					console.log(response);
					 $("#sns_table").empty();
		  				console.log(response);
		  				console.log("전체공지 사이즈",response.length);
		  				let pagesize = response.length;
		  				console.log("페이지사이즈",pagesize);
		  				$("#TripSharePlanList").empty();
		  				
		  				

		  				
		  				let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
		  				let colgroup =$("<colgroup><col width='25%'><col width='30%'><col width='45%'></colgroup>")
		  				let thead = $("<thead><tr><th>지역</th><th>이름</th><th>날짜</th></tr></thead>")
		  		        
		  				let tbody = $("<tbody ></tbody>")		
		  				
		  				
		  		        
		  		        console.log("포문직전")
		  				for(  i of response){
		  					
		  					let sd = getFormatDate(i.trip_start_date);
		  				 	let ed = getFormatDate(i.trip_end_date);
		  				 	let areaStr = getTripAreaStr(i.all_notices_number)
		  					let tr = $("<tr></tr>")
		  					
		  					let td1 =$('<td>'+areaStr+'</td>');  //지역
		  					
		  					//<a data-name="'+i.trip_number+'" class="modalplan">
		  					let td2 = $('<td><a data-name="'+i.trip_number+'" class="modalplan">'+i.trip_title+'</a></td>');   // 이름
		  					let td3 = $('<td>'+sd+' - '+ed+'</td>'); // 날짜

		  					tr.append(td1)
		  					tr.append(td2)
		  					tr.append(td3)
		  					
		  					tbody.append(tr);	
		  				}//for문 종료
		  				
		  				boards.append(colgroup);
		  				boards.append(thead); 
		  				boards.append(tbody);
		  				console.dir(boards);
		  				$("#TripSharePlanList").append(boards);
		  				
		  				setTimeout(() => {
		  					dtable =$("#boards").DataTable({
		  						 "order": [[0, 'desc']], // asc 또는 desc

		  						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

		  			             	// 검색 기능 숨기기
		  			             	searching: false,
//		  			             	// 정렬 기능 숨기기
//		  			             	ordering: false,
//		  			             	// 정보 표시 숨기기
		  			             	info: false,
//		  			             	// 페이징 기능 숨기기
//		  			             	paging: false
		  			            	
		  			            });
		  				}, 100);
	        }, error : function(jqXHR, status, e) {

	        }
	    });	
	}, 200)
	
	
})
</script>
</body>

</html>