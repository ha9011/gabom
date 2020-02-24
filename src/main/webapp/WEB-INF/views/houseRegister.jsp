<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=LIBRARY"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
body{overflow:scroll;}
#house_form{margin-left:500px;margin-top:50px;border:2px solid green;width:38%}
#sign{margin-left:300px;width:100px;height:40px;}

</style>
</head>
<body>

<div id="house_form">

<form action="houseRegisterUpload" method="post"
		enctype="multipart/form-data">
	<div >
		<h3>숙소명을 입력해주세요</h3>
		<input type="text" name="house_name">
	</div>
	<div>
		<h3>메인사진을 등록해주세요</h3>
		<input type="file" name="house_mainImage" required><br>
		<img id="image_section" width="80%" src="" alt="메인이미지"/>
	</div>
	
	<div>
		<h3>주소를 입력해주세요</h3>
		<input type="text" name="house_address"><button type="button">입력</button>
		<div id="map" style="width:80%;height:300px;"></div>
		
		<!-- <input type="text" name="y"  id="y" />
		<input type="text" name="x"  id="x" /> -->
	</div>
	
	<div>
		<h3>숙소유형을 선택해주세요</h3>
		<label><input type="radio" name="house_type" value="1"> 아파트</label>
        <label><input type="radio" name="house_type" value="2"> 주택</label>
        <label><input type="radio" name="house_type" value="3"> 빌라</label>
	</div>
	<div>
		<h3>숙소사진을 등록해주세요</h3>
		<input type="file" name="house_detailImage">
		<img alt="" src="">
	</div>
	<div>
		<h3>가격을 입력해주세요</h3>
		<input type="text" name="house_price">
	</div>
	<div>
		<h3>주차</h3>
		<label><input type="radio" name="house_parkable" value="1">주차 가능</label>
        <label><input type="radio" name="house_parkable" value="2">주차 불가능</label>
	</div>
	<div>
		<h3>방 개수를 입력해주세요</h3>
		<input type="text" name="house_rooms">
	</div>
	<div>
		<h3>욕실 개수를 입력해주세요</h3>
		<input type="text" name="house_bathrooms">
	</div>
	<div>
		<h3>침대 개수를 입력해주세요</h3>
		<input type="text" name="house_beds">
	</div>
	<div>
		<h3>예약 가능 날짜를 선택해주세요</h3>
		<input type='date' name='mindate' />
		<input type='date' name='maxdate' />
	</div>
	
	<div><button type="submit" id="sign">작성완료</button></div>
	
</form>
</div>
</body>
<script>

//지도 표시 영역
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

</script>
</html>