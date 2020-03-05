<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
/* #showImage{
/* background-image: url(resources/snsImage/sns3.jpg);*/
/* z-index: 100;
width: 100%;
height: 700px;
} */

#snsMain{
	 background-image: url(resources/snsImage/bg2.jpg);
	background-size: cover;
}
#snsProfileImg img{
		float: none;
 		margin: 0 auto;
  		width: 100%;
		height: 100%;
			margin-top: 70px;
			border-radius: 40px;
		}
		#snsAside{
			background-color: white;
			margin-top: 40px;
			border-top-left-radius: 20px;
		}
		#snsProfileName{
			text-align: center;
			margin-bottom: 30px;
		}
		#snsProfileNotice{
			text-align: center;
		}
		#snsProfileMyPosts{
			text-align: center;
			margin-bottom: 30px;
		}
		#snsProfileInfo{
			text-align: center;
		}
		#snsFriendList{
			text-align: center;
		}
		
		#snsTimeLine{
			background-color: white;
			margin-top: 40px;
			border-radius: 0;
			border-top-right-radius: 20px;
		}
		#writeContents textarea{
		font-family: 'Jua' ;
		font-size: 15px;
		border-radius: 20px;
		color: currentColor;
			margin-bottom: 20px;
		}
		.fileRegiBtn input[type="file"]{
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #337ab7;
  cursor: pointer;
  border: 1px solid #337ab7;
  border-radius: 15px;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}



.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
		#coverBox{
		float: none;
		display: flex;
		margin-top: 0;
		}
		#travelPlan{
		margin-bottom: 40px;
		}
		#writeButton{
			background-color: #337ab7;
			font-family: 'Jua' ;
			width: 100px;
		}
		img.myImage{
			border-radius: 50%;
			width: 90px;
			height: 50px;
			margin: 0;
			margin-bottom: 10px;
		}
		.security select{
			height: 45px;
			font-family: 'Jua' ;
			font-weight: bold;
			font-size: 17px;
			margin-bottom: 30px;
		}
		.security select option{
			font-family: 'Jua' ;
			font-weight: bold;
			font-size: 17px;
		}
</style>

<script type="text/javascript">
$(function () {
	$('body').fadeIn();
});//onload End
</script>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>
<div id="showImageBox" class="container-fluid">
</div>
<div style="position: fixed; bottom: 20px; right: 30px;">
		<a href="#snsMain">TOP</a>
	</div>
	<div class="container-fluid" id="snsMain">
	<div class="container-fluid">
	<div class="row">
	<aside class="container col-xs-4 col-md-2 col-sm-4" id="snsAside">
		<div id="snsProfileImg">
		<img src="resources/snsImage/sns7.jpg" class="img-responsive img-thumbnail">
		</div>
		<br/>
		<div class="snsProfile">
 <ul class="nav nav-pills nav-stacked">
 	<li><div id="snsProfileName">kohkss 님</div></li>
  <li role="presentation" id="snsProfileNotice"><a href="#;">알람</a></li>
  <li role="presentation" id="snsProfileInfo"><a href="#">정보수정</a></li>
  <li role="presentation" id="snsFriendList"><a href="#">내친구</a></li>
  <li role="presentation" id="snsProfileMyPosts"><a href="#">내글</a></li>
</ul>
<ul class="nav nav-pills nav-stacked">
 	<li role="presentation" class="active" id="snsWirte"><a href="#">글작성</a></li>
  <li role="presentation" class="active" id="timeLine"><a href="#">타임라인</a></li>
  <li role="presentation" class="active" id="socialClub"><a href="#">소모임</a></li>
  <li role="presentation" class="active" id="travelPlan"><a href="#">여행계획</a></li>
