<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{overflow:scroll;}
#house_form{margin-left:600px;}

</style>
</head>
<body>
<div id="house_form">
<form action="houseRegisterUpload">
	<div >
		<h3>숙소명</h3>
		<input type="text" name="house_name">
	</div>
	<div>
		<h3>메인사진을 등록해주세요</h3>
		<input type="file" name="house_mainImage">
		<img alt="" src="">
	</div>
	<div>
		<h3>주소를 입력해주세요</h3>
		<input type="text" name="house_address">
		<div id="map"></div>
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
		<input type="text" name="house_price">
	</div>
	<div>
		<h3>욕실 개수를 입력해주세요</h3>
		<input type="text" name="house_price">
	</div>
	<div>
		<h3>침대 개수를 입력해주세요</h3>
		<input type="text" name="house_price">
	</div>
	<div>
		<h3>예약 가능 날짜를 선택해주세요</h3>
		<input type='date' name='mindate' />
		<input type='date' name='maxdate' />
	</div>
	
	<div><input type="button" value="작성완료"></div>
	
</form>
</div>
</body>
</html>