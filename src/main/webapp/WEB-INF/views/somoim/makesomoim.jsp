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
	background-color:#3abade; 
}
#frm{
 padding : 10px;
 margin-top: 50px;
}
#main{
	background-color:white;
	width : 40%; 
	margin : 100px auto;
	display: inline-block;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.7);
	border-radius:10px;
}

#btn{
 text-align: center;;
}
	:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}


/*  */


.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input{
  height: auto;
  border-radius: 2rem;
  border: 1px solid #3abade;
}
.form-label-group textarea{
  height: auto;
  border-radius: 2rem;
  border: 1px solid #3abade;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}

/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}

/*  */

h1 {
  color: #f1c40f;
  font-size: 4rem;
  text-transform: uppercase;
  display: block;
  width: 100%;
  text-align: center;
}
@media screen and (max-width: 600px) {
  h1 {
    font-size: 3rem;
  }
}

p {
  color: #f1c40f;
  font-size: 1.2rem;
  width: 100%;
  padding: 20px;
  text-align: center;
}

.btn {
  box-sizing: border-box;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  background-color: transparent;
  border: 2px solid #e74c3c;
  border-radius: 0.6em;
  color: #e74c3c;
  cursor: pointer;
  display: -webkit-box;
  display: flex;
  align-self: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  margin: 20px;
  padding: 1.2em 2.8em;
  text-decoration: none;
  text-align: center;
  text-transform: uppercase;
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
}
.btn:hover, .btn:focus {
  color: #fff;
  outline: 0;
}

.first {
  -webkit-transition: box-shadow 300ms ease-in-out, color 300ms ease-in-out;
  transition: box-shadow 300ms ease-in-out, color 300ms ease-in-out;
}
.first:hover {
  box-shadow: 0 0 40px 40px #e74c3c inset;
}

.third {
  border-color: #3498db;
  color: #fff;
  box-shadow: 0 0 40px 40px #3498db inset, 0 0 0 0 #3498db;
  -webkit-transition: all 150ms ease-in-out;
  transition: all 150ms ease-in-out;
}
.third:hover {
  box-shadow: 0 0 10px 0 #3498db inset, 0 0 10px 4px #3498db;
  color:black;
}
</style>

<body>
	<div id="main">
	<form id="frm"
		action="somoimregister?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data">

		<div class="form-label-group">
               	<img id="image_section" width="100%" height="300px" class="rounded" alt="메인이미지">
                <input type="file" id="somoim_mainpicture" class="form-control"  name="somoim_mainpicture">
                <label for="somoim_mainpicture">메인사진</label>
              </div>
              
              <div class="form-label-group">
                <input type="text" class="form-control" placeholder="지역" id="somoim_location" name="somoim_location">
                <label for="somoim_location">지역</label>
              </div>
              
              <div class="form-label-group">
                <input type="text" class="form-control" placeholder="상세주소" id="somoim-detail_location" name="somoim_detail_location">
                <label for="somoim-detail_location">상세주소</label>
              </div>
              
              <div class="form-label-group">
                <input type="text" class="form-control" placeholder="모임명" id="somoim_name" name="somoim_name">
                <label for="somoim_name">모임명</label>
              </div>
              
              <div class="form-label-group">
				  <textarea class="form-control" placeholder="모임소개" rows="5" id="somoim_introduce" name = "somoim_introduce"></textarea>
              </div>
              
              <div class="form-label-group">
                <input type="text" class="form-control" placeholder="관심사" id="somoim_interest" name="somoim_interest">
                <label for="somoim_interest">관심사</label>
              </div>
              
              <div class="form-label-group">
                <input type="number" class="form-control" placeholder="정원" id="somoim_person" name="somoim_person"  max="100">
                <label for="somoim_person">정원</label>
              </div>

              <div style="display:flex;margin: 7% 25% 0 25%;">
              	<button id="register" class="btn third" type="submit">개설하기</button>
              	<button id="cancel" class="btn first" type="button">취소</button>
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