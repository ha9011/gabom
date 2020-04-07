<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
	<div>
	<img src='./' >
	</div>

 			
</body>
<script>

let boards = $("<table id='boards' class='table table-bordered table-hover'></table>")
 				let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
 				let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
 		        
 				let tbody = $("<tbody ></tbody>")		
 				
 				
 		        
 		        
 				for(let i = 0;i<response.length;i++){
 					
 					let tr = $("<tr></tr>")
 					let td1 =$('<td>'+response[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+response[i].all_notices_number+'">'+response[i].all_notices_title+'</a></td>');
 					
 					const writeDate=response[i].all_notices_date.split(" ");  //split(쪼개다)
 					//console.log(writeDate[0]); //년 월 일
 					//console.log(writeDate[1]); //시 분 초
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
 				
 				$("#boardstable").append(boards);
 				
 		setTimeout(() => {
 					dtable =boards.DataTable({
 						 "order": [[0, 'desc']], // asc 또는 desc

 						 "dom" : '<"top"il>t<"bottom"prf><"clear">',

 			             	// 검색 기능 숨기기
 			             	searching: false,
// 			             	// 정렬 기능 숨기기
// 			             	ordering: false,
// 			             	// 정보 표시 숨기기
 			             	info: false,
// 			             	// 페이징 기능 숨기기
// 			             	paging: false
 			            	
 			            });
 		}, 100);
</script>
</html>