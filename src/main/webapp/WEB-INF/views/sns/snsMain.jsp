<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
			margin-bottom: 20px;
			margin-top: 15px;
			
		}
		.security select{
			height: 45px;
			font-family: 'Jua' ;
			font-weight: bold;
			font-size: 17px;
			margin-bottom: 30px;
			margin-top: 15px;
		}
		.security select option{
			font-family: 'Jua' ;
			font-weight: bold;
			font-size: 17px;
		}
		#posts{
			background-color: white;
			border: 2px solid #BDBDBD;
			margin-bottom: 65px;
			height: 650px;
			margin-top: 40px;
		}
		#postsContentsBox{
			width: 100%;
			height: 270px;
			font-family: 'Jua' ;
			font-weight: bold;
			font-size: 17px;
			background-color: white;
		}
		#postHead{
			height: 60px;
		}
		#postsOptionBox{
			background-color: white;
		}
		#snsOption{
			color: #337ab7;
			margin-right: 30px;
			margin-top: 20px;
		}
		#snsOption button{
			border: 0;
			background-color: white;
		}
		.snsOptionSelector{
			padding-left: 10px;
			padding-right: 10px;
			font-weight: bold;
			font-size: 19px;
		}
		#snsTimeLinefilter{
			font-family: 'Jua' ;
			font-size: 19px;
			font-weight: bold;
			background-color: white;
		}
		#postsPhotoBox{
			float: none;
		display: flex;
		margin-top: 0;
		}
		#postHead{
		font-family: 'Jua' ;
			font-size: 18px;
			font-weight: bold;
		}
		#postHead option{
			font-family: 'Jua' ;
			font-size: 18px;
			font-weight: bold;
		}
		#postHead a{
			margin-left: 5px;
		}
		#postsContentsBox textarea{
			resize: none;
			font-size: 18px;
			border: 0;
			
		}
		#snsMember_id{
			font-family: 'Jua';
			font-weight: bold;
			font-size: 19px;
			margin-top: 15px;
			padding-top: 12px;
		}
		#snsComment{
			font-family: 'Jua';
			font-weight: bold;
			font-size: 19px;
		}
		#snsCommentBox{
			margin: 0 auto;
			float: none;
			text-align: center;
			background-color: #F2F2F2;
			border-radius: 20px;
			border: 2px solid #BDBDBD;
		}
		#cancel{
		background-color:white;
			font-family: 'Jua';
			font-weight: bold;
			width: 90px;
		 }
		 #writeBox{
		 background-color: #F2F2F2;
		 border-radius: 20px;
		 margin-top: 15px;
		 }
		 #snsImageContainer{
		 height: 150px;
		 }
</style>

<script type="text/javascript">

//페이지 불러올때 ajax
$(function () {
	$('body').fadeIn();
	getProflie();
	
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'get',
			url:"sns/timeline",
			dataType : "json"
	}).done((timeLineJson)=>{
		makeTimeLine(timeLineJson);
	});
	
});//onload End

//내글만 보기  ajax
$(function mytime() {
	
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'get',
			url:"sns/mytimeline",
			dataType : "json"
	}).done((timeLineJson)=>{
		console.log("타임라인 통신 성공")
		//makeTimeLine(timeLineJson);
	});
	
	
});//내글만보기  End

//친구글 같이 보기  ajax
$(function friendtime() {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'get',
			url:"sns/friendtimeline",
			dataType : "json"
	}).done((timeLineJson)=>{
		console.log("타임라인 통신 성공")
		//makeTimeLine(timeLineJson);
	});
	
	
});//친구글만 보기  End

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
		<img src="" class="img-responsive img-thumbnail">
		</div>
		<br/>
		<div class="snsProfile">
 <ul class="nav nav-pills nav-stacked">
 	<li><div id="snsProfileName"></div></li>
  <li role="presentation" id="snsProfileNotice"><a href="#;">알람</a></li>
  <li role="presentation" id="snsProfileInfo"><a href="#">정보수정</a></li>
  <li role="presentation" id="snsFriendList"><a href="#">내친구</a></li>
  <li role="presentation" id="snsProfileMyPosts"><a href="#">내글</a></li>
</ul>
<ul class="nav nav-pills nav-stacked">
 	<li role="presentation" class="active" id="snsWirte"><a href="#;">글작성</a></li>
  <li role="presentation" class="active" id="timeLine"><a href="#">타임라인</a></li>
  <li role="presentation" class="active" id="socialClub"><a href="#">소모임</a></li>
  <li role="presentation" class="active" id="travelPlan"><a href="#">여행계획</a></li>
