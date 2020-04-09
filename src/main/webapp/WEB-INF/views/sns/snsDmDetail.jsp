<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
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
			text-align: left;
			display: inline-block;
		}
		
		.userTextContainer {
			display: flex;
			padding-top: 22px;
		}
		
		.userTextContainer img {
			min-height: 24px;
		}
		
		.userImg {
			/* background-image: url(images/asd.jpg); */
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
			text-align: right;
			font-size: 10px;
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
			color: #F4FA58;
			text-align: right;
			margin-top: 37px;
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
<script type="text/javascript">
	let userId="${userId}";
$(function(){
	dmDetailLoad(userId);
});
</script>
</head>
<body>
	<div class="msgBox">

	</div>
	<div class="msgInputBox">
		<textarea class="msgInput" rows="5"></textarea>
		<div>
			<input type="button" value="전송" class="msgInputBtn">
		</div>
	</div>
	<script type="text/javascript">
	$(".msgInputBtn").click(function () {
		let contents=$(".msgInput").val();
		if(contents==""){
			alert("내용을 입력 해주세요.");
			return false;
		}else{
		InsertDm(contents);
		}
	});
	$(".msgInput").keyup(function(e){
        if (e.keyCode == 13) {
        	let contents=$(".msgInput").val();
    		if(contents==""){
    			alert("내용을 입력 해주세요.");
    			return false;
    		}else{
    		InsertDm(contents);
    		}
        }
	});
	
	function InsertDm(contents) {
		contents = contents.replace(/(?:\r\n|\r|\n)/g, '&nbsp;');
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);
 			}
		});//먼저 보냄
		let data={"contents":contents,
				"userId":userId}
		$.ajax({
				method:'post',
				url:"/gabom/insert/contents",
				data:data,
				dataType : "json"
		}).done((dmJson)=>{
			$(".msgInput").val("");
			makeDmDetail(dmJson);
			$(".msgBox").scrollTop($(".msgBox")[0].scrollHeight);
		}).fail((error)=>{
			console.log("err",error);
		});			 
	}
	</script>
	<script type="text/javascript">
		let id="${id}";
	function makeDmDetail(json) {
		let make='';
		for(let k in json){
			if(json[k]["sendMember"]==userId){
			make+='	<div class="container-fluid userTextContainer">';
			make+='<div class="userImg" style="background-image:url('+json[k]["memberPic"]+')"></div>';
			make+='<div class="userTextBox">';
			make+='<div class="userId">'+json[k]["sendMember"]+'</div>';
			make+='<div class="userTextContents" data-dmNumber="'+json[k]["dmNumber"]+'">'+json[k]["contents"]+'</div>';
			make+='<div class="userTextDate">';
			if(json[k]["checkNum"]==1){
			make+='	<div class="msgCnt">1</div>';
			}
			make+='<br/>'+json[k]["resultDate"];
			make+=' </div>';
			make+=' </div>';
			make+='</div>';
			}else if(json[k]["sendMember"]==id){
				make+='<div class="container-fluid">';
				make+='<div class="myTextBox">';
				make+='<div class="myTextContents" data-dmNumber="'+json[k]["dmNumber"]+'">'+json[k]["contents"]+'</div>';
				make+='<div class="myTextDate">';
				if(json[k]["checkNum"]==1){
				make+='<div class="myMsgCnt">1</div>';
				}
				make+='<br/>'+json[k]["resultDate"]+'</div>';
				make+='</div>';
				make+='</div>';	
			}
		}
		$(".msgBox").html(make);
	}
	</script>
	<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	function dmDetailLoad(userId) {
	 	$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);
 			}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"/gabom/detail/contents",
				data:{"userId":userId},
				dataType : "json"
		}).done((dmJson)=>{
			console.log(dmJson);
			makeDmDetail(dmJson);
			$(".msgBox").scrollTop($(".msgBox")[0].scrollHeight);
		}).fail((error)=>{
			console.log("err",error);
		});			 
	}
	</script>
	<script>
		$(".msgBox").on("mousedown",".userTextContents",function(e){
			e.stopPropagation();
			let num=e.target.dataset.dmnumber;
			console.log(num);
			if(e.which==3){
				$(document).bind("contextmenu", function (event) {
			event.preventDefault();
			$("div.custom-menu").remove();
			let divss = $("<div class='custom-menu' onclick='delContents(\""+num+"\")'>삭제</div>").css({
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
		
		
		$(".msgBox").on("mousedown",".myTextContents",function(e){
			e.stopPropagation();
			let num=e.target.dataset.dmnumber;
			console.log(num);
			if(e.which==3){
				$(document).bind("contextmenu", function (event) {
			event.preventDefault();
			$("div.custom-menu").remove();
			let divss = $("<div class='custom-menu' onclick='delContents(\""+num+"\")'>삭제</div>").css({
				top: event.pageY + "px"
				, left: event.pageX + "px"
			});
			$("body").append(divss);
			
		}).bind("click", function (event) {
			$("div.custom-menu").hide();
		});		
			}
		});
		$(".msgBox").on("mouseout",".myTextContents",function(e){
			e.stopPropagation();
			$(document).unbind("contextmenu");
		});
		$(".msgBox").on("mouseout",".userTextContents",function(e){
			e.stopPropagation();
			$(document).unbind("contextmenu");
		});
	</script>
	<script>
	function delContents(num){
		console.log("num",num);
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);
 			}
		});//먼저 보냄
		let data={
				"num":num,
				"id":id,
				"userId":userId
		}
		$.ajax({
				method:'post',
				url:"/gabom/delete/contents",
				data:data,
				dataType : "json"
		}).done((delJson)=>{
			console.log(delJson);
			makeDmDetail(delJson);
			$(".msgBox").scrollTop($(".msgBox")[0].scrollHeight);
		}).fail((error)=>{
			console.log("err",error);
		});			 
	}
	</script>
</body>
</html>