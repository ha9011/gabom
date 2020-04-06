<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
		<style>
		html,
		body {
			height: 90%;
		
		}
		
		body{
		overflow-x: hidden;
			overflow-y: hidden;
		}
		
		div {
			font-size: 16px;
			font-weight: 700;
			font-family: 'Jua';
			padding: 8px;
		}
		
		.msgBox {
			background-color: #9bbad8;
			height: 100%;
			overflow: auto;
		}
		
		.userTextBox {
			float: left;
		}
		
		.myTextBox {
			float: right;
		}
		
		.myTextContents {
			max-width: 200px;
			word-break: break-all;
			border-radius: 20px;
			background-color: #F4FA58;
		}
		
		.userTextContainer {
			display: flex;
		}
		
		.userTextContainer img {
			min-height: 24px;
		}
		
		.userImg {
			background-image: url(images/asd.jpg);
			background-size: 50px 50px;
			width: 50px;
			height: 50px;
			border-radius: 50%;
			margin-top: 10px;
		}
		
		.myTextDate {
			text-align: left;
			font-size: 10px;
		}
		
		.userTextContents {
			float: left;
			word-break: break-all;
			max-width: 200px;
			background-color: white;
			border-radius: 20px;
		}
		
		.userTextDate {
			text-align: left;
			font-size: 10px;
			padding-left: 120px;
		}
		.msgInput {
			resize: none;
			width: 100%;
			border: 0;
			overflow: visible;
		}
		
		.msgInputBox {
			display: flex;
		}
		
		.msgInputBtn {
			background-color: #F4FA58;
			border: 0.5px solid #FAAC58;
			padding: 5px;
			padding-left: 13px;
			padding-right: 13px;
			border-radius: 10px;
			font-size: 16px;
		}
		
		.msgCnt {
			padding: 0;
			font-size: 10px;
			margin: 0 auto;
			color: #F4FA58;
			text-align: right;
		}
		
		.myMsgCnt {
			padding: 0;
			font-size: 10px;
			margin: 0;
			color: #F4FA58;
		}
		
		.custom-menu {
			z-index: 1000;
			position: absolute;
			background-color: white;
			padding: 5px;
			padding-left: 10px;
			padding-right: 10px;
			border-radius: 20px;
			cursor: pointer;
		}
		
		*:focus {
		outline: none;
		}
	</style>
</head>
<body>
	<div class="msgBox">
		<div class="container-fluid userTextContainer">
			<div class="userImg">친구 이미지</div>
			<div>
			<div class="userTextBox">
				<div class="userId">샘플2</div>
				<div class="userTextContents">친구 내용</div>
			</div>
			<div class="userTextDate">
				<div class="msgCnt">1카운터</div>
				<br/>상대 메세지 2020-04-03 11:23
			 </div>
			 </div>
			</div>
			
		<div class="container-fluid">
			<div class="myTextBox">
				<div class="myTextContents">내 내용</div>
				<div class="myTextDate">
					<div class="myMsgCnt">1카운터</div>
					<br/>내 메세지 시간 2020-04-03 11:23 </div>
			</div>
		</div>
	</div>
	<div class="msgInputBox">
		<textarea class="msgInput" rows="5"></textarea>
		<div>
			<input type="button" value="전송" class="msgInputBtn">
		</div>
	</div>
	<script>
		$(".userTextContents").mousedown(function(e){
			if(e.which==3){
				$(document).bind("contextmenu", function (event) {
					console.log(e);
			event.preventDefault();
			$("div.custom-menu").remove();
			let divss = $("<div class='custom-menu' onclick='delContents()'>삭제</div>").css({
				top: event.pageY + "px"
				, left: event.pageX + "px"
			});
			$("body").append(divss);
			
		}).bind("click", function (event) {
			$("div.custom-menu").hide();
		});		
			}
		});
		$(".userTextContents").mouseout(function(){
			$(document).unbind("contextmenu");
		});
		
		
		
		$(".myTextContents").mousedown(function(e){
			if(e.which==3){
				$(document).bind("contextmenu", function (event) {
			event.preventDefault();
			$("div.custom-menu").remove();
			let divss = $("<div class='custom-menu' onclick='delContents()'>삭제</div>").css({
				top: event.pageY + "px"
				, left: event.pageX + "px"
			});
			$("body").append(divss);
			
		}).bind("click", function (event) {
			$("div.custom-menu").hide();
		});		
			}
		});
		$(".myTextContents").mouseout(function(){
			$(document).unbind("contextmenu");
		});
	</script>
	<script>
	function delContents(){
		console.log("a");
	}
	</script>
</body>
</html>