</ul>
</div>
	</aside>
	<div class="jumbotron col-xs-8 col-md-10 col-sm-8" id="snsTimeLine">
			<div class="navbar-default navbar-right" id="snsTimeLinefilter">
	  							<a href="sns/timeline">전체</a>&nbsp;/
	  							<a href="sns/friendtimeline" onclick="friendtime();">친구</a>&nbsp;/
	  							<a href="sns/mytimeline" onclick="mytime();">내글</a>
				</div><br/><br/>
				<hr/>
	<div id="writeBox" class="container"></div>
	<div class="container" id="snsTimeLineMain"></div>
	</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	$("#writeBox").on("click","#writeButton",function(){
		let str = $("#sns_posts_content").val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$("#sns_posts_content").val(str);
		if(str==""){
			alert("내용을 입력 해주세요.");
			return false;
		}
		let form=$("#writeBoxForm")[0];	
		
		var WriteData= new FormData(form);
		
		
		
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
 			method:'post',
 			url:"sns/write/insert",
 			data:WriteData,
 			dataType : "json",
 			processData: false,
            contentType: false,
		}).done((json)=>{
			makeTimeLine(json);
		});
		
		
	});
	
	
	</script>
	<!-- 호버시 아이콘 변환 스크립트 -->
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
<!-- 글쓰기칸 만드는 스크립트 -->
<script type="text/javascript">
//글쓰기칸 만드는 작업
	$("#snsWirte").click(function (){
		makewriteBox();
	$(".filebox label").hover(function () {
		$(".filebox label").html('<i class="fas fa-plus fa-2x"></i>');
	},function(){
		$(".filebox label").html('<i class="fas fa-image fa-2x"></i>');
	});
	});
	//글쓰기칸 만드는 함수
	function makewriteBox() {
		let photo="";
		photo+='<form name="writeBoxForm" method="post" enctype="multipart/form-data" id="writeBoxForm">';
		photo+='<div class="row">';
		photo+='<img src='+jsonPicture+' class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage" id="writeProfileImage">';
		photo+='<div class="container col-xs-4 col-md-2 col-sm-4 pull-right security">';
		photo+='<select class="form-control" id="security" name="security">';
		photo+='<option>전체 공개</option>';
		photo+='<option>나만 보기</option>';
		photo+='<option>친구 공개</option>';
		photo+='</select>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div class="input-group" id="writeContents">';
		photo+='<textarea class="form-control" aria-describedby="basic-addon1" rows="7" cols="185" placeholder="무슨 생각을 하고 계신가요?" id="sns_posts_content" name="sns_posts_content"></textarea>';
		photo+='</div>';
		photo+='<div class="row">';
		photo+='<div class="filebox col-xs-4 col-md-2 col-sm-4">';
		photo+='<label for="ex_file"><i class="fas fa-image fa-2x"></i></label>';
		photo+='<input type="file" id="ex_file" multiple="multiple" accept="image/jpeg, image/png, image/gif, image/jpg" name="snsWriteImage">';
		photo+='</div>';
		photo+='<div class="col-xs-8 col-md-10 col-sm-8" id="writeButtonBox" >';
		photo+='<button class="btn btn-Default pull-right" id="cancel">취소</button>';
		photo+='<button type="button" class="btn btn-info pull-right" id="writeButton">작성</button>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div id="coverBox">';
		photo+='</div>';
		photo+='</form>';
		$("#writeBox").html(photo);	
	}
	
	
</script>
<!-- 이미지 미리보기 스크립트 -->
<script type="text/javascript">
function readURL(input) {
    if (input.files.length!=0 && input.files!=undefined) {
    for(let i=0;i<input.files.length;i++){	
		let $coverBox=$("<div class='cover'>");
		let $imageBox=$('<img class="img-thumbnail img-responsive">');
		$imageBox.appendTo($coverBox);
    var reader = new FileReader();
    reader.onload = function (e) {
            $imageBox.attr('src', e.target.result);        //cover src로 붙여지고
        }
      reader.readAsDataURL(input.files[i]);
		$coverBox.appendTo($("#coverBox"));
    }
    }
}
$("#writeBox").on('change','#ex_file',function(){
    readURL(this);
});	


