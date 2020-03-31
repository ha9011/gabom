<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<title>Gabom SNS</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.1/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="resources/fontCss/fontAni.css">
<style type="text/css">
#snsMain {
	background-image: url(resources/snsImage/cl3.jpg);
	background-size: 100%;
}

#snsProfileImg img {
	float: none;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	border-radius: 40px;
	margin-top: 20px;
}

#snsAside {
	background-color: white;
	margin-top: 40px;
	border-top-left-radius: 20px;
	position: absolute;
	top: 224px;
}

#snsProfileName {
	text-align: center;
	margin-bottom: 30px;
}

#snsProfileNotice {
	text-align: center;
}

#snsProfileMyPosts {
	text-align: center;
	margin-bottom: 30px;
}

#snsProfileInfo {
	text-align: center;
}

#snsFriendList {
	text-align: center;
}

#snsTimeLine {
	background-color: white;
	margin-top: 40px;
	border-top-right-radius: 20px;
}

#writeContents textarea {
	font-family: 'Jua';
	font-size: 15px;
	border-radius: 20px;
	color: currentColor;
	margin-bottom: 20px;
}

.fileRegiBtn input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
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

#coverBox {
	float: none;
	display: flex;
	margin-top: 0;
}

#travelPlan {
	
}

#writeButton {
	background-color: #337ab7;
	font-family: 'Jua';
	width: 100px;
	border: 0;
}

img.myImage {
	border-radius: 50%;
	width: 90px;
	height: 50px;
	margin: 0;
	margin-bottom: 20px;
	margin-top: 15px;
}

.security select {
	height: 45px;
	font-family: 'Jua';
	font-weight: bold;
	font-size: 17px;
	margin-bottom: 30px;
	margin-top: 15px;
}

.security select option {
	font-family: 'Jua';
	font-weight: bold;
	font-size: 17px;
}

#posts {
	background-color: white;
	border: 2px solid #BDBDBD;
	margin-bottom: 65px;
	margin-top: 40px;
}

#postsContentsBox {
	width: 100%;
	height: 270px;
	font-family: 'Jua';
	font-weight: bold;
	font-size: 17px;
	background-color: white;
}

#postHead {
	height: 60px;
}

#postsOptionBox {
	background-color: white;
}

#snsOption {
	color: #337ab7;
	margin-right: 30px;
	margin-top: 20px;
}

#snsOption button {
	border: 0;
	background-color: white;
}

.snsOptionSelector {
	padding-left: 10px;
	padding-right: 10px;
	font-weight: bold;
	font-size: 19px;
}

#snsTimeLinefilter {
	font-family: 'Jua';
	font-size: 19px;
	font-weight: bold;
	background-color: white;
}

#snsTimeLineFilterBox {
	background-image: url(resources/snsImage/aaxx.gif);
	background-size: 100% 470px;
	height: 150px;
}

#postsPhotoBox {
	float: none;
	display: flex;
	margin-top: 0;
}

#postHead {
	font-family: 'Jua';
	font-size: 18px;
	font-weight: bold;
}

#postHead option {
	font-family: 'Jua';
	font-size: 18px;
	font-weight: bold;
}

#postHead a {
	margin-left: 5px;
}

#postsContentsBox textarea {
	resize: none;
	font-size: 18px;
	border: 0;
}

#snsMember_id {
	font-family: 'Jua';
	font-weight: bold;
	font-size: 19px;
	margin-top: 15px;
	padding-top: 12px;
}

.snsComment {
	font-family: 'Jua';
	font-weight: bold;
	font-size: 19px;
}

#snsCommentBox {
	margin: 0 auto;
	float: none;
	text-align: center;
	background-color: #F2F2F2;
	border-radius: 20px;
	border: 2px solid #BDBDBD;
}

#cancel {
	background-color: white;
	font-family: 'Jua';
	font-weight: bold;
	width: 90px;
}

#writeBox {
	background-color: #F2F2F2;
	border-radius: 20px;
	margin-top: 15px;
	margin-bottom: 20px;
}

.snsImageContainer {
	float: none;
	display: flex;
	margin-top: 0;
}

#snsTimeLineMain {
	display: flex;
	flex-direction: column-reverse;
}

