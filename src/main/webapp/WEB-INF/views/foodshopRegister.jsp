<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foodshopRegister</title>
<style>
body {
	overflow: scroll;
}

#food_form {
	margin-top : 10%;
	margin-left: 40%;
}
</style>

</head>
<body>
	<div id="food_form">
		<form action="foodRegisterUpload">
			<div>
				<h3>상호명 입력해주세요.</h3>
				<input type="text" name="food_name">
			</div>
			<div>
				<h3>메인사진을 등록해주세요.</h3>
				<input type="file" name="food_mainImage">

			</div>
			<div>
				<h3>주소를 입력해주세요.</h3>
				<input type="text" name="food_address">
			</div>
			<div>
				<h3>음식점유형을 선택해주세요.</h3>
				<label><input type="radio" name="food_type" value="1">
					레스토랑</label> <label><input type="radio" name="food_type" value="2">
					카페</label> <label><input type="radio" name="food_type" value="3">
					호프</label>
			</div>
			<div>
				<h3>음식점 메뉴사진/상세사진을 등록해주세요.</h3>
				<input type="file" name="food_menuImages">

			</div>
			<div>
				<h3>주차</h3>
				<label><input type="radio" name="food_parkable" value="1">주차
					가능</label> <label><input type="radio" name="food_parkable"
					value="2">주차 불가능</label>
			</div>

			<div>
				<h3>예약 날짜를 선택해주세요.</h3>
				<input type='date' name='foodregisterdate' /> <input type="time"
					name='mintime' /> <input type="time" name='maxtime' />
			</div>

			<div>
				<input type=button value="작성완료">
				<!-- <input type="submit" value="작성완료"> -->
			</div>
		</form>
	</div>
</body>
</html>