</ul>
</div>
	</aside>
	<div class="jumbotron col-xs-8 col-md-10 col-sm-8" id="snsTimeLine">
	<div id="writeBox"></div>
	</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	//호버시 아이콘 변환 스크립트
	$("#snsProfileNotice a").hover(function () {
		$("#snsProfileNotice a").html('<i class="fas fa-bell"></i>');
	},function(){
		$("#snsProfileNotice a").html('알람');
	});
	$("#snsProfileInfo a").hover(function () {
		$("#snsProfileInfo a").html('<i class="fas fa-tools"></i>');
	},function(){
		$("#snsProfileInfo a").html('정보수정');
	});
	$("#snsProfileMyPosts a").hover(function () {
		$("#snsProfileMyPosts a").html('<i class="fas fa-user-edit"></i>');
	},function(){
		$("#snsProfileMyPosts a").html('내글');
	});
	$("#snsFriendList a").hover(function () {
		$("#snsFriendList a").html('<i class="fas fa-user-friends"></i>');
	},function(){
		$("#snsFriendList a").html('내친구');
	});
	//어사이드 글작성부터
	$("#snsWirte a").hover(function () {
		$("#snsWirte a").html('<i class="fas fa-edit"></i>');
	},function(){
		$("#snsWirte a").html('글작성');
	});
	
	$("#timeLine a").hover(function () {
		$("#timeLine a").html('<i class="far fa-clock"></i>');
	},function(){
		$("#timeLine a").html('타임라인');
	});
	
	$("#socialClub a").hover(function () {
		$("#socialClub a").html('<i class="fas fa-users"></i>');
	},function(){
		$("#socialClub a").html('소모임');
	});
	$("#travelPlan a").hover(function () {
		$("#travelPlan a").html('<i class="fas fa-map-marked-alt"></i>');
	},function(){
		$("#travelPlan a").html('여행계획');
	});
	</script>
<script type="text/javascript">
//글쓰기칸 만드는 작업
	$("#snsWirte").click(function (){
		let photo="";
		photo+='<div class="row">';
		photo+='<img src="resources/snsImage/sns7.jpg" class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage">';
		photo+='<div class="container col-xs-4 col-md-2 col-sm-4 pull-right security">';
		photo+='<select class="form-control">';
		photo+='<option>전체 공개</option>';
		photo+='<option>나만 보기</option>';
		photo+='<option>친구 공개</option>';
		photo+='</select>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div class="input-group" id="writeContents">';
		photo+='<textarea class="form-control" aria-describedby="basic-addon1" rows="7" cols="185" placeholder="무슨 생각을 하고 계신가요?"></textarea>';
		photo+='</div>';
		photo+='<div class="row">';
		photo+='<div class="filebox col-xs-4 col-md-2 col-sm-4">';
		photo+='<label for="ex_file"><i class="fas fa-image fa-2x"></i></label>';
		photo+='<input type="file" id="ex_file">';
		photo+='</div>';
		photo+='<div class="col-xs-8 col-md-10 col-sm-8" >';
		photo+='<button class="btn btn-info pull-right" id="writeButton">작성</button>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div id="coverBox">';
		photo+='</div>';
		$("#writeBox").html(photo);
	$(".filebox label").hover(function () {
		$(".filebox label").html('<i class="fas fa-plus fa-2x"></i>');
	},function(){
		$(".filebox label").html('<i class="fas fa-image fa-2x"></i>');
	});
	});
</script>
<script type="text/javascript">
function readURL(input) {
	let $coverBox=$("<div class='cover'>");
	let $imageBox=$('<img class="img-thumbnail img-responsive">');
	$imageBox.appendTo($coverBox);
	console.log("버튼클릭함1");
    if (input.files && input.files[0]) {
		console.log(input.files);
    var reader = new FileReader();
    reader.onload = function (e) {
            $imageBox.attr('src', e.target.result);        //cover src로 붙여지고
        }
      reader.readAsDataURL(input.files[0]);
		$coverBox.appendTo($("#coverBox"));
    }
}
$("#writeBox").on('change','#ex_file',function(){
    readURL(this);
});	


</script>
</body>
</html>