#commentImg {
	width: 50px;
	height: 45px;
	margin-right: 10px;
}

td {
	font-size: 14px;
	font-weight: bold;
	font-family: 'Jua';
}

.commentLike, .commentHate {
	color: #337ab7;
	border: 0;
}

.commentLike:hover, .commentHate:hover {
	background-color: white;
}

td a {
	cursor: pointer;
}

.commentWrite {
	font-size: 14px;
	font-family: 'Jua';
}

.commentWriteBox {
	margin-bottom: 70px;
	font-family: 'Jua';
}

.info {
	width: 250px;
	height: 20px;
	height: auto;
	position: fixed;
	left: 50%;
	margin-left: -125px;
	bottom: 100px;
	z-index: 9999;
	background-color: #337ab7;
	color: #F0F0F0;
	font-family: 'Jua';
	font-size: 15px;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
}

#more {
	text-align: center;
	background-color: #337ab7;
	color: white;
	width: 100%;
	height: 32px;
	border-radius: 8px;
}

#more a {
	color: white;
	font-family: 'Jua';
	font-size: 20px;
	font-weight: bold;
}

.commentCancelBtn {
	font-family: 'Jua';
	font-weight: bold;
	font-size: 15px;
	text-align: center;
	cursor: pointer;
	background-color: #F2F2F2;
	border-radius: 20px;
	border: 2px solid #BDBDBD;
}

.editButton, .editCancelButton {
	border: 0;
	background-color: #337ab7;
	color: white;
	border-radius: 10px;
	margin: 7px;
	width: 70px;
	height: auto;
}

.searchBar {
	display: flex;
}

#timeLineProfileBox {
	display: flex;
	font-family: 'Jua';
	font-weight: bold;
	font-size: 22px;
	text-align: center;
	background-image: url(resources/snsImage/cl4.jpg);
	background-size: cover;
	color: white;
	height: 150px;
	border-radius: 20px;
}

#timeLineProfileBox div {
	margin-top: 32px;
	cursor: pointer;
}

#timeLineProfileBox img {
	width: 170px;
	margin: 0;
	height: 150px;
	margin: 0;
}

.friendRequestBtnBox .friendRequestBtn {
	width: 200px;
	font-family: 'Jua';
	height: 40px;
	border-radius: 10px;
	color: #337ab7;
	font-weight: bold;
	font-size: 15px;
}

.friendRequestBtnBox {
	margin-top: 10px;
	align-items: center;
}

@media ( max-width :1200px) {
	.timeLineProfileBoxName {
		display: none;
	}
}

.friendReqList {
	text-align: center;
	cursor: pointer;
}

.friendReqContent {
	font-size: 18px;
}

.friendReqContent div {
	margin-top: 30px;
}

.friendReqContent button {
	width: 56px;
	margin-left: 7px;
	margin-right: 7px;
	border-radius: 15px;
}

.friendListContent div {
	margin-top: 20px;
	margin-right: 70px;
}

.friendListContent button {
	border-radius: 15px;
}

.friendList img {
	margin-left: 30px;
}

.searchData {
	margin-top: 15px;
	padding-right: 170px;
}

#friendMore {
	text-align: center;
	background-color: #337ab7;
	color: white;
	width: 100%;
	height: 32px;
	border-radius: 8px;
	display: none;
}

#friendMore a {
	color: white;
	font-family: 'Jua';
	font-size: 20px;
	font-weight: bold;
}

#myPostMore {
	text-align: center;
	background-color: #337ab7;
	color: white;
	width: 100%;
	height: 32px;
	border-radius: 8px;
	display: none;
}

#myPostMore a {
	color: white;
	font-family: 'Jua';
	font-size: 20px;
	font-weight: bold;
}

.searchTot {
	font-family: 'Jua';
	font-size: 16px;
	font-weight: bold;
}

.searchD {
	color: #337ab7;
}

.commentMore {
	font-family: 'Jua';
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 20px;
}

.commentTd {
	cursor: pointer;
}

.top {
	font-family: 'Jua';
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 30px;
}

#searchBtn {
	background-image: url(resources/snsImage/jjh.gif);
	background-size: 100%;
}

*:focus {
	outline: none;
}

#footerM {
	display: none;
}

