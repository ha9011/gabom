<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
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
	border-radius: 0;
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
	background-image: url(resources/snsImage/cl4.jpg);
	background-size: cover;
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
	background-image: url(resources/snsImage/yy.JPG);
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
	.timeLineProfileBoxPost {
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

.imgBox {
	position: fixed;
	left: 380px;
	right: 380px;
	bottom: 100px;
	z-index: 9999;
	background-color: #337ab7;
	color: #F0F0F0;
	font-family: 'Jua';
	font-size: 15px;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
	bottom: 100px;
}

.imgBox img {
	width: 100%;
	height: auto;
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
</style>
<script type="text/javascript">
$(window).scroll(function(){
	var scrollTop = $(document).scrollTop();
	if (scrollTop < 224) {
	 scrollTop = 224;
	}
	$("#snsAside").stop();
	$("#snsAside").animate( { "top" : scrollTop });
	});
//페이지 불러올때 ajax
$(function () {
	$('body').fadeIn();
	getProflie();
	setTimeLine();
	$("#searchText").focusin(function(){
		$(window).keydown(function(key) {
	        if (key.keyCode == 13) {
	        	 enterSearch();
	        }
	        });
	});
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
							<li role="presentation" id="snsFriendList"><a href="#">내친구</a></li>
							<!-- <li role="presentation" id="snsProfileMyPosts"><a href="#">내글</a></li> -->
						</ul>
						<ul class="nav nav-pills nav-stacked">
							<li role="presentation" class="active" id="snsWirte"><a
								href="#writeBox">글작성</a></li>
							<li role="presentation" class="active" id="timeLine"><a
								href="#snsTimeLineMain">타임라인</a></li>
							<li role="presentation" class="active" id="travelPlan"><a
								href="trip">여행계획</a></li>
							<li role="presentation" class="active" id="search"><a
								href="#snsTimeLineFilterBox">검색</a></li>
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
								<button type="button" class="btn btn-default" id="searchBtn"
									style="width: 70px; background-color: #337ab7;">
									<i class="fas fa-search fa-2x" style="color: white;"></i>
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
	<div class="imgBox" style="display: none"></div>
	<!-- 어사이드 내친구 -->
	<script type="text/javascript" src="resources/snsJS/asideMyFriend.js"></script>
	<!-- 검색 결과 내 친구 해제 -->
	<script type="text/javascript">
	function searchInFriendCancel(id) {
		if(confirm("친구 상태를 해제 하시겠습니까?")){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/cancel",
					data:{"friendId":id},
					dataType : "json"
			}).done((msgJson)=>{
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
				let req="#searchInFriendCancelBox"+id;
				$(req).remove();
				let str="";
				str+='<div class="searchData">';
				str+='<button type="button" class="btn btn-primary" id="searchInfriendReq'+id+'"';
				str+='onclick=searchInfriendReq(\''+id+'\')>친구신청</button>';
				str+='</div>'
				let newReq="#friendBtn"+id;
				$(newReq).html(str);
			});
			}
	}
	</script>
	<!-- 검색 결과 내 친구 요청 취소 -->
	<script type="text/javascript">
	function searchInFriendReqStatus(id) {
	if(confirm("취소 하시겠습니까?")){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
			$.ajax({
				method:'post',
				url:"sns/friend/request/cancel",
				data:{"friendId":id},
				dataType : "json"
			}).done((msgJson)=>{
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
				let req="#friendReqStatusBox"+id;
				$(req).remove();
				let str="";
				str+='<div class="searchData">';
				str+='<button type="button" class="btn btn-primary" id="searchInfriendReq'+id+'"';
				str+='onclick=searchInfriendReq(\''+id+'\')>친구신청</button>';
				str+='</div>'
				let newReq="#friendBtn"+id;
				$(newReq).html(str);
			});		
		}
	}
	</script>
	<!-- 검색결과 내 친구 요청 -->
	<script type="text/javascript">
	function searchInfriendReq(reqId) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request",
				data:{"friendId":reqId},
				dataType : "json"
		}).done((userJson)=>{
			$('.info').text(userJson.message).fadeIn(400).delay(1000).fadeOut(400);
			let req="#friendReqBox"+reqId;
			$(req).remove();
			let str="";
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary" id="friendReqStatus'+reqId+'"';
			str+='onclick="searchInFriendReqStatus(\''+reqId+'\')">요청중</button>';
			str+='</div>';
			let newReq="#friendBtn"+reqId;
			$(newReq).html(str);
		});
	}
	</script>
	<!-- 친구 요청 내 친구 거절 -->
	<script type="text/javascript">
	function friendReqInCancel(reqId) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request/refusal",
				data:{"reqId":reqId},
				dataType : "json"
		}).done((json)=>{
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
			let tr="#proInReq"+reqId;
			let td=tr+" td";
			$(tr).remove();
			let friendReqCnt=$(".timeLineProfileBoxRequest").text().substr(5);
			let friendReqCntNumber=parseInt(friendReqCnt);
			$(".timeLineProfileBoxRequest").html("친구 요청<br/><br/>"+(friendReqCntNumber-1));
		});
	}
	</script>
	<!-- 타임라인 내 친구 거절 -->
	<script type="text/javascript">
	function friendReqCancel(reqId) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request/refusal",
				data:{"reqId":reqId},
				dataType : "json"
		}).done((json)=>{
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
			makeTimeLineProfile(reqId);
		});
	}
	</script>
	<!-- 친구 요청 내 친구 수락 -->
	<script type="text/javascript">
	function friendReqInAccept(id) {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'post',
			url:"sns/friend/request/accept",
			data:{"id":id},
			dataType : "json"
	}).done((json)=>{
		$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		let tr="#proInReq"+id;
		let td=tr+" td";
		$(tr).remove();
		let friendCnt=$(".timeLineProfileBoxFriend").text().substr(2);
		let friendCntNumber=parseInt(friendCnt);
		$(".timeLineProfileBoxFriend").html('친구<br/><br/>'+(friendCntNumber+1));
		let friendReqCnt=$(".timeLineProfileBoxRequest").text().substr(5);
		let friendReqCntNumber=parseInt(friendReqCnt);
		$(".timeLineProfileBoxRequest").html("친구 요청<br/><br/>"+(friendReqCntNumber-1));
	});			
	}
	</script>
	<!-- 친구 목록 내  친구 해제 -->
	<script type="text/javascript">
		function friendListInCancel(id) {
			if(confirm("친구상태를 해제 하시겠습니까?")){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/cancel",
					data:{"friendId":id},
					dataType : "json"
			}).done((json)=>{
				$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
				let tr="#proFriendList"+id;
				let td=tr+" td";
				$(tr).remove();
				let friendCnt=$(".timeLineProfileBoxFriend").text().substr(2);
				let friendCntNumber=parseInt(friendCnt);
				$(".timeLineProfileBoxFriend").html('친구<br/><br/>'+(friendCntNumber-1));
			});			
			}
		}	
	</script>
	<!-- 이미지 크게 -->
	<script type="text/javascript">
	function resizeImg(osrc){
				let make="";
				make+='<div><img src="'+osrc+'" onclick="closeImgBox()"/></div>';
				$(".imgBox").html(make);
				$(".imgBox").fadeIn();
		}
	function closeImgBox() {
		$(".imgBox").fadeOut();
	}
	</script>
	<!-- 게시글 검색 결과 눌렀을때 -->
	<script type="text/javascript">
	function serachPost(postNumber) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/search/post",
				data:{"postNumber":postNumber},
				dataType : "json"
		}).done((json)=>{
			for(let k in json){
			makeTimeLineProfile(json[k]["posts_writer"]);
			}
			makeTimeLine(json);
		});			
	}
	</script>
	<!-- 친구 목록 출력 -->
	<script type="text/javascript">
	function makeFriendList(json) {
		location.href="#showImageBox";
		$("#more").css("display","none");
		$("#friendList").css("display","none");
		$("#myPostMore").css("display","none");
		$("#snsTimeLineMain").empty();
		let table=$("<table>").addClass("table table-hover friendList").css("margin-top","26px");
		let tbody=table.append("<tbody>");
		let make="";
		if(json.message=="친구가 없습니다."){
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		}else{
		for(let k in json){
			make+='<tr id="proFriendList'+json[k].member_id+'">';
			make+='<td onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<img src="'+json[k].member_profile_picture+'"';
			make+='class="img-thumbnail img-responsive" style="width: 70px;height: 70px;"/>';
			make+='</td>';
			make+='<td class="friendListContent" onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<div><a href="#;">'+json[k].member_id+'</a></div>';
			make+='</td>';
			make+='<td class="friendListContent">';
			make+='<div><button type="button" class="btn-default"';
			make+='onclick="friendListInCancel(\''+json[k].member_id+'\')">친구 해제</button></div>';
			make+='</tr>';
		}
		}
		tbody.append(make);
		tbody.append(table);
		table.appendTo($("#snsTimeLineMain"));
		$("#snsTimeLineMain").hide();
		$("#snsTimeLineMain").slideDown();
	}
	</script>
	<!-- 친구 리스트 ajax-->
	<script type="text/javascript">
	function friendList(id) {
		if(id==userId){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/list",
					data:{"id":userId},
					dataType : "json"
			}).done((json)=>{
				makeFriendList(json);
			});			
		}else{
			$('.info').text("본인만 이용 가능합니다.").css("background-color","red").fadeIn(400).delay(1000)
			.fadeOut(400,function(){
			$('.info').css("background-color","#337ab7");
			});
		}
	}
	</script>
	<!-- 친구 수락 -->
	<script type="text/javascript">
	function friendAccept(id) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request/accept",
				data:{"id":id},
				dataType : "json"
		}).done((json)=>{
			moveThisNamePost(id);
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		});			
	}
	</script>
	<!-- 친구 요청 목록 출력 -->
	<script type="text/javascript">
	function requestPrint(json) {
		$("#more").css("display","none");
		$("#friendList").css("display","none");
		$("#myPostMore").css("display","none");
		$("#snsTimeLineMain").empty();
		let table=$("<table>").addClass("table table-hover friendReqList").css("margin-top","26px");
		let tbody=table.append("<tbody>");
		let make="";
		if(json.message=="요청이 없습니다."){
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		}else{
		for(let k in json){
			make+='<tr class="'+k+'" id="proInReq'+json[k].member_id+'">';
			make+='<td onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<img src="'+json[k].member_profile_picture+'"';
			make+='class="img-thumbnail img-responsive" style="width: 110px;height: 100px;"/>';
			make+='</td>';
			make+='<td class="friendReqContent" onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<div><a href="#;">'+json[k].member_id+'</a></div>';
			make+='</td>';
			make+='<td class="friendReqContent">';
			make+='<div><button type="button" class="btn-default" onclick="friendReqInAccept(\''+json[k].member_id+'\',\''+k+'\')">수락</button><span>';
			make+='<button type="button" class="btn-default" onclick="friendReqInCancel(\''+json[k].member_id+'\')">거절</button></span></div>';
			make+='</tr>';
		}
		}
		tbody.append(make);
		tbody.append(table);
		table.appendTo($("#snsTimeLineMain"));
		$("#snsTimeLineMain").hide();
		$("#snsTimeLineMain").slideDown();
	}
	</script>
	<!-- 친구 요청 목록 -->
	<script type="text/javascript">
	function friendRequestTot(id) {
		if(id==userId){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/request/sum",
					data:{"id":userId},
					dataType : "json"
			}).done((json)=>{
				requestPrint(json);
			});			
		}else{
			$('.info').text("본인만 이용 가능합니다.").css("background-color","red").fadeIn(400).delay(600)
			.fadeOut(400,function(){
			$('.info').css("background-color","#337ab7");
			});
		}
	}
	</script>
	<!-- 친구 요청 취소 -->
	<script type="text/javascript">
	function friendRequestStatus(id) {
		if(confirm("취소 하시겠습니까?")){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/request/cancel",
					data:{"friendId":id},
					dataType : "json"
			}).done((msgJson)=>{
				moveThisNamePost(id);
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
			});		
		}
	}	
	</script>
	<!-- 친구 요청 -->
	<script type="text/javascript">
	function friendRequest(id){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request",
				data:{"friendId":id},
				dataType : "json"
		}).done((userJson)=>{
			$('.info').text(userJson.message).fadeIn(400).delay(1000).fadeOut(400);
			moveThisNamePost(id);
		});
	}	
	</script>
	<!-- 친구 해제 -->
	<script type="text/javascript">
	function friendCancel(friendId) {
		if(confirm("친구 상태를 해제 하시겠습니까?")){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/cancel",
				data:{"friendId":friendId},
				dataType : "json"
		}).done((msgJson)=>{
			$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
			moveThisNamePost(friendId);
		});
		}
	}
	</script>
	<!-- 다른사람 글 보기 -->
	<script type="text/javascript">
	var userPostRow=1;
	function moveThisNamePost(id) {
		if(id==userId){
			asideRead();
			return;
		}
		thisId=id;
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		let userPostData={
				"id":id,
				"row":userPostRow
		}
		$.ajax({
				method:'post',
				url:"sns/user/posts",
				data:userPostData,
				dataType : "json"
		}).done((userJson)=>{
			makeTimeLine(userJson);
			makeTimeLineProfile(id);
			$("#more").css("display","none");
			$("#myPostMore").css("display", "none");
			$("#friendMore").css("display", "block");
			for(let k in userJson){
				if(userJson[k]["max"]==userJson[k]["rowNum"]){
					userPostRow=1;
					$("#friendMore").css("display", "none");
					}
				}
			});
	}	
		$("#friendMore").click(function () {
		userPostRow++;
		moveThisNamePost(thisId);
		});
	</script>
	<!-- 타임라인내 프로필 -->
	<script type="text/javascript">
	function makeTimeLineProfile(id) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/timeline/profile",
				data:{"id":id},
				dataType : "json"
		}).done((profileJson)=>{
				make(profileJson);
		});
		function make(json) {
			let make="";
			make+='<div class="container" id="timeLineProfileBox">';
			make+='<img src="'+json.pic+'" class="img-thumbnail img-responsive" onclick=resizeImg(this.src)>';
			make+='<div class="container timeLineProfileBoxId">아이디';
				if(json.friendStatus==2&&userId!=json.id){
					make+='<i class="fas fa-star" style="color:gold"></i>';
				}
			make+='<br/><br/>'+json.id+'</div>';
			make+='<div class="container timeLineProfileBoxName">이름<br/><br/>'+json.name+'</div>';
			make+='<div class="container timeLineProfileBoxPost">게시글<br/><br/>'+json.post+'</div>';
			make+='<div class="container timeLineProfileBoxFriend" onclick="friendList(\''+json.id+'\')">친구<br/><br/>'+json.friend+'</div>';
			make+='<div class="container timeLineProfileBoxRequest" onclick=friendRequestTot(\''+json.id+'\')>';
			make+='친구 요청<br/><br/>'+json.friendRequset+'</div>';
			make+='</div>';
			if(json.reverse==1){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendReqCancel(\''+json.id+'\')">거절</button><span>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendAccept(\''+json.id+'\')">수락</button></span>';
				make+='</div>';
			}
			else if(json.friendStatus==0&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequest(\''+json.id+'\')">';
				make+='친구 신청</button></div>';
			}
			else if(json.friendStatus==1&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequestStatus(\''+json.id+'\')">';
				make+='요청중</button>';
				make+='</div>';
			}
			else if(json.friendStatus==2&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendCancel(\''+json.id+'\')">';
				make+='친구 해제</button></div>';
			}
			$("#timeLineProfileBoxTot").html(make);
			$("#timeLineProfileBoxTot").hide();
			$("#timeLineProfileBoxTot").slideDown();
		}
	}
	</script>
	<!-- 어사이드 유저 이름 클릭 -->
	<script type="text/javascript">
	var asideRow=1;
	$("#snsProfileName").on("click",function(){
		asideRead();
	});
		function asideRead() {
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/mypost",
					data:{"row":asideRow},
					dataType : "json"
			}).done((myPostJson)=>{
				makeTimeLineProfile(userId);
				makeTimeLine(myPostJson);
				$("#more").css("display","none");
				$("#friendMore").css("display", "none");
				$("#myPostMore").css("display", "block");
				for(let k in myPostJson){
					if(myPostJson[k]["max"]==myPostJson[k]["rowNum"]){
						$("#myPostMore").css("display", "none");
						asideRow=1;
					}
				}
			});
		}
		$("#myPostMore").click(function() {
			asideRow++;
			asideRead();
		});
	</script>
	<!-- 댓글삭제 -->
	<script type="text/javascript">
		function commentDel(postNum,commentNum) {
			if(confirm("삭제 하시겠습니까?")){
				$.ajaxSetup({
					beforeSend : function(xhr){
			 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
				});//먼저 보냄
				let commentDelData={
						"postNum":postNum,
						"commentNum":commentNum
				}
				$.ajax({
						method:'post',
						url:"sns/comment/delete",
						data:commentDelData,
						dataType : "json"
				}).done((commentDelJson)=>{
					let commentRowNum="#commentRowBox"+commentNum;
					$(commentRowNum).remove();
					let commentCnt="#snsComment"+postNum;
					let cnt=$(commentCnt).text();
					let cnt2=cnt.substr(6);
					let cnt3=cnt2.split(")")[0];
					let cnt4=parseInt(cnt3);
					$(commentCnt).text("댓글 보기("+(cnt4-1)+")");
				});
			}
		}	
	</script>
	<!-- 댓글 수정 -->
	<script type="text/javascript">
	function commentEdit(number,commentNumber) {
		var contentsVal="#commentContents"+commentNumber;
		var commentEditVal="#contentsVal"+commentNumber;
		let showComment=$(contentsVal).html();
		showComment=showComment.split("<br>").join("\r\n");
		var htmlString='<div id="commentEditTot">';
		htmlString+='<textarea class="form-control" aria-describedby="basic-addon1" rows="7" cols="70"'; 
		htmlString+='style="resize: none;" id="contentsVal'+commentNumber+'">'+showComment+'</textarea>';
		htmlString+='<div class="pull-right">';
		htmlString+='<button class="btn btn-default" type="button" id=commentEdit style="font-weight: bold;">수정</button>';
		htmlString+='<button class="btn btn-default" type="button" id=commentEditCancel style="font-weight: bold;">취소</button>';
		htmlString+='</div></div>';
		$(contentsVal).html(htmlString);
		$("#commentEdit").on("click",function(){
			let editcomment=$(commentEditVal).val();
				editcomment=editcomment.replace(/(?:\r\n|\r|\n)/g, '<br/>');
				commentEditAjax(editcomment);		
		});
		$("#commentEditCancel").on("click",function(){
			if(confirm("취소 하시겠습니까?")){
				$(contentsVal).text($(commentEditVal).prop("defaultValue"));
				$("#commentEditTot").empty();
			}
		});
		function commentEditAjax(data) {
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
			});//먼저 보냄
			let commentEditData={
					"data":data,
					"commentNumber":commentNumber
			}
			$.ajax({
					method:'post',
					url:"sns/comment/edit",
					data:commentEditData,
					dataType : "json"
			}).done((commentEditJson)=>{
				$(contentsVal).html(commentEditJson.content);
				$("#commentEditTot").empty();
			});
		} 
	}
	</script>
	<!-- 검색 서비스 -->
	<script type="text/javascript">
	let searchPostRow=1;
	let searchFriendRow=1;
	function search(searchData) {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
	});//먼저 보냄
	let searchTotData={
			"searchData":searchData,
			"postRow":searchPostRow,
			"friendRow":searchFriendRow
	}
	$.ajax({
			method:'post',
			url:"sns/search",
			data:searchTotData,
			dataType : "json"
	}).done((searchJson)=>{
		$("#searchText").val("");
		makeSearchList(searchJson,searchData);
		for(let k in searchJson["publicPost"]){
			if(searchJson["publicPost"][k]["max"]==searchJson["publicPost"][k]["row"]){
				$("#postMoreBtn").css("display","none");
				searchPostRow=1;
			}
		}
		for(let k in searchJson["friendList"]){
			if(searchJson["friendList"][k]["max"]==searchJson["friendList"][k]["row"]){
				$("#friendMoreBtn").css("display","none");
				searchFriendRow=1;
			}
		}
		
	});
	}
	function friendMoreBtn(data){
		searchFriendRow++;
		search(data);
	}
	function postMoreBtn(data) {
		searchPostRow++;
		search(data);
	}
	</script>
	<!-- 검색 결과 출력 -->
	<script type="text/javascript">
	function makeSearchList(json,data) {
		$("#timeLineProfileBoxTot").empty();
		$("#snsTimeLineMain").empty();
		$("#more").css("display","none");
		$("#friendMore").css("display","none");
		$("#myPostMore").css("display","none");
		let $tot=$("<div>").addClass("container searchTot");
		let $friend=$("<div>").addClass("container")
		.html("<div style='display:flex;margin-bottom:20px;'><div class=searchD>\""+data+"\"</div>에 관련된 친구 검색 결과</div>");
		let str="";
		str+='<table class="table table-hover table-responsive">';
		str+='<tbody>';
		if(json["friendList"].length==0){
		str+='<tr>';
		str+='<td style="width: 600px;">검색 결과가 없습니다.</td>';
		str+='</tr>';
		}else{
		for(let k in json["friendList"]){
		str+='<tr>';
		str+='<td>';
		str+='<img src="'+json["friendList"][k]["pic"]+'" class="img-thumbnail img-responsive img-circle"';
		str+='style="width: 66px;height: 60px;" onclick="moveThisNamePost(\''+json["friendList"][k]["id"]+'\')">';
		str+='</td>';
		str+='<td>';
		str+='<div class="searchData">';
		str+='<a href="#;" onclick="moveThisNamePost(\''+json["friendList"][k]["id"]+'\')">'+json["friendList"][k]["id"]+'</a></div></td>';
		str+='<td id="friendBtn'+json["friendList"][k]["id"]+'">';
		if(json["friendList"][k]["id"]==userId){
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary" onclick="moveThisNamePost(\''+userId+'\')">내 글</button>';
			str+='</div>';		
		}
		if(json["friendList"][k]["status"]==0&&json["friendList"][k]["id"]!=userId){
			str+='<div class="searchData" id="friendReqBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary" id="searchInfriendReq'+json["friendList"][k]["id"]+'"';
			str+='onclick=searchInfriendReq(\''+json["friendList"][k]["id"]+'\')>친구신청</button>';
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==1){
			str+='<div class="searchData" id="friendReqStatusBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary" id="friendReqStatus'+json["friendList"][k]["id"]+'"';
			str+='onclick="searchInFriendReqStatus(\''+json["friendList"][k]["id"]+'\')">요청중</button>';	
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==2&&json["friendList"][k]["id"]!=userId){
			str+='<div class="searchData" id="searchInFriendCancelBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary"';
			str+='onclick=searchInFriendCancel(\''+json["friendList"][k]["id"]+'\')>친구 해제</button>';
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==3){
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary">차단 해제</button>';
			str+='</div>';
		}
		str+='</td>';
		str+='</tr>';
		}
		}
		str+='</tbody>';
		str+='</table>';
		str+='<div class="pull-right"><a href="#;" id="friendMoreBtn" onclick="friendMoreBtn(\''+data+'\')">친구 더보기</a></div>';
		str+='<hr/><br/><br/>';
		str+='<div style="display:flex; margin-bottom:20px;"><div class=searchD>\"'+data+'\"</div>에 관련된 게시글 검색 결과</div>';
		str+='<table class="table table-hover table-responsive">';
		str+='<tbody>';
		if(json["publicPost"].length==0){
			str+='<tr>';
			str+='<td style="width: 600px;">검색 결과가 없습니다.</td>';
			str+='</tr>';
			}else{
		for(let k in json["publicPost"]){
		str+='<tr onclick="serachPost(\''+json["publicPost"][k]["postNumber"]+'\')">';
		str+='<input type="hidden" value="'+json["publicPost"][k]["postNumber"]+'">';
		str+='<td><a href="#;">'+json["publicPost"][k]["contents"]+'</a></td>';
		str+='<td>'+json["publicPost"][k]["date"]+'</td>';
		str+='</tr>';
		}
			}
		str+='</tbody>';
		str+='</table>';
		str+='<div class="pull-right"><a href="#;" id="postMoreBtn" onclick="postMoreBtn(\''+data+'\')">게시글 더보기</a></div>';
		$friend.append(str);
		$friend.appendTo($tot);
		$("#snsTimeLineMain").html($tot);
		$("#snsTimeLineMain").hide();
		$("#snsTimeLineMain").fadeIn();
	}//
	</script>
	<!-- 검색 클릭 이벤트 -->
	<script type="text/javascript">
	function enterSearch() {
		let searchData=$("#searchText").val();
		 if(searchData==""){
    		 $('.info').text("내용을 입력하세요").fadeIn(400).delay(1000).fadeOut(400);
    		 return false;
    	 }
		 search(searchData);
	}
	 $("#searchBtn").click(function() {
		 var searchData=$("#searchText").val();
		 if(searchData==""){
    		 $('.info').text("내용을 입력하세요").fadeIn(400).delay(1000).fadeOut(400);
    		 return false;
    	 }
		 search(searchData);
	});
	</script>
	<!-- 글삭제 -->
	<script type="text/javascript">
	function postDelete(e) {
		if(confirm("삭제 하시겠습니까?")){
		var postNumber=e.id.substr(7);
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
 			method:'post',
 			url:"sns/post/delete",
 			data:{"postNumber":postNumber},
 			dataType : "json"
		}).done((delJson)=>{
			makeTimeLine(delJson);
			location.href="#snsTimeLineMain";
		});
		}else{return false;}
	}//end
	</script>
	<!-- 타임라인 버튼 -->
	<script type="text/javascript">
		$("#timeLine").click(function () {
			setTimeLine();		
			$("#more").css("display","block");
			$("#friendMore").css("display","none");
			$("#myPostMore").css("display","none");
			$("#timeLineProfileBoxTot").empty();
		});
	</script>
	<!-- 댓글 입력후 출력 -->
	<script type="text/javascript">
	function commentUnitMake(commentJson,number){
		let classNum="."+number+" tbody";
		let firstTr=classNum+" tr:first td";
		let text=$(firstTr).text();
		if(text=="댓글이 없습니다."){
			$(firstTr).remove();
		}
		let commentBox="";
		commentBox+='<tr id="commentRowBox'+commentJson["number"]+'">';
		commentBox+='<td style="width: 70px;" class="commentTd" onclick="moveThisNamePost(\''+commentJson["id"]+'\')"><img src="'+commentJson["profilePic"]+'" class="img-thumbnail img-responsive img-circle"';
		commentBox+='id="commentImg"><a href="#showImageBox">'+commentJson["id"]+'</a></td>';
		commentBox+='<td style="width: 500px;" id="commentContents'+commentJson["number"]+'">'+commentJson["content"]+'</td>';
		commentBox+='<td style="background-color: white">';
		commentBox+='<button type="button" class="btn-default commentLike" onclick="commentLike(\''+commentJson["number"]+'\')">';
		commentBox+='<i class="far fa-thumbs-up commentLike" id="commentLike'+commentJson["number"]+'">'+commentJson["like"]+'</i></button>';
		commentBox+='<button type="button" class="btn-default commentHate" onclick="commentHate(\''+commentJson["number"]+'\')"><i class="far fa-thumbs-down commentHate" id="commentHate'+commentJson["number"]+'">'+commentJson["hate"]+'</i></button>';
		commentBox+='</td>';
		commentBox+='<td style="background-color: white">'+commentJson["date"]+'</td>';
		commentBox+='<td style="background-color: white; width: 150px">';
		if(userId==commentJson["id"]){
			commentBox+='<a onclick=commentEdit("'+number+'","'+commentJson["number"]+'")>';
			commentBox+='수정</a>/<a onclick=commentDel("'+number+'","'+commentJson["number"]+'")>삭제</a>';	
		}else{
			commentBox+='<a>신고</a>';
		}
		commentBox+='</td>';
		commentBox+='</tr>';
		$(classNum).append(commentBox);
		let commentCnt="#snsComment"+number;
		let cnt=$(commentCnt).text();
		let cnt2=cnt.substr(6);
		let cnt3=cnt2.split(")")[0];
		let cnt4=parseInt(cnt3);
		$(commentCnt).text("댓글 보기("+(cnt4+1)+")");
	}
	</script>
	<!-- 글 수정 스크립트 -->
	<script type="text/javascript">
	function editPost(e) {
		var editPostNumber=e.id.substr(12);
		var editPostBoxId="#editBox"+editPostNumber;
		const preContents="#postContents"+editPostNumber;
		//첫값
		$editTotalBox=$("<div>").addClass("container editBtnBox");
		$editBox=$("<div>").addClass("collapse navbar-collapse")
		.append("<ul>").addClass("nav navbar-nav navbar-right");
		$editButton=$("<li>").append($("<button>").addClass("editButton").text("수정"));
		$cancelButton=$("<li>").append($("<button>").addClass("editCancelButton").text("취소"));
		$editBox.append($editButton);
		$editBox.append($cancelButton);
		$editBox.appendTo($editTotalBox);
		$(editPostBoxId).html($editTotalBox);
		//바뀐값
		var editContents=e.value;

		editContents = editContents.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
	$("li").on("click",".editCancelButton",function(){
		if(confirm("수정을 취소 하시겠습니까?")){
			$(preContents)[0].value=$(preContents)[0].defaultValue;
			$(editPostBoxId).empty();
		}
	});
	$("li").on("click",".editButton",function(){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		var editData={
				"editContents":editContents,
				"postNumber": editPostNumber
			}
		$.ajax({
				method:'post',
				url:"sns/post/edit",
				data:editData,
				dataType : "json"
			}).done((editTimeLineJson)=>{
				$(editPostBoxId).empty();
				makeTimeLine(editTimeLineJson);
			}).fail((s)=>{
				console.log("실패");
			});
		});
	}
	</script>
	<!-- 댓글 입력 -->
	<script type="text/javascript">
	function commentInsert(number) {
	var commentWriteContents="#commentWriteBox"+number+" input";
	var commentData={
			postNumber:number,
			commentContent:$(commentWriteContents).val()
	}
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
			method:'post',
			url:"sns/comment/insert",
			data:commentData,
			dataType : "json"
		}).done((commentJson)=>{
			commentUnitMake(commentJson,number);
			$(commentWriteContents).val("");
		});
	}
	</script>
	<!-- 글쓰기 서비스 -->
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
		
		var writeData= new FormData(form);
		writeData.append("low",low);
		
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
 			method:'post',
 			url:"sns/write/insert",
 			data:writeData,
 			dataType : "json",
 			processData: false,
            contentType: false,
		}).done((json)=>{
			makeTimeLine(json);
			$("#writeBox").css("border","0 solid white");
			$("#writeBox").slideUp();
			$("#writeBox").empty();
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
		$("#snsProfileInfo a").html('<i class="fas fa-cog fa-spin"></i>');
	},function(){
		$("#snsProfileInfo a").html('정보수정');
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
		$("#timeLine a").html('<i class="far fa-clock fa-spin"></i>');
	},function(){
		$("#timeLine a").html('타임라인');
	});
	$(".top a").hover(function () {
		$(".top a").html('<i class="fas fa-arrow-circle-up"></i>');
	},function(){
		$(".top a").html('TOP');
	});
	$("#search a").hover(function () {
		$("#search a").html('<i class="fa fa-search"></i>');
	},function(){
		$("#search a").html('검색');
	});
	/* $("#socialClub a").hover(function () {
		$("#socialClub a").html('<i class="fas fa-users"></i>');
	},function(){
		$("#socialClub a").html('소모임');
	}); */
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
		$("#writeBox").css("border","2px solid #BDBDBD");
		let photo="";
		photo+='<form name="writeBoxForm" method="post" enctype="multipart/form-data" id="writeBoxForm">';
		photo+='<div class="row" id="wirteBoxR">';
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
		$("#writeBox").hide();
		$("#writeBox").slideDown();
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
	<!-- 정보공개 변환 -->
	<script type="text/javascript">
	function infoSecurity(e) {
		let postNumber=e.id.substr(12);
		let securityVal;
		if(e.value=="전체 공개"){
			securityVal=0;
		}else if(e.value=="나만 보기"){
			securityVal=2;
		}else if(e.value=="친구 공개"){
			securityVal=1;
		}
		let securityData={
			"postNumber":postNumber,
			"securityVal":securityVal
		}
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/post/security",
				data:securityData,
				dataType : "json"
		}).done((securityJson)=>{
   	          $('.info').text(securityJson.message)
    	         .fadeIn(400).delay(1000).fadeOut(400);
		});
	}
