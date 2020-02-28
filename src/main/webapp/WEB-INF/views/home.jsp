<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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



<body>
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>



<a href="login">로그인</a>
<a href="joinmember">회원가입</a>
<a href="myinfo">나의정보</a>
<a href="serviceinfo">회사정보</a>
<a href="houseRegister">집등록</a>
<a href="foodshopRegister">음식점등록</a>
<a href="adminmenu">관리자 메뉴</a>
<div>
	<a href="housechoice">숙박</a>
	<a href="foodmain">맛집</a>
</div>

<div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>


</body>
</html>