@media ( max-width :1200px) {
	#footerM {
		display: block;
	}
	#snsAside {
		display: none;
	}
	#snsTimeLine {
		width: 100%;
		border-top-left-radius: 20px;
	}
	#more, #friendMore, #myPostMore {
		position: fixed;
		left: 0px;
		bottom: 100px;
		height: 70px;
		width: 40%;
		background-color: #337ab7;
		color: white;
		border-radius: 0;
		text-align: center;
		border-top-right-radius: 8px;
		border-top-left-radius: 10px;
		padding-top: 20px;
    	margin-left: 30%;
	}
	#more a, #friendMore a, #myPostMore a {
		font-size: 25px;
	}
	#footerM {
		display: none;
		position: fixed;
		left: 0px;
		bottom: 0px;
		height: 106px;
		width: 100%;
		background-color: #337ab7;
		color: white;
		display: flex;
		z-index: 9997;
	}
	#footerM i {
		padding-left: 50px;
		padding-right: 65px;
		padding-top: 20px;
	}
}
.emoreal {
			font-size: 20px;
			display: flex;
			margin-bottom: 50px;
			cursor: pointer;
		}
.writeEmo{
margin-right: 15px;
margin-top: 2px;
 
}
</style>
<script type="text/javascript">
	$(window).scroll(function() {
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 224) {
			scrollTop = 224;
		}
		$("#snsAside").stop();
		$("#snsAside").animate({
			"top" : scrollTop
		});
	});
	//페이지 불러올때 ajax
	$(function() {
		$('body').fadeIn();
		getProflie();
		setTimeLine();
	});//onload End
