<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<form action="joinmemberAction?${_csrf.parameterName}=${_csrf.token}"
			method="post" enctype="multipart/form-data"
			onsubmit="return checkForm();">

			<div id="profilePic">
				<img src="./resources/loginimage/a.png" width="80px" height="80px">
				<!-- 기본 이미지 -->
				<br> <input type="file" name="member_profile_picture"
					id="member_profile_picture" >
					
				<input type="hidden" name="profillCheck" id="profillCheck" value="0">	
				
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
				비 밀 번 호 : <input type="password" name="member_password"
					id="member_password"><br> 비밀번호확인 :<input
					type="password" name="member_password_check"
					id="member_password_check"><br>
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
					checked="checked" value="1">여행자 <input type="radio"
					name="member_type" id="member_type_Servicer" value="2">서비스
			</div>

			<div id="insertIntroduce">
				<input type="text" name="member_profile_contents"
					id="member_profile_contents">
			</div>


			<br> <br> <input type="submit" value="회원가입" />
			<button id="joinCancel">취소</button>


		</form>
	</div>

	<script type="text/javascript">
		
	console.log("유효성검사 시작")
	var userPic = $("#member_profile_picture");
	userPic.on("change",function(){
		if(userPic.val().length===0){
			$("#profillCheck").val("0");
		}else{
			$("#profillCheck").val("1");
		}
	
	})
	
		function checkForm() {

			console.log("사진 검사 : " + $("#profillCheck").val())
			
			
			var userId = $("#member_id");
			// 아이디 입력 유무 체크
			if (userId.val() == ''
					|| !(userId.val().length >= 3 && userId.val().length <= 12)) {
				console.log("member_id - test")
				alert("아이디를 입력하시오");
				userId.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			var userEmail = $("#member_email");
			// 이메일 체크 - 정규식, 입력 유무
			if (userEmail.val() == '') {
				console.log("member_email - test")
				alert("이메일 입력하시오");
				userEmail.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			var userPWD = $("#member_password");
			// 비밀번호 정규식
			if (userPWD.val() == '') {
				console.log("member_password - test")
				alert("비밀번호 입력하시오");
				userPWD.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			var userName = $("#member_name");
			// 아이디 입력 유무 체크
			if (userName.val() == '') {
				console.log("member_name - test")
				alert("이름을 입력하세요");
				userName.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			var userPhone = $("#member_phone");
			// 전화번호 유무 체크
			if (userPhone.val() == '') {
				console.log("member_id - test")
				alert("전화번호를 입력하세요");
				userPhone.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			var userBirth = $("#member_birth");
			// 아이디 입력 유무 체크
			if (userBirth.val() == '') {
				console.log("member_birth - test")
				alert("이름을 입력하세요");
				userBirth.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			
			return true;
		}

		
	</script>
</body>


</html>