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

#housemain_judge {
	border: 1px solid black;
}

#house_judge {
	height: auto;
	width: 100%;
	display: block;
	border: 1px solid black;
	width: 100%;
	display: block;
	overflow: auto;
}
#foodmain_judge {
	border: 1px solid black;
}

#food_judge {
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
				</ul>
			</div>
		</div>
		<div>
			<div id="service_main">
				<div id="housemain_judge"></div>
				<div id="foodmain_judge"></div>
			</div>
		</div>


	</div>
	<div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>

	<script>
	console.log(${housejudge});
	console.log("flist=",${foodjudge});
	const house = ${housejudge};
	const food = ${foodjudge};
	console.log("house=",house);
	console.log("food=",food);
	console.log("house",house.length);
	console.log("food",food.length);
	
	let strh=" ";
 	for(var i=0;i<house.length;i++){
 		strh+='<div style="border: 1px solid black; margin-top: 5px; id="house_judge">';
		strh+='<div id="house_judge">';
		strh+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/housemainImage/upload/1582626283965.jpg"></div>';
		//풀요청받고 위에꺼랑 변경
		//str+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/housemainImage/upload/'+house[i].house_sysname+'"></div>';
		strh+='<div id="list_right">상호명 : '+house[i].house_name+'<br>';
		strh+='주소 : '+house[i].house_address+'</div>';
		strh+='</div>';
		strh+='</div>';
		//house[i].house_sysname
 		/* const b = $("<div></div>").text(a.house_address);
 		const c= $("<div></div>").attr("src",'./resources/housemainImage/'+a.house_sysname); */
 	}
 	$("#housemain_judge").append(strh);


 	let strf= " ";
 	for(var i=0;i<food.length;i++){
 		strf+='<div style="border: 1px solid black; margin-top: 5px; id="food_judge">';
		strf+='<div id="food_judge">';
		strf+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/foodmainImage/upload/'+food[i].food_sysname+'"></div>';
		strf+='<div id="list_right">상호명 : '+food[i].food_name+'<br>';
		strf+='주소 : '+food[i].food_address+'</div>';
		strf+='</div>';
		strf+='</div>';
 	}
 	$("#foodmain_judge").append(strf);
	
</script>
</body>

</html>