</script>
<!-- 타임라인 생성 스크립트 -->
<script type="text/javascript">
	//타임 라인 생성 함수
	function makeTimeLine(timeLineJson) {
		console.log(timeLineJson);
		$("#snsTimeLineMain").empty();
		
		var idx = 0;
		 for(let j in timeLineJson.write){
			 var i=j.substr(9);
			let postsContents = timeLineJson["write"]["writeList"+idx][0]["sns_posts_content"];
	 		let RePostsContents=postsContents.replace("<br/>", "\r\n");
		let $timeLine = "";
		$timeLine += '<div class="jumbotron" id="posts">';
		$timeLine += '<div class="row">';
		$timeLine += '<img src="resources/snsImage/sns7.jpg" class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage" id="timeLineProfile">';
		$timeLine += '<div id="snsMember_id">'+timeLineJson["write"]["writeList"+idx][0]["sns_posts_writer"]+' 님의 글</div>';
		$timeLine += '<input type="hidden" value='+timeLineJson["write"]["writeList"+idx][0]["sns_posts_number"]+' id="posts_number">';
		$timeLine += '</div>';
		$timeLine += '<div class="nav-tabs" id="postHead">';
		if(userId==timeLineJson["write"]["writeList"+idx][0]["sns_posts_writer"]){
		$timeLine += '<a href="#;">수정</a>&nbsp;/';
		$timeLine += '<a href="#;">삭제</a>&nbsp;/';
		}
		$timeLine += '<a href="#;">신고</a>';
		if(userId==timeLineJson["write"]["writeList"+idx][0]["sns_posts_writer"]){
		$timeLine += '<div class="container col-xs-5 col-md-3 col-sm-5 pull-right">';
		$timeLine += '<select class="form-control" name="">';
		if(timeLineJson["write"]["writeList"+idx][0]["sns_posts_authority"]==0){
		$timeLine += '<option>전체 공개</option>';
		$timeLine += '<option>나만 보기</option>';
		$timeLine += '<option>친구 공개</option>';
		}else if(timeLineJson["write"]["writeList"+idx][0]["sns_posts_authority"]==1){
			$timeLine += '<option>친구 공개</option>';
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>전체 공개</option>';
		}else if(timeLineJson["write"]["writeList"+idx][0]["sns_posts_authority"]==2){
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>전체 공개</option>';
		}
		$timeLine += '</select>';
		$timeLine += '</div>';
		}
		$timeLine += '</div>';
		$timeLine += '<div class="container" id="postsContentsBox">';
		$timeLine += '<textarea class="container" cols="93" rows="8" readonly>'+RePostsContents+'</textarea>';
		$timeLine += '<div class="container" id="postsPhotoBox">';
		$timeLine += '</div>';
		$timeLine += '<div id="postsOptionBox" class="navbar-default navbar-right">';
		$timeLine += '<div id="snsOption">';
		$timeLine += '<button type="button"><i class="fas fa-share snsOptionSelector"></i> </button>';
		$timeLine += '<button type="button"><i class="far fa-thumbs-up snsOptionSelector" id="snsLike"></i></button>';
		$timeLine += '<button type="button"><i class="far fa-thumbs-down snsOptionSelector" id="snsHate"></i></button></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$timeLine += '<div class="container" id="snsImageContainer">';
		
		$timeLine += '</div>';
		$timeLine += '<div class="container">';
		$timeLine += '<div class="navbar-default" id="snsCommentBox"><a href="#;" id="snsComment">댓글 보기</a></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$('#snsTimeLineMain').append($timeLine);
		let $snsPostsImageBox=$("<div class='cover'>");
		let $postsimageBox=$('<img class="img-thumbnail img-responsive">');
		
		
		
		//$postsimageBox.attr("src",);
		idx++;
		 } 
		 idx=0;
	}
</script>
<!-- 글작성 취소 스크립트 -->
<script type="text/javascript">
$("div").on("click","#cancel",function(){
	if(confirm("입력하신 내용을 잃습니다. 취소 하시겠습니까?")){
		$("#writeBox").empty();
	}else{
		return false;
	}
	
});

</script>
<!-- 페이지 로딩시 해당 회원 정보 출력 스크립트 -->
<script type="text/javascript">
// 페이지 로딩시 해당 회원에 정보를 가져온다.
	function getProflie(){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
 			method:'get',
 			url:"sns/profile",
 			dataType : "json"
		}).done((json)=>{
			setProfile(json);
		});
	}
//페이지 프로필파일과 이름을 출력 해주는 함수
function setProfile(json) {
	$("#snsProfileImg img").attr("src",json.member_profile_picture);
	$("#snsProfileName").html(json.member_name+"님");
	userId=json.member_id;
	console.log(userId);
	jsonPicture=json.member_profile_picture;	
}

{
	
}


</script>
<script type="text/javascript">


</script>
</body>
</html>