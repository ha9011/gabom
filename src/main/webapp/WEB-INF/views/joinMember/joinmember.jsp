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
				<img src="./resources/userprofileimage/upload/basicprofile.jpg" width="80px" height="80px" id="previewPic">
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

			
			<!-- type은 전 페이지에서 mav로 받아옴 -->
			<input type="hidden" name="member_type" id="member_type">
			

			<div id="insertIntroduce">
				<input type="text" name="member_profile_contents"
					id="member_profile_contents">
			</div>


			<br> <br> <input type="submit" value="회원가입" />
			<button id="joinCancel">취소</button>


		</form>
	</div>

</body>

<script type="text/javascript">
	console.log("넘어온 type 확인 : " + ${type})
	var type = "${type}"
	$("#member_type").val(type);
	
	console.log("유효성검사 시작");
	var userPic = $("#member_profile_picture");
	var preview = $("#previewPic");
	
	userPic.on("change",function(e){
		if(userPic.val().length===0){
			$("#profillCheck").val("0");
			// 미리 보기 심기
			
			preview.attr("src","");
			preview.attr('src', "./resources/userprofileimage/upload/basicprofile.jpg");
			
			
		}else{
			$("#profillCheck").val("1");
			
			preview.attr('src', ""); // 변할 때마다 리셋
			var files = e.target.files;
			
			console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
			
			if(!files[0]["type"].match("image.*")){
				alert("확장자는 이미지 확장자만 가능함")
				return 
			}
			
			 var reader = new FileReader();
	         reader.onload = function(e) {
	        	 preview.attr('src', e.target.result);
	         }
	         reader.readAsDataURL(files[0]);
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
				}else if (!/^[A-Za-z0-9]{4,20}$/.test(id)) {   
					userCheck.empty()
					userCheck.css("color","red").text("영문,숫자 4~20 조합하셔야 합니다.")
				}else if(rest == 1){
					userCheck.empty()
					userCheck.css("color","red").text("이미 사용된 아이디입니다.")
				}else if(rest == 0){
					userCheck.empty()
					userCheck.css("color","green").text("사용가능한 아이디 입니다.")
				}	
				
		})
		.fail((rest)=>{console.log("실패 : " + rest)});
		
		
	})
	
	
	$("#member_email").on("blur", function(e){
		console.log("이메일 중복 확인 blur");
		var checkEmail = $("#checkEmail");
		var email = e.target.value;
		console.log(email);
		$.ajax({
			url:"join/useremail",
			data:"member_email="+email,
			method:"get",
			dataType:"json",
			//콜백지옥을 해결하기 위해 [es6] promise-await,async   
			// jquery 방식은 - deferred객체를 쓴다. 
		})
		.done((rest)=>{
				
				console.log("rest : " +rest);
				var checkEmail = $("#checkEmail");
				checkEmail.empty()
				var userEmail = $("#member_email");
				
				// 아이디 입력 유무 체크
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if (email == '') {
					console.log("e1")
					checkEmail.empty()
					checkEmail.css("color","red").text("필수 기재 사항입니다.")
				}else if (!regExp.test(email)) {   
					console.log("e2")
					checkEmail.empty()
					checkEmail.css("color","red").text("이메일형식으로 넣어야합니다..")
				}else if(rest == 1){
					console.log("e3")
					checkEmail.empty()
					checkEmail.css("color","red").text("이미 사용중인 이메일입니다.")
				}else if(rest == 0){
					console.log("e4")
					checkEmail.empty()
					checkEmail.css("color","green").text("사용가능한 이메일 입니다.")
				}	
		})
		.fail((rest)=>{console.log("실패 : " + rest)});
		
	})
		
		
		// 비밀번호 정규식 검사
		
		
		$("#member_password").on("blur", function(e){
			console.log("비밀번호 정규식 확인 blur1");
			var checkPWD = $("#checkPWD");
			var PWD = e.target.value;
			console.log(PWD);
					
					checkPWD.empty()
					var userPWD = $("#member_password");
					
					// 비밀번호 입력, 정규식 등등 유무
					var regExp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
					if (PWD == '') {
						console.log("e1")
						checkPWD.empty()
						checkPWD.css("color","red").text("필수 기재 사항입니다.")
					}else if (!regExp.test(PWD)) {   
						console.log("e2")
						checkPWD.empty()
						checkPWD.css("color","red").text("비밀번호는 특수문자 1개이상, 대문자 1개이상, 소문자, 숫자 조합입니다.")
					}
		})
		
		$("#member_password_check").on("blur", function(e){
			console.log("비밀번호 정규식 확인 blur2");
			var checkPWD = $("#checkPWD");
			var PWD = e.target.value;
			console.log(PWD);
					
					checkPWD.empty();
					var userCheckPWD = $("#member_password_check").val();
					var userPWD = $("#member_password").val();
					console.log("userCheckPWD : " +userCheckPWD);
					console.log("userPWD : " +userPWD);
					// 비밀번호 입력, 정규식 등등 유무
					var regExp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
					
					if (PWD == '') {
						console.log("e1")
						checkPWD.empty()
						checkPWD.css("color","red").text("필수 기재 사항입니다.")
					}else if (!regExp.test(PWD)) {   
						console.log("e2")
						checkPWD.empty()
						checkPWD.css("color","red").text("비밀번호는 특수문자 1개이상, 대문자 1개이상, 소문자, 숫자 조합입니다.")
					}else if (userCheckPWD === userPWD) {   
						console.log("e2")
						checkPWD.empty()
						checkPWD.css("color","green").text("비밀번호가 일치 합니다.")
					}else if(userCheckPWD !== userPWD){
						checkPWD.empty()
						checkPWD.css("color","red").text("비밀번호가 일치 하지 않습니다.")
					}
		});
</script>

</html>