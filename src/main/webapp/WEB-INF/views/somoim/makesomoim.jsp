<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript"
	src="/juso_support_center/js/jquery-1.8.3.min.js"></script>

<script language="javascript">

</script>
<title>Insert title here</title>
</head>
<style>

body{
	display: flex;
}
#frm{
 padding : 10px;
}
#main{
	
	width : 40%; 
	border : 2px solid aqua;
	margin : 100px auto;
	display: inline-block;
}

#btn{
 text-align: center;;
}

</style>

<body>
	<div id="main">
	<form id="frm"
		action="somoimregister?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data">

		<div>
			<h4>메인사진</h4>
			<img id="image_section" width="100%" height="300px" class="rounded" alt="메인이미지">
			<input id="somoim_mainpicture" name="somoim_mainpicture" type="file" class="form-control-file border">
			<br>
		</div>

		<div id="infofrm">

			<div class="form-group">
				<label for="location">지역 : </label> <input type="text"
					class="form-control" id="somoim_location" name="somoim_location">
			</div>
			<br>

			<div class="form-group">
				<label for="detailLocation">상세주소 : </label> <input type="text"
					class="form-control" id="somoim-detail_location" name="somoim_detail_location">
			</div>
<br>
			<div class="form-group">
				<label for="name">모임명 :</label> <input type="text"
					class="form-control" id="somoim_name" name="somoim_name">
			</div>
<br>

			<div class="form-group">
				<label for="comment">모임 소개:</label>
				<textarea class="form-control" rows="5" id="somoim_introduce" name = "somoim_introduce"></textarea>
			</div>
<br>
			<div class="form-group">
				<label for="hobby">관심사 :</label> <input type="text"
					class="form-control" id="somoim_interest" name="somoim_interest">
			</div>
<br>
			<div class="form-group">
				<label for="name">정원 :</label> <input type="number"
					class="form-control" id="somoim_person" name="somoim_person"  max="100" >
			</div>
<br>

			<div id="btn">
			<button id="register" type="submit" class="btn btn-outline-primary">개설</button>
			<button id="cancel" type="button" class="btn btn-outline-dark">취소</button>
			</div>
			<br>
		</div>
	</form>
	</div>
</body>

<script>

   $("#image_section").hide();

   $("#somoim_mainpicture").change(function(e){
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


// $("#register").on("click",function(){
// 	console.log("register");
// 	//var formdata = new FormData($("#frm"));
// 	var formData = new FormData(document.getElementById("frm"));   // 이 친구는 무조건 js로 해야한다.
	
// 	for (var value of formData.values()) {
// 		  console.log(value);
// 	}
	
	
	
// })

$("#cancel").on("click",function(){
	console.log("cancel");
	location.href="mainsomoim";
})



</script>

</html>