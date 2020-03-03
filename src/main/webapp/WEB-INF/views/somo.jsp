<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	
	<form action="houseregisterupload?${_csrf.parameterName}=${_csrf.token}" method="post"
			enctype="multipart/form-data" >
		
			<div>
				<h4>메인사진</h4>
				<input id="mainImage" type="file" name=""><br> 
				<img id="image_section" width="40%" height="300px" src="" alt="메인이미지" />
			</div>
			<div id="infofrm">
				<div id="adress">
				<h5>지역</h5>
					<input id="" type="text" name="">
				</div>
			
				<div id="add_adress">
				<h5>상세주소</h5>
					 <input id="" type="text" name="">
				</div>
			
				<div id="">
					<h5>타이틀</h5>
					 <input id="" type="text" name="">
				</div>
			
				<div id="">
					<h5>타이틀</h5>
					<input id="" type="text" name="">
				</div>
			
				<div id="">
					<h5>타이틀</h5>
					<input id="" type="text" name="">
				</div>
			
				<div id="">
					<h5>타이틀</h5>
					<input id="" type="text" name="">
				</div>
				<button id="commit" type="submit">신청완료</button>
			</div>
	</form>

</body>

<script>
$("#image_section").hide();

	$("#mainImage").change(function(e){
		$("#image_section").show();

		$('#image_section').attr('src', ""); // 변할 때마다 리셋
		var files = e.target.files;
	
		console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
	
		if(!files[0]["type"].match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 
	}
	
	 	var reader = new FileReader();
     	reader.onload = function(e) {
         	$('#image_section').attr('src', e.target.result);
    	 }
     	reader.readAsDataURL(files[0]);
})



</script>
</html>