</script>
</head>
<body>
	<header id="header">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
	</header>
	<div id="showImageBox" class="container-fluid"></div>
	<div class="container-fluid" id="snsMain">
		<div class="container-fluid">
			<div class="row">
				<aside class="container col-xs-3 col-md-2 col-sm-3" id="snsAside">
					<div id="snsProfileImg">
						<a href="#timeLineProfileBoxTot"><img src=""
							class="img-responsive img-thumbnail" onclick="asideRead()"></a>
					</div>
					<br />
					<div class="snsProfile">
						<ul class="nav nav-pills nav-stacked">
							<li><div id="snsProfileName"></div></li>
							<!-- <li role="presentation" id="snsProfileNotice" onclick="notice()"><a
								href="#;">알람</a></li> -->
							<li role="presentation" id="snsProfileInfo"><a href="myinfo">정보수정</a></li>
							<li role="presentation" id="snsFriendList"><a href="#">내친구&nbsp;
									<i class="fas fa-star faa-tada animated" style="color: gold"></i>
							</a></li>
							<!-- <li role="presentation" id="snsProfileMyPosts"><a href="#">내글</a></li> -->
						</ul>
						<ul class="nav nav-pills nav-stacked">
							<li role="presentation" class="active" id="snsWirte"><a
								href="#writeBox">글작성</a></li>
							<li role="presentation" class="active" id="timeLine"><a
								href="#snsTimeLineMain" onclick="setTimeLine()">타임라인</a></li>
							<li role="presentation" class="active" id="travelPlan"><a
								href="myplan">여행계획</a></li>
							<li role="presentation" class="active" id="search"><a
								href="#;">검색</a></li>
							<li role="presentation" class="active top"><a href="#">TOP</a></li>
						</ul>
					</div>
				</aside>
				<div class="jumbotron col-xs-9 col-md-10 col-sm-9 pull-right"
					id="snsTimeLine">
					<div class="jumbotron" id="snsTimeLineFilterBox">
						<div class="navbar-default" id="snsTimeLinefilter">
							<div class="form-group searchBar">
								<input type="text" class="form-control serachText"
									id="searchText" placeholder="검색"
									style="font-size: 23px; text-align: center; height: 50px;">
								<button type="button" class="btn-default" id="searchBtn"
									style="width: 70px; background-color: #337ab7;">
									<i class="fas fa-search fa-2x faa-pulse animated-hover"
										style="color: white;"></i>
								</button>
							</div>
						</div>
						<br /> <br />
					</div>
					<hr />
					<div id="writeBox" class="container"></div>
					<div id="timeLineProfileBoxTot" class="container"></div>
					<div class="container" id="snsTimeLineMain"></div>
					<div id="more">
						<a href="#;">더보기</a>
					</div>
					<div id="friendMore">
						<a href="#;">더보기</a>
					</div>
					<div id="myPostMore">
						<a href="#;">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='info' style='display: none'>설정이 변경되었습니다.</div>
	<div id="footerM" class="container">
		<div onclick="setTimeLineM()">
			<i class="fas fa-home fa-5x"></i>
		</div>
		<div onclick="makewriteBoxM()">
			<i class="fas fa-edit fa-5x"></i>
		</div>
		<div onclick="location.href='#snsTimeLine;'">
			<i class="fas fa-search fa-5x"></i>
		</div>
		<div onclick="makeFriendListM()">
			<i class="fas fa-star faa-tada animated fa-5x" style="color: gold"></i>
		</div>
		<div onclick="asideRead()">
			<i class="fas fa-user fa-5x"></i>
		</div>
		<div onclick="location.href='#';">
			<i class="fas fa-arrow-circle-up fa-5x faa-float animated "></i>
		</div>
	</div>
	<!-- 이모티콘 -->
	<script type="text/javascript">
	var emotype=undefined;
	function emogi(number,type) {
		emotype=type;
		var cVal="."+number+" .emoBox";
		var make='';
		make+='';
		make+='<div class="container emoreal">';
		make+='<div class="emoRow">';
		make+='	<div>😀</div>';
		make+='	<div>😁</div>';
		make+='	<div>😂</div>';
		make+='	<div>😎</div>';
		make+='	<div>😘</div>';
		make+='</div>';
		make+='<div class="emoRow">';
		make+='	<div>😱</div>';
		make+='	<div>💩</div>';
		make+='	<div>❤️</div>';
		make+='	<div>💛</div>';
		make+='	<div>🙏</div>';
		make+='</div>';
		make+='<div class="emoRow">';
		make+='<div>💜</div>';
		make+='	<div>💓</div>';
		make+='	<div>🐸</div>';
		make+='	<div>🐵</div>';
		make+='	<div>🙈</div>';
		make+='</div>'; 
		make+='<div class="emoRow">';
		make+='	<div>🙉</div>';
		make+='	<div>🙊</div>';
		make+='	<div>🐒</div>';
		make+='	<div>🐔</div>';
		make+='	<div>🐧</div>';
		make+='</div>';
		make+='<div class="emoRow">';
		make+='	<div>🐦</div>';
		make+='	<div>🐤</div>';
		make+='	<div>🐣</div>';
		make+='	<div>👍</div>';
		make+='	<div>😶</div>';
		make+='</div>';
		make+='<div class="emoRow">';
		make+='	<div>🙄</div>';
		make+='	<div>😏</div>';
		make+='	<div>😣</div>';
		make+='	<div>😥</div>';
		make+='	<div>😮</div>';
		make+='</div>';
		make+='<div class="emoRow">';
		make+='<div>😯</div>';
		make+='	<div>😫</div>';
		make+='	<div>😌</div>';
		make+='	</div>';
		make+='</div>';
		if(emotype=="comment"){
		$(cVal).html(make);
		$(".emoBox").hide();
		$(".emoBox").slideDown();
		}else if(emotype=="write"){
			$("#writeBoxEmo").html(make);
			$("#writeBoxEmo").hide();
			$("#writeBoxEmo").slideDown();
		}
		console.log(emotype);
		$('.emoreal .emoRow div').click(function (e) {
			if(emotype=="comment"){
			var commentWriteContents="#commentWriteBox"+number+" input";
			$(commentWriteContents)[0].value=
				$(commentWriteContents)[0].value+e.target.innerHTML;
			}else if(emotype=="write"){
				let writBoxContent="#writeContents textarea";
				$(writBoxContent).val($(writBoxContent).val()+e.target.innerHTML);
			}
		});
	}
	</script>
	<!-- 모바일 글쓰기 버튼 -->
	<script type="text/javascript">
	function makewriteBoxM() {
		makewriteBox();
		location.href="#writeBox";
	}
	</script>
	<!-- 모바일 타임라인 홈 -->
	<script type="text/javascript">
	function setTimeLineM(){
		setTimeLine();
		$("#more").css("display","block");
		$("#friendMore").css("display","none");
		$("#myPostMore").css("display","none");
		$("#timeLineProfileBoxTot").empty();
		location.href="#showImageBox";
	}
	</script>
	<!-- 댓글 신고 -->
	<script type="text/javascript">
	function commentReport(commentNumber) {
			$.ajaxSetup({
				beforeSend : function(xhr){
	 			xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/comment/report",
					data:{"commentNumber":commentNumber},
					dataType : "json"
			}).done((json)=>{
				$('.info').text(json.message).css("background-color","red").fadeIn(300).delay(800)
				.fadeOut(300,function(){
				$('.info').css("background-color","#337ab7");
				});
			});			
		}
	</script>
	<!-- 글신고 -->
	<script type="text/javascript">
	function reportPost(postNumber) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/post/report",
				data:{"postNumber":postNumber},
				dataType : "json"
		}).done((json)=>{
			$('.info').text(json.message).css("background-color","red").fadeIn(300).delay(800)
			.fadeOut(300,function(){
			$('.info').css("background-color","#337ab7");
			});
		});			
	}
	</script>
	<!-- 모바일 친구 리스트 -->
	<script type="text/javascript">
	function makeFriendListM() {
		friendList(userId);	
		makeTimeLineProfile(userId);
	}
	</script>
	<!-- 검색 클릭시 검색 텍스트바 포커스 -->
	<script type="text/javascript">
		$("#search").click(function() {
			$("#searchText").focus();
		});
	</script>
	<!-- 토큰 전역 설정 -->
	<script type="text/javascript">
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
	</script>
	<!-- 검색 결과 ENTER 1 -->
	<script type="text/javascript" src="resources/snsJS/enterSearch.js"></script>
	<!-- 어사이드 내친구1 -->
	<script type="text/javascript" src="resources/snsJS/asideMyFriend.js"></script>
	<!-- 검색 결과 내 친구 해제1 -->
	<script type="text/javascript"
		src="resources/snsJS/searchInFriendCancel.js?ver=2"></script>
	<!-- 검색 결과 내 친구 요청 취소1 -->
	<script type="text/javascript"
		src="resources/snsJS/searchInFriendReqCancel.js"></script>
	<!-- 검색결과 내 친구 요청1 -->
	<script type="text/javascript"
		src="resources/snsJS/searchInfriendReq.js"></script>
	<!-- 친구 요청 내 친구 거절1 -->
	<script type="text/javascript"
		src="resources/snsJS/friendReqInFriendCancel.js"></script>
	<!-- 타임라인 내 친구 거절 1-->
	<script type="text/javascript"
		src="resources/snsJS/timeLineFriendCancel.js"></script>
	<!-- 친구 요청 내 친구 수락1 -->
	<script type="text/javascript"
		src="resources/snsJS/friendReqInAccept.js"></script>
	<!-- 친구 목록 내  친구 해제1 -->
	<script type="text/javascript"
		src="resources/snsJS/friendListInCancel.js"></script>
	<!-- 이미지 크게 1 -->
	<script type="text/javascript" src="resources/snsJS/resizeImg.js?ver=3"></script>
	<!-- 게시글 검색 결과 눌렀을때 1 -->
	<script type="text/javascript" src="resources/snsJS/postSelect.js"></script>
	<!-- 친구 목록 출력 1 -->
	<script type="text/javascript" src="resources/snsJS/makeFriendList.js"></script>
	<!-- 친구 리스트 ajax 1-->
	<script type="text/javascript" src="resources/snsJS/friendList.js"></script>
	<!-- 친구 수락 1-->
	<script type="text/javascript" src="resources/snsJS/friendAccept.js"></script>
	<!-- 친구 요청 목록 출력 1-->
	<script type="text/javascript" src="resources/snsJS/friendReqPrint.js"></script>
	<!-- 친구 요청 목록1 -->
	<script type="text/javascript" src="resources/snsJS/friendReqList.js"></script>
	<!-- 친구 요청 취소1 -->
	<script type="text/javascript" src="resources/snsJS/friendReqCancel.js"></script>
	<!-- 친구 요청1 -->
	<script type="text/javascript" src="resources/snsJS/friendReq.js"></script>
	<!-- 친구 해제1 -->
	<script type="text/javascript" src="resources/snsJS/friendCancel.js"></script>
	<!-- 다른사람 글 보기1 -->
	<script type="text/javascript" src="resources/snsJS/userPost.js"></script>
	<!-- 타임라인내 프로필1 -->
	<script type="text/javascript"
		src="resources/snsJS/timeLineInProfile.js?ver=1"></script>
	<!-- 어사이드 유저 이름 클릭1 -->
	<script type="text/javascript" src="resources/snsJS/asidePost.js"></script>
	<!-- 댓글삭제 1-->
	<script type="text/javascript" src="resources/snsJS/commentDel.js"></script>
	<!-- 댓글 수정1 -->
	<script type="text/javascript" src="resources/snsJS/commentEdit.js"></script>
	<!-- 검색 서비스 1-->
	<script type="text/javascript" src="resources/snsJS/search.js"></script>
	<!-- 검색 결과 출력 1-->
	<script type="text/javascript"
		src="resources/snsJS/searchPrint.js?ver=1"></script>
	<!-- 검색 클릭 이벤트1 -->
	<script type="text/javascript" src="resources/snsJS/searchClick.js"></script>
	<!-- 글삭제 1-->
	<script type="text/javascript" src="resources/snsJS/postDel.js?ver=2"></script>
	<!-- 타임라인 버튼1 -->
	<script type="text/javascript" src="resources/snsJS/timeLineBtn.js"></script>
	<!-- 댓글 입력후 출력 1-->
	<script type="text/javascript"
		src="resources/snsJS/commentInsertPrint.js"></script>
	<!-- 글 수정 스크립트1 -->
	<script type="text/javascript" src="resources/snsJS/postEdit.js"></script>
	<!-- 댓글 입력1 -->
	<script type="text/javascript" src="resources/snsJS/commentInsert.js"></script>
	<!-- 글쓰기 1-->
	<script type="text/javascript"
		src="resources/snsJS/postInsert.js?ver=3"></script>
	<!-- 호버시 아이콘 변환 스크립트1 -->
	<script type="text/javascript" src="resources/snsJS/snsHover.js?ver=1"></script>
	<!-- 글쓰기칸 만드는 스크립트1 -->
	<script type="text/javascript" src="resources/snsJS/writeBox.js?ver=5"></script>
	<!-- 이미지 미리보기 스크립트1 -->
	<script type="text/javascript" src="resources/snsJS/imgView.js"></script>
	<!-- 정보공개 변환1 -->
	<script type="text/javascript" src="resources/snsJS/postSecurity.js"></script>
	<!-- 타임라인 생성 스크립트 1-->
	<script type="text/javascript"
		src="resources/snsJS/timeLinePrint.js?ver=5"></script>
	<!-- 글작성 취소 스크립트 1-->
	<script type="text/javascript" src="resources/snsJS/postCancel.js"></script>
	<!-- 페이지 로딩시 해당 회원 정보 출력 스크립트1 -->
	<script type="text/javascript" src="resources/snsJS/asideProfile.js"></script>
	<!-- 좋아요 기능 1-->
	<script type="text/javascript" src="resources/snsJS/postLike.js"></script>
	<!-- 싫어요 기능1 -->
	<script type="text/javascript" src="resources/snsJS/postHate.js"></script>
	<!-- 더보기 기능1 -->
	<script type="text/javascript" src="resources/snsJS/postMore.js"></script>
	<!-- 타임라인 Ajax1 -->
	<script type="text/javascript" src="resources/snsJS/timeLineAjax.js"></script>
	<!-- 댓글출력 Ajax1 -->
	<script type="text/javascript"
		src="resources/snsJS/commentAjax.js?ver=2"></script>
	<!-- 댓글 출력 서비스 1-->
	<script type="text/javascript"
		src="resources/snsJS/commentPrint.js?ver=6"></script>
	<!-- 댓글 좋아요1 -->
	<script type="text/javascript" src="resources/snsJS/commentLike.js"></script>
	<!-- 댓글 싫어요 1-->
	<script type="text/javascript" src="resources/snsJS/commentHate.js"></script>
</body>
</html>