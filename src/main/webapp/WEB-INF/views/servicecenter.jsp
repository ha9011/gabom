<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service center</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- 데이타테이블 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    
<style>
#data_table_paginate{
	text-align: center;
}
#rightSide{
	margin-top: 3%;
	margin-bottom: 3%;
}
div{
display: block;
}
#leftSide{
float: left;
margin: 2% 0 0 7%; 
}
#rightSide{
float: right;
width: 70%;
margin: 3% 3% 3% 3%;
}
    
    
</style>
</head>


<body>

<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>
	
<div class="container" style="width: 95%;">

	<div id="leftSide">
		<h2>고객센터&amp;QnA</h2>
		<ul>
			<li><a href="#" id="notice_li">전체공지</a></li>
		</ul>
		<ul>
			<li><a href="#" id="qna_li">QnA</a></li>
		</ul>
	</div>
<!-- 데이타 테이블 -->
	<div id="rightSide">
		<div id="write_div">
			<div id="right_div">
					
			</div>
		</div>
	</div>
	
	
	
	
	
	
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
							
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- qna디테일 modal End -->
		<!----------------------------------------------qna글쓰기 Modal---------------------------------------------->
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



 <div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 

<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script>
	const notice = ${noticelist}; 
	const qna = ${qnalist};
	console.log("notice",notice);
	console.log("qna",qna);
	
	var dtable ;
//----------------------------------날짜----------------------------------
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

//-----------------------고객센터 클릭시 전체공지 출력----------------------------------------------------
/* if(dtable!=null){
		dtable.destroy();  // 일단 초기화
	} */

	
//  jQuery(function($){
//      $("#data_table").DataTable({
//      	"order": [[0, 'desc']], // asc 또는 desc

//			 "dom" : '<"top"il>t<"bottom"prf><"clear">',
			 
//			 info : false ,//정보 표시 숨기기
//			 searching : false //검색기능 숨기기 
//      });
//  });

	let boards = $("<table id='data_table' class='table table-bordered table-hover'></table>")
let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")

let tbody = $("<tbody ></tbody>")		

