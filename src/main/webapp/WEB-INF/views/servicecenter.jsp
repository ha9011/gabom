<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service center</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
	<!-- 데이타테이블 -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    
<script>
        jQuery(function($){
            $("#notice_table").DataTable({
            	"order": [[0, 'desc']], // asc 또는 desc

				 "dom" : '<"top"il>t<"bottom"prf><"clear">',
				 
				 info : false ,//정보 표시 숨기기
				 searching : false //검색기능 숨기기 
            });
        });
    </script>
<style>
#notice_table_paginate{
	text-align: center;
}
#boardstable{
	margin-top: 3%;
	margin-bottom: 3%;
}
    
    
    
</style>
</head>


<body>

<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>
<h3></h3>

<div class="container">
	<div id="boardstable">
	
	</div>
</div>








 <div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
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

	const notice = ${noticelist}; 
	const qna = ${qnalist};
	console.log("notice",notice);
	console.log("qna",qna);
	
	
	let boards = $("<table id='notice_table' class='table table-bordered table-hover'></table>")
	let colgroup =$("<colgroup><col width='15%'><col width='45%'><col width='20%'><col width='20%'></colgroup>")
	let thead = $("<thead><tr><th>글번호</th><th>제목</th><th>날짜</th><th>조회수</th></tr></thead>")
    
	let tbody = $("<tbody ></tbody>")		
    
	for(let i = 0;i<notice.length;i++){
		
		let tr = $("<tr></tr>")
		let td1 =$('<td>'+notice[i].all_notices_number+'</td><td><a id="notices_detail" class="notices_detail" href="#;" data-toggle="modal" data-target="#noticesModal" data-number="'+notice[i].all_notices_number+'">'+notice[i].all_notices_title+'</a></td>');
		
		const writeDate=notice[i].all_notices_date.split(" ");  //split(쪼개다)
		//console.log(writeDate[0]); //년 월 일
		//console.log(writeDate[1]); //시 분 초
		const today = getToday(); //오늘 날짜를 직접 정의
		
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
	$("#boardstable").append(boards);





</script>
</body>
</html>