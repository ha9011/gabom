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
<style type="text/css">
.jumbotron {
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
	background-image: url(resources/searchuserinfo/wood.jpg);
	background-size: cover;
}

#idTitle {
	font-size: 50px;
	font-weight: bold;
}

#idEmail {
	font-size: 30px;
	font-weight: bold;
}

#member_email {
	height: 50px;
	border-radius: 30px;
	color: black;
	font-weight: bold;
}

#searchId {
	height: 100px;
	font-size: 40px;
	text-shadow: black 0.1em 0.1em 0.1em;
	border-radius: 25px;
	font-weight: bold;
}

#alertBox {
	font-weight: bold;
	font-size: 13px;
	text-shadow: black 0em 0em 0em;
}
</style>
</head>
<body>

	<div class="container" id="idContainer">
		<div class="jumbotron">
			<div class="col-md-12" id="idTitle">아이디 찾기</div>
			<br /> <br /> <br /> <br /> <br /> <br />
			<form action="" method="post">
				<div class="col-md-12" id="idEmail">E-mail</div>
				<br /> <br /> <br /> <br /> <br /> <br />
				<div>
					<input type="text" class="col-md-12 col-sm-12 col-xs-12"
						id="member_email" name="member_email">
				</div>
				<br /> <br /> <br /> <br />
				<div class="col-md-12"></div>
				<br /> <br /> <br /> <br />
				<div id="alertBox"></div>
				<br /> <br /> <br /> <br />
				<div>
					<input type="submit" class="btn-info col-md-12 col-xs-12 col-sm-12"
						value="아이디 찾기" id="searchId" formaction="senduserid">
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<br /> <br />
			</form>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		</div>
	</div>
	<script type="text/javascript">
	let type='${type}';
	//type이 아이디일경우 id div 비밀번호일경우 비밀번호 div
	//class="alert alert-success" role="alert" id="alertBox"
	if(type=='id'){
	$('#member_email').on('blur',function(){
		if(checkEmail()==true){
			alert('성공');
			ajaxEmail();//서버와 비동기 동기
		}
	});//email end
	} //type id End
	function checkEmail() {
		let MemberEmail= $('#member_email').val();
		let patten= /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
		if(MemberEmail.length==0){
			return $('#alertBox').attr('class','alert alert-danger')
									.attr('role','alert').text('필수 입력입니다.')
		}else if (!patten.test(MemberEmail)) {
			return $('#alertBox').attr('class','alert alert-danger')
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
		}).fail((error)=>{
			console.log('error=',error);
			$('#alertBox').attr('class','alert alert-danger')
			.attr('role','alert').text('이메일이 존재하지 않습니다.')
		});
 		//연속 작업일시.then().done().fail();//ajaxend
	}
	</script>
</body>
</html>