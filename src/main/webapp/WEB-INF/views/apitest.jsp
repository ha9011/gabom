<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
#headerContainer {
	margin-top: 10px;
	border-radius: 20px;
	background-color: white;
}

#header_img {
	float: none;
	margin: 0 auto;
	display: flex;
	align-items: center;
	width: 250px;
	height: 75px;
	margin-bottom: 40px;
}

#logout {
	border: 0;
	outline: 0;
	background-color: white;
	color: #337ab7;
	font-family: 'Jua';
	width: 85px;
	height: 50px;
}

#logout:hover {
	background-color: #E6E6E6
}

/* -------------------header------------------------------------------- */

</style>
</head>
<body>
	<div class="container" id="headerContainer">

		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 40px;">
			<a href="/gabom/"> <img id="header_img"
				src="resources/headerImage/logo3.png">
			</a>
		</div>
	</div>
	
<script>
	var detailcommon = ${detailcommon};
	console.log("디테일", detailcommon);
	response = JSON.parse(detailcommon);
	console.log("response", response);
</script>
</body>
</html>