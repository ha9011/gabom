<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>
<style>
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

#main_div{
	
}

/* -------------------header------------------------------------------- */

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
	<form id="select_trip">
	<div class="container" id="main_div">
	<h2 id="title_h"></h2>
		<div style="display: flex;">
		<div id="img_div" >	</div>
		<div id="map" style="width: 45%; height: 300px; "> </div>
		
		</div>
		<div id="title_div" style="margin-top: 5%; ">
			<ul id="title_ul" > <!-- tabindex="0" -->
			
			</ul> 
		</div>
		<div id="overview_div" style="margin-top: 5%;"> </div>
		<button id="hidden" type="button" class="btn btn-lg btn-primary" style="float: right;">일정추가</button>
	</div>
	</form>
	
	
	
<script>
	var detailcommon = ${detailcommon};
	console.log("디테일", detailcommon);
	response = JSON.parse(detailcommon);
	console.log("response", response);
	
	var detail = response.response.body.items.item;
	console.log("detail",detail);
	//이미지 출력
	let title = "";
	title += "<h2>"+detail.title+"</h2>";
	title += "<input type='hidden' name='title' value='"+detail.title+"'>";
	title += "<input type='hidden' name='mapx' value='"+detail.mapx+"'>";
	title += "<input type='hidden' name='mapy' value='"+detail.mapy+"'>";
	$("#title_h").append(title);
	let img =  "<img style='width:85%; height: 300px;' src='"+detail.firstimage+"'>";
	$("#img_div").append(img);
	let overview = "<p>"+detail.overview+"</p>";
	$("#overview_div").append(overview);
	
	let li = " ";
	let addr2 = " ";
	
 	if(detail.zipcode != undefined){ //우편번호가 존재할때
 		li += "<li><strong>우편번호</strong> :"+ detail.zipcode+"</li>";	
 	}
 	if(detail.telname != undefined){ //전화명이 존재할때
 		li += "<li><strong>전화명</strong> :"+ detail.telname+"</li>";	
 	}
 	if(detail.tel != undefined){ //전화번호가 존재할때
 		li += "<li><strong>전화번호</strong> :"+ detail.tel+"</li>";	
 	}
	if(detail.homepage != undefined){ //홈페이지가 존재할때
		li += "<li><strong>홈페이지</strong> :"+ detail.homepage+"</li>";	
	}
 	if(detail.addr1 != undefined){ //주소1이 존재할때
 		li += "<li id='addr1'><strong>주소</strong> :"+  detail.addr1 ; //+ "</li>"
 	}
 	if(detail.addr2 != undefined){ //주소2가 존재할때
 		addr2 += "<span>" + detail.addr2 + "</span></li>";
	 	console.log('addr2',addr2);
 	}else{
 		+ "</li>";
 	}
 		$("#addr1").append(addr2);
	 
	$("#title_ul").append(li);
	
//---------------------------------------------버튼입력시 데이타전송----------------------------------	
	$("#hidden").on("click",function(e){
	var formData = new FormData(document.getElementById("select_trip"));
		console.log(formData.get("mapx"));
		console.log(formData.get("mapy"));
		console.log(formData.get("title"));
		var params = {
				"mapx" : formData.get("mapx"),
				"mapy" : formData.get("mapy"),
				"title" : formData.get("title"),
		}
		//시큐리티 ajax Setup
//  		$.ajaxSetup({         //상세모달 ajax
//  		      beforeSend : function(xhr){
//  		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
//  		      });//먼저 보냄

//             	console.log("일정추가 ajax시작");
//             	console.log(params);
//             $.ajax({
//                 url : "destinationselect",
//                 type : "get",
//                 data : params ,
//                 success : function(response) {
                	
 					
                    
//                 }, error : function(jqXHR, status, e) {
//                     //console.error(status + " :asdasd " + e);
//                 }
//             });	 
            //$(opener.document).getElementById("")
            window.opener.destinationselect(params);
		window.close();
	})
	
	
//-----------------------------------------------지도출력-----------------------------------//	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	    	 x=detail.mapx;
			 y=detail.mapy;
	    	
	        var coords = new kakao.maps.LatLng(detail.mapy, detail.mapx);
	        
			console.dir(x);
	    	console.dir(y);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+detail.title+'</div>'
	        });
	        infowindow.open(map, marker);
	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);

//지도 표시 영역
</script>
</body>
</html>