<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가봄 숙소</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#house_list{
	display:flex;
}
#house{
	border:2px solid black;
	margin:20px; 
}
</style>

</head>
<body>
	<form action="searchhouse" method="get" > <!-- housemain page에서 검색하는 것  -->
		<div id="searchbox">
			검색창<input id="searchhouse" type="text" name="house_address">
				<button type="submit" id="searchbtn">검색</button>
		</div>
	</form>
	
	<div id="house_list">
		<c:forEach var="hlist" items="${houselist}">
			<div id="house">
				<div id="mainimg"><img class="img" name="${hlist.house_number}" style="width:200px;height:150px;" src="./resources/housemainImage/upload/${hlist.house_sysname}" alt="${hlist.house_sysname}"/></div>
				<div id="info">${hlist.house_name}<br>주소:${hlist.house_address}<br>가격:${hlist.house_price}</div>
			</div>
		</c:forEach>
	</div>
</body>
<script>
 //var houselist=${houselist};
 	//console.log(houselist);
 	 
 $(".img").on('click', function() {
	console.log("사진 클릭") 
	console.log($(this).attr("name"));
    location.href="housedetail?house_number="+$(this).attr("name");
})	 
</script>
<script>
	 
</script>
</html>