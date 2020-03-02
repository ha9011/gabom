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
	/* 	border: 1px solid black; */
	width: 70%;
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
	width: 70%;
}

#food_judge {
/* 	height: auto; */
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

#list_right_sec{
	float: left;
	width: 78%;
	height: 230px;
	
}
#list_right {
	height: 70%;
	display: block;
	padding: 6px;
}
#list_button{
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
	<h3>adminmenu.jsp</h3>
	<div id="admin_page">
		<header id="header"> </header>
		<div id="admin_nav">
			<nav class="container-fluid">
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
			</nav>
		</div>
		<div>
			<div id="service_main">
				<div id="housemain_judge"></div>
				
				<div id="foodmain_judge"></div>
			</div>
		</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span></button>
      </div>
      	  <form action="/sucess" name="sFrm">
      <div class="modal-body" id="judge_modal">
      	  내용
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-default">승인</button>
        <button type="button" class="btn btn-primary">거절</button>
      </div>
      </form>
    </div>
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
//	console.log("housemodal",${housemodal});	
	let strh=" ";
 	for(var i=0;i<2;i++){
 		strh+='<div style="border: 1px solid black; margin-top: 5px; id="house_judge">';
		strh+='<div id="house_judge">';
		//strh+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/housemainImage/upload/1582626283965.jpg"></div>';
		//풀요청받고 위에꺼랑 변경
		strh+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/housemainImage/upload/'+house[i].house_sysname+'"></div>';
		strh+='<div id="list_right_sec">';
		strh+='<div id="list_right">상 호 명 : '+house[i].house_name+'<br>';
		if(house[i].house_type == 1){
			strh+='집 유 형 : 아파트 <br>';
		}else if(house[i].house_type == 2){
			strh+='집 유 형 : 빌라 <br>';
		}else if(house[i].house_type == 3){
			strh+='집 유 형 : 주택 <br>';
		}
		//strh+='<input type="hidden" value="house" name="type">';
		//strh+='집 유형 : '+house[i].house_type+'<br>';
		strh+='집 주 소 : '+house[i].house_address+'</div>';
		strh+='<div id="list_button" class="house"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-number="'+house[i].house_number+'">승인/거절</button></div>';
		strh+='</div>';
		strh+='</div>';
		strh+='</div>';
		//house[i].house_sysname
 		/* const b = $("<div></div>").text(a.house_address);
 		const c= $("<div></div>").attr("src",'./resources/housemainImage/'+a.house_sysname); */
 	}
 	$("#housemain_judge").append(strh);

 	let strf= " ";
 	for(var i=0;i<2;i++){
 		strf+='<div style="border: 1px solid black; margin-top: 5px; id="food_judge">';
		strf+='<div id="food_judge">';
		strf+='<div id="list_left"><img style="height:250px; width:250px;" src="resources/foodmainImage/upload/'+food[i].food_sysname+'"></div>';
		strf+='<div id="list_right_sec">';
		strf+='<div id="list_right">상 호 명 : '+food[i].food_name+'<br>';
		if(food[i].food_type == 1){
			strf+='집 유 형 : 레스토랑 <br>';
		}else if(food[i].food_type == 2){
			strf+='집 유 형 : 카페 <br>';
		}else if(food[i].food_type == 3){
			strf+='집 유 형 : 호프 <br>';
		}
		strf+='<input type="hidden" value="food" name="type">';
		//strf+='음식점 유형 : '+food[i].food_type+'<br>';
		strf+='음식점 주소 : '+food[i].food_address+'</div>';
		strf+='<div id="list_button" class="food"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">승인/거절</button></div>';
		strf+='</div>';
		strf+='</div>';
		strf+='</div>';
 	}
 	$("#foodmain_judge").append(strf);
	
 	$('.house').on('click',function(e){
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number;

 		
 		$.ajaxSetup({         
 		      beforeSend : function(xhr){
 		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 		      });//먼저 보냄

            	console.log("ajax시작");
            	console.log(params);
            $.ajax({
                url : "judgemodal",
                type : "get",
                data : {"num":params}, 
                success : function(response) {
                    console.log("123",response);
                    
                    let strj = " ";
                    for(var i=0;i<1;i++){
                    	console.log("i",i);
                    	console.log("asdasd11",response.house_number);	
                    strj += '<div class="modal-body">';
                    strj += '등록번호 '+response[i].house_number+'<br>';
                    strj += '아이디 '+response[i].house_hosrid+'<br>';
                    strj += '이름 '+response[i].house_name+'<br>';
                    strj += '주소'+response[i].house_address+'<br>';
                    strj += '집유형'+response[i].house_type+'<br>';
                    strj += '수용인원'+response[i].house_person+'<br>';
                    strj += '주차공간'+response[i].house_parkable+'<br>';
                    strj += '방갯수'+response[i].house_room+'<br>';
                    strj += '침대수'+response[i].house_bed+'<br>';
                    strj += '욕실'+response[i].house_bathroom+'<br>';
                    strj += '체크인'+response[i].house_checkin+'<br>';
                    strj += '체크아웃'+response[i].house_checkout+'<br>';
                    strj += '1박가격'+response[i].house_price+'<br>';
                    strj += '</div>';
                    strj += '<div class="modal-body">';
                    strj += '사진';
                    strj += '</div>';
                    } 
                    $("#judge_modal").append(strj);
                }, error : function(jqXHR, status, e) {
                    //console.error(status + " :asdasd " + e);
                }

            });	 
           
 		
 		
 	}); //house End
 	
</script>
</body>

</html>