for(let i = 0;i<notice.length;i++){
	
	let tr = $("<tr></tr>")
	let td1 =$('<td>'+notice[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+notice[i].all_notices_number+'">'+notice[i].all_notices_title+'</a></td>');
	
	const writeDate=notice[i].resultDate.split(" ");  //split(쪼개다)
	console.log("년월일",writeDate[0]); //년 월 일
	//console.log("시분초",writeDate[1]); //시 분 초
	const today = getToday(); //오늘 날짜를 직접 정의
	console.log("sksksk",notice);
	let td2 ;
	if(today==writeDate[0]){ //날 짜
		td2 = $('<td>'+writeDate[1]+'</td>')
	}else{
		td2= $('<td>'+writeDate[0]+'</td>');
	}
	let td3 = $('<td id="'+'board'+notice[i].all_notices_number+'">'+notice[i].all_notices_views+'</td>'); //조 회 수

	tr.append(td1)
	tr.append(td2)
	tr.append(td3)
	
	tbody.append(tr);	
}//for문 종료

boards.append(colgroup);
boards.append(thead); 
boards.append(tbody);
console.dir(boards);
$("#right_div").append(boards);
console.log("qwewqewqewqewqewq")

$("#data_table").DataTable({
	"order": [[0, 'desc']], // asc 또는 desc

	 "dom" : '<"top"il>t<"bottom"prf><"clear">',
	 
	 info : false ,//정보 표시 숨기기
	 searching : false //검색기능 숨기기 
});

//-----------------------------------------------------고객센터 클릭시 이벤트 End---------------------------------------------------------

//-----------------------------------------------전체공지 클릭시 ajax----------------------------------------------------
	$(document).on("click","#notice_li",function(){
		console.log("전체공지 클릭함?");
		
		if(dtable!=null){
			dtable.destroy();  // 일단 초기화
		}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		 $.ajax({
         url : "allnotices", //어드민 컨트롤러 url
         type : "Post",
         dataType : 'json',
         success : function(response) {
      	   
      	   $("#right_div").empty();
				console.log('notices불러오기 성공');
				console.log(response);
								
				let boards = $("<table id='data_table' class='table table-bordered table-hover'></table>")
				let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
				let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
		        
				let tbody = $("<tbody ></tbody>")		
				
				for(let i = 0;i<response.length;i++){
					
					let tr = $("<tr></tr>")
					let td1 =$('<td>'+response[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a></td>');
					
					const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
					const today = getToday(); //오늘 날짜를 직접 정의

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
				$("#right_div").append(boards);
				
				setTimeout(() => {
					dtable =$("#data_table").DataTable({
						 "order": [[0, 'desc']], // asc 또는 desc

						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

			             	// 검색 기능 숨기기
			             	searching: false,
			             	// 정보 표시 숨기기
			             	info: false,
			            });
				}, 100);
				
				
         }, error : function(jqXHR, status, e) {
             console.error("게시판출력 에러");
         }
     		}); //ajax end

	}); //notice_li click End
//-----------------------------------------------전체공지 클릭시 ajax------------------------------------------------------------------

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
          url : "noticesmodal", //admin 컨트롤러 url
          type : "get",
          data : {"num":params}, 
          success : function(response) {
				$("#notices_modal_header").empty();
				$("#notices_modal_body").empty();
				response = JSON.parse(response);
				console.log("notices",response);
				console.log("숫자",response[0].all_notices_number);
				let strn = " ";
				strn += '<div style="text-align: center"><h3>제목 : '+response[0].all_notices_title+'</h3></div>';
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
//---------------------------------------------------------------------전체공지 상세 modal 생성---------------------------------------------------------------------

//--------------------------------------------------------------------qna li 클릭시 ajax------------------------------------------------------------------
$(document).on("click","#qna_li",function(){
	console.log("qna클릭함??");
	
	if(dtable!=null){
		dtable.destroy();  // 일단 초기화
	}
		$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
	$.ajax({
		url : "qnaboard", //rest admin controller
        type : "Post",
        dataType : 'json',
        success : function(response) {
        	
        	$("#right_div").empty();
        	console.log("qna출력 성공",response);
        	
        	let boards = $("<table id='data_table' class='table table-bordered table-hover'> </table>")
        	let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
        	let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>글쓴이</th><th>날짜</th></tr></thead>")
        	let tbody = $("<tbody></tbody>")	
        	
        	for(i=0;i<response.length;i++){
        		
        		let tr = $("<tr></tr>")
        		let td1 =$('<td>'+response[i].qna_number+'</td><td><a id="qna_detail" class="qna_detail" href="#;" data-toggle="modal" data-target="#qnaModal" data-number="'+response[i].qna_number+'">'+response[i].qna_title+'</a></td><td>'+response[i].qna_member_id+'</td>');
        		$("#write_modal_header").append("<input type='hidden' class='form-control' id='member' name='member' value='"+response[i].qna_member_id+"'>")	
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
        	let div = $('<div style="text-align: center;" id="write_button_area"></div>');
        	
        		boards.append(colgroup);
        		boards.append(thead); 
        		boards.append(tbody);
        		
        		$("#right_div").append(boards);
        		$("#right_div").append(div);
        	    $("<button>").addClass("btn btn-info custom").attr("id","write").attr("data-toggle","modal").attr("data-target","#write_modal").text("글쓰기").appendTo($("#write_button_area"));
        	      
        		setTimeout(() => {
        			dtable =$("#data_table").DataTable({
        				 "order": [[0, 'desc']], // asc 또는 desc

        				 "dom" : '<"top"il>t<"bottom"prf><"clear">',

        	             	// 검색 기능 숨기기
        	             	searching: false,
//        	             	// 정렬 기능 숨기기
//        	             	ordering: false,
//        	             	// 정보 표시 숨기기
        	             	info: false,
//        	             	// 페이징 기능 숨기기
//        	             	paging: false
        	            	
        	            });
        		}, 100);

        }, error : function(jqXHR, status, e) {
            console.log("qna글쓰기 에러");
        }
        
	});//ajax end
});
//-----------------------------------------------qnali 클릭시 ajax End------------------------------------------------------------------

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
          url : "qnamodal", //어드민 qna url
          type : "Post",
          data : {"num":params}, 
          success : function(response) {
				$("#qna_modal_header").empty();
				$("#qna_modal_body").empty();
				response = JSON.parse(response);
				console.log(response);
				console.log(response.nlist);

				let strn = " ";
				strn += '<div style="text-align: center"><h3>제목 : '+response.nlist[0].qna_title+'</h3></div>';
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
				$("#qna_modal_body").append(strn);
				
				console.log("modal생성"); 
          }, error : function(jqXHR, status, e) {
              console.error("qna출력모달 에러");
          }
      });	  
}); //qna 상세모달 End
//---------------------------------------------------------------------qna 상세 모달 End---------------------------------------------------------------------

//---------------------------------------------------------------------qna글쓰기 모달 생성 및 글등록--------------------------------------------------------------
$("#write_modal_button").on("click",function(e){
	console.log("글쓰기 클릭");
	
	$("#right_div").empty();
	if(dtable!=null){
		dtable.destroy();  // datatable 초기화
	}
	var formData = new FormData();
	formData.append("title",document.getElementById("title").value);
	//formData.append("member",document.getElementById("member").value);
	
	
	var str = $('#content').val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	document.getElementById("content").value=str;
	formData.append("content",document.getElementById("content").value);
	console.log("qna제목=",formData.get("title"));
	console.log("qna내용=",formData.get("content"));
	console.log("qna작성자=",formData.get("member"));
	$.ajaxSetup({         
		beforeSend : function(xhr){
	    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	    });
    	console.log("qna글쓰기 ajax시작");
    	
	$.ajax({
		url : "qnawrite", //rest service controller
        type : "Post",
        data : formData, 
        dataType : 'json',
		processData:false,//application/x-www-form-urlencoded(쿼리스트링)
        contentType:false,//multipart의 경우 contentType을 false로
        
        success : function(response) {
        	
        	console.log("질문쓰기 성공",response);
        	document.getElementById("title").value = " ";
        	document.getElementById("content").value = " ";
        	document.getElementById("member").value = " ";
        	
        	let boards = $("<table id='data_table' class='table table-bordered table-hover'> </table>")
        	let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
        	let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>글쓴이</th><th>날짜</th></tr></thead>")
        	let tbody = $("<tbody></tbody>")	
        	
        	for(i=0;i<response.length;i++){
        		console.log("kajsdjasd",response[i]);
        		let tr = $("<tr></tr>");
        		let td1 =$('<td>'+response[i].qna_number+'</td><td><a id="qna_detail" class="qna_detail" href="#;" data-toggle="modal" data-target="#qnaModal" data-number="'+response[i].qna_number+'">'+response[i].qna_title+'</a></td><td>'+response[i].qna_member_id+'</td>');
        		$("#write_modal_header").append("<input type='hidden' class='form-control' id='member' name='member' value='"+response[i].qna_member_id+"'>");
        		const writeDate=response[i].resultDate.split(" ");  //split(쪼개다)
        		
        		const today = getToday(); //오늘 날짜를 직접 정의
        		
        		let td2 ;
        			if(today==writeDate[0]){ //날 짜
        				td2 = $('<td>'+writeDate[1]+'</td>');
        			}else{
        				td2= $('<td>'+writeDate[0]+'</td>');
        			}
        			
        			tr.append(td1);
        			tr.append(td2);
        			tbody.append(tr);		
        	}
        	let div = $('<div style="text-align: center;" id="write_button_area"></div>');
        	
        		boards.append(colgroup);
        		boards.append(thead); 
        		boards.append(tbody);
        		
        		$("#right_div").append(boards);
        		$("#right_div").append(div);
				$("<button>").addClass("btn btn-info custom").attr("id","write").attr("data-toggle","modal").attr("data-target","#write_modal").text("글쓰기").appendTo($("#write_button_area"));
        		setTimeout(() => {
        			dtable =$("#data_table").DataTable({
        				 "order": [[0, 'desc']], // asc 또는 desc

        				 "dom" : '<"top"il>t<"bottom"prf><"clear">',

        	             	// 검색 기능 숨기기
        	             	searching: false,
//        	             	// 정렬 기능 숨기기
//        	             	ordering: false,
//        	             	// 정보 표시 숨기기
        	             	info: false,
//        	             	// 페이징 기능 숨기기
//        	             	paging: false
        	            	
        	            });
        		}, 100);

				

        }, error : function(jqXHR, status, e) {
            console.log("qna글쓰기 에러");
        }
        
	});//ajax end
        
});//글쓰기 이벤트 end
//---------------------------------------------------------------------qna글쓰기 모달 생성 및 글등록 End---------------------------------------------------------


</script>
</body>
</html>