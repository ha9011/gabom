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
				<div id="checkID"></div><br>
			</div>

			<div id="insertEmail">
				이메일 : <input type="text" name="member_email" id="member_email"><br>
				<div id="checkEmail"></div><br>
			</div>

			<div id="insertPWD">
				비 밀 번 호 : <input type="password" name="member_password"
					id="member_password"><br> 비밀번호확인 :<input
					type="password" name="member_password_check"
					id="member_password_check"><br>
			</div>
			<div id="checkPWD"></div><br>


			<div id="insertName">
				이름 :<input type="text" name="member_name" id="member_name">
			</div>
			<div id="checkName"></div><br>

			<div id="insertPhone">
				전화번호 : <input type="text" name="member_phone" id="member_phone">
			</div>
			<div id="checkPhone"></div><br>

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
			var userCheck = $("#checkID");
			// 아이디 입력 유무 체크
			if (userId.val() == '') {
				console.log("member_id - test")
				userCheck.css("color","red").text("필수 기재 사항입니다.")
				userId.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}else if (!/^[A-Za-z0-9]{4,20}$/.test(userId.val())) {   
				console.log("member_id - test")
				userCheck.css("color","red").text("영문,숫자 4~20 조합하셔야 합니다.")
				userId.focus();
				return false;
			}else{
				userCheck.empty();
			}
			
			
			var userEmail = $("#member_email");
			var checkEmail = $("#checkEmail");
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (userEmail.val() == '') {
				console.log("member_email - test")
				checkEmail.css("color","red").text("필수 기재 사항입니다.");
				userEmail.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}else if(!regExp.test(userEmail.val())){
				console.log("member_id - test")
				checkEmail.css("color","red").text("이메일 양식에 맞게 작성하세요 (ex. gabom@google.com)");
				userEmail.focus();
				return false;
			}else{
				checkEmail.empty();
			}
			
			
			var userPWD = $("#member_password");
			var checkPWD = $("#checkPWD");
			var regExp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			if (userPWD.val() == '') {
				console.log("member_password - test")
				checkPWD.css("color","red").text("비밀번호를 입력하세요");
				userPWD.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}else if(!regExp.test(userPWD.val())){
				console.log("member_password - test")
				checkPWD.css("color","red").text("숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력");
				checkPWD.focus();
				return false;
			}else{
				checkPWD.empty();
			}
			
			
			var userName = $("#member_name");
			var checkName = $("#checkName");
			var regExp = /^[가-힣]{2,6}$/;
			if (userName.val() == '') {
				console.log("member_name - test")
				checkPWD.css("color","red").text("이름를 입력하세요");
				userName.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}else if(!regExp.test(userName.val())) {   
				console.log("member_name - test")
				checkName.css("color","red").text("2글자 이상 한글로만 입력하세요.");
				checkName.focus();
				return false;
			}else{
				checkName.empty();
			}
			
			
			
			var userPhone = $("#member_phone");
			var checkPhone = $("#checkPhone");
			var regExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
			if (userPhone.val() == '') {
				console.log("member_id - test")
				alert("전화번호를 입력하세요");
				userPhone.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}else if(!regExp.test(userPhone.val())) {   
				console.log("member_name - test")
				checkPhone.css("color","red").text("-없이 핸드폰번호로 입력하세요 ");
				checkPhone.focus();
				return false;
			}else{
				checkPhone.empty();
			}
			
			
			var userBirth = $("#member_birth");
			// 아이디 입력 유무 체크
			if (userBirth.val() == '') {
				console.log("member_birth - test")
				alert("생년월일을 선택하세요");
				userBirth.focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			
			return true;
		}

	$("#member_id").on("blur", function(e){
		console.log("아이디 중복 확인 blur");
		

		var userCheck = $("#checkID");
		var id = e.target.value;
		console.log(id);
		
		
		$.ajax({
			url:"join/userid",
			data:"member_id="+id,
			method:"get",
			dataType:"json",
			//콜백지옥을 해결하기 위해 [es6] promise-await,async   
			// jquery 방식은 - deferred객체를 쓴다. 
		})
		.done((rest)=>{
				
				console.log("test : " +rest);
				var userCheck = $("#checkID");
				userCheck.empty()
				
				var userId = $("#member_id");
				
				// 아이디 입력 유무 체크
				
			
				
				if (id == '') {
					userCheck.empty()
					userCheck.css("color","red").text("필수 기재 사항입니다.")
					userId.focus();
				}else if (!/^[A-Za-z0-9]{4,20}$/.test(id)) {   
					userCheck.empty()
					userCheck.css("color","red").text("영문,숫자 4~20 조합하셔야 합니다.")
					userId.focus();
				}else if(rest == 1){
					userCheck.empty()
					userCheck.css("color","red").text("이미 사용된 아이디입니다.")
				}else if(rest == 0){
					userCheck.empty()
					userCheck.css("color","green").text("사용가능한 아이디 입니다.")
					userId.focus();
				}	
					
				
				
				
				
				
		})
		.fail((rest)=>{console.log("실패 : " + rest)});
		
		
		
		
	})
		
	</script>
</body>


</html>