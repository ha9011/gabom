<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>검색결과</title>
<style>

#middle{
	display:flex; 
}
#house_list{
	
	width:45%;
	
}
.house{
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
 
		<div id="searchbox">
			검색창<input id="changesearch" type="text" name="house_address">
				<button type="submit" id="searchbtn">검색</button>
		</div>

<div id="middle">
		<div id="house_list" class="house_list">
		</div>
		
		<div id="maparea">
			<div id="map" style="width:100%; height: 1000px;"></div>
		</div>
</div>

</body>
<script>
var test = ${searchhouse};
console.log(test);

var house_list = document.getElementById("house_list");

for(i of test ){
	console.log("집리스트 보여줘",i)
	 var out = $('<div class="house" name ='+[i.house_number]+'></div>')
	 var img = $('<div class="img"><img alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="./resources/housemainImage/upload/'+[i.house_sysname]+'"></div>')
	 var info = $('<div class="info">'+"이름"+[i.house_name]+"<br>"+"가격"+[i.house_price]+"<br>"+"주소"+[i.house_address]+'</div>')

	$("#house_list").append(out);
	out.append(img);
	out.append(info);
} 


//--------------------------------------지도 마커싱
let positions  =new Array; 
let xavg = 0;
let yavg =0;

for(i of test){
	console.log(i)
	let innerList = {  
		latlng: new kakao.maps.LatLng(i.house_ypoint, i.house_xpoint)
	};
	yavg += Number(i.house_ypoint);
	xavg +=  Number(i.house_xpoint);
	
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
		var changesearch=$("#changesearch").val();
		console.log(changesearch);
	 	
		$.ajax({
		       type:'get',
		        url:'rest/changesearch',
		        data:{"data":changesearch},
		        dataType:"json",
		        
		        success:function(data){
		        	
		        	 positions  =new Array; 
		        	 xavg = 0;
		        	 yavg =0;
		        	
					console.log("성공");
					 $('#house_list').empty();
					 $('#map').empty();
			         console.log(data);
			         
			         for(i of data ){
			        		console.log("집리스트 보여줘",i)
			        		 var out = $('<div class="house" name ='+[i.house_number]+'></div>')
			        		 var img = $('<div class="img"><img alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="./resources/housemainImage/upload/'+[i.house_sysname]+'"></div>')
			        		 var info = $('<div class="info">'+"이름"+[i.house_name]+"<br>"+"가격"+[i.house_price]+"<br>"+"주소"+[i.house_address]+'</div>')

			        		$("#house_list").append(out);
			        		out.append(img);
			        		out.append(info);
			         };
			        		
			         		for(i of data){
			        			console.log(i)
			        			let innerList = {  
			        				latlng: new kakao.maps.LatLng(i.house_ypoint, i.house_xpoint)
			        			};
			        			yavg += Number(i.house_ypoint);
			        			xavg +=  Number(i.house_xpoint);
			        			
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