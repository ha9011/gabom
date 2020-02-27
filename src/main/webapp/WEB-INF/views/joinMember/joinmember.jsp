<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<form action="joinmemberAction?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
			
			<div id="profilePic">
				<img src="./resources/loginimage/a.png" width="80px" height="80px">
				<!-- 기본 이미지 -->
				<br> <input type="file" name="member_profile_picture" id="member_profile_picture" value="a">
			</div>

			<div id="insertID">
				아이디 : <input type="text" name="member_id" id="member_id"><br>
				<div id="checkID"></div>
			</div>

			<div id="insertEmail">
				이메일 : <input type="text" name="member_email" id="member_email"><br>
				<div id="checkEmail"></div>
			</div>

			<div id="insertPWD">
				비 밀 번 호 : <input type="password" name="member_password" id="member_password"><br>
				비밀번호확인 :<input type="password" name="member_password_check" id="member_password_check"><br>
			</div>
			<div id="checkPWD"></div>


			<div id="insertName">
				이름 :<input type="text" name="member_name" id="member_name">
			</div>

			<div id="insertPhone">
				전화번호 : <input type="text" name="member_phone" id="member_phone">
			</div>

			<div id="insertBirth">
				생년월일 : <input type="date" name="member_birth" id="member_birth">
			</div>

			<div id="insertType">
				타 입 : <input type="radio" name="member_type" id="member_type_Travel"
					checked="checked" value="1">여행자
					 <input type="radio" name="member_type"
					id="member_type_Servicer" value="2">서비스
			</div>

			<div id="insertIntroduce">
				<input type="text" name="member_profile_contents" id="member_profile_contents" >
			</div>


			<br>
			<br>

			<button id="join">가입</button>
			<button id="joinCancel">취소</button>


		</form>


	</div>
</body>


</html>