<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#main {
	text-align: center;
	padding: 20px;
}

#content {
	border: 1px solid black;
	
	display: inline-flex;
}

#traveType{
	border: 1px solid black;
	margin : 20px;
}

#serviceType{
	border: 1px solid black;
	margin : 20px;
}

#travelContent{
	border: 1px solid black;
	margin : 50px 50px 5px 50px;
	padding : 10px;
}

#serviceContent{
	border: 1px solid black;
	margin : 50px 50px 5px 50px;
	padding : 10px;
}

</style>
</head>

<body>
	<h1>회원가입</h1>

	<div id="main">
		<div>*원하시는 Type에 사진을 클릭해주세요. </div>
		<div id="content">
			
			<div id="traveType">
				<div id="travelContent">
					<img src="./resources/userprofileimage/traveltype.jpg" width="300px" height="300px">
					<div>여행객</div>
				</div>
				<div>GABOM에서 제공하는 여행계획, 숙박예약, </div>
				<div>음식점예약, SNS 등 여러 서비스를 사용할 수 있습니다.</div>
				
			</div>

			<div id="serviceType">
				<div id="serviceContent">
					<img src="./resources/userprofileimage/servicetypefood.jpg" width="300px" height="300px">
					<div>서비스업체</div>
				</div>
				<div>GABOM의 여행자에게 서비스를 제공할 수 있습니다.</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$("#travelContent").on("click",function(){
		console.log("여행자")
		location.href="joinmember?member_type=1"
	})

	$("#serviceContent").on("click",function(){
		console.log("서비스업체")
		location.href="joinmember?member_type=2"
	//	location.href=""
		
	})
	
</script>
</html>