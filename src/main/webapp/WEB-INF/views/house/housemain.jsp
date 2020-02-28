<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가봄 숙소</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="searchdetail"> <!-- housemain page에서 검색하는 것  -->
	<div id="searchbox">
			<input id="subsearch" type="text" name="house_address">
		</div>
	</form>
	
	<div id="house_list">
	</div>
</body>
<script>
var houserlist={houselist};
console.log(houserlist);
</script>
</html>