</script>
	<!-- 타임라인 생성 스크립트 -->
	<script type="text/javascript">
	//타임 라인 생성 함수
	function makeTimeLine(timeLineJson){
		$("#snsTimeLineMain").empty();
		 for(let j in timeLineJson){
			let postsContents = timeLineJson[j]["content"];
	 		let RePostsContents=postsContents.split("<br/>").join("\r\n");
		let $timeLine = "";
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<div class="jumbotron" id="posts" style="border: 5px solid #337ab7">';
		}else{
		$timeLine += '<div class="jumbotron" id="posts">';
		}
		$timeLine += '<div class="row" onclick="moveThisNamePost(\''+timeLineJson[j]["posts_writer"]+'\')">';
		$timeLine += '<a href="#;"><img src='+timeLineJson[j]["profilePicture"]+' class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage" id="timeLineProfile"></a>';
		$timeLine += '<div id="snsMember_id"><a href="#;">'+timeLineJson[j]["posts_writer"]+'</a> 님의 글</div>';
		$timeLine += '<input type="hidden" value='+timeLineJson[j]["posts_number"]+' id="posts_number">';
		$timeLine += '</div>';
		$timeLine += '<div class="nav-tabs" id="postHead">';
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<a href="#;" id="postdel'+timeLineJson[j]["posts_number"]+'" onclick="postDelete(this)">삭제</a>';
		}else{
		$timeLine += '<a href="#;" onclick="reportPost(\''+timeLineJson[j]["posts_number"]+'\')">신고</a>';
		}
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<div class="container col-xs-5 col-md-3 col-sm-5 pull-right">';
		$timeLine += '<select class="form-control" onchange="infoSecurity(this)" id="infoSecurity'+timeLineJson[j]["posts_number"]+'">';
		if(timeLineJson[j]["posts_authority"]==0){
		$timeLine += '<option>전체 공개</option>';
		$timeLine += '<option>나만 보기</option>';
		$timeLine += '<option>친구 공개</option>';
		}else if(timeLineJson[j]["posts_authority"]==1){
			$timeLine += '<option>친구 공개</option>';
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>전체 공개</option>';
		}else if(timeLineJson[j]["posts_authority"]==2){
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>친구 공개</option>';
			$timeLine += '<option>전체 공개</option>';
		}
		$timeLine += '</select>';
		$timeLine += '</div>';
		}
		$timeLine += '</div>';
		$timeLine += '<div class="container" id="postsContentsBox">';
		if(timeLineJson[j]["posts_writer"]==userId){
		$timeLine += '<textarea class="container" cols="93" rows="8" id="postContents'+timeLineJson[j]["posts_number"]+'" onkeyup="editPost(this)">'+RePostsContents+'</textarea>';	
		}else{
		$timeLine += '<textarea class="container" cols="93" rows="8" readonly id=postContents"'+timeLineJson[j]["posts_number"]+'" onkeyup="editPost(this)" >'+RePostsContents+'</textarea>';
		}
		$timeLine += '<div class="container" id="editBox'+timeLineJson[j]["posts_number"]+'"></div>';
		$timeLine += '<div class="container" id="postsPhotoBox">';
		$timeLine += '</div>';
		$timeLine += '<div id="postsOptionBox" class="navbar-default navbar-right">';
		$timeLine += '<div id="snsOption">';
		/* $timeLine += '<button type="button"><i class="fas fa-share snsOptionSelector"></i> </button>'; */
		$timeLine += '<button type="button"><i class="far fa-thumbs-up snsOptionSelector like" id="snsLike'+timeLineJson[j]["posts_number"]+'" onclick="likeSend(\''+timeLineJson[j]["posts_number"]+'\',\''+timeLineJson[j]["posts_writer"]+'\')">'+timeLineJson[j]["like"]+'</i></button>';
		$timeLine += '<button type="button"><i class="far fa-thumbs-down snsOptionSelector hate" id="snsHate'+timeLineJson[j]["posts_number"]+'" onclick="hateSend(\''+timeLineJson[j]["posts_number"]+'\',\''+timeLineJson[j]["posts_writer"]+'\')">'+timeLineJson[j]["hate"]+'</i></button></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$timeLine += '<div class="container snsImageContainer" id="'+j+'" >';
		$timeLine += '</div>';
		$timeLine += '<div class="container">';
		$timeLine += '<div class="navbar-default" id="snsCommentBox"><a href="#;" class="snsComment" id="snsComment'+timeLineJson[j]["posts_number"]+'" onclick="comment(\''+timeLineJson[j]["posts_number"]+'\')">댓글 보기('+timeLineJson[j]["commentCount"]+')</a></div>';
		$timeLine += '<div class="'+timeLineJson[j]["posts_number"]+'" id="commentReal"></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$('#snsTimeLineMain').append($timeLine);
		 for(var k=0;k<timeLineJson[j]["photoList"].length;k++){
		let $snsPostsImageBox=$("<div class='cover'>");
		let $postsimageBox=$('<img class="img-thumbnail img-responsive" onclick="resizeImg(this.src)">');
		$postsimageBox.attr("src","resources/snsPostsImage/"+timeLineJson[j]["photoList"][k]["sns_photo_origin_name"]);
		$postsimageBox.appendTo($snsPostsImageBox);
		$snsPostsImageBox.appendTo($("#"+j));
		}
		 }
	}
