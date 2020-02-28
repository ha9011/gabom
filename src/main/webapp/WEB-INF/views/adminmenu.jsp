<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스업체 등록 심사</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 제이쿼리 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 부트스트랩 -->

<style>
#admin_div {
	border: 1px solid black;
	width: 99%;
	height: 99%;
}

#admin_list {
	/* 	float: right; */
	
}

#service_judge {
	border: 1px solid black;
}

#tour_judge {
	height: auto;
	width: 100%;
	display: block;
	border: 1px solid black;
	width: 100%;
	display: block;
	overflow: auto;
}

#list_left {
	float: left;
	height: 100%;
	width: 20%;
	display: block;
	padding: 6px;
	height: 100%;
}

#list_right {
	float: right;
	height: auto;
	width: 70%;
	display: block;
	padding: 6px;
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
	<h3>adminmenu.jsp</h3>
	<div id="admin_page">
		<header id="header"> </header>
		<div id="admin_nav">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="home">HOME</a>
				</div>
				<ul class="nav navbar-nav" id="menu_parent">
					<li><a href="#">서비스업체 등록심사</a></li>
					<li><a href='#'>서비스업체 신고관리</a></li>
					<li><a href="#"> 여행객계획 등록심사</a></li>
					<li><a href="#"> 여행객 신고관리</a></li>
					<li><a href="#"> 전체회원 공지사항</a></li>
					<li><a href="#"> QnA</a></li>
					<li><button id="test_ajax">@</button></li>
				</ul>
			</div>
		</div>
		<div>
			<div>
				<div id="service_judge">

					<!-- <div style="border: 1px solid black; margin-top: 5px;"
				id="tour_judge">
				<div id="tour_judge">
					<div id="list_left">사진</div>
					<div id="list_right">내용</div>
				</div>
			</div> -->


				</div>
			</div>
		</div>


	</div>
	<div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>

	<script>
	console.log(${housejudge});
	const house = ${housejudge};
	console.log("house=",house);
	console.log("1",house.length);
 	
	
	let str=" ";
 	for(var i=0;i<house.length;i++){
 		console.log(house[i].house_number);
 		console.log(house[i].house_sysname);
 		str+='<div style="border: 1px solid black; margin-top: 5px;';
		str+='id="tour_judge">';
		str+='<div id="tour_judge">';
		str+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/housemainImage/upload/1582626283965.jpg"></div>';
		//str+='<div id="list_left"><img src="resources/housemainImage/upload/'+house[i].house_sysname+'"></div>';
		str+='<div id="list_right">상호명 : '+house[i].house_name+'</div>';
		str+='<div id="list_right">주소 : '+house[i].house_address+'</div>';
		str+='</div>';
		str+='</div>';
		//house[i].house_sysname
 		/* const b = $("<div></div>").text(a.house_address);
 		const c= $("<div></div>").attr("src",'./resources/housemainImage/'+a.house_sysname); */
 		
 	}
 	$("#service_judge").append(str);

	
	
</script>
</body>

</html>