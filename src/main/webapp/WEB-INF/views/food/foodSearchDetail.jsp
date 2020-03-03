<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
<title>검색결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<style>
body{overflow:scroll;}
.form-control-borderless {
    border:none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    border: none;
    outline: none;
    box-shadow: none;
}

#middle{
	display:flex; 
}
#food_list{
	
	width:45%;
	
}
.food{
	margin:15px;
	width:80%;
	border-bottom:2px solid gray;
	display:flex;
}
#maparea{
	width:70%;
}
img{
	width:200px;
	height:100px;
	margin:5px;
}


</style>
</head>
<body>

 <!-- searchdetail page에서 재검색하는 것  -->
 
		<div class="container">
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="foodchangesearch" name="food_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
                    </div>
</div>

<div id="middle">
		<div id="food_list" class="food_list">
		</div>
		
		<div id="maparea">
			<div id="map" style="width:100%; height: 1000px;"></div>
		</div>
</div>

</body>
<script>
var test = ${searchfood};
console.log(test);

var food_list = document.getElementById("food_list");

for(i of test ){
	console.log("집리스트 보여줘",i)
	 var out = $('<div class="food" name ='+[i.food_number]+'></div>')
	 var img = $('<div class="img"><img alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
	 var info = $('<div class="info">'+"이름"+[i.food_name]+"<br>"+"가격"+[i.food_price]+"<br>"+"주소"+[i.food_address]+'</div>')

	$("#food_list").append(out);
	out.append(img);
	out.append(info);
	
	$(".food").on('click', function() { // 이미지 클릭시 url 이동
		console.log("집 클릭") 
		console.log($(this).attr("name"));
	    location.href="fooddetail?food_number="+$(this).attr("name");
	});	
} 


//--------------------------------------지도 마커싱
let positions  =new Array; 
let xavg = 0;
let yavg =0;

for(i of test){
	console.log(i)
	let innerList = {  
		latlng: new kakao.maps.LatLng(i.food_ypoint, i.food_xpoint)
	};
	yavg += Number(i.food_ypoint);
	xavg +=  Number(i.food_xpoint);
	
	positions.push(innerList)
}

xavg=xavg/test.length;

yavg=yavg/test.length;

console.log(xavg);
console.log(yavg);


console.log(positions)

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = { 
    center: new kakao.maps.LatLng(yavg, xavg), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
   };

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {
    console.log(positions[i].latlng)
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        /* title : positions[i].title, */ // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

//---------------------------------------------------------------------------------------------------------
 $("#searchbtn").on("click", function() {
	 	console.log("ajax 재검색")
		var changesearch=$("#foodchangesearch").val();
		console.log(changesearch);
	 	
		$.ajax({
		       type:'get',
		        url:'rest/foodchangesearch',
		        data:{"data":foodchangesearch},
		        dataType:"json",
		        
		        success:function(data){
		        	
		        	 positions  =new Array; 
		        	 xavg = 0;
		        	 yavg =0;
		        	
					console.log("성공");
					 $('#food_list').empty();
					 $('#map').empty();
			         console.log(data);
			         
			         for(i of data ){
			        		console.log("집리스트 보여줘",i)
			        		 var out = $('<div class="food" name ='+[i.food_number]+'></div>')
			        		 var img = $('<div id="mainimg" name ='+[i.food_number]+'><img alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
			        		 var info = $('<div class="info">'+"이름"+[i.food_name]+"<br>"+"가격"+[i.food_price]+"<br>"+"주소"+[i.food_address]+'</div>')

			        		$("#food_list").append(out);
			        		out.append(img);
			        		out.append(info);
			         };
			         
			         $("#mainimg").on('click', function() { // 이미지 클릭시 url 이동
			     		console.log("집 클릭") 
			     		console.log($(this).attr("name"));
			     	    location.href="fooddetail?food_number="+$(this).attr("name");
			     	});	
			        		
			         		for(i of data){
			        			console.log(i)
			        			let innerList = {  
			        				latlng: new kakao.maps.LatLng(i.food_ypoint, i.food_xpoint)
			        			};
			        			yavg += Number(i.food_ypoint);
			        			xavg +=  Number(i.food_xpoint);
			        			
			        			positions.push(innerList)
			        		}

			        		
			        		console.log("positions : " + positions);
			        		xavg=xavg/data.length;

			        		yavg=yavg/data.length;
			        		console.log("positions : " + positions);
			        		var mapContainer = document.getElementById('map') // 지도를 표시할 div 
			        		console.dir(mapContainer);
			        		
			        		mapOption = { 
			        		    center: new kakao.maps.LatLng(yavg, xavg), // 지도의 중심좌표
			        		    level: 7 // 지도의 확대 레벨
			        		   };
			        		
			        		//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			        		var map = new kakao.maps.Map(mapContainer, mapOption); 

			        		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

			        		for (var i = 0; i < positions.length; i ++) {
			        		    console.log(positions[i].latlng)
			        		    // 마커 이미지의 이미지 크기 입니다
			        		    var imageSize = new kakao.maps.Size(24, 35); 
			        		    
			        		    // 마커 이미지를 생성합니다    
			        		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			        		    
			        		    // 마커를 생성합니다
			        		    var marker = new kakao.maps.Marker({
			        		        map: map, // 마커를 표시할 지도
			        		        position: positions[i].latlng, // 마커를 표시할 위치
			        		        /* title : positions[i].title, */ // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        		        image : markerImage // 마커 이미지 
			        		    });
			        		}
				},
				error:function(error){
					console.log("실패")
				}
});
})//event end
	 






</script>
</html>