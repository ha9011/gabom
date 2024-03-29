<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <meta name="_csrf" content="${_csrf.token}"/> --%>
<%-- <meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
#idContainer {
	color: #585858;
	background-image: url(resources/searchuserinfo/al.jpg);
	background-size: cover;
	height: 600px;
}

#passwordContainer {
	text-shadow: black 0em 0em 0em;
	color: #585858;
	background-image: url(resources/searchuserinfo/lan.jpg);
	background-size: cover;
	height: 600px;
}

#idTitle {
	font-size: 23px;
	font-weight: bold;
	color:#58ACFA; 
}

#idEmail {
	font-size: 15px;
	font-weight: bold;
}

#member_email, #member_password_id, #member_password_email {
	height: 40px;
	border-radius: 30px;
	color: #585858;
	font-weight: bold;
}

#searchId, #searchpassword {
	height: 40px;
	font-size: 20px;
	text-shadow: black 0em 0em 0em;
	border-radius: 10px;
	font-weight: bold;
}

#alertBox, #alertBoxPassword {
	font-weight: bold;
	font-size: 13px;
	text-shadow: black 0em 0em 0em;
}

#idContainer, #passwordContainer {
	display: none;
}
.jumbotron{
		color: #585858;
		width: 430px;
		height: 500px;
		margin: 0 auto;
		margin-top: 40px;
		font-family: 'Jua' ;
		}
		*:focus {outline:none;}
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>
	<div class="container-fluid" id="idContainer">
			<div class="jumbotron">
			<div class="col-md-12" id="idTitle">아이디 찾기/<a href="searchuserpassword" style="color:#585858;">비밀번호 찾기</a></div>
			<br /> <br /> <br /> <br /> <br /> <br />
			<form action="senduserid" method="post" onsubmit="return checkBox(1)"
				name="idform">
				<div class="col-md-12" id="idEmail">이메일</div>
				<br /> <br />
				<div>
					<input type="text" class="col-md-12 col-sm-12 col-xs-12"
						id="member_email" name="member_email">
				</div>
				<br /> <br /> <br /> <br />
				<div id="alertBox"></div>
				<br /><br/> <br /> <br /> <br />
				<div>
					<input type="submit" class="btn-info col-md-12 col-xs-12 col-sm-12"
						value="아이디 찾기" id="searchId">
					<!-- formaction="senduserid" -->
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <br /> <br />
			</form>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			</div>
	</div>
	<div class="container-fluid" id="passwordContainer">
			<div class="jumbotron">
			<form action="senduserpassword" method="post"
				onsubmit="return checkBox(2)">
				<div class="col-md-12" id="idTitle">비밀번호 찾기/<a href="searchuserid" style="color:#585858;">아이디 찾기</a></div>
				<br /> <br /> <br />
				<div class="col-md-12" id="idEmail">E-mail</div>
				<div>
					<input type="text" class="col-md-12 col-sm-12 col-xs-12"
						id="member_password_email" name="member_email">
				</div><br/><br/><br/><br/><br/>
				<div class="col-md-12" id="idEmail">ID</div>
				<br/>
				<div>
					<input type="text" class="col-md-12 col-sm-12 col-xs-12"
						id="member_password_id" name="member_id">
				</div>
				<br /> 
				<br /> 
				<br/>
				<br/>
				<div id="alertBoxPassword"></div>
				<br /> 
				<br />
				<br/>
				<div>
					<input type="submit" class="btn-info col-md-12 col-xs-12 col-sm-12"
						value="패스워드 찾기" id="searchpassword">
				</div>
				<br /> <br /> <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</form>
			<br /> <br />
			</div>
	</div>
	<script type="text/javascript">
	
	function checkBox(number){
		if(number==1){
		let checkClass=$('#alertBox').prop("class");
		if(checkClass=="alert alert-success glyphicon glyphicon-ok col-md-12 col-sm-12 col-xs-12"){
			return true;
		}else{
			alert("올바른 정보를 입력해 주세요.");
			return false;
		}
		}else if(number==2){
			let checkClassPassword=$('#alertBoxPassword').prop("class");
			if(checkClassPassword=="alert alert-success glyphicon glyphicon-ok col-md-12 col-sm-12 col-xs-12"){
				return true;
			}else{
				alert("올바른 정보를 입력해 주세요.");
				return false;
			}
			
			
		}
	}
	let type='${type}';
	if(type=='id'){
		$("#idContainer").fadeIn('slow');
		//$("#idContainer").css("display","block");
		$("#passwordContainer").css("display","none");
	}else if(type=='password'){
		$("#passwordContainer").fadeIn('slow');
		//$("#passwordContainer").css("display","block");
		$("#idContainer").css("display","none");
	}
	//type이 아이디일경우 id div 비밀번호일경우 비밀번호 div
	//class="alert alert-success" role="alert" id="alertBox"
	if(type=='id'){
	$('#member_email').on('blur',function(){
		if(checkEmail()==true){
			ajaxEmail();//서버와 비동기 동기
		}
	});//email end
	} //type id End
	function checkEmail() {
		let MemberEmail= $('#member_email').val();
		let patten= /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
		if(MemberEmail.length==0){
			return $('#alertBox').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
									.attr('role','alert').text('필수 입력입니다.')
		}else if (!patten.test(MemberEmail)) {
			return $('#alertBox').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text('이메일 형식 오류')
		}
		$('#alertBox').text('');
		return true;
	}
	function ajaxEmail() {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		
		let member_email=$('#member_email').val();
		
		$.ajax({
 			method:'post',
 			url:"user/id/email",
 			data:'member_email='+member_email,
 			dataType : "json",
 		}).done((data)=>{
 			console.log('data=',data);
 			if(data.message==" "){
 				//$('#alertBox').css("display","block");
 	 			$('#alertBox').attr('class','alert alert-success glyphicon glyphicon-ok col-md-12 col-sm-12 col-xs-12')
 				.attr('role','alert');
 				return
 			}else{
 				//$('#alertBox').css("display","block");
 			$('#alertBox').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text(data.message);
 			}
		}).fail((error)=>{
			console.log('error=',error);
			$('#alertBox').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text('이메일요청 오류')
		});
	}
	</script>
	<script type="text/javascript">
	console.log(type);
	if(type=='password'){
	$('#member_password_email').on('blur',function(){
		if(checkEmailPassword()==true){
			$('#member_password_id').on('blur',function(){
				$('#alertBoxPassword').css("display", "block");
			ajaxMatchIdEmail();//서버와 비동기
			});
		}
	});//email end
	} //
	function checkEmailPassword() {
		MemberEmailPassword= $('#member_password_email').val();
		pattenPassword= /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
		if(MemberEmailPassword.length==0){
			$('#alertBoxPassword').empty();
			return $('#alertBoxPassword').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
									.attr('role','alert').text('필수 입력입니다.')
		}else if (!pattenPassword.test(MemberEmailPassword)) {
			$('#alertBoxPassword').empty();
			return $('#alertBoxPassword').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text('이메일 형식 오류');
		}
		$('#alertBoxPassword').empty();
		$('#alertBoxPassword').css("display", "none");
		return true;
	}
	function ajaxMatchIdEmail(){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		member_email=$('#member_password_email').val();
		let member_id=$('#member_password_id').val();
		$.ajax({
 			method:'post',
 			url:"user/password/data",
 			data:{member_email,member_id},
 			dataType : "json",
 		}).done((data)=>{
 			console.log('data=',data);
 			if(data.message==" "){
 				//$('#alertBox').css("display","block");
 				$('#alertBoxPassword').empty();
 	 			$('#alertBoxPassword').attr('class','alert alert-success glyphicon glyphicon-ok col-md-12 col-sm-12 col-xs-12')
 				.attr('role','alert');
 				return
 			}else{
 				//$('#alertBox').css("display","block");
 				$('#alertBoxPassword').empty();
 			$('#alertBoxPassword').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text(data.message);
 			}
		}).fail((error)=>{
			console.log('error=',error);
			$('#alertBoxPassword').empty();
			$('#alertBoxPassword').attr('class','alert alert-danger col-md-12 col-sm-12 col-xs-12')
			.attr('role','alert').text('요청 오류');
		});
	}
	</script>
</body>
</html>