<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스업체 등록 심사</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<!-- 제이쿼리 -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
부트스트랩 -->

<style>

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
	<h3>adminmenu.jsp header</h3>
	
	<div class="container">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#jodge">서비스업체 등록심사</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">서비스업체 신고관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">여행객계획 등록심사</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu3">여행객 신고관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#all_notices">전체회원 공지사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu5">QnA</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="home">Home</a>
    </li>
  </ul>
	 <!-- Tab 내용 -->
  <div class="tab-content">
    <div id="jodge" class="container tab-pane active"><br>
    	<div>
			<div id="service_main">
				<div id="housemain_judge"><h3>House심사대기 List</h3></div>
				<div id="foodmain_judge"><h3>Food심사대기 List</h3></div>
			</div>
		</div>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
    <h3>서비스업체 신고관리</h3>
    <p>메 뉴 1</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>여행객계획 등록심사</h3>
      <p>메뉴2</p>
    </div>
    <div id="menu3" class="container tab-pane fade"><br>
      <h3>여행객 신고관리</h3>
      <p>메뉴3</p>
    </div>
    <div id="all_notices" class="container tab-pane fade"><br>
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
				<div style="text-align: center;" id="write_button_area"> </div>
    </div>
    <div id="menu5" class="container tab-pane fade"><br>
      <h3>QnA</h3>
      <p>메뉴5</p>
    </div>
  </div>
  
  
  <!-- 서비스업 Modal -->
   <div class="modal" id="myModal">
    <div class="modal-dialog "><!-- modal-dialog-scrollable -->
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">서비스업 등록 심사</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>

        <form id="sFrm">
        <div class="modal-body" id="judge_modal">
        </div>
        <div class="modal-body" id="notices_modal">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button id="approved" value="승인" class="btn btn-primary judge"data-dismiss="modal">승인</button>
			<button id="refuse" value="거절" class="btn btn-primary judge"data-dismiss="modal">거절</button>
         	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>  
  <!-- Modal End -->
  
   <!-- 공지사항 Modal -->
   <div class="modal" id="noticesModal">
    <div class="modal-dialog "><!-- modal-dialog-scrollable -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header" id="notices_modal_header">
          <h1 class="modal-title"></h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body" id="notices_modal_body">
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
         	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>  
  <!-- noticesModal End -->
  
   <!-- 글쓰기 Modal -->
   <div class="modal" id="write_modal">
    <div class="modal-dialog "><!-- modal-dialog-scrollable -->
      <div class="modal-content">
        <!-- Modal Header -->
        <form id="write_notices">
        <div class="modal-header" id="write_modal_header">
          <!-- <h1 class="modal-title"></h1> -->
			<label for="title">제목:</label> 
			<input type="text"class="form-control" id="title" placeholder="제목" name="title">
			<button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body" id="write_modal_body">
        <textarea class="form-control" rows="5" id="content"
							name="content"></textarea>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
         	<button type="button" id="write_modal_button" class="btn btn-info" data-dismiss="modal">등록</button>
        </div>
        </form>
      </div>
    </div>
  </div>  
  <!-- write_modal End -->
  
