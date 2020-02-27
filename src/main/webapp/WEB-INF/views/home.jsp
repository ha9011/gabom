<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>


<html>
<head>
	<title>Home</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<a href="login">로그인</a>
<a href="joinmember">회원가입</a>
<a href="myinfo">나의정보</a>
<a href="serviceinfo">회사정보</a>
<a href="houseRegister">집등록</a>
<a href="foodshopRegister">음식점등록</a>

<a href="adminmenu">관리자 메뉴</a>

<div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>


</body>
</html>