</script>
	<!-- 글작성 취소 스크립트 -->
	<script type="text/javascript">
	$("div").on("click","#cancel",function(){
		if(confirm("입력하신 내용을 잃습니다. 취소 하시겠습니까?")){
			$("#writeBox").css("border","0 solid white");
			$("#writeBox").slideUp();
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
	userId=undefined;
//페이지 프로필파일과 이름을 출력 해주는 함수
function setProfile(json) {
	$("#snsProfileImg img").attr("src",json.member_profile_picture);
	$("#snsProfileName").html("<a href='#timeLineProfileBoxTot'>"+json.member_id+"</a>님");
	userId=json.member_id;
	jsonPicture=json.member_profile_picture;	
}
</script>
	<!-- 좋아요 기능 -->
	<script type="text/javascript">
	function likeSend(postNumber,writer) {
		var snsLikeId="#snsLike"+postNumber;
		var snsHateId="#snsHate"+postNumber;
		 $.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'post',
			url:"sns/timeline/like",
			data:{"postNumber":postNumber},
			dataType : "json"
	}).done((totalJson)=>{
		$(snsLikeId).text(totalJson.likeTotal);
		$(snsHateId).text(totalJson.hateTotal);
	});
	}
</script>
	<!-- 싫어요 기능 -->
	<script type="text/javascript">
	function hateSend(postNumber,writer) {
		var snsLikeId="#snsLike"+postNumber;
		var snsHateId="#snsHate"+postNumber;
	 	$.ajaxSetup({
			beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
			method:'post',
			url:"sns/timeline/hate",
			data:{"postNumber":postNumber},
			dataType : "json"
		}).done((totalJson)=>{
			$(snsLikeId).text(totalJson.likeTotal);
			$(snsHateId).text(totalJson.hateTotal);
		});
	}
</script>
	<!-- 더보기 기능 -->
	<script type="text/javascript">
 	var low = 1;
 		$("#more").click(function() {
	 		$("#more").html('<i class="fas fa-spinner fa-pulse fa-2x"></i>');
	 		low++;
	  		setTimeLine();
	  		$("#more").html('<a href="#;">더보기</a>');
 		});
</script>
	<!-- 타임라인 Ajax -->
	<script type="text/javascript">
	function setTimeLine() {
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
			$.ajax({
			method:'get',
			url:"sns/timeline",
			data:{"low":low},
			dataType : "json"
			}).done((timeLineJson)=>{
			makeTimeLine(timeLineJson);
			});
	}
</script>
	<!-- 댓글출력 Ajax -->
	<script type="text/javascript">
	let commentRow=1;
	function comment(number) {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	commentData={
			"commentRow":commentRow,
			"postNumber":number
	}
	$.ajax({
			method:'post',
			url:"sns/comment",
			data:commentData,
			dataType : "json"
	}).done((commentJson)=>{
		printComment(commentJson,number);
		if(commentJson.length==commentJson[0]["max"]){
			let commentM="#commentMore"+number;
			$(commentM).hide();
			commentRow=1;
		}
	});
}
	function commentMore(number){
		commentRow++
		comment(number);
	}
</script>
	<!-- 댓글 출력 서비스 -->
	<script type="text/javascript">
	function printComment(commentJson,number) {
	$("."+number).empty();
		let commentBox="";
		commentBox+='<div class="container-fluid" id=commentReal>';
		commentBox+='<table class="table table-hover table-responsive">';
		commentBox+='<tbody>';
	if(commentJson.comment=="댓글이 없습니다."){
		commentBox+='<tr>';
		commentBox+='<td>'+commentJson.comment+'</td>';
		commentBox+='</tr>';
	}else{
			for(let k in commentJson){
			commentBox+='<tr id="commentRowBox'+commentJson[k]["number"]+'">';
			commentBox+='<td style="width: 70px" class="commentTd" onclick="moveThisNamePost(\''+commentJson[k]["id"]+'\')"><img src="'+commentJson[k]["profilePic"]+'" class="img-thumbnail';
			commentBox+='img-responsive img-circle" id="commentImg"><a href="#showImageBox">'+commentJson[k]["id"]+'</a></td>';
			commentBox+='<td style="width: 500px" id="commentContents'+commentJson[k]["number"]+'">'+commentJson[k]["content"]+'</a></td>';
			commentBox+='<td style="background-color: white">';
			commentBox+='<button type="button" class="btn-default commentLike" onclick="commentLike(\''+commentJson[k]["number"]+'\')">';
			commentBox+='<i class="far fa-thumbs-up commentLike" id="commentLike'+commentJson[k]["number"]+'">'+commentJson[k]["like"]+'</i></button>';
			commentBox+='<button type="button" class="btn-default commentHate" onclick="commentHate(\''+commentJson[k]["number"]+'\')"><i class="far fa-thumbs-down commentHate"';
			commentBox+='id="commentHate'+commentJson[k]["number"]+'">'+commentJson[k]["hate"]+'</i></button>';
			commentBox+='</td>';
			commentBox+='<td style="background-color: white">'+commentJson[k]["date"]+'</td>';
			commentBox+='<td style="background-color: white; width: 150px">';
			
			if(userId==commentJson[k]["id"]){
				commentBox+='<a onclick=commentEdit("'+number+'","'+commentJson[k]["number"]+'")>';
				commentBox+='수정</a>/<a onclick=commentDel("'+number+'","'+commentJson[k]["number"]+'")>삭제</a>';	
			}else{
				commentBox+='<a>신고</a>';
			}
			commentBox+='</td>';
			commentBox+='</tr>';
				}
	}
		commentBox+='</tbody>';
		commentBox+='</table>';	
		commentBox+='<div class="container">';
		commentBox+='<div class="pull-left commentMore" id="commentMore'+number+'"><a href="#;" onclick=commentMore(\''+number+'\')>댓글 더보기</a></div>';
		commentBox+='</div>';
		commentBox+='<div class="input-group commentWriteBox" id="commentWriteBox'+number+'">';
		commentBox+='<input type="text" class="form-control" placeholder="댓글 입력">';
		commentBox+='<span class="input-group-btn">';
		commentBox+='<button type="button" class="btn btn-primary commentWrite" onclick="commentInsert('+number+')">확인</button>';
		commentBox+='</span>';
		commentBox+='</div>';
		commentBox+='<div class="commentCancelBtn" id="commentCancelBtn'+number+'">닫기</div>';
		commentBox+='</div>';	
		$("."+number).html(commentBox);
		$("."+number).hide();
		$("."+number).slideDown();
		var commentCancel="#commentCancelBtn"+number;
		$(commentCancel).on("click",function(){
			$("."+number).slideUp();
			$("."+number).empty();
		});
}//서비스 End
</script>
	<!-- 댓글 좋아요 -->
	<script type="text/javascript">
	function commentLike(commentNumber) {
		var $likeCommentval="#commentLike"+commentNumber;
		var $hateCommentval="#commentHate"+commentNumber;
		
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/comment/like",
				data:{"commentNumber":commentNumber},
				dataType : "json"
		}).done((commentLikeTotalJson)=>{
			$($likeCommentval).text(commentLikeTotalJson.commentLikeTotal);
			$($hateCommentval).text(commentLikeTotalJson.commentHateTotal);
		});
	}
</script>
	<!-- 댓글 싫어요 -->
	<script type="text/javascript">
 	function commentHate(commentNumber) {
	var $likeCommentval="#commentLike"+commentNumber;
	var $hateCommentval="#commentHate"+commentNumber;
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	$.ajax({
			method:'post',
			url:"sns/comment/hate",
			data:{"commentNumber":commentNumber},
			dataType : "json"
	}).done((commentHateTotalJson)=>{
		$($likeCommentval).text(commentHateTotalJson.likeTotal);
		$($hateCommentval).text(commentHateTotalJson.hateTotal);
	});
}
</script>
</body>
</html>