</div> <!-- container End -->
	
	
	
	<div id="admin_page">
		
		


	</div>
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
	
	/* $('#all_notices').on('click',function(e){ 
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number; }*/
	
	
	/* function printData() {
				const boards = page.boards; //게시글만 저장
				
				const pagination = getPagination(page); //pagination 저장
				//게시판 글들만 출력
				const $tbody = $("#boards tbody");
				
				$.each(boards, function(i, $board) {
					const $tr=$("<tr>").appendTo($tbody);
					$("<td>").text($board.bno).appendTo($tr); //글번호 추가
					
					//두번째 td : 제목을 출력 하고 링크 걸기
					const $td=$("<td></td>").text($board.title).appendTo($tr);
					const $link = $("<a>").attr("href", "/kim_client/board/read.html?bno=" + $board.bno);
					$($td).wrapInner($link); //부모안에 쏴라
					//제목에 a태그

					//세번째td: 날짜, 오늘 작성한 글은 시분초를 , 그이전글은 년월일 출력
					const writeDate=$board.writeDate.split(" ");  //split(쪼개다)
					console.log(writeDate[0]); //년 월 일
					console.log(writeDate[1]); //시 분 초
					
					const today = getToday(); //오늘 날짜를 직접 정의
					
					if(today==writeDate[0]){
						$("<td>").text(writeDate[1]).appendTo($tr);
					}else{
						$("<td>").text(writeDate[0]).appendTo($tr);
					}
					//네번째td : 조회수 출력
					$("<td>").text($board.readCnt).appendTo($tr);
					
				}); //end each
				
				const $ul = $("#pagination");
				//페이지가 계속 추가 되어 출력된다면 empty
				//$ul.empty(); //선택한 요소의 내용을 지웁니다. 태그까지 지울땐 .remove()를 사용
				let li;
				if(pagination.prev>0){ //1번 페이지그룹 0, 2번째 페이지 그룹이 1
					li = $("<li>").text('이전').appendTo($ul); //앞에 페이지 그룹이 있으면 이전창 생성
					if(queryString.match(/writer/)) //글쓴이를 선택한 상테에서 페이지
						li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+pagination.prev+'&writer='+writer));
					else //글쓴이가 선택되지 않은 상태에서 페이지
						li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+pagination.prev));
				}
				for(let i = pagination.startPage; i<=pagination.endPage; i++){ //변수i는 시작페이지, i는 끝페이지까지
					li = $("<li>").text(i).appendTo($ul);
					if(page.pageno==i) //현재페이지인 경우
					
					li.attr("class","active").wrapInner($("<a></a>").attr('href','/kim_client/board/list.html?pageno='+i).prop('disabled',true)); //또는('href','#')
					else //다른페이지 클릭시
						if(queryString.match(/writer/)) //글쓴이를 선택한 상테에서 페이지
							li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+i+'&writer='+writer));
						else //글쓴이가 선택되지 않은 상태에서 페이지
							li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+i));
				}
				if(pagination.next>0){ //현재그룹에서 다음그룹이 남아있을경우
					li = $("<li>").text('다음').appendTo($ul);
					if(queryString.match(/writer/)) //글쓴이를 선택한 상테에서 페이지
						li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+pagination.next+'&writer='+writer));
					else //글쓴이가 선택되지 않은 상태에서 페이지
						li.wrapInner($("<a>").attr('href','/kim_client/board/list.html?pageno='+pagination.next));
				}
				
			} //printData end */

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			
	
		
	//전체공지 출력
	const board = ${allnotices}; 
	console.log("board",board);
	
	let strb = " ";
	for(let i = 0;i<board.length;i++){
		strb += '<tr>';
		strb += '<td>'+board[i].all_notices_number+'</td>'; //글번호
		strb += '<td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+board[i].all_notices_number+'">'+board[i].all_notices_title+'</a></button>';
		//strb += '<td><input type="hidden" id="notices_detail" class="notices_detail" data-number="'+board[i].all_notices_number+'"value="'+board[i].all_notices_title+'">';
		strb += '</td>'; //제목
		//<input type="hidden" id="notices_detail" class="notices_detail" data-number="'+board[i].all_notices_number+'">
		//board[i].all_notices_number
		const writeDate=board[i].all_notices_date.split(" ");  //split(쪼개다)
		console.log(writeDate[0]); //년 월 일
		console.log(writeDate[1]); //시 분 초
		
		const today = getToday(); //오늘 날짜를 직접 정의
		
		if(today==writeDate[0]){ //날 짜
		strb += '<td>'+writeDate[1]+'</td>';
		}else{
			strb += '<td>'+writeDate[0]+'</td>';
		}
		strb += '<td id="'+'board'+board[i].all_notices_number+'">'+board[i].all_notices_views+'</td>'; //조 회 수
		strb += '</tr>';
	}//for문 종료
	$("#notices_body").append(strb);
	
	//notices modal 생성
	$(".notices_detail").on("click",function(e){
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
					strn += '<div>'+response[0].all_notices_body+'</div>';
					$("#notices_modal_body").append(strn);
					console.log("modal생성"); 
					console.log(response[0].all_notices_views);
					$("#board"+response[0].all_notices_number).text(response[0].all_notices_views); //조회수 변경
              }, error : function(jqXHR, status, e) {
                  console.error("게시판출력모달 에러");
              }
          });	 
	}); //notices모달 click End
	

	//글쓰기 버튼 생성
	$("<button>").addClass("btn btn-info custom").attr("id","write").attr("data-toggle","modal").attr("data-target","#write_modal").text("글쓰기").appendTo($("#write_button_area"));
	
	//글쓰기 모달 생성
	$("#write_modal_button").on("click",function(){
		console.log("글쓰기 클릭");
		var formData = new FormData(document.getElementById("write_notices"));
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
			processData:false,//application/x-www-form-urlencoded(쿼리스트링)
            contentType:false,//multipart의 경우 contentType을 false로
            
            success : function(response) {
            	console.log("글쓰기 성공");
            }, error : function(jqXHR, status, e) {
                console.log("글쓰기 에러");
            }
            
		});
            
	});//글쓰기 ajax End 

	
	//house 리스트 출력
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
	//food 리스트 출력
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
	
 	//하우스 모달 ajax 시작
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
 	
 	//음식점 모달 ajax 시작
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
 	
	//승인거절 ajax
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