<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>House Choice</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#house{
		display:flex;
		
}

#hotel{
		margin:100px;
		border:2px solid black;
		width:300px;
		height:300px;
		background-color:#16AEF6;
		text-align:center; 
}
#gabom_house{
		margin:100px;
		border:2px solid black;
		width:300px;
		height:300px;
		background-color:#16AEF6;
		text-align:center; 
}		

</style>

</head>
<body>

<div id="house">
	<div id="hotel">호텔</div>
	<div id="gabom_house">가봄 숙소</div>
</div>
</body>

<script>
	var hotel = document.getElementById("hotel");
	var gabom_house1 = document.getElementById("gabom_house");
	var hotelcom = "https://www.hotelscombined.co.kr/";
	var gabom_house2 ="housemain"
	
	hotel.addEventListener('click', function(e) {
	console.log("호텔로 이동");
	$(location).attr('href',hotelcom);
});
	
	gabom_house.addEventListener('click', function(e) {
		console.log("가봄숙소로 이동");
		$(location).attr('href',gabom_house2);
	});